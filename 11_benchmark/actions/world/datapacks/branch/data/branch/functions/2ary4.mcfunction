#> branch:2ary4
# @benchmark

execute store result score p _ run random value 0..3

execute if score p _ matches ..1 run function branch:2ary4-0
execute if score p _ matches 2.. run function branch:2ary4-1
