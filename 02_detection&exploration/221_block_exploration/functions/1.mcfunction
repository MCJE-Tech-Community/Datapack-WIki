### 視線先ブロック探査 functionループ型 1m
# 1mおきに移動してブロックの有無を確認

scoreboard players set #blex:1 _ 0
execute unless block ~-0.5 ~-0.5 ~-0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1
execute unless block ~-0.5 ~-0.5 ~0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1
execute unless block ~0.5 ~-0.5 ~-0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1
execute unless block ~0.5 ~-0.5 ~0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1

execute unless block ~-0.5 ~0.5 ~-0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1
execute unless block ~-0.5 ~0.5 ~0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1
execute unless block ~0.5 ~0.5 ~-0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1
execute unless block ~0.5 ~0.5 ~0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1

execute if score #blex:1 _ matches 1.. positioned ^ ^ ^-0.25 run function 221_block_exploration:05
execute if score #blex:1 _ matches 1.. positioned ^ ^ ^0.25 run function 221_block_exploration:05

scoreboard players remove #blex:root _ 1
execute positioned ^ ^ ^1 if score #blex:root _ matches 1.. run function 221_block_exploration:1