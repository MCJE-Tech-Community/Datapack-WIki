#> branch:linear4
# @benchmark

execute store result score p _ run random value 0..3

execute if score p _ matches ..0 run _ "0"
execute if score p _ matches 1 run _ "1"
execute if score p _ matches 2 run _ "2"
execute if score p _ matches 3.. run _ "3"
