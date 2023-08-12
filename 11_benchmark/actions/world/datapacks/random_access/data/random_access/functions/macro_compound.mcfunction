#> random_access:macro_compound
# @benchmark

execute store result storage _ d int 1 run random value 0..65535
function random_access:macro_compound_macro with storage _
