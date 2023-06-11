<?php

namespace App\Controller;

use App\Entity\Product;
use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\Order;
use App\Entity\CommandLine;


class OrderController extends AbstractController
{

    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager, private RequestStack $requestStack)
    {
        $this->entityManager = $entityManager;
    }

    public function getTotal(Order $order) {
        $total = 0;

        foreach($order->getCommandLines() as $commandLine) {
            $total += $commandLine->getProduct()->getPrice() * $commandLine->getQuantity();
        }

        return $total;
    }

    #[Route('/order', name: 'app_order')]
    public function index(): Response
    {

        // Check if the user is authenticated
        if (!$this->getUser()) {
            // Redirect the user to the login page with a return URL parameter
            return $this->redirectToRoute('app_login', ['returnUrl' => $this->generateUrl('app_order')]);
        }

        $session = $this->requestStack->getSession();

        $cart = $session->get('cart', []);

        // don't allow empty cart

        if(empty($cart)) {
            return $this->redirectToRoute('app_catalog');
        }


        $this->entityManager->clear();

        // create a new order

        $order = new Order();
        // increment the order number 
        $orderNumber = $this->entityManager->getRepository(Order::class)->findNextOrderNumber();
        $order->setNumber($orderNumber);
        // set the user
        $currentUser = $this->entityManager->getRepository(User::class)->findOneBy(['email' => $this->getUser()->getUserIdentifier()]);
        $order->setUser($currentUser);
        // set the datetime
        $order->setDatetime(new \DateTime());

        //var_dump($order)

        // create a command line for each cart item

        foreach($cart as $item) {
            $commandLine = new CommandLine();
            // get the product from the database
            $product = $this->entityManager->getRepository(Product::class)->find($item['product']->getId());
            $commandLine->setProduct($product);
            $commandLine->setQuantity($item['quantity']);
            $commandLine->setCustomerOrder($order);

            $order->addCommandLine($commandLine);
        }


        // persist the order

        $this->entityManager->persist($order);
        $this->entityManager->flush(); // save the order in the database

        // empty the cart

        $session->set('cart', []);

        // render the order info page

        return $this->render('order/index.html.twig', [
            'order' => $order,
            "commandLines" => $order->getCommandLines(),
            "total" => $this->getTotal($order)
        ]);
    }

    // view previous orders

    #[Route('/order/history', name: 'app_order_history')]

    public function history(): Response
    {
        $orders = $this->entityManager->getRepository(Order::class)->findBy(['user' => $this->getUser()], ['datetime' => 'DESC']);

        return $this->render('order/history.html.twig', [
            'orders' => $orders
        ]);
    }


}
