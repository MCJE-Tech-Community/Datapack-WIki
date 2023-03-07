### 視線先ブロック探査 functionループ型 0.25m
# 1mおきに移動してブロックの有無を確認

## 探査
# 角8方向に探査点を伸ばしてチェック
scoreboard players set #02:025 _ 1
execute if block ~0.125 ~0.125 ~0.125 #221_block_exploration01:through if block ~0.125 ~0.125 ~-0.125 #221_block_exploration01:through if block ~0.125 ~-0.125 ~0.125 #221_block_exploration01:through if block ~0.125 ~-0.125 ~-0.125 #221_block_exploration01:through if block ~-0.125 ~0.125 ~0.125 #221_block_exploration01:through if block ~-0.125 ~0.125 ~-0.125 #221_block_exploration01:through if block ~-0.125 ~-0.125 ~0.125 #221_block_exploration01:through if block ~-0.125 ~-0.125 ~-0.125 #221_block_exploration01:through run scoreboard players set #02:025 _ 0
# ブロックがあったらさらに細かくチェック
execute if score #02:025 _ matches 1 positioned ^ ^ ^-0.0625 run function 221_block_exploration01:0125
execute if score #02:025 _ matches 1 positioned ^ ^ ^0.0625 run function 221_block_exploration01:0125