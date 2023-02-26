### 視線先ブロック探査 functionループ型 0.03125m
# 1mおきに移動してブロックの有無を確認

## 探査
# 角8方向に探査点を伸ばしてチェック
# ブロックがある場所で探査終了
scoreboard players set #blex:003125 _ 2
execute if score #blex:003125 _ matches 2 positioned ~-0.015625 ~-0.015625 ~-0.015625 unless block ~ ~ ~ #221_block_exploration:through store success score #blex:003125 _ run function 221_block_exploration:point
execute if score #blex:003125 _ matches 2 positioned ~-0.015625 ~-0.015625 ~0.015625 unless block ~ ~ ~ #221_block_exploration:through store success score #blex:003125 _ run function 221_block_exploration:point
execute if score #blex:003125 _ matches 2 positioned ~0.015625 ~-0.015625 ~-0.015625 unless block ~ ~ ~ #221_block_exploration:through store success score #blex:003125 _ run function 221_block_exploration:point
execute if score #blex:003125 _ matches 2 positioned ~0.015625 ~-0.015625 ~0.015625 unless block ~ ~ ~ #221_block_exploration:through store success score #blex:003125 _ run function 221_block_exploration:point
execute if score #blex:003125 _ matches 2 positioned ~-0.015625 ~0.015625 ~-0.015625 unless block ~ ~ ~ #221_block_exploration:through store success score #blex:003125 _ run function 221_block_exploration:point
execute if score #blex:003125 _ matches 2 positioned ~-0.015625 ~0.015625 ~0.015625 unless block ~ ~ ~ #221_block_exploration:through store success score #blex:003125 _ run function 221_block_exploration:point
execute if score #blex:003125 _ matches 2 positioned ~0.015625 ~0.015625 ~-0.015625 unless block ~ ~ ~ #221_block_exploration:through store success score #blex:003125 _ run function 221_block_exploration:point
execute if score #blex:003125 _ matches 2 positioned ~0.015625 ~0.015625 ~0.015625 unless block ~ ~ ~ #221_block_exploration:through store success score #blex:003125 _ run function 221_block_exploration:point

# 探査の停止
execute if score #blex:003125 _ matches 0..1 store result score #blex:1 _ store result score #blex:05 _ store result score #blex:025 _ store result score #blex:0125 _ store result score #blex:00625 _ run scoreboard players set #blex:loop _ 0