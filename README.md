# Docker & Symfony + MySQL  
Installation d'un environnement NginX / MySQL / PHP8 / NodeJS / Yarn / Symfony CLI avec Docker.  
Services complémentaires : PHPMyAdmin / MailDev  

---  

## Installation  
  1. Cloner le dépôt git :  
  `git clone https://github.com/nicolasvauche/docker_sf.git`  

  2. Dupliquer le fichier .env-sample et le renommer en .env :  
  `cd docker_sf`  
  `cp .env-sample .env`  
  Modifier ce fichier en renseignant vos informations  

  3. Monter les conteneurs Docker :  
  `docker-compose up -d --build`  

  4. Ouvrir un autre onglet de votre terminal, et accéder à la console de votre conteneur principal :  
  `docker-compose exec php /bin/bash`  

  5. Tester le Symfony CLI :  
  `symfony check:requirements`  

---  

## Installer un projet Symfony :  
Toutes les commandes sont exécutées dans le terminal de votre conteneur principal :  
- `php bin/console […]`  
- `git […]`  
- `npm […]`  
- `yarn […]`  

**Note : supprimer le fichier delete-me.txt avant d'initialiser un projet SF**  
`rm delete-me.txt`  

- Latest : `symfony new --full .`  
- LTS : `composer create-project symfony/website-skeleton:"^5.4" .`  
