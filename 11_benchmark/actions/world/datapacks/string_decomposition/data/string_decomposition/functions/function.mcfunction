#> string_decomposition:function
# @benchmark

function string_decomposition:init
execute store result score a _ run data get storage _ a
execute if score a _ matches 1.. run function string_decomposition:function-1
