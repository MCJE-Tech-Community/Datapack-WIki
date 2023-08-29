#> random_access:macro_score_cache
# @benchmark

execute store result score p _ run random value 0..65535
execute store result storage _ d int 1 run scoreboard players operation p _ /= r _
function random_access:macro_score_cache_macro with storage _
