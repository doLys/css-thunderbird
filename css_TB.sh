#!/bin/bash

# CSS content to be added to userChrome.css
# Contenu CSS à ajouter à userChrome.css
css_content=$(cat <<'EOF'
/* Styles for every other message line */
/* Styles pour chaque autre ligne de message */
#threadTree tr:nth-child(odd) {
  background-color: #f2f2f2; /* Light gray background for odd rows */
  /* Fond gris clair pour les lignes impaires */
}

/* Styles for new unread messages count: same color as folder's name */
/* Styles pour le nombre de nouveaux messages non lus : même couleur que le nom du dossier */
.new-messages > .container > .unread-count {
    color: var(--new-folder-color) !important; /* Use the folder's color for unread count */
    /* Utiliser la couleur du dossier pour le nombre de messages non lus */
    background-color: unset !important; /* Reset background color */
    /* Réinitialiser la couleur de fond */
}

/* Styles for older unread messages count */
/* Styles pour le nombre de messages non lus plus anciens */
.folder-count-badge {
    color: darkgrey !important; /* Dark grey color for older unread messages count */
    /* Couleur gris foncé pour le nombre de messages non lus plus anciens */
    background-color: unset !important; /* Reset background color */
    /* Réinitialiser la couleur de fond */
}

/* Styles for proper menubar position */
/* Styles pour la position correcte de la barre de menu */
#toolbar-menubar {
    order: -1 !important; /* Adjust the order of the menubar */
    /* Ajuster l'ordre de la barre de menu */
}
EOF
)

# Function to set the legacy user profile customizations preference
# Fonction pour définir la préférence des personnalisations de profil utilisateur héritées
set_preference() {
    local profile_dir="$1"  # Get the profile directory as an argument
    # Récupérer le répertoire du profil en argument
    local pref_file="$profile_dir/prefs.js"  # Define the path to prefs.js file
    # Définir le chemin du fichier prefs.js
    
    if [ ! -f "$pref_file" ]; then
        return  # Exit the function if prefs.js does not exist
        # Quitter la fonction si prefs.js n'existe pas
    fi
    
    echo "Checking prefs.js for profile: $(basename "$profile_dir")"
    echo "Vérification de prefs.js pour le profil : $(basename "$profile_dir")"
    
    if grep -q 'toolkit.legacyUserProfileCustomizations.stylesheets' "$pref_file"; then
        echo "Preference already set in profile: $(basename "$profile_dir")"
        echo "Préférence déjà définie dans le profil : $(basename "$profile_dir")"
        return  # Exit the function if preference is already set
        # Quitter la fonction si la préférence est déjà définie
    fi
    
    echo "Setting preference in profile: $(basename "$profile_dir")"
    echo "Définition de la préférence dans le profil : $(basename "$profile_dir")"
    echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> "$pref_file"
    
    echo "Preference set successfully in profile: $(basename "$profile_dir")"
    echo "Préférence définie avec succès dans le profil : $(basename "$profile_dir")"
}

# Function to update userChrome.css with the CSS content
# Fonction pour mettre à jour userChrome.css avec le contenu CSS
update_css() {
    local profile_dir="$1"  # Get the profile directory as an argument
    # Récupérer le répertoire du profil en argument
    local css_file="$profile_dir/chrome/userChrome.css"  # Define the path to userChrome.css file
    # Définir le chemin de userChrome.css
    
    # Create the chrome directory only if prefs.js exists
    # Créer le répertoire chrome uniquement si prefs.js existe
    if [ -f "$profile_dir/prefs.js" ]; then
        mkdir -p "$profile_dir/chrome"  # Create the chrome directory if it doesn't exist
        # Créer le répertoire chrome s'il n'existe pas
        
        if grep -qF "$css_content" "$css_file"; then
            echo "CSS content already exists in profile: $(basename "$profile_dir")"
            echo "Le contenu CSS existe déjà dans le profil : $(basename "$profile_dir")"
            return  # Exit the function if CSS content is already present
            # Quitter la fonction si le contenu CSS est déjà présent
        fi
        
        echo "Updating userChrome.css in profile: $(basename "$profile_dir")"
        echo "Mise à jour de userChrome.css dans le profil : $(basename "$profile_dir")"
        
        echo "$css_content" >> "$css_file"
        
        echo "userChrome.css updated successfully in profile: $(basename "$profile_dir")"
        echo "userChrome.css mis à jour avec succès dans le profil : $(basename "$profile_dir")"
    fi
}

# Main loop to process each Thunderbird profile
# Boucle principale pour traiter chaque profil Thunderbird
for profile_dir in ~/.thunderbird/*; do
    if [ -d "$profile_dir" ]; then
        # Check if prefs.js exists before processing
        # Vérifier si prefs.js existe avant de traiter
        if [ -f "$profile_dir/prefs.js" ]; then
            echo "Processing profile: $(basename "$profile_dir")"
            echo "Traitement du profil : $(basename "$profile_dir")"
            
            set_preference "$profile_dir"
            update_css "$profile_dir"
            
            echo  # Print a blank line for better readability
            echo  # Imprimer une ligne vide pour une meilleure lisibilité
        else
            echo "Skipping non-profile directory: $(basename "$profile_dir")"
            echo "Ignorer le répertoire non profil : $(basename "$profile_dir")"
        fi
    fi
done

echo "Script execution complete."
echo "Exécution du script terminée."

