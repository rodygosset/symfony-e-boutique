<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230607211456 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE customer_adress ADD user_id INT NOT NULL');
        $this->addSql('ALTER TABLE customer_adress ADD CONSTRAINT FK_ED291BEFA76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        $this->addSql('CREATE INDEX IDX_ED291BEFA76ED395 ON customer_adress (user_id)');
        $this->addSql('ALTER TABLE user ADD roles JSON NOT NULL, CHANGE email email VARCHAR(180) NOT NULL, CHANGE last_name name VARCHAR(255) NOT NULL');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_8D93D649E7927C74 ON user (email)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP INDEX UNIQ_8D93D649E7927C74 ON user');
        $this->addSql('ALTER TABLE user DROP roles, CHANGE email email VARCHAR(255) NOT NULL, CHANGE name last_name VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE customer_adress DROP FOREIGN KEY FK_ED291BEFA76ED395');
        $this->addSql('DROP INDEX IDX_ED291BEFA76ED395 ON customer_adress');
        $this->addSql('ALTER TABLE customer_adress DROP user_id');
    }
}
