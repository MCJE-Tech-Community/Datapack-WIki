execute store result storage _ c int 1 run scoreboard players get b _
execute store result storage _ d int 1 run scoreboard players add b _ 1
function string_decomposition:append with storage _
scoreboard players remove a _ 1
execute if score a _ matches 1.. run function string_decomposition:macro-1
