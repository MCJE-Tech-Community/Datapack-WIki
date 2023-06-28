### 視線先ブロック探査 functionループ型 0.03125m
# 1mおきに移動してブロックの有無を確認

## 探査
# 角8方向に探査点を伸ばしてチェック
# ブロックがある場所で探査終了
scoreboard players set #003125 _ 1
execute if score #003125 _ matches 1 positioned ^ ^ ^0.015625 unless block ~ ~ ~ #block_exploration02:through run function block_exploration02:check
execute if score #003125 _ matches 1 positioned ^ ^ ^-0.015625 unless block ~ ~ ~ #block_exploration02:through run function block_exploration02:check
execute if score #003125 _ matches 1 rotated ~180 ~ positioned ^ ^ ^0.015625 unless block ~ ~ ~ #block_exploration02:through rotated as @s run function block_exploration02:check
execute if score #003125 _ matches 1 rotated ~180 ~ positioned ^ ^ ^-0.015625 unless block ~ ~ ~ #block_exploration02:through rotated as @s run function block_exploration02:check
execute if score #003125 _ matches 1 rotated as 0-0-0-0-1000000de positioned ^ ^ ^0.015625 unless block ~ ~ ~ #block_exploration02:through rotated as @s run function block_exploration02:check
execute if score #003125 _ matches 1 rotated as 0-0-0-0-1000000de positioned ^ ^ ^-0.015625 unless block ~ ~ ~ #block_exploration02:through rotated as @s run function block_exploration02:check
execute if score #003125 _ matches 1 rotated as 0-0-0-0-1000000de rotated ~180 ~ positioned ^ ^ ^0.015625 unless block ~ ~ ~ #block_exploration02:through rotated as @s run function block_exploration02:check
execute if score #003125 _ matches 1 rotated as 0-0-0-0-1000000de rotated ~180 ~ positioned ^ ^ ^-0.015625 unless block ~ ~ ~ #block_exploration02:through rotated as @s run function block_exploration02:check