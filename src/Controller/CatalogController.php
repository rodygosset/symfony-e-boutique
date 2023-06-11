<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CatalogController extends AbstractController
{
    #[Route('/catalog', name: 'app_catalog')]
    public function index(Request $request, EntityManagerInterface $em): Response
    {

        // handle filtering logic

        $category = $request->query->get('category');
        $name = $request->query->get('name');

        // get the products

        $repository = $em->getRepository(Product::class);
        
        // Create a query builder to build the product query

        $qb = $repository->createQueryBuilder('p')
            ->leftJoin('p.category', 'c');
        
        if (!empty($category)) {
            $qb->andWhere('c.id = :categoryId')
                ->setParameter('categoryId', $category);
        }
        
        if (!empty($name)) {
            $qb->andWhere('p.name LIKE :name')
                ->setParameter('name', '%'.$name.'%');
        }

        // if no filters are applied, show all available products

        $products = [];

        if (empty($category) && empty($name) && empty($price) && empty($available)) {
            $products = $repository->findBy(['available' => true]);
        } else {
            $products = $qb->getQuery()->getResult();
        }

        $categories = $em->getRepository(Category::class)->findAll();

        // render the template

        return $this->render('catalog/index.html.twig', [
            'products' => $products,
            'categories' => $categories,
        ]);
    }
}
