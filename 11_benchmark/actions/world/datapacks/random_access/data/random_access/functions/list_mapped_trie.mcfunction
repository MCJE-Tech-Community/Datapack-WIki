#> random_access:list_mapped_trie
# @benchmark

execute store result score p _ run random value 0..65535

scoreboard players operation p _ *= q _
data remove storage _ c[2]
execute if score p _ matches ..-1 run data modify storage _ c append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2] append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2][-2] append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][-2][-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2][-2][-2] append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][-2][-2][-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2][-2][-2][-2] append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][-2][-2][-2][-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2][-2][-2][-2][-2] append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][-2][-2][-2][-2][-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][-2][-2][-2][-2][-2][-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2][-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation p _ += p _
data remove storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score p _ matches ..-1 run data modify storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] append value []

data get storage _ c[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2]
