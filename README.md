
# MkDroid

MkDroid est un framework qui permet de générer des projets Android en C++ natif à l'aide de **Premake5**. 
Il inclut des outils pour automatiser la compilation, la signature, le nettoyage et le déploiement d'APK, 
ainsi que pour gérer les appareils Android connectés.

## 📋 Fonctionnalités

- Génération de projets Android avec **Premake5**.
- Prise en charge des compilateurs **Gradle**, **Clang**, et autres.
- Automatisation des tâches courantes :
  - Compilation
  - Signature et vérification des APK
  - Nettoyage des projets
  - Installation des APK sur des appareils connectés
- Système flexible permettant l'intégration avec des projets tiers.
- Compatibilité avec **C++ natif** pour une performance optimale.

---

## 🛠️ Structure du projet

Voici un aperçu de la structure des dossiers principaux :

```
├── tools/
│   ├── android/         # Scripts Gradle pour Android
│   ├── commands/        # Scripts Python pour diverses commandes
│   ├── premake/         # Binaires et modules Premake5
│   └── workspace/       # Fichiers et configurations spécifiques aux projets
├── nken.sh              # Script Shell principal
├── nken.bat             # Script Batch principal
└── premake5.lua         # Exemple de fichier de configuration Premake5
```

---

## 🚀 Installation et configuration

### 1️⃣ Installation

1. **Clonez le projet MkDroid :**
   ```bash
   git clone https://github.com/votre-repo/mkdroid.git
   cd mkdroid
   ```

2. **Copiez les fichiers nécessaires dans votre projet tiers :**
   - Copiez le dossier `tools/` et les fichiers suivants dans la racine de votre projet :
     - `nken.sh`
     - `nken.bat`
     - `.nkenclean`

### 2️⃣ Configuration

1. Créez un fichier `premake5.lua` dans votre projet.
2. Exemple de configuration basique :
   ```lua
   include "tools/config.lua"

   workspace "MKDROID"
       configurations { "Debug", "Release" }
       architecture "arm64"

       include "AppBase"
       include "NativeActivity"
   ```
3. Ajoutez vos projets et bibliothèques spécifiques dans le fichier.

---

## 🔧 Utilisation

Les commandes suivantes permettent d'exécuter différentes tâches depuis le terminal ou l'invite de commande.

### 1️⃣ Génération de projets

Utilisez Premake5 pour générer un projet Android :
```bash
./nken gen gradle
```

### 2️⃣ Compilation

Compilez le projet avec un compilateur spécifique :
```bash
./nken build gradle --path ./myproject --config release
```

### 3️⃣ Signature et vérification des APK

- Signer un APK :
  ```bash
  ./nken sign --apk myapp.apk --keystore mykeystore.jks --alias mykeyalias --storepass mystorepass --keypass mykeypass
  ```

- Vérifier si un APK est signé :
  ```bash
  ./nken issign --apk myapp.apk
  ```

### 4️⃣ Installation sur appareil Android

Installez un APK sur un appareil spécifique :
```bash
./nken adb install --device_id <device_id> --apk <path_to_apk>
```

### 5️⃣ Nettoyage

Nettoyez les fichiers générés :
```bash
./nken clean
```

---

## ⚙️ Configuration système requise

- **Java JDK** : 17 ou supérieur
- **Android SDK** : Version minimale 21
- **Android NDK** : Version 25.1.8937393 ou supérieure
- **CMake** : 3.22.1 ou supérieur
- **Gradle** : 8.1 ou supérieur

---

## 📖 Documentation

- **Configurer premake5.lua** : Consultez `tools/premake/mkdroid/` pour des exemples détaillés.
- **Commandes disponibles** : Toutes les commandes Python se trouvent dans le dossier `tools/commands/`.

---

## 🛠️ Développement

Pour contribuer ou étendre les fonctionnalités de MkDroid :
1. Modifiez ou ajoutez des scripts lua dans `tools/premake/mkdroid/`.
1. Modifiez ou ajoutez des scripts Python dans `tools/commands/`.
2. Ajoutez de nouvelles fonctionnalités dans `nken.sh` ou `nken.bat` ou autres.

---

## 📜 Licence

Ce projet est sous licence MIT. Consultez le fichier `LICENSE` pour plus de détails.

---

## 🤝 Contributions

Les contributions sont les bienvenues ! N'hésitez pas à soumettre des issues, des pull requests ou à discuter de nouvelles idées pour améliorer MkDroid.

---

## 🧩 Exemple de projet

Un exemple complet est disponible dans le dossier `./`. Suivez ces étapes pour le configurer :
1. Copiez les fichiers de `tools/` et le script `premake5.lua`.
2. Modifiez `premake5.lua` pour ajouter vos projets.

---

## 💬 Support

Pour toute question ou assistance, contactez-nous à : `teuguiasederis@gmail.com`.

---

## 🛡️ Bonnes pratiques

1. **Structure des dossiers** : Organisez vos projets avec des sous-dossiers clairs pour séparer le code natif, les ressources et les scripts Gradle.
2. **Configurations Premake5** : Gardez vos configurations decentralisées dans plusieurs fichiers `premake5.lua` pour simplifier les mises à jour.
3. **Gestion des dépendances** : Assurez-vous d'ajouter toutes les bibliothèques nécessaires dans les configurations de vos projets.
4. **Tests fréquents** : Testez vos APK sur plusieurs appareils et versions Android pour garantir la compatibilité.

---

## 🌟 Remerciements

Merci à tous les contributeurs et aux développeurs qui ont testé MkDroid dans leurs projets ! Votre feedback nous aide à améliorer ce framework.

---

## 🗺️ Roadmap

Voici les prochaines fonctionnalités prévues pour MkDroid :
1. **Intégration CI/CD** : Automatisation de la génération et du déploiement via des outils comme GitHub Actions ou Jenkins.
2. **Support des modules Kotlin** : Compatibilité avec les bibliothèques et modules Kotlin natifs.

Si vous avez des suggestions ou des idées pour MkDroid, n'hésitez pas à les partager dans la section **Issues** du projet GitHub ou a me joindre par mail.

---

🎉 **Merci d'utiliser MkDroid !**  
Faites-nous savoir si vous avez des idées ou si vous avez créé un projet en utilisant ce framework.
