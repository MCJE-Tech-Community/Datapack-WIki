## Work
# 1 a b c d e f

## Functions
# a
data modify entity 0-0-0-0-0 data.byte set value 1b
data modify entity 0-0-0-0-0 data.byte set value 0b
# b
data modify entity 0-0-0-0-0 data.int set value 1
data modify entity 0-0-0-0-0 data.int set value 0
# c
data modify entity 0-0-0-0-0 data.short set value 1s
data modify entity 0-0-0-0-0 data.short set value 0s
# d
data modify entity 0-0-0-0-0 data.float set value 1.0f
data modify entity 0-0-0-0-0 data.float set value 0.0f
# e
data modify entity 0-0-0-0-0 data.double set value 1.0d
data modify entity 0-0-0-0-0 data.double set value 0.0d
# f
data modify entity 0-0-0-0-0 data.string set value "1"
data modify entity 0-0-0-0-0 data.string set value "0"

## Conditions
# 1
summon marker ~ ~ ~ {UUID:[I;0,0,0,0],data:{byte:0b,int:0,short:0s,float:0.0f,double:0.0d,string:"0"}}