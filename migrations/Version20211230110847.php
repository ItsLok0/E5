<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211230110847 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE indisponibilite ADD rdv_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE indisponibilite ADD CONSTRAINT FK_8717036F4CCE3F86 FOREIGN KEY (rdv_id) REFERENCES rdv (id)');
        $this->addSql('CREATE INDEX IDX_8717036F4CCE3F86 ON indisponibilite (rdv_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE indisponibilite DROP FOREIGN KEY FK_8717036F4CCE3F86');
        $this->addSql('DROP INDEX IDX_8717036F4CCE3F86 ON indisponibilite');
        $this->addSql('ALTER TABLE indisponibilite DROP rdv_id');
    }
}
