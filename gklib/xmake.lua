target("gklib")
set_kind("static")
set_toolchains("clang-cl")

set_languages("c11")
add_files("evaluate.c","gkregex.c","mcore.c","seq.c"
,"blas.c","fkvkselect.c","graph.c","memory.c","sort.c"
,"cache.c","fs.c","htable.c","pqueue.c","string.c"
,"csr.c","getopt.c","io.c","random.c","timers.c"
,"error.c","gk_util.c","itemsets.c","rw.c","tokenizer.c")
if is_plat("windows") then
    add_files("win32/*.c")
end
includes("gklib_rules.lua")
add_rules("gklib_rules")
add_includedirs("./", {public = interface})

target_end()