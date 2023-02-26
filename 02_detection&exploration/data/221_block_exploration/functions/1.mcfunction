### 視線先ブロック探査 functionループ型 1m
# 1mおきに移動してブロックの有無を確認

## 探査
# 角8方向に探査点を伸ばしてチェック
scoreboard players set #blex:1 _ 0
execute unless block ~-0.5 ~-0.5 ~-0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1
execute unless block ~-0.5 ~-0.5 ~0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1
execute unless block ~0.5 ~-0.5 ~-0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1
execute unless block ~0.5 ~-0.5 ~0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1
execute unless block ~-0.5 ~0.5 ~-0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1
execute unless block ~-0.5 ~0.5 ~0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1
execute unless block ~0.5 ~0.5 ~-0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1
execute unless block ~0.5 ~0.5 ~0.5 #221_block_exploration:through run scoreboard players set #blex:1 _ 1

# ブロックがあったらさらに細かくチェック
execute if score #blex:1 _ matches 1.. positioned ^ ^ ^-0.25 run function 221_block_exploration:05
execute if score #blex:1 _ matches 1.. positioned ^ ^ ^0.25 run function 221_block_exploration:05

## ループ
# ブロックがなかったら1m先に進む
scoreboard players remove #blex:loop _ 1
execute if score #blex:loop _ matches 1.. positioned ^ ^ ^1 run function 221_block_exploration:1