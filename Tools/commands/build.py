# build.py

import subprocess
import argparse
import os
import sys
from pathlib import Path

gradle_build_path = "./Tools/android/gradlew"
msvc_build_path = "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\MSBuild\\Current\\Bin\\MSBuild.exe"
clang_build_path = "C:\\Program Files\\LLVM\\bin\\clang.exe"
mingw_build_path = "C:\\Program Files\\MinGW\\bin\\gcc.exe"
make_build_path = "/usr/bin/make"  # Modifier si le chemin de make est différent


def description():
    print("""
    Ce script permet de compiler des projets avec plusieurs outils de compilation (Gradle, MSBuild, Clang, MinGW, Make).
    Vous pouvez spécifier le type de build et le chemin du projet.
    """)


def help_command():
    print("""
    Utilisation : ./nken build [options]
    
    Options:
        action                      : Système de build à utiliser [gradle|msvc|clang|mingw|make] (obligatoire).
        --path                      : Chemin vers la solution/projet à compiler (obligatoire).
        --config                    : Type de build [debug|release], par défaut "debug".
        --help                      : Affiche cette aide.
        
    Exemples :
        ./nken build gradle --path ./myproject --config release
        ./nken build msvc --path ./myproject.sln --config debug
        ./nken build make --path ./myproject --config release
    """)


def build_gradle(solution_path, config):
    """
    Compile un projet Android en utilisant Gradle Wrapper.
    
    :param solution_path: Chemin vers le répertoire du projet Android.
    :param config: Type de build ('debug' ou 'release').
    """
    if config not in ['debug', 'release']:
        raise ValueError("Le type de build doit être 'debug' ou 'release'.")
    
    build_path = Path(gradle_build_path)
    if not build_path.exists() or not build_path.is_file():
        raise FileNotFoundError(f"Le fichier Gradle Wrapper n'a pas été trouvé : {build_path}")

    command = [
        str(build_path), '-p', str(Path(solution_path)),
        f"assemble{config.capitalize()}"
    ]

    try:
        result = subprocess.run(command, check=True, capture_output=True, text=True, cwd=solution_path)
        print(f"Compilation {config} réussie :\n{result.stdout}")
    except subprocess.CalledProcessError as e:
        print(f"Erreur lors de la compilation {config} : {e.stderr}")
        exit(1)


def build_msvc(solution_path, config):
    """
    Compile un projet Visual Studio en utilisant MSBuild.
    
    :param solution_path: Chemin vers le fichier .sln du projet Visual Studio.
    :param config: Type de build ('debug' ou 'release').
    """
    build_path = msvc_build_path
    if not Path(build_path).exists():
        raise FileNotFoundError(f"MSBuild introuvable : {build_path}")

    command = [build_path, solution_path, f'/property:Configuration={config}']

    try:
        result = subprocess.run(command, check=True, capture_output=True, text=True)
        print(f"Compilation {config} réussie :\n{result.stdout}")
    except subprocess.CalledProcessError as e:
        print(f"Erreur lors de la compilation {config} : {e.stderr}")
        exit(1)


def build_clang(solution_path, config):
    """
    Compile un projet avec Clang.
    
    :param solution_path: Chemin vers le fichier source ou le répertoire du projet.
    :param config: Type de build ('debug' ou 'release').
    """
    build_path = Path(clang_build_path)
    if not build_path.exists():
        raise FileNotFoundError(f"Clang introuvable : {build_path}")

    command = [str(build_path), solution_path, "-o", "output"]

    if config == "debug":
        command.append("-g")
    elif config == "release":
        command.append("-O3")

    try:
        result = subprocess.run(command, check=True, capture_output=True, text=True)
        print(f"Compilation {config} réussie :\n{result.stdout}")
    except subprocess.CalledProcessError as e:
        print(f"Erreur lors de la compilation {config} : {e.stderr}")
        exit(1)


def build_mingw(solution_path, config):
    """
    Compile un projet avec MinGW.
    
    :param solution_path: Chemin vers le fichier source ou le répertoire du projet.
    :param config: Type de build ('debug' ou 'release').
    """
    build_path = Path(mingw_build_path)
    if not build_path.exists():
        raise FileNotFoundError(f"MinGW introuvable : {build_path}")

    command = [str(build_path), solution_path, "-o", "output"]

    if config == "debug":
        command.append("-g")
    elif config == "release":
        command.append("-O3")

    try:
        result = subprocess.run(command, check=True, capture_output=True, text=True)
        print(f"Compilation {config} réussie :\n{result.stdout}")
    except subprocess.CalledProcessError as e:
        print(f"Erreur lors de la compilation {config} : {e.stderr}")
        exit(1)


def build_make(solution_path, config):
    """
    Compile un projet en utilisant Make.
    
    :param solution_path: Chemin vers le répertoire contenant le Makefile.
    :param config: Type de build ('debug' ou 'release').
    """
    build_path = Path(make_build_path)
    if not build_path.exists():
        raise FileNotFoundError(f"Make introuvable : {build_path}")

    command = [str(build_path)]
    
    # Ajouter la configuration de build comme variable d'environnement si nécessaire
    if config == "debug":
        command.append("DEBUG=1")
    elif config == "release":
        command.append("RELEASE=1")

    try:
        result = subprocess.run(command, check=True, capture_output=True, text=True, cwd=solution_path)
        print(f"Compilation {config} réussie :\n{result.stdout}")
    except subprocess.CalledProcessError as e:
        print(f"Erreur lors de la compilation {config} : {e.stderr}")
        exit(1)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Outil de compilation multi-plateforme.")
    
    parser.add_argument("action", choices=["gradle", "msvc", "clang", "mingw", "make"], help="Action à exécuter")
    parser.add_argument('--path', default='./', help="Chemin vers la solution/projet à compiler.")
    parser.add_argument('--config', default='debug', choices=['debug', 'release'], help="Type de build (par défaut : debug).")

    args = parser.parse_args()

    if args.action == 'gradle':
        build_gradle(args.path, args.config)
    elif args.action == 'msvc':
        build_msvc(args.path, args.config)
    elif args.action == 'clang':
        build_clang(args.path, args.config)
    elif args.action == 'mingw':
        build_mingw(args.path, args.config)
    elif args.action == 'make':
        build_make(args.path, args.config)
