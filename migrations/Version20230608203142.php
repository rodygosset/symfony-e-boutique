<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230608203142 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE customer_adress DROP FOREIGN KEY FK_ED291BEFA832C1C9');
        $this->addSql('DROP INDEX IDX_ED291BEFA832C1C9 ON customer_adress');
        $this->addSql('ALTER TABLE customer_adress DROP email_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE customer_adress ADD email_id INT NOT NULL');
        $this->addSql('ALTER TABLE customer_adress ADD CONSTRAINT FK_ED291BEFA832C1C9 FOREIGN KEY (email_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_ED291BEFA832C1C9 ON customer_adress (email_id)');
    }
}
