<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Utilisateur;

class PrincipalController extends AbstractController
{
    /**
     * @Route("/principal",name="principal")
     */
    public function index(): Response
    {
        return $this->render('principal/index.html.twig', [
            'controller_name' => 'Accueil',
        ]);
    }

    /**
     * @Route("/logout",name="logout",methods={"GET"})
     */
    public function logout():void
    {
        throw new \Exception('Dont\'t forget to activate logout in security.yaml');
    }

    /**
     * @Route("/principal/listeUtilisateur",name="listeUtilisateur")
     */
    public function listeUt()
    {
        $repository=$this->getDoctrine()->getRepository(Utilisateur::class);
        $lesUts=$repository->findAll();
        return $this->render('principal/listeUtilisateur.html.twig',[
                'listeUt' => $lesUts,
                'controller_name' => 'Liste des utilisateurs',
        ]);
    }

}
