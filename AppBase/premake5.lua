-- premake5.lua for ./AppBase

project "AppBase"
    --kind "SharedLib"
    kind "ConsoleApp"
    language "C++"
    
    solution.outputdir.build("%{prj.name}")

    files { 
        "./src/**.h", 
        "./src/**.cpp",
        "./src/**.c",
        --solution.properties.ndk.path .. "/" .. solution.properties.ndk.version .. "/sources/android/native_app_glue/android_native_app_glue.c"
    }

    includedirs { 
        "./src",
        solution.project.base.include,
        --solution.properties.ndk.path .. "/" .. solution.properties.ndk.version .. "/sources/android/native_app_glue"
    }

    --print(solution.project.base.include)

    links { "Base", "android", "log", "EGL", "GLESv3", "GLESv1_CM" }

    --links { "android", "log", "EGL", "GLESv3", "GLESv1_CM" }

    local_importModules { 
        --solution.project.base.path,
    }

    local_includes { 
        --solution.project.base.path .. "/" .. solution.project.base.name .. ".mk" 
    }

    local_sharedLinks {
        --"base",
    }

    local_abi               {solution.abi.flags.all}
    local_platform          (solution.platform.flags.android21)
    local_stl               (solution.stl.flags.cpp_static)
    --local_toolchain         (solution.toolchain.flags.clang)