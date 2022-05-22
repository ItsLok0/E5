<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211124145255 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE assistant (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(50) NOT NULL, prenom VARCHAR(50) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE indisponibilite (id INT AUTO_INCREMENT NOT NULL, un_motif_id INT DEFAULT NULL, un_medecin_id INT DEFAULT NULL, date DATE NOT NULL, heure_deb TIME NOT NULL, heure_fin TIME DEFAULT NULL, INDEX IDX_8717036F33FB9249 (un_motif_id), INDEX IDX_8717036F65F36D13 (un_medecin_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE medecin (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(50) NOT NULL, prenom VARCHAR(50) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE motif (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE patient (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(50) NOT NULL, prenom VARCHAR(50) NOT NULL, tel VARCHAR(10) NOT NULL, num_secu VARCHAR(64) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE rdv (id INT AUTO_INCREMENT NOT NULL, un_medecin_id INT DEFAULT NULL, un_assistant_id INT DEFAULT NULL, un_patient_id INT DEFAULT NULL, date DATE NOT NULL, heure_deb TIME NOT NULL, heure_fin TIME DEFAULT NULL, libelle VARCHAR(255) NOT NULL, validation TINYINT(1) NOT NULL, INDEX IDX_10C31F8665F36D13 (un_medecin_id), INDEX IDX_10C31F8610321EAD (un_assistant_id), INDEX IDX_10C31F86A89E5EE (un_patient_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE utilisateur (id INT AUTO_INCREMENT NOT NULL, un_medecin_id INT DEFAULT NULL, un_assistant_id INT DEFAULT NULL, un_patient_id INT DEFAULT NULL, email VARCHAR(180) NOT NULL, roles JSON NOT NULL, password VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_1D1C63B3E7927C74 (email), UNIQUE INDEX UNIQ_1D1C63B365F36D13 (un_medecin_id), UNIQUE INDEX UNIQ_1D1C63B310321EAD (un_assistant_id), UNIQUE INDEX UNIQ_1D1C63B3A89E5EE (un_patient_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE indisponibilite ADD CONSTRAINT FK_8717036F33FB9249 FOREIGN KEY (un_motif_id) REFERENCES motif (id)');
        $this->addSql('ALTER TABLE indisponibilite ADD CONSTRAINT FK_8717036F65F36D13 FOREIGN KEY (un_medecin_id) REFERENCES medecin (id)');
        $this->addSql('ALTER TABLE rdv ADD CONSTRAINT FK_10C31F8665F36D13 FOREIGN KEY (un_medecin_id) REFERENCES medecin (id)');
        $this->addSql('ALTER TABLE rdv ADD CONSTRAINT FK_10C31F8610321EAD FOREIGN KEY (un_assistant_id) REFERENCES assistant (id)');
        $this->addSql('ALTER TABLE rdv ADD CONSTRAINT FK_10C31F86A89E5EE FOREIGN KEY (un_patient_id) REFERENCES patient (id)');
        $this->addSql('ALTER TABLE utilisateur ADD CONSTRAINT FK_1D1C63B365F36D13 FOREIGN KEY (un_medecin_id) REFERENCES medecin (id)');
        $this->addSql('ALTER TABLE utilisateur ADD CONSTRAINT FK_1D1C63B310321EAD FOREIGN KEY (un_assistant_id) REFERENCES assistant (id)');
        $this->addSql('ALTER TABLE utilisateur ADD CONSTRAINT FK_1D1C63B3A89E5EE FOREIGN KEY (un_patient_id) REFERENCES patient (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE rdv DROP FOREIGN KEY FK_10C31F8610321EAD');
        $this->addSql('ALTER TABLE utilisateur DROP FOREIGN KEY FK_1D1C63B310321EAD');
        $this->addSql('ALTER TABLE indisponibilite DROP FOREIGN KEY FK_8717036F65F36D13');
        $this->addSql('ALTER TABLE rdv DROP FOREIGN KEY FK_10C31F8665F36D13');
        $this->addSql('ALTER TABLE utilisateur DROP FOREIGN KEY FK_1D1C63B365F36D13');
        $this->addSql('ALTER TABLE indisponibilite DROP FOREIGN KEY FK_8717036F33FB9249');
        $this->addSql('ALTER TABLE rdv DROP FOREIGN KEY FK_10C31F86A89E5EE');
        $this->addSql('ALTER TABLE utilisateur DROP FOREIGN KEY FK_1D1C63B3A89E5EE');
        $this->addSql('DROP TABLE assistant');
        $this->addSql('DROP TABLE indisponibilite');
        $this->addSql('DROP TABLE medecin');
        $this->addSql('DROP TABLE motif');
        $this->addSql('DROP TABLE patient');
        $this->addSql('DROP TABLE rdv');
        $this->addSql('DROP TABLE utilisateur');
    }
}
