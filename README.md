```markdown
# css_TB.sh

## Description

`css_TB.sh` est un script shell conçu pour améliorer l'interface utilisateur de Thunderbird en appliquant des styles CSS personnalisés via le fichier `userChrome.css`. Ce script automatise la configuration des préférences et l'ajout de styles pour rendre Thunderbird plus agréable et fonctionnel.

`css_TB.sh` is a shell script designed to enhance the Thunderbird user interface by applying custom CSS styles via the `userChrome.css` file. This script automates the configuration of preferences and the addition of styles to make Thunderbird more pleasant and functional.

## Fonctionnalités / Features

- **Personnalisation de l'interface** : Applique des styles CSS spécifiques pour améliorer l'apparence de Thunderbird.
- **Automatisation** : Configure automatiquement les préférences nécessaires dans le fichier `prefs.js`.
- **Facilité d'utilisation** : Exécutez simplement le script pour appliquer les changements sans intervention manuelle.

- **Interface customization**: Applies specific CSS styles to enhance the appearance of Thunderbird.
- **Automation**: Automatically configures the necessary preferences in the `prefs.js` file.
- **Ease of use**: Simply run the script to apply changes without manual intervention.

## Prérequis / Prerequisites

- Un environnement Unix/Linux
- Bash shell
- Thunderbird installé avec des profils configurés

- A Unix/Linux environment
- Bash shell
- Thunderbird installed with configured profiles

## Installation

1. Clonez le dépôt :
   ```bash
   git clone https://github.com/doLys/css-thunderbird.git
   ```

2. Accédez au répertoire du projet :
   ```bash
   cd css-thunderbird
   ```

3. Créez le répertoire `css-thunderbird` dans le répertoire principal (si nécessaire) :
   ```bash
   mkdir css-thunderbird
   ```

4. Rendez le script exécutable :
   ```bash
   chmod +x css_TB.sh
   ```

1. Clone the repository:
   ```bash
   git clone https://github.com/doLys/css-thunderbird.git
   ```

2. Navigate to the project directory:
   ```bash
   cd css-thunderbird
   ```

3. Create the `css-thunderbird` directory in the main directory (if necessary):
   ```bash
   mkdir css-thunderbird
   ```

4. Make the script executable:
   ```bash
   chmod +x css_TB.sh
   ```

## Utilisation / Usage

Pour exécuter le script, utilisez la commande suivante dans votre terminal :
```bash
./css_TB.sh
```

Le script va parcourir tous les profils Thunderbird et appliquer les styles CSS définis dans le script.

To run the script, use the following command in your terminal:
```bash
./css_TB.sh
```

The script will go through all Thunderbird profiles and apply the CSS styles defined in the script.

## Contenu CSS / CSS Content

Voici un aperçu des styles CSS qui seront ajoutés au fichier `userChrome.css` :

Here is an overview of the CSS styles that will be added to the `userChrome.css` file:

```css
/* Styles for every other message line */
#threadTree tr:nth-child(odd) {
  background-color: #f2f2f2; /* Light gray background for odd rows */
}

/* Styles for new unread messages count: same color as folder's name */
.new-messages > .container > .unread-count {
    color: var(--new-folder-color) !important; /* Use the folder's color for unread count */
    background-color: unset !important; /* Reset background color */
}

/* Styles for older unread messages count */
.folder-count-badge {
    color: darkgrey !important; /* Dark grey color for older unread messages count */
    background-color: unset !important; /* Reset background color */
}

/* Styles for proper menubar position */
#toolbar-menubar {
    order: -1 !important; /* Adjust the order of the menubar */
}
```

## Personnalisation des Styles / Customizing Styles

Les utilisateurs peuvent facilement ajouter ou modifier des styles CSS dans le script. Pour ce faire, recherchez la section `EOF` dans le script `css_TB.sh` et ajoutez vos propres styles entre les balises `EOF` :

Users can easily add or modify CSS styles in the script. To do this, look for the `EOF` section in the `css_TB.sh` script and add your own styles between the `EOF` tags:

```bash
css_content=$(cat <<'EOF'
/* 
  Ajoutez vos styles CSS ici. 
  Exemple : 
  #example {
      color: red; /* Changez la couleur du texte en rouge */
  }
*/
EOF
)
```

## Contribuer / Contributing

Les contributions sont les bienvenues ! Si vous souhaitez contribuer à ce projet, veuillez suivre ces étapes :

Contributions are welcome! If you want to contribute to this project, please follow these steps:

1. Fork the project.
2. Create a new branch for your feature (`git checkout -b feature/nouvelle-fonctionnalite`).
3. Commit your changes (`git commit -m 'Ajoute une nouvelle fonctionnalité'`).
4. Push to the branch (`git push origin feature/nouvelle-fonctionnalite`).
5. Open a Pull Request.

1. Fork the project.
2. Create a new branch for your feature (`git checkout -b feature/new-feature`).
3. Commit your changes (`git commit -m 'Add a new feature'`).
4. Push to the branch (`git push origin feature/new-feature`).
5. Open a Pull Request.

## License / Licence

Ce projet est sous licence AGPL v3 - voir le fichier [LICENSE](LICENSE) pour plus de détails.

This project is licensed under the AGPL v3 - see the [LICENSE](LICENSE) file for more details.

## Auteurs / Authors

- **nam1962** - [nam1962](https://github.com/nam1962) - Créateur du script et du projet
- **Perplexity AI** - Aide à la création et à la rédaction du README.md et du script
- **Phind** - Améliorations apportées au script

- **nam1962** - [nam1962](https://github.com/nam1962) - Creator of the script and the project
- **Perplexity AI** - Help in creating and writing the README.md and the script
- **Phind** - Improvements made to the script

## Remerciements / Acknowledgments

Merci à tous ceux qui ont contribué à ce projet. N'hésitez pas à poser des questions ou à faire des suggestions pour améliorer le script.

Thank you to everyone who contributed to this project. Feel free to ask questions or make suggestions to improve the script.
```
