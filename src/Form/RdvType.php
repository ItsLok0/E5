<?php

namespace App\Form;

use App\Entity\RDV;
use App\Entity\Patient;
use App\Entity\Medecin;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
class RdvType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('date')
            ->add('heureDeb',TimeType::class,array('label'=>'Heure du rendez-vous'))
           
            ->add('libelle',TextType::class,array('label'=>'Motif:'))
            /*->add('validation')
            ->add('unPatient',EntityType::class,array('class'=>Patient::class,'choice_label'=>'nom'))*/
            ->add('unMedecin',EntityType::class,array('class'=>Medecin::class,'choice_label'=>'nom','label'=>'Sélectionner votre médecin: '))
            /*->add('unAssistant')*/
            ->add('save',SubmitType::class,array('label'=>'Valider'))
            ->getForm()	
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => RDV::class,
        ]);
    }
}
