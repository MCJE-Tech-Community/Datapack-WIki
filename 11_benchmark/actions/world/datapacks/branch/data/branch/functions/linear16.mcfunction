#> branch:linear16
# @benchmark

execute store result score p _ run random value 0..15

execute if score p _ matches ..0 run _ "0"
execute if score p _ matches 1 run _ "1"
execute if score p _ matches 2 run _ "2"
execute if score p _ matches 3 run _ "3"
execute if score p _ matches 4 run _ "4"
execute if score p _ matches 5 run _ "5"
execute if score p _ matches 6 run _ "6"
execute if score p _ matches 7 run _ "7"
execute if score p _ matches 8 run _ "8"
execute if score p _ matches 9 run _ "9"
execute if score p _ matches 10 run _ "10"
execute if score p _ matches 11 run _ "11"
execute if score p _ matches 12 run _ "12"
execute if score p _ matches 13 run _ "13"
execute if score p _ matches 14 run _ "14"
execute if score p _ matches 15.. run _ "15"
