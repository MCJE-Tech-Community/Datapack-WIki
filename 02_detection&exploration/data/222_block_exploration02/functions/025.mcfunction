### 視線先ブロック探査 functionループ型 0.25m
# 1mおきに移動してブロックの有無を確認

## 探査
# 角8方向に探査点を伸ばしてチェック
scoreboard players set #02:025 _ 0
execute unless block ^ ^ ^0.125 #222_block_exploration02:through run scoreboard players set #02:025 _ 1
execute unless block ^ ^ ^-0.125 #222_block_exploration02:through run scoreboard players set #02:025 _ 1
execute rotated ~180 ~ unless block ^ ^ ^0.125 #222_block_exploration02:through run scoreboard players set #02:025 _ 1
execute rotated ~180 ~ unless block ^ ^ ^-0.125 #222_block_exploration02:through run scoreboard players set #02:025 _ 1
execute rotated as 0-0-0-0-1000000de unless block ^ ^ ^0.125 #222_block_exploration02:through run scoreboard players set #02:025 _ 1
execute rotated as 0-0-0-0-1000000de unless block ^ ^ ^-0.125 #222_block_exploration02:through run scoreboard players set #02:025 _ 1
execute rotated as 0-0-0-0-1000000de rotated ~180 ~ unless block ^ ^ ^0.125 #222_block_exploration02:through run scoreboard players set #02:025 _ 1
execute rotated as 0-0-0-0-1000000de rotated ~180 ~ unless block ^ ^ ^0.125 #222_block_exploration02:through run scoreboard players set #02:025 _ 1

# ブロックがあったらさらに細かくチェック
execute if score #02:025 _ matches 1.. positioned ^ ^ ^-0.0625 run function 222_block_exploration02:0125
execute if score #02:025 _ matches 1.. positioned ^ ^ ^0.0625 run function 222_block_exploration02:0125