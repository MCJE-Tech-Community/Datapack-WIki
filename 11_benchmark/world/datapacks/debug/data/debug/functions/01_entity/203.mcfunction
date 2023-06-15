## Work
# 1 a b c d e f g h i

## Functions
# a
data modify entity 0-0-0-0-0 Motion[1] set value 0.1d
data modify entity 0-0-0-0-0 Motion[1] set value 0.0d
# b
data modify entity 0-0-0-0-1 Motion[1] set value 0.1d
data modify entity 0-0-0-0-1 Motion[1] set value 0.0d
# c
data modify entity 0-0-0-0-2 Motion[1] set value 0.1d
data modify entity 0-0-0-0-2 Motion[1] set value 0.0d
# d
data modify entity 0-0-0-0-3 Motion[1] set value 0.1d
data modify entity 0-0-0-0-3 Motion[1] set value 0.0d
# e
data modify entity 0-0-0-0-4 Motion[1] set value 0.1d
data modify entity 0-0-0-0-4 Motion[1] set value 0.0d
# f
data modify entity 0-0-0-0-5 Motion[1] set value 0.1d
data modify entity 0-0-0-0-5 Motion[1] set value 0.0d
# g
data modify entity 0-0-0-0-6 Motion[1] set value 0.1d
data modify entity 0-0-0-0-6 Motion[1] set value 0.0d
# h
data modify entity 0-0-0-0-7 Motion[1] set value 0.1d
data modify entity 0-0-0-0-7 Motion[1] set value 0.0d
# i
data modify entity 0-0-0-0-8 Motion[1] set value 0.1d
data modify entity 0-0-0-0-8 Motion[1] set value 0.0d

## Conditions
# 1
summon zombie ~ ~ ~ {UUID:[I;0,0,0,0]}
summon villager ~ ~ ~ {UUID:[I;0,0,0,1]}
summon armor_stand ~ ~ ~ {UUID:[I;0,0,0,2]}
summon area_effect_cloud ~ ~ ~ {UUID:[I;0,0,0,3]}
summon block_display ~ ~ ~ {UUID:[I;0,0,0,4]}
summon item_display ~ ~ ~ {UUID:[I;0,0,0,5]}
summon text_display ~ ~ ~ {UUID:[I;0,0,0,6]}
summon marker ~ ~ ~ {UUID:[I;0,0,0,7]}
summon marker ~ ~ ~ {UUID:[I;0,0,0,8],data:{0:"A",1:"A",2:"A",3:"A",4:"A",5:"A",6:"A",7:"A",8:"A",9:"A"}}