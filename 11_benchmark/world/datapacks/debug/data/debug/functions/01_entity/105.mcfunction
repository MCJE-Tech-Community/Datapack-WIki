## Work
# 1 a b c d

## Functions
# a
execute if entity @e[tag=A]
# b
execute if entity @e[tag=A,x=8.0,y=72.0,z=8.0]
# c
execute if entity @e[x=8.0,y=72.0,z=8.0,tag=A]
# d
execute positioned 8.0 72.0 8.0 if entity @e[tag=A]

## Conditions
# 1
summon marker ~ ~ ~ {Tags:[A]}