#> branch:2ary8
# @benchmark

execute store result score p _ run random value 0..7

execute if score p _ matches ..3 run function branch:2ary8-0
execute if score p _ matches 4.. run function branch:2ary8-1
