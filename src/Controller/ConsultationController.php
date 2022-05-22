<?php

namespace App\Controller;

use App\Entity\RDV;
use App\Entity\Patient;
use App\Form\RdvType;
use App\Form\ValidationType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints\Date;

class ConsultationController extends AbstractController
{
    /**
     * @Route("/consultation/{id}", name="consultation")
     */
    public function consultation($id)
    {
        $repository = $this->getDoctrine()->getRepository(RDV::class);
        $lesRdv = $repository->findByUnPatient($id);
        return $this->render('consultation/index.html.twig', ['rdv' => $lesRdv]);
    }

    /**
     * @Route("/consultationAdmin", name="consultationAdmin")
     */
    public function consultationAdmin()
    {
        $repository = $this->getDoctrine()->getRepository(RDV::class);
        $lesRdv = $repository->findAll();
        return $this->render('consultation/consultationAdmin.html.twig', ['rdv' => $lesRdv]);
    }

    /**
     * @Route("/consultationA/{id}", name="consultationA")
     */
    public function consultationA($id)
    {
        $repository = $this->getDoctrine()->getRepository(RDV::class);
        $lesRdv = $repository->findByUnAssistant($id);
        return $this->render('consultation/consultationA.html.twig', ['rdv' => $lesRdv]);
    }

    /**
     * @Route("/consultationM/{date}", name="consultationM")
     */
    public function consultationM($date)
    {
        $repository = $this->getDoctrine()->getRepository(RDV::class);
        $laDate = \DateTime::createFromFormat('Y-m-d', $date);
        $lesRdv = $repository->findByDate($laDate);
        $lesDates = $repository->ok();
        return $this->render(
            'consultation/consultationM.html.twig',
            ['rdv' => $lesRdv, 'dates' => $lesDates]
        );
    }

    /**
     * @Route("/ajouter/{id}",name="ajouter")
     */
    public function ajouter($id, Request $request): Response
    {
        $em = $this->getDoctrine()->getManager();
        $rdv = new Rdv();
        $form = $this->createForm(RdvType::class, $rdv);
        $user = $this->getUser();

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $rdv = $form->getData();
            $rdv->setValidation(0);
            $rdv->setUnPatient($user->getUnPatient());
            $rdv->setUnAssistant($user->getUnAssistant());
            $em = $this->getDoctrine()->getManager();
            $em->persist($rdv);
            $em->flush();

            /* return $this->redirectToRoute('login');*/
        }


        return $this->render('consultation/ajouter.html.twig', [
            'form' => $form->createView(),
        ]);
    }


    /**
     * @Route("/validation/{id}",name="validation")
     */
    public function validation($id, Request $request): Response
    {

        $repository = $this->getDoctrine()->getRepository(Rdv::class);
        $rdv = $repository->find($id);
        $form = $this->createForm(ValidationType::class, $rdv);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $rdv = $form->getData();
            $em = $this->getDoctrine()->getManager();
            $em->persist($rdv);
            $em->flush();
            return $this->redirectToRoute('principal');
        }


        return $this->render('consultation/validation.html.twig', [
            'form' => $form->createView(),
        ]);
    }
    /**
     * @Route("/annuler/{id}", name="annuler")
     */
    public function annuler($id)
    {
        $repository = $this->getDoctrine()->getRepository(Rdv::class);
        $rdv = $repository->find($id);
        $em = $this->getDoctrine()->getManager();
        $em->remove($rdv);
        $em->flush();

        //     return $this->redirectToRoute('principal');
        // }
    }

    /**
     * @Route("/terminer/{id}", name="terminer")
     */
    public function terminer($id, Request $request)
    {
        $repository = $this->getDoctrine()->getRepository(Rdv::class);
        $rdv = $repository->find($id);
        $heureActuelle = new \DateTime('now');
        $rdv->setHeureFin($heureActuelle);
        $em = $this->getDoctrine()->getManager();
        $em->persist($rdv);
        $em->flush();

        return $this->redirectToRoute('principal');
    }
}
