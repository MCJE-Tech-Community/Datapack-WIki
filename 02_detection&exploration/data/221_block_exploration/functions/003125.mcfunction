### 視線先ブロック探査 functionループ型 0.03125m
# 1mおきに移動してブロックの有無を確認

## 各方向の角に実行点を伸ばしてブロックがないかチェック
scoreboard players set #blex:003125 _ 0
execute unless block ~-0.015625 ~-0.015625 ~-0.015625 #221_block_exploration:through run scoreboard players set #blex:003125 _ 1
execute unless block ~-0.015625 ~-0.015625 ~0.015625 #221_block_exploration:through run scoreboard players set #blex:003125 _ 2
execute unless block ~0.015625 ~-0.015625 ~-0.015625 #221_block_exploration:through run scoreboard players set #blex:003125 _ 3
execute unless block ~0.015625 ~-0.015625 ~0.015625 #221_block_exploration:through run scoreboard players set #blex:003125 _ 4

execute unless block ~-0.015625 ~0.015625 ~-0.015625 #221_block_exploration:through run scoreboard players set #blex:003125 _ 5
execute unless block ~-0.015625 ~0.015625 ~0.015625 #221_block_exploration:through run scoreboard players set #blex:003125 _ 6
execute unless block ~0.015625 ~0.015625 ~-0.015625 #221_block_exploration:through run scoreboard players set #blex:003125 _ 7
execute unless block ~0.015625 ~0.015625 ~0.015625 #221_block_exploration:through run scoreboard players set #blex:003125 _ 8

execute if score #blex:003125 _ matches 1 positioned ~-0.015625 ~-0.015625 ~-0.015625 run function 221_block_exploration:point
execute if score #blex:003125 _ matches 2 positioned ~-0.015625 ~-0.015625 ~0.015625 run function 221_block_exploration:point
execute if score #blex:003125 _ matches 3 positioned ~0.015625 ~-0.015625 ~-0.015625 run function 221_block_exploration:point
execute if score #blex:003125 _ matches 4 positioned ~0.015625 ~-0.015625 ~0.015625 run function 221_block_exploration:point
execute if score #blex:003125 _ matches 5 positioned ~-0.015625 ~0.015625 ~-0.015625 run function 221_block_exploration:point
execute if score #blex:003125 _ matches 6 positioned ~-0.015625 ~0.015625 ~0.015625 run function 221_block_exploration:point
execute if score #blex:003125 _ matches 7 positioned ~0.015625 ~0.015625 ~-0.015625 run function 221_block_exploration:point
execute if score #blex:003125 _ matches 8 positioned ~0.015625 ~0.015625 ~0.015625 run function 221_block_exploration:point

execute if score #blex:003125 _ matches 1.. store result score #blex:1 _ store result score #blex:05 _ store result score #blex:025 _ store result score #blex:0125 _ store result score #blex:00625 _ run scoreboard players set #blex:root _ 0