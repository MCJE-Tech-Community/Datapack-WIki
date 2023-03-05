### 視線先ブロック探査 functionループ型 0.5m
# 1mおきに移動してブロックの有無を確認

## 探査
# 角8方向に探査点を伸ばしてチェック
scoreboard players set #blex:05 _ 0
execute unless block ^ ^ ^0.25 #222_block_exploration02:through run scoreboard players set #blex:05 _ 1
execute unless block ^ ^ ^-0.25 #222_block_exploration02:through run scoreboard players set #blex:05 _ 1
execute rotated ~180 ~ unless block ^ ^ ^0.25 #222_block_exploration02:through run scoreboard players set #blex:05 _ 1
execute rotated ~180 ~ unless block ^ ^ ^-0.25 #222_block_exploration02:through run scoreboard players set #blex:05 _ 1
execute rotated as 0-0-0-0-1000000de unless block ^ ^ ^0.25 #222_block_exploration02:through run scoreboard players set #blex:05 _ 1
execute rotated as 0-0-0-0-1000000de unless block ^ ^ ^-0.25 #222_block_exploration02:through run scoreboard players set #blex:05 _ 1
execute rotated as 0-0-0-0-1000000de rotated ~180 ~ unless block ^ ^ ^0.25 #222_block_exploration02:through run scoreboard players set #blex:05 _ 1
execute rotated as 0-0-0-0-1000000de rotated ~180 ~ unless block ^ ^ ^-0.25 #222_block_exploration02:through run scoreboard players set #blex:05 _ 1

# ブロックがあったらさらに細かくチェック
execute if score #blex:05 _ matches 1.. positioned ^ ^ ^-0.125 run function 222_block_exploration02:025
execute if score #blex:05 _ matches 1.. positioned ^ ^ ^0.125 run function 222_block_exploration02:025