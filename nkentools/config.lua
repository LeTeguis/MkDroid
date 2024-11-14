-- config.lua

-- solution premake5 path
solution.premake.path = "%{wks.location}/nkentools/premake"

-- solution project
solution.project.appBase                = {}
solution.project.appBase.name 	        = "AppBase"
solution.project.appBase.path 	        = "%{wks.location}/%{solution.project.appBase.name}"
solution.project.appBase.source 	    = "%{solution.project.appBase.path}/src"
solution.project.appBase.include 	    = "%{solution.project.appBase.path}/src"
solution.project.appBase.targetdir 	    = ""
solution.project.appBase.objdir 	    = ""

solution.project.nativeActivity             = {}
solution.project.nativeActivity.name 	    = "NativeActivity"
solution.project.nativeActivity.path 	    = "%{wks.location}/%{solution.project.nativeActivity.name}"
solution.project.nativeActivity.source 	    = "%{solution.project.nativeActivity.path}/src"
solution.project.nativeActivity.include     = "%{solution.project.nativeActivity.path}/src"
solution.project.nativeActivity.targetdir   = ""
solution.project.nativeActivity.objdir 	    = ""

-- solution properties
solution.properties.jdk 		        = "C:/Program Files/Java/jdk-17" 
solution.properties.sdk.path 		    = "C:/Users/teugu/AppData/Local/Android/Sdk"
solution.properties.sdk.version.compile = "31"
solution.properties.sdk.version.target  = "31"
solution.properties.sdk.version.min     = "21"
solution.properties.ndk.path 		    = "C:/Users/teugu/AppData/Local/Android/Sdk/ndk"
solution.properties.ndk.version         = "25.1.8937393"
solution.properties.cmake 		        = "C:/Users/teugu/AppData/Local/Android/Sdk/cmake/3.22.1/bin/cmake.exe"
solution.properties.application.id 	    = "com.rihen.appbase"
solution.properties.application.ApkName = "AppBase"
solution.properties.application.root    = "PremakeNDKAndroid"
solution.properties.gradle.pack         = "gradle-8.1-all.zip"
solution.properties.gradle.version      = "8.0.0"

solution.variables.add("workspace", "NDK_PATH", solution.properties.ndk.path)
solution.variables.add("workspace", "SDK_PATH", solution.properties.sdk.path)
solution.variables.add("workspace", "JDK_PATH", solution.properties.jdk)

solution.outputdir.code     =   "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
solution.outputdir.bin      =   "%{wks.location}/build/bin/"
solution.outputdir.obj      =   "%{wks.location}/build/obj/"
solution.outputdir.bindir   =   solution.outputdir.bin .. solution.outputdir.code
solution.outputdir.objdir   =   solution.outputdir.obj .. solution.outputdir.code

function solution.outputdir.build(projectName)
    targetdir   ( solution.outputdir.bindir .. "/" .. projectName )
    objdir      ( solution.outputdir.objdir .. "/" .. projectName )
end