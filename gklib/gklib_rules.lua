rule("gklib_rules")
on_load(function (target)
    local function rela(p)
        return path.absolute(p, os.projectdir())
    end

    local using_msvc = target:toolchain("msvc")
    local clang_cl = target:toolchain("clang-cl")
    if is_plat("windows") then
        target:add("defines", "WIN32")
        target:add("defines", "USE_GKREGEX")
    end
    if using_msvc or clang_cl then
        target:add("defines", "_CRT_SECURE_NO_DEPRECATE")
        target:add("defines", "_CRT_SECURE_NO_WARNINGS")
        target:add("defines", "__thread=__declspec(thread)")
    end
    target:add("cflags", "-Wno-implicit-function-declaration", "-Wno-deprecated-declarations", "-Wno-format", "-Wno-deprecated-non-prototype","-Wno-int-to-void-pointer-cast", "-Wno-void-pointer-to-int-cast", {
        tools = {"clang", "gcc", "clang_cl"}
    })
end)