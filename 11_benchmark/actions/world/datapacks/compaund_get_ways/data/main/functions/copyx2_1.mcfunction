#> main:copyx2_1
# @benchmark

data modify storage _: c set from storage _: a[-1]
data modify storage _: d set from storage _: c.type

data modify storage _: c set from storage _: b[-1]
data modify storage _: d set from storage _: c.type