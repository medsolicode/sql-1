
CREATE TABLE utilisateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE article (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(200) NOT NULL,
    contenu TEXT NOT NULL,
    date_pub DATE,
    utilisateur_id INT,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id)
);

CREATE TABLE commentaire (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contenu TEXT,
    date_commentaire DATE,
    article_id INT,
    utilisateur_id INT,
    FOREIGN KEY (article_id) REFERENCES article(id),
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id)
);


INSERT INTO utilisateur (nom, email) VALUES
('Ali', 'ali@test.com'),
('Sara', 'sara@test.com'),
('Youssef', 'youssef@test.com');

INSERT INTO article (titre, contenu, date_pub, utilisateur_id) VALUES
('Introduction à SQL', 'Cours de base sur SQL', '2025-01-10', 1),
('HTML pour débutants', 'Bases du HTML', '2025-01-12', 1),
('CSS avancé', 'Flexbox et Grid', '2025-01-15', 2),
('JavaScript Basics', 'Variables et fonctions', '2025-01-18', 3);

INSERT INTO commentaire (contenu, date_commentaire, article_id, utilisateur_id) VALUES
('Très utile !', '2025-01-11', 1, 2),
('Merci pour le cours', '2025-01-12', 2, 3),
('Super article', '2025-01-16', 3, 1);


SELECT 
  article.titre,
  utilisateur.nom
FROM article
INNER JOIN utilisateur
ON article.utilisateur_id = utilisateur.id;

SELECT 
  utilisateur.nom,
  COUNT(article.id) AS nb_articles
FROM utilisateur
INNER JOIN article
ON article.utilisateur_id = utilisateur.id
GROUP BY utilisateur.nom;

SELECT titre, date_pub
FROM article
ORDER BY date_pub DESC
LIMIT 2;


START TRANSACTION;

INSERT INTO article (titre, contenu, date_pub, utilisateur_id)
VALUES ('Nouveau post', 'Texte exemple', '2025-07-18', 1);

UPDATE utilisateur
SET email = 'alice.update@test.com'
WHERE id = 1;

DELETE FROM commentaire
WHERE id = 3;

COMMIT;

SELECT * FROM article;
