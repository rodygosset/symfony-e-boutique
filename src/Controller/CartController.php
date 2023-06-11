<?php

namespace App\Controller;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\BrowserKit\Request;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;

class CartController extends AbstractController
{

    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager, private RequestStack $requestStack)
    {
        $this->entityManager = $entityManager;
    }

    public function getTotal() {
        $session = $this->requestStack->getSession();

        $cart = $session->get('cart', []);

        $total = 0;

        foreach($cart as $cartItem) {
            $total += $cartItem['product']->getPrice() * $cartItem['quantity'];
        }

        return $total;
    }

    #[Route('/cart', name: 'app_cart')]
    public function index(): Response
    {
        $session = $this->requestStack->getSession();

        return $this->render('cart/index.html.twig', [
            'cartItems' => $session->get('cart', []),
            'total' => $this->getTotal()
        ]);
    }


    // add to cart route

    #[Route('/cart/add/{productId}', name: 'add_to_cart')]

    public function addToCart($productId): RedirectResponse
    {
        // get the product

        $product = $this->entityManager->getRepository(Product::class)->find($productId);

        // if the product does not exist in the database

        if (!$product) {
            // throw a 404 exception
            throw $this->createNotFoundException('The product does not exist');
        }

        // cart is a list of assoc arrays
        // that each contain a product and a quantity


        $session = $this->requestStack->getSession();

        $cart = $session->get('cart', []);

        // find the product in the cart

        $found = false;
        foreach($cart as &$cartItem) {
            if ($cartItem['product']->getId() === $product->getId()) {
                $cartItem['quantity'] += 1;
                $found = true;
                break;
            }
        }

        // if the product is not in the cart

        if(!$found) {
            // add it to the cart
            $cart[] = [
                'product' => $product,
                'quantity' => 1
            ];
        }

        // save the cart in the session

        $session->set('cart', $cart);

        return $this->redirectToRoute('app_cart');
    }

    // remove from cart route

    #[Route('/cart/remove/{productId}', name: 'remove_from_cart')]

    public function removeFromCart($productId): RedirectResponse
    {
        // get the product

        $product = $this->entityManager->getRepository(Product::class)->find($productId);

        // if the product does not exist in the database

        if (!$product) {
            // throw a 404 exception
            throw $this->createNotFoundException('The product does not exist');
        }

        // get the cart from the session


        $session = $this->requestStack->getSession();

        $cart = $session->get('cart', []);

        // find the product in the cart and remove it

        foreach($cart as $index => $cartItem) {
            if ($cartItem['product']->getId() === $product->getId()) {
                // remove the product from the cart
                unset($cart[$index]);
                break;
            }
        }

        // update the cart in the session

        $session->set('cart', $cart);

        return $this->redirectToRoute('app_cart');
    }

    // update the quantity for a product in the cart

    #[Route('/cart/update/{productId}/quantity/{quantity}', name: 'update_cart_quantity')]

    public function updateCartQuantity($productId, $quantity): RedirectResponse
    {
        // get the product

        $product = $this->entityManager->getRepository(Product::class)->find($productId);

        // if the product does not exist in the database

        if (!$product) {
            // throw a 404 exception
            throw $this->createNotFoundException('The product does not exist');
        }

        // get the cart from the session

        $session = $this->requestStack->getSession();

        $cart = $session->get('cart', []);

        // find the product in the cart and update the quantity

        $found = false;

        for($i = 0; $i < count($cart); $i++) {
            if ($cart[$i]['product']->getId() === $product->getId()) {
                // update the quantity
                $cart[$i]['quantity'] = $quantity;
                $found = true;
                break;
            } 
        }

        if(!$found) {
            // throw a 404 exception

            throw $this->createNotFoundException('The product does not exist in the cart');
        }

        // update the cart in the session

        $session->set('cart', $cart);

        return $this->redirectToRoute('app_cart');
    }

    // clear cart route

    #[Route('/cart/clear', name: 'clear_cart')]

    public function clearCart(): RedirectResponse
    {
        // clear the cart in the session

        $session = $this->requestStack->getSession();

        $session->set('cart', []);

        return $this->redirectToRoute('app_cart');
    }

}
