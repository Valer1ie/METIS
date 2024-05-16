target("metis")
set_toolchains("clang")
set_kind("shared")
set_languages("c11")
add_files("libmetis/*.c")
includes("gklib")
includes("gklib/gklib_rules.lua")
add_rules("gklib_rules")
add_includedirs("include", {public = true})
add_includedirs("gklib","libmetis", {public = false})
on_load(function (target)
    target:add("defines", "HAVE_CONFIG_H")
    target:add("deps", "gklib")
    target:add("defines", "IDXTYPEWIDTH=32", "REALTYPEWIDTH=32",{public = true})
end)
target_end()