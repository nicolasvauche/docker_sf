# Docker & Symfony  
Installation d'un environnement NginX / MySQL / PHP8 / Symfony avec Docker.  
Services complémentaires : PHPMyAdmin / MailDev  

## Installation  
1. Cloner le dépôt git :  
`git clone https://github.com/nicolasvauche/docker_sf.git`  

2. Dupliquer le fichier .env-sample et le renommer en .env :  
`cd docker_sf`  
`cp .env-sample .env`  

3. Modifier ce fichier en renseignant vos informations (ports et base de données)  

4. Monter les conteneurs Docker :  
`docker-compose up -d --build`  

5. Ouvrir un autre onglet de votre terminal, et accéder à la console de votre conteneur principal :  
`docker-compose exec php /bin/bash`  

6. Tester le Symfony CLI :  
`symfony check:requirements`  

7. Initialiser un nouveau projet Symfony :  
**Note : supprimer le fichier delete-me.txt avant d'initialiser un projet SF**  
- Latest : `symfony new --full .`  
- LTS : `composer create-project symfony/website-skeleton:"^5.4" .`  