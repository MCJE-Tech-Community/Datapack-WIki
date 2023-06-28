## Work
# 1 a b c d e f g h i j k l

## Functions
# a
execute as 0-0-0-0-0 if entity @s[scores={A=1}]
# b
execute as 0-0-0-0-0 if entity @s[scores={A=0}]
# c
execute as 0-0-0-0-0 if entity @s[scores={A=1,B=1}]
# d
execute as 0-0-0-0-0 if entity @s[scores={A=0,B=1}]
# e
execute as 0-0-0-0-0 if entity @s[scores={A=1,B=0}]
# f
execute as 0-0-0-0-0 if entity @s[scores={A=0,B=0}]
# g
execute as 0-0-0-0-0 if score @s A matches 1
# h
execute as 0-0-0-0-0 if score @s A matches 0
# i
execute as 0-0-0-0-0 if score @s A matches 1 if score @s B matches 1
# j
execute as 0-0-0-0-0 if score @s A matches 0 if score @s B matches 1
# k
execute as 0-0-0-0-0 if score @s A matches 1 if score @s B matches 0
# l
execute as 0-0-0-0-0 if score @s A matches 0 if score @s B matches 0

## Conditions
# 1
summon marker ~ ~ ~ {UUID:[I;0,0,0,0]}
execute as 0-0-0-0-0 run scoreboard players set @s A 1
execute as 0-0-0-0-0 run scoreboard players set @s B 1