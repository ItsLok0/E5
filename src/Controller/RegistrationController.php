<?php

namespace App\Controller;

use App\Entity\Utilisateur;
use App\Entity\Patient;
use App\Entity\Assistant;
use App\Entity\Medecin;
use App\Form\RegistrationFormType;
use App\Form\RegistrationFormPatientType;
use App\Form\RegistrationFormAssistantType;
use App\Form\RegistrationFormMedecinType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

class RegistrationController extends AbstractController
{

    private $security;

    public function __construct(Security $security)
    {
        $this->security = $security;
    }

    /**
     * @Route("/register", name="register")
     */
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager): Response
    {
        $user = new Utilisateur();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        $recupMdp = $form->get('plainPassword')->getData();
        $recupMail = $form->get('email')->getData();
        $containLetter = preg_match('/[a-zA-Z]/', $recupMdp);
        $containDigit = preg_match('/\d/', $recupMdp);
        $containSpecial = preg_match('/[^a-zA-Z\d]/', $recupMdp);
        $validMail = filter_var($recupMail, FILTER_VALIDATE_EMAIL);

        if ($form->isSubmitted() && $form->isValid() && $containDigit && $containLetter && $containSpecial && $validMail) {
            // encode the plain password
            $user->setPassword(
            $userPasswordHasher->hashPassword(
                    $user,
                    $recupMdp
                )
            );

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($user);
            $entityManager->flush();
            // do anything else you need here, like send an email

            return $this->redirectToRoute('principal');
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
            'controller_name' => 'Création d\'un compte',
        ]);
    }


    /**
     * @Route("/registration/registerPatient", name="registerPatient")
     */
    public function registerPatient(Request $request, EntityManagerInterface $entityManager): Response
    {
        $user = $this->security->getUser();

        $repository=$this->getDoctrine()->getRepository(Assistant::class);
        $repositoryUser=$this->getDoctrine()->getRepository(Utilisateur::class);
        $unPatient=$user->getUnAssistant();

        if(is_null($unPatient)){
            $patient = new Patient();
            $form = $this->createForm(RegistrationFormPatientType::class, $patient);
            $form->handleRequest($request);
            $patient = $form->getData();
            $recupNumSecu = $form->get('numSecu')->getData();
            $numSecu = strval($recupNumSecu);
            $key = 'ODkwMDY1OS4zMTU=';
            $encrypter = new \Illuminate\Encryption\Encrypter($key);
            $encrypted = $encrypter->encrypt($numSecu);

            if ($form->isSubmitted() && $form->isValid()) {

                $patient->setNumSecu(
                    $encrypted
                );
                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($medecin);
                $entityManager->flush();

                $user->setUnMedecin($medecin);
                
                $entityManager->persist($user);
                $entityManager->flush();
                // do anything else you need here, like send an email

                return $this->redirectToRoute('principal');
            }
        }
        else {
            $form=$this->createForm(RegistrationFormPatientType::class,$unPatient);
            $form->handleRequest($request);

            if($form->isSubmitted() && $form->isValid()){
                $patient = $form->getData();
                $recupNumSecu = $form->get('numSecu')->getData();
                $numSecu = strval($recupNumSecu);
                $key = 'ODkwMDY1OS4zMTU=';
                $encrypter = new \Illuminate\Encryption\Encrypter($key);
                $encrypted = $encrypter->encrypt($numSecu);

                $patient->setNumSecu(
                    $encrypted
                );

                $em=$this->getDoctrine()->getManager();
                $em->persist($patient);
                $em->flush();

                $user->setUnPatient($patient);
                $entityManager->persist($user);
                $entityManager->flush();

                return $this->redirectToRoute('principal');
            }
        }

        return $this->render('registration/registerPatient.html.twig', [
            'registrationForm' => $form->createView(),
            'controller_name' => 'Modification du compte',
        ]);
    }

    /**
     * @Route("/registration/registerMedecin", name="registerMedecin")
     */
    public function registerMedecin(Request $request, EntityManagerInterface $entityManager): Response
    {
        $user = $this->security->getUser();

        $repository=$this->getDoctrine()->getRepository(Medecin::class);
        $repositoryUser=$this->getDoctrine()->getRepository(Utilisateur::class);
        $unMedecin=$user->getUnMedecin();

        if(is_null($unMedecin)){
            $medecin = new Medecin();
            $form = $this->createForm(RegistrationFormMedecinType::class, $medecin);
            $form->handleRequest($request);

            if ($form->isSubmitted() && $form->isValid()) {

                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($medecin);
                $entityManager->flush();

                $user->setUnMedecin($medecin);
                
                $entityManager->persist($user);
                $entityManager->flush();
                // do anything else you need here, like send an email

                return $this->redirectToRoute('principal');
            }
        }
        else {
            $form=$this->createForm(RegistrationFormMedecinType::class,$unMedecin);
            $form->handleRequest($request);
            if($form->isSubmitted() && $form->isValid()){
                $medecin = $form->getData();
                $em=$this->getDoctrine()->getManager();
                $em->persist($medecin);
                $em->flush();

                $user->setUnMedecin($medecin);
                $entityManager->persist($user);
                $entityManager->flush();

                return $this->redirectToRoute('principal');
            }
        }

        return $this->render('registration/registerMedecin.html.twig', [
            'registrationForm' => $form->createView(),
            'controller_name' => 'Modification du compte',
        ]);
    }

    /**
     * @Route("/registration/registerAssistant", name="registerAssistant")
     */
    public function registerAssistant(Request $request, EntityManagerInterface $entityManager): Response
    {
        $user = $this->security->getUser();

        $repository=$this->getDoctrine()->getRepository(Assistant::class);
        $repositoryUser=$this->getDoctrine()->getRepository(Utilisateur::class);
        $unAssistant=$user->getUnAssistant();

        if(is_null($unAssistant)){
            $assistant = new Assistant();
            $form = $this->createForm(RegistrationFormMedecinType::class, $assistant);
            $form->handleRequest($request);

            if ($form->isSubmitted() && $form->isValid()) {

                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($assistant);
                $entityManager->flush();

                $user->setUnAssistant($assistant);
                
                $entityManager->persist($user);
                $entityManager->flush();
                // do anything else you need here, like send an email

                return $this->redirectToRoute('principal');
            }
        }
        else {
            $form=$this->createForm(RegistrationFormMedecinType::class,$unAssistant);
            $form->handleRequest($request);
            if($form->isSubmitted() && $form->isValid()){
                $assistant = $form->getData();
                $em=$this->getDoctrine()->getManager();
                $em->persist($assistant);
                $em->flush();

                $user->setUnAssistant($assistant);
                $entityManager->persist($user);
                $entityManager->flush();

                return $this->redirectToRoute('principal');
            }
        }

        return $this->render('registration/registerAssistant.html.twig', [
            'registrationForm' => $form->createView(),
            'controller_name' => 'Modification du compte',
        ]);
    }

}
