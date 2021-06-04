# Examen - projet :

## Introduction ;

Aujourd'hui, le cloud prends une part de plus en plus importantes dans les infrastructures et le développement. De plus l'utilisation des services managés et de l'Infrastructure As Code a changé les paradigmes de nos métiers. Dans ce cadre, votre évaluation va consister en un projet a réaliser par deux, de préférence entre {un,une} Ops et {un,une} Dev. Le but sera d'éprouver les capacités de collaboration offertes par Git et Gitlab. Vous devrez donc montez deux projets Git, l'un pour l'infra et l'autre pour le dev, totalement automatisés.

Pour cela vous allez aborder les deux thématiques suivantes :

* L'Infrastructure As Code avec Terraform sur le cloud AWS
* Le développement dit "serverless" sur une Lambda AWS de code Python

## Consignes :

Sur une instance Gitlab CE autohébergée ou sur Gitlab.com, cela peut-être celle créé pendant les TPs, effectuer les actions suivantes :

* 2 projets Git et 2 comptes associés pour chacunes des personnes. L'un pour l'infrastructure l'autre pour le code. Le code vous est fournis dans les 2 répertoires `Terraform` pour la partie OPS et `Python` pour la partie Dev.
* 2 chaînes CD complète pour chacun des projets (décrite en détail dans le `Makefile`) 
	* Pour l'infrastructure, la chaine sera composée des étapes suivantes :
		* `test` qui executera une validation local des fichiers Terraform
		* `apply` qui lui permettera de déployer l'infrastructure et sotckera les fichiers `terraform.tfstate` dans un artefact (15 jours de conservation)
		* `destroy` qui va permettre de supprimer l'infrastrucutre
	* Pour le côté Dev, la chaine sera composées des étapes :
		* `test` qui lancera des tests unitaires
		* `release` qui va packager le code dans un livrable (.zip ici, pour être déployé sur une Lambda)
		* `deploy` qui lui doit-être uniquement executé sur la branche master, et qui va comme son nom l'indique déployer le code

/!\ Si vous réalisez le projet seul, vous n'avez à réaliser que la partie infrastrucutre !

## Notes :

* Utilisez les notions vu en cours, runner Docker, Variables protégé etc 
* Vous devez posséder un compte AWS fonctionnel et être en capacités de vous générer des Access Key Secret Key (token obligatoire pour la CLI)
* Le code est réduit au minimum pour ne pas induire d'erreur spécifique. Néanmoins le principe de fonctionnement est totalement comparable avec des chaînes CD plus classique, vous devez aux mieux respecter les bonnes pratiques.
* Afin de mettre tous le monde sur un pied d'égalité, les étapes de la chaine ainsi que les commandes nécessaires sont disponibles dans un `Makefile` à la base du code de chaques parties.
* Il peut être nécessaire d'adapter le code Terraform (celui-ci étant dépendant des déploiements sur la région France)
* Il faut dans les 2 pipelines exporter les variables AWS donné dans les makefiles avec les valeurs obtenu par la création d'un utilisateur "cli" sur AWS / IAM.

## Rendu :

* Le rendu ce fait sous forme de document pdf au nom des {étudiants,étudiantes} nommé `nom-prenom_nom-prenom_gitlab.pdf` les 2 personnes doivent être en copie du mail (en plus de moi-même)
* Ce rendu doit contenir des screens détaillants les actions importantes effectuées et l'ensemble du code des 2 projets (y compris le `.gitlab-ci.yml`et une archive des .git) le tout dans une archive nom-prenom_nom-prenom_gitlab.tar.gz
* Le rendu doit-être effectué par mail *avant* le : 19 octobre 
