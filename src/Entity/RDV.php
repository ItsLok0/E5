<?php

namespace App\Entity;

use App\Repository\RDVRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=RDVRepository::class)
 */
class RDV
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
     * @ORM\Column(type="string", length=255)
     */
    private $libelle;

    /**
     * @ORM\ManyToOne(targetEntity=Medecin::class, inversedBy="desRDV")
     */
    private $unMedecin;

    /**
     * @ORM\ManyToOne(targetEntity=Assistant::class, inversedBy="desRDV")
     */
    private $unAssistant;

    /**
     * @ORM\ManyToOne(targetEntity=Patient::class, inversedBy="desRDV")
     */
    private $unPatient;

    /**
     * @ORM\Column(type="boolean")
     */
    private $validation;

    /**
     * @ORM\OneToMany(targetEntity=Indisponibilite::class, mappedBy="rdv")
     */
    private $UneIndisp;

    public function __construct()
    {
        $this->UneIndisp = new ArrayCollection();
    }

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

    public function getLibelle(): ?string
    {
        return $this->libelle;
    }

    public function setLibelle(string $libelle): self
    {
        $this->libelle = $libelle;

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

    public function getUnAssistant(): ?Assistant
    {
        return $this->unAssistant;
    }

    public function setUnAssistant(?Assistant $unAssistant): self
    {
        $this->unAssistant = $unAssistant;

        return $this;
    }

    public function getUnPatient(): ?Patient
    {
        return $this->unPatient;
    }

    public function setUnPatient(?Patient $unPatient): self
    {
        $this->unPatient = $unPatient;

        return $this;
    }

    public function getValidation(): ?bool
    {
        return $this->validation;
    }

    public function setValidation(bool $validation): self
    {
        $this->validation = $validation;

        return $this;
    }

    /**
     * @return Collection|Indisponibilite[]
     */
    public function getUneIndisp(): Collection
    {
        return $this->UneIndisp;
    }

    public function addUneIndisp(Indisponibilite $uneIndisp): self
    {
        if (!$this->UneIndisp->contains($uneIndisp)) {
            $this->UneIndisp[] = $uneIndisp;
            $uneIndisp->setRdv($this);
        }

        return $this;
    }

    public function removeUneIndisp(Indisponibilite $uneIndisp): self
    {
        if ($this->UneIndisp->removeElement($uneIndisp)) {
            // set the owning side to null (unless already changed)
            if ($uneIndisp->getRdv() === $this) {
                $uneIndisp->setRdv(null);
            }
        }

        return $this;
    }

    
}
