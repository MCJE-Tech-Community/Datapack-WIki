#> branch:linear8
# @benchmark

execute store result score p _ run random value 0..7

execute if score p _ matches ..0 run _ "0"
execute if score p _ matches 1 run _ "1"
execute if score p _ matches 2 run _ "2"
execute if score p _ matches 3 run _ "3"
execute if score p _ matches 4 run _ "4"
execute if score p _ matches 5 run _ "5"
execute if score p _ matches 6 run _ "6"
execute if score p _ matches 7.. run _ "7"
