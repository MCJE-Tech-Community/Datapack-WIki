## Work
# 1 a b c d e f

## Functions
# a
execute as 0-0-0-0-0 if entity @s[nbt={data:{A:1b}}]
# b
execute as 0-0-0-0-0 if entity @s[nbt={data:{A:0b}}]
# c
execute as 0-0-0-0-0 if data entity @s {data:{A:1b}}
# d
execute as 0-0-0-0-0 if data entity @s {data:{A:0b}}
# e
execute as 0-0-0-0-0 if data entity @s data{A:1b}
# f
execute as 0-0-0-0-0 if data entity @s data{A:0b}

## Conditions
# 1
summon marker ~ ~ ~ {UUID:[I;0,0,0,0],data:{A:1b}}