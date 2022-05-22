<?php

namespace App\Entity;

use App\Repository\IndisponibiliteRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=IndisponibiliteRepository::class)
 */
class Indisponibilite
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="date")
     */
    private $date;

    /**
     * @ORM\Column(type="time")
     */
    private $heureDeb;

    /**
     * @ORM\Column(type="time", nullable=true)
     */
    private $heureFin;

    /**
     * @ORM\ManyToOne(targetEntity=Motif::class)
     */
    private $unMotif;

    /**
     * @ORM\ManyToOne(targetEntity=Medecin::class, inversedBy="desIndisponibilite")
     */
    private $unMedecin;

    /**
     * @ORM\ManyToOne(targetEntity=Rdv::class, inversedBy="UneIndisp")
     */
    private $rdv;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(\DateTimeInterface $date): self
    {
        $this->date = $date;

        return $this;
    }

    public function getHeureDeb(): ?\DateTimeInterface
    {
        return $this->heureDeb;
    }

    public function setHeureDeb(\DateTimeInterface $heureDeb): self
    {
        $this->heureDeb = $heureDeb;

        return $this;
    }

    public function getHeureFin(): ?\DateTimeInterface
    {
        return $this->heureFin;
    }

    public function setHeureFin(?\DateTimeInterface $heureFin): self
    {
        $this->heureFin = $heureFin;

        return $this;
    }

    public function getUnMotif(): ?Motif
    {
        return $this->unMotif;
    }

    public function setUnMotif(?Motif $unMotif): self
    {
        $this->unMotif = $unMotif;

        return $this;
    }

    public function getUnMedecin(): ?Medecin
    {
        return $this->unMedecin;
    }

    public function setUnMedecin(?Medecin $unMedecin): self
    {
        $this->unMedecin = $unMedecin;

        return $this;
    }

    public function getRdv(): ?Rdv
    {
        return $this->rdv;
    }

    public function setRdv(?Rdv $rdv): self
    {
        $this->rdv = $rdv;

        return $this;
    }
}
