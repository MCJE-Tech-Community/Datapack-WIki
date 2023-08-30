#> main:on
# @benchmark

execute as 0-0-0-0-1 on passengers if entity @s[type=marker,tag=data] run data modify storage _: A set from entity @s data.A
data modify storage _: A set value ""