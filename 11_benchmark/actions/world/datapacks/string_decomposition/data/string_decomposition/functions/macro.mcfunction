#> string_decomposition:macro
# @benchmark

function string_decomposition:init
execute store result score a _ run data get storage _ a
scoreboard players set b _ 0
execute if score a _ matches 1.. run function string_decomposition:macro-1
