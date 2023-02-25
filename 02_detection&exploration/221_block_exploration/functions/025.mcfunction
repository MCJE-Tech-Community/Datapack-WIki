### 視線先ブロック探査 functionループ型 0.25m
# 1mおきに移動してブロックの有無を確認

scoreboard players set #blex:025 _ 0
execute unless block ~-0.125 ~-0.125 ~-0.125 #221_block_exploration:through run scoreboard players set #blex:025 _ 1
execute unless block ~-0.125 ~-0.125 ~0.125 #221_block_exploration:through run scoreboard players set #blex:025 _ 1
execute unless block ~0.125 ~-0.125 ~-0.125 #221_block_exploration:through run scoreboard players set #blex:025 _ 1
execute unless block ~0.125 ~-0.125 ~0.125 #221_block_exploration:through run scoreboard players set #blex:025 _ 1

execute unless block ~-0.125 ~0.125 ~-0.125 #221_block_exploration:through run scoreboard players set #blex:025 _ 1
execute unless block ~-0.125 ~0.125 ~0.125 #221_block_exploration:through run scoreboard players set #blex:025 _ 1
execute unless block ~0.125 ~0.125 ~-0.125 #221_block_exploration:through run scoreboard players set #blex:025 _ 1
execute unless block ~0.125 ~0.125 ~0.125 #221_block_exploration:through run scoreboard players set #blex:025 _ 1

execute if score #blex:025 _ matches 1.. positioned ^ ^ ^-0.0625 run function 221_block_exploration:0125
execute if score #blex:025 _ matches 1.. positioned ^ ^ ^0.0625 run function 221_block_exploration:0125