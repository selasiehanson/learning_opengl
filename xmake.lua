target("sglad")
    set_kind("static")
    add_includedirs("./includes/glad/include")
    add_files("./includes/glad/src/*.c")
    -- add_defines("_GLFW_USE_CONFIG_H")
       -- add_links("opengl32")
    -- add_defines("__MACOSX_CORE__=1")

target("sglfw")
    set_kind("static")
    -- add_includedirs("./includes/glfw/include")
    set_languages("c99", "objective-c")
    -- add_includedirs("./includes/glfw/src/*.h")
    -- add_files("./includes/glfw/src/*.h")
    -- add_files("./includes/glfw/src/*.m")
    -- add_files("./includes/glfw/src/*.c")
        -- add_files("./includes/glfw/src/cocoa_platform.h")
        -- add_files("./includes/glfw/src/cocoa_joystick.h")

        -- add_files("./includes/glfw/src/posix_thread.h")
        -- add_files("./includes/glfw/src/nsgl_context.h")
        -- add_files("./includes/glfw/src/egl_context.h")
        -- add_files("./includes/glfw/src/osmesa_context.h")
     

        add_defines("_GLFW_COCOA")
        add_defines("_GLFW_NSGL")
        -- add_defines("_GLFW_USE_OPENGL")
        -- add_defines("__MACOSX_CORE__=1")

        -- common files
        add_headerfiles("./includes/glfw/include/GLFW/glfw3.h")
        add_headerfiles("./includes/glfw/include/GLFW/glfw3.h")
        add_headerfiles("./includes/glfw/src/glfw_config.h")
        -- add_files("./includes/glfw/include/GLFW/glfw3native.h")


        add_files("./includes/glfw/src/context.c")
        add_files("./includes/glfw/src/init.c")
        add_files("./includes/glfw/src/input.c")
        add_files("./includes/glfw/src/monitor.c")
        add_files("./includes/glfw/src/vulkan.c")
        add_files("./includes/glfw/src/window.c")


        -- mac specific
        add_files("./includes/glfw/src/cocoa_init.m")
        add_files("./includes/glfw/src/cocoa_joystick.m")
        add_files("./includes/glfw/src/cocoa_monitor.m")
        add_files("./includes/glfw/src/cocoa_window.m")
        add_files("./includes/glfw/src/cocoa_time.c")
        add_files("./includes/glfw/src/posix_thread.c")
        add_files("./includes/glfw/src/nsgl_context.m")
        add_files("./includes/glfw/src/egl_context.c")
        add_files("./includes/glfw/src/osmesa_context.c")

        -- add_cflags("-fno-common")
        -- add_cflags("-fobjc-arc")
        -- add_frameworks("CoreVideo", "OpenGL", "CoreFoundation", "IOKit", "Cocoa", "Carbon")
        -- add_frameworks("Cocoa", "OpenGL", "IOKit", "CoreVideo")
        add_frameworks("Cocoa", "IOKit")
        add_cflags("-fpic")
        set_values("objc.build.arc", false)
        -- add_cxflags("-stdlib=libc++","-pedantic", "-Wall", {force=true})
        -- add_defines("_CRT_SECURE_NO_WARNINGS")



-- define target
target("main")

    -- set kind
    set_kind("binary")

    set_languages("cxx17")
    -- add files
    add_files("src/main.cpp")

    add_deps("sglad", "sglfw")
    -- add_frameworks("CoreVideo", "OpenGL", "CoreFoundation", "IOKit", "Cocoa", "Carbon")

    add_includedirs(
        -- "/usr/local/include",
        -- "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1",
        "./includes/glad/include",
        "./includes/glfw/include"
        )


    add_cxflags("-stdlib=libc++","-pedantic", "-Wall", {force=true})
    add_cxflags("-fpic")
    add_defines("_GLFW_COCOA")
    -- add_cxflags("-fobjc-arc")
    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
    -- add_ldflags("-L/usr/local/lib", "-lglfw", "-ldl", {force=true})
--
-- If you want to known more usage about xmake, please see https://xmake.io
--
-- ## FAQ
--
-- You can enter the project directory firstly before building project.
--
--   $ cd projectdir
--
-- 1. How to build project?
--
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro defination
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "c++11")
--
--    -- set optimization: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--

