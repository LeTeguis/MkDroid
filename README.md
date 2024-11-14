
# MkDroid

MkDroid is a framework for generating Android projects in native C++ using **Premake5**. 
It includes tools for automating APK compilation, signing, cleanup and deployment, 
as well as for managing connected Android devices.


## 📋 Features

- Android project generation with **Premake5**.
- Support for **Gradle**, **Clang** and other compilers.
- Automation of common tasks:
  - Compilation
  - APK signing and verification
  - Project cleanup
  - Installation of APKs on connected devices
- Flexible system for integration with third-party projects.
- Native **C++ compatibility** for optimum performance.

---

## 🛠️ Project structure

Here's an overview of the main folder structure:

```
├── nkentools/
│ ├── android/ # Gradle scripts for Android
│ ├── commands/ # Python scripts for various commands
│ ├── premake/ # Premake5 binaries and modules
│ └── workspace/ # Project-specific files and configurations
├── nken.sh # Main shell script
├── nken.bat # Main batch script
└── premake5.lua # Example Premake5 configuration file
```

---

## 🚀 Installation and configuration

### 1️⃣ Installation

1. **Launch the MkDroid project:**
   ```bash
   git clone https://github.com/LeTeguis/mkdroid.git
   cd mkdroid
   ```

2. **Copy the necessary files into your third-party project:**
   - Copy the `nkentools/` folder and the following files to the root of your project:
     - `nken.sh`
     - `nken.bat`
     - `.nkenclean`

### 2️⃣ Configuration

1. Create a `premake5.lua` file in your project.
2. Basic configuration example:
   ```lua
   include “nkentools/config.lua

   workspace “MKDROID
       configurations { “Debug”, “Release” }
       architecture “arm64

       include “AppBase”
       include “NativeActivity”
   ```
3. Add your specific projects and libraries to the file.

---

## 🔧 Usage

The following commands allow you to perform various tasks from the terminal or command prompt.

### 1️⃣ Project generation

Use Premake5 to generate an Android project:
```bash
./nken gen gradle
```

### 2️⃣ Compiling

Compile the project with a specific compiler:
```bash
./nken build gradle --path ./myproject --config release
```

### 3️⃣ Signing and verifying APKs

- Signing an APK :
  ```bash
  ./nken sign --apk myapp.apk --keystore mykeystore.jks --alias mykeyalias --storepass mystorepass --keypass mykeypass
  ```

- Check if an APK is signed :
  ```bash
  ./nken issign --apk myapp.apk
  ```

### 4️⃣ Installation on Android devices

Install an APK on a specific device:
```bash
./nken adb install --device_id <device_id> --apk <path_to_apk>
```

### 5️⃣ Cleaning

Clean up the generated files:
```bash
./nken clean
```

---

## ⚙️ System requirements

- Java JDK**: 17 or higher
- Android SDK**: Minimum version 21
- Android NDK**: Version 25.1.8937393 or higher
- **CMake**: 3.22.1 or higher
- Gradle**: 8.1 or higher

---

## 📖 Documentation

- **Configuring premake5.lua** : See `nkentools/premake/mkdroid/` for detailed examples.
- **Available commands** : All Python commands can be found in the `nkentools/commands/` folder.

---

## 🛠️ Development

To contribute to or extend the functionality of MkDroid :
1. Edit or add lua scripts in `nkentools/premake/mkdroid/`.
1. Modify or add Python scripts in `nkentools/commands/`.
2. Add new features in `nken.sh` or `nken.bat` or others.

---

## 📜 License

This project is licensed under the MIT license. See the `LICENSE` file for details.

---

## 🤝 Contributions

Contributions are welcome! Feel free to submit issues, pull requests or discuss new ideas for improving MkDroid.

---

## 🧩 Example project

A complete example is available in the `./` folder. Follow these steps to configure it:
1. Copy the `nkentools/` files and the `premake5.lua` script.
2. Modify `premake5.lua` to add your projects.

---

## 💬 Support

For questions or assistance, please contact us at : `teuguiasederis@gmail.com`.

---

## 🛡️ Best practices

1. **Folder structure**: Organize your projects with clear subfolders to separate native code, resources and Gradle scripts.
2. **Premake5 configurations**: Keep your configurations decentralized in several `premake5.lua` files to simplify updates.
3. **Dependency management**: Make sure you add all necessary libraries to your project configurations.
4. **Frequent testing**: Test your APKs on multiple devices and Android versions to ensure compatibility.



---

## 🌟 Acknowledgements

Thanks to all the contributors and developers who have tested MkDroid in their projects! Your feedback helps us to improve this framework.

---

## 🗺️ Roadmap

Here are the next features planned for MkDroid:
1. **CI/CD integration**: Automation of generation and deployment via tools like GitHub Actions or Jenkins.
2. **Kotlin module support**: Compatibility with native Kotlin modules and libraries.

If you have any suggestions or ideas for MkDroid, please share them in the **Issues** section of the GitHub project or contact me by mail.

---

🎉 **Thank you for using MkDroid!**  
Let us know if you have any ideas or have created a project using this framework.

Translated with DeepL.com (free version)