-- premake5.lua for ./AppBase

project "AppBase"
    --kind "SharedLib"
    kind "ConsoleApp"
    language "C++"
    
    solution.outputdir.build("%{prj.name}")

    files { 
        "./src/**.h", 
        "./src/**.cpp",
    }

    includedirs { 
        "./src",
        solution.project.nativeActivity.path .. "/src",
    }

    links { "NativeActivity", "android", "log", "EGL", "GLESv3", "GLESv1_CM" }

    local_importModules { 
        solution.project.nativeActivity.path,
    }
    --local_includes { "%{solution.project.nativeActivity.path}/%{solution.project.nativeActivity.name}.mk" }

    local_abi               {solution.abi.flags.all}
    local_platform          (solution.platform.flags.android21)
    local_stl               (solution.stl.flags.cpp_static)
    --local_toolchain         (solution.toolchain.flags.clang)