#> branch:linear2
# @benchmark

execute store result score p _ run random value 0..1

execute if score p _ matches ..0 run _ "0"
execute if score p _ matches 1.. run _ "1"
