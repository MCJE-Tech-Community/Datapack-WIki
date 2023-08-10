#> branch:4ary16
# @benchmark

execute store result score p _ run random value 0..15

execute if score p _ matches ..3 run function branch:4ary16-0
execute if score p _ matches 4..7 run function branch:4ary16-1
execute if score p _ matches 8..11 run function branch:4ary16-2
execute if score p _ matches 12.. run function branch:4ary16-3
