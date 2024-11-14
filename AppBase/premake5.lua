-- premake5.lua for ./AppBase

project "AppBase"
    --kind "SharedLib"
    kind "ConsoleApp"
    language "C++"
    
    solution.outputdir.build("%{prj.name}")

    files { 
        "./src/**.h", 
        "./src/**.cpp",
        --"$(NDK_PATH)/sources/android/native_app_glue/android_native_app_glue.c"
    }

    links { "NativeActivity", "android", "log", "EGL", "GLESv3", "GLESv1_CM" }
    -- links { "android", "log", "EGL", "GLESv3", "GLESv1_CM" }

    includedirs { 
        "./src", 
        "%{solution.project.nativeActivity.path}/src",
        --"$(NDK_PATH)/sources/android/native_app_glue"
    }

    local_importModules { 
        --"%{solution.project.nativeActivity.path}/%{solution.project.nativeActivity.name}.mk" 
    }
    local_includes { "%{solution.project.nativeActivity.path}/%{solution.project.nativeActivity.name}.mk" }

    local_abi               {solution.abi.flags.all}
    local_platform          (solution.platform.flags.android21)
    local_stl               (solution.stl.flags.cpp_static)
    --local_toolchain         (solution.toolchain.flags.clang)