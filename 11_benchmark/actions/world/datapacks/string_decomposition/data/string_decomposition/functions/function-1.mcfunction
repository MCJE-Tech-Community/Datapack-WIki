data modify storage _ b append string storage _ a 0 1
data modify storage _ a set string storage _ a 1
scoreboard players remove a _ 1
execute if score a _ matches 1.. run function string_decomposition:function-1
