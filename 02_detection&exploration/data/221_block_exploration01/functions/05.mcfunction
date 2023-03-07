### 視線先ブロック探査 functionループ型 0.5m
# 1mおきに移動してブロックの有無を確認

## 探査
# 角8方向に探査点を伸ばしてチェック
scoreboard players set #02:05 _ 1
execute if block ~0.25 ~0.25 ~0.25 #221_block_exploration01:through if block ~0.25 ~0.25 ~-0.25 #221_block_exploration01:through if block ~0.25 ~-0.25 ~0.25 #221_block_exploration01:through if block ~0.25 ~-0.25 ~-0.25 #221_block_exploration01:through if block ~-0.25 ~0.25 ~0.25 #221_block_exploration01:through if block ~-0.25 ~0.25 ~-0.25 #221_block_exploration01:through if block ~-0.25 ~-0.25 ~0.25 #221_block_exploration01:through if block ~-0.25 ~-0.25 ~-0.25 #221_block_exploration01:through run scoreboard players set #02:05 _ 0
# ブロックがあったらさらに細かくチェック
execute if score #02:05 _ matches 1 positioned ^ ^ ^-0.125 run function 221_block_exploration01:025
execute if score #02:05 _ matches 1 positioned ^ ^ ^0.125 run function 221_block_exploration01:025