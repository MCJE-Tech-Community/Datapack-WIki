### 視線先ブロック探査 functionループ型 0.03125m
# 1mおきに移動してブロックの有無を確認

## 探査
# 角8方向に探査点を伸ばしてチェック
# ブロックがある場所で探査終了
scoreboard players set #003125 _ 2
execute if score #003125 _ matches 2 positioned ~0.015625 ~0.015625 ~0.015625 unless block ~ ~ ~ #block_exploration01:through store success score #003125 _ run function block_exploration01:point
execute if score #003125 _ matches 2 positioned ~0.015625 ~0.015625 ~-0.015625 unless block ~ ~ ~ #block_exploration01:through store success score #003125 _ run function block_exploration01:point
execute if score #003125 _ matches 2 positioned ~0.015625 ~-0.015625 ~0.015625 unless block ~ ~ ~ #block_exploration01:through store success score #003125 _ run function block_exploration01:point
execute if score #003125 _ matches 2 positioned ~0.015625 ~-0.015625 ~-0.015625 unless block ~ ~ ~ #block_exploration01:through store success score #003125 _ run function block_exploration01:point
execute if score #003125 _ matches 2 positioned ~-0.015625 ~0.015625 ~0.015625 unless block ~ ~ ~ #block_exploration01:through store success score #003125 _ run function block_exploration01:point
execute if score #003125 _ matches 2 positioned ~-0.015625 ~0.015625 ~-0.015625 unless block ~ ~ ~ #block_exploration01:through store success score #003125 _ run function block_exploration01:point
execute if score #003125 _ matches 2 positioned ~-0.015625 ~-0.015625 ~0.015625 unless block ~ ~ ~ #block_exploration01:through store success score #003125 _ run function block_exploration01:point
execute if score #003125 _ matches 2 positioned ~-0.015625 ~-0.015625 ~-0.015625 unless block ~ ~ ~ #block_exploration01:through store success score #003125 _ run function block_exploration01:point

# 探査の停止
execute if score #003125 _ matches 0..1 store result score #1 _ store result score #05 _ store result score #025 _ store result score #0125 _ store result score #00625 _ store result score #003125 _ run scoreboard players set #loop _ 0