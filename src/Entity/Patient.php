<?php

namespace App\Entity;

use App\Repository\PatientRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=PatientRepository::class)
 */
class Patient
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $nom;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $prenom;

    /**
     * @ORM\Column(type="string", length=10)
     */
    private $tel;

    /**
     * @ORM\Column(type="string", length=64)
     */
    private $numSecu;

    /**
     * @ORM\OneToMany(targetEntity=RDV::class, mappedBy="unPatient")
     */
    private $desRDV;

    public function __construct()
    {
        $this->desRDV = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getPrenom(): ?string
    {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): self
    {
        $this->prenom = $prenom;

        return $this;
    }

    public function getTel(): ?string
    {
        return $this->tel;
    }

    public function setTel(string $tel): self
    {
        $this->tel = $tel;

        return $this;
    }

    public function getNumSecu(): ?string
    {
        return $this->numSecu;
    }

    public function setNumSecu(string $numSecu): self
    {
        $this->numSecu = $numSecu;

        return $this;
    }

    /**
     * @return Collection|RDV[]
     */
    public function getDesRDV(): Collection
    {
        return $this->desRDV;
    }

    public function addDesRDV(RDV $desRDV): self
    {
        if (!$this->desRDV->contains($desRDV)) {
            $this->desRDV[] = $desRDV;
            $desRDV->setUnPatient($this);
        }

        return $this;
    }

    public function removeDesRDV(RDV $desRDV): self
    {
        if ($this->desRDV->removeElement($desRDV)) {
            // set the owning side to null (unless already changed)
            if ($desRDV->getUnPatient() === $this) {
                $desRDV->setUnPatient(null);
            }
        }

        return $this;
    }
}
