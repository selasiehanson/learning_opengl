target("sglad")
    set_kind("static")
    add_includedirs("./includes/glad/include")
    add_files("./includes/glad/src/*.c")
    -- add_defines("_GLFW_USE_CONFIG_H")
       -- add_links("opengl32")
    -- add_defines("__MACOSX_CORE__=1")

target("sglfw")
    set_kind("static")
    set_languages("c99", "objective-c")

        add_defines("_GLFW_COCOA")
        add_defines("_GLFW_NSGL")
        add_defines("_GLFW_USE_OPENGL")

        -- common files
        add_headerfiles("./includes/glfw/include/GLFW/glfw3.h")
        add_headerfiles("./includes/glfw/include/GLFW/glfw3.h")

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

        -- add_frameworks("CoreVideo", "OpenGL", "CoreFoundation", "IOKit", "Cocoa", "Carbon")
        -- add_frameworks("Cocoa", "OpenGL", "IOKit", "CoreVideo")
        add_frameworks("Cocoa", "IOKit")
        add_cflags("-fpic")
        -- xmake sets this to true by default.
        -- xmake sets this to true by default.
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

