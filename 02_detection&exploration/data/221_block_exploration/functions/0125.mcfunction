### 視線先ブロック探査 functionループ型 0.125m
# 1mおきに移動してブロックの有無を確認

scoreboard players set #blex:0125 _ 0
execute unless block ~-0.0625 ~-0.0625 ~-0.0625 #221_block_exploration:through run scoreboard players set #blex:0125 _ 1
execute unless block ~-0.0625 ~-0.0625 ~0.0625 #221_block_exploration:through run scoreboard players set #blex:0125 _ 1
execute unless block ~0.0625 ~-0.0625 ~-0.0625 #221_block_exploration:through run scoreboard players set #blex:0125 _ 1
execute unless block ~0.0625 ~-0.0625 ~0.0625 #221_block_exploration:through run scoreboard players set #blex:0125 _ 1

execute unless block ~-0.0625 ~0.0625 ~-0.0625 #221_block_exploration:through run scoreboard players set #blex:0125 _ 1
execute unless block ~-0.0625 ~0.0625 ~0.0625 #221_block_exploration:through run scoreboard players set #blex:0125 _ 1
execute unless block ~0.0625 ~0.0625 ~-0.0625 #221_block_exploration:through run scoreboard players set #blex:0125 _ 1
execute unless block ~0.0625 ~0.0625 ~0.0625 #221_block_exploration:through run scoreboard players set #blex:0125 _ 1

execute if score #blex:0125 _ matches 1.. positioned ^ ^ ^-0.03125 run function 221_block_exploration:00625
execute if score #blex:0125 _ matches 1.. positioned ^ ^ ^0.03125 run function 221_block_exploration:00625