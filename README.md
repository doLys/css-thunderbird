Oui, en copiant et collant le texte que j'ai fourni, vous obtiendrez un fichier **`README.md`** correctement formaté avec toutes les balises de code nécessaires. Voici un rappel sur les balises de code en Markdown :

- Pour le code en ligne, utilisez un seul backtick (\`) de chaque côté du code.
- Pour les blocs de code, utilisez trois backticks (\`\`\`) avant et après le code.

### Voici le contenu complet avec toutes les balises de code clairement indiquées

```markdown
# css_TB.sh

## Description

`css_TB.sh` est un script shell conçu pour améliorer l'interface utilisateur de Thunderbird en appliquant des styles CSS personnalisés via le fichier `userChrome.css`. Ce script automatise la configuration des préférences et l'ajout de styles pour rendre Thunderbird plus agréable et fonctionnel.

## Fonctionnalités

- **Personnalisation de l'interface** : Applique des styles CSS spécifiques pour améliorer l'apparence de Thunderbird.
- **Automatisation** : Configure automatiquement les préférences nécessaires dans le fichier `prefs.js`.
- **Facilité d'utilisation** : Exécutez simplement le script pour appliquer les changements sans intervention manuelle.

## Prérequis

- Un environnement Unix/Linux
- Bash shell
- Thunderbird installé avec des profils configurés

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

## Utilisation

Pour exécuter le script, utilisez la commande suivante dans votre terminal :
```bash
./css_TB.sh
```

Le script va parcourir tous les profils Thunderbird et appliquer les styles CSS définis dans le script.

## Contenu CSS

Voici un aperçu des styles CSS qui seront ajoutés au fichier `userChrome.css` :

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

## Personnalisation des Styles

Les utilisateurs peuvent facilement ajouter ou modifier des styles CSS dans le script. Pour ce faire, recherchez la section `EOF` dans le script `css_TB.sh` et ajoutez vos propres styles entre les balises `EOF` :

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

## Contribuer

Les contributions sont les bienvenues ! Si vous souhaitez contribuer à ce projet, veuillez suivre ces étapes :

1. Forkez le projet.
2. Créez une nouvelle branche pour votre fonctionnalité (`git checkout -b feature/nouvelle-fonctionnalite`).
3. Commitez vos modifications (`git commit -m 'Ajoute une nouvelle fonctionnalité'`).
4. Poussez vers la branche (`git push origin feature/nouvelle-fonctionnalite`).
5. Ouvrez une Pull Request.

## License

Ce projet est sous licence MIT - voir le fichier [LICENSE](LICENSE) pour plus de détails.

## Auteurs

- **nam1962** - [nam1962](https://github.com/nam1962) - Créateur du script et du projet
- **Perplexity AI** - Aide à la création et à la rédaction du README.md et du script
- **Phind** - Améliorations apportées au script

## Remerciements

Merci à tous ceux qui ont contribué à ce projet. N'hésitez pas à poser des questions ou à faire des suggestions pour améliorer le script.
```



