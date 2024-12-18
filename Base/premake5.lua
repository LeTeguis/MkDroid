-- premake5.lua for ./Base

project "Base"
    kind "SharedLib"
    --kind "StaticLib"
    language "C++"
    
    solution.outputdir.build("%{prj.name}")

    files { 
        "./src/**.h", 
        "./src/**.cpp",
        "./src/**.c",
        --solution.properties.ndk.path .. "/" .. solution.properties.ndk.version .. "/sources/android/native_app_glue/android_native_app_glue.c"
    }

    -- Lien avec `native_app_glue` et autres bibliothèques Android
    links { "android", "log", "EGL", "GLESv3", "GLESv1_CM" }  -- Spécifiez les bibliothèques Android ici

    includedirs { 
        "./src",
        --solution.properties.ndk.path .. "/" .. solution.properties.ndk.version .. "/sources/android/native_app_glue"
    }

    local_abi               { solution.abi.flags.all }
    local_platform          (solution.platform.flags.android21)
    local_stl               (solution.stl.flags.cpp_static)
    --local_toolchain         (solution.toolchain.flags.clang)