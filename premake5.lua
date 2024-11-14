-- premake5.lua for PremakeNDAndroid solution

include "nkentools/config.lua"

workspace "MKDROID"
    configurations { "Debug", "Release" }
    architecture "arm64"  -- Définissez l'architecture cible appropriée

    buildoptions {
        solution.cflags.flags.FatalCompileWarnings,
        solution.cflags.flags.ShadowedVariables,
        solution.cflags.flags.UndefinedIdentifiers,
        solution.cflags.flags.DefineExeception,
        solution.cflags.flags.UnuseFunction,
    }
  
    -- Ajout des C++ flags pour Android
    buildoptions {
        -- solution.cppflags.flags["C++17"]  -- Exemple : utiliser le standard C++17
    }
  
    -- Ajout des options de lien
    linkoptions {
        --solution.ldflags.flags.LinkTimeOptimization
    }


    include "NativeActivity"
    include "AppBase"