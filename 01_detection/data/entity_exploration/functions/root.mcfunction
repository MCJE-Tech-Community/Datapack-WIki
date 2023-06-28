### 視線先エンティティ探査 (functionループ)
# 好きな位置と向きで実行するとそこから視線上のエンティティを探査する

## 開始前
# 発光を付与したエンティティの発光を解除
execute as @e[tag=02_glow] run data modify entity @s Glowing set value 0
tag @e[tag=02_glow] remove 02_glow

## ループの開始
# 探査距離の上限 m
scoreboard players set #02:loop _ 25

# 自身を除外するためのタグ
tag @s add root

# ループの開始
# プレイヤーから実行する前提でanchoredがついているので注意
execute anchored eyes positioned ^ ^ ^0.5 run function 123_entity_exploration:1

# タグ削除
tag @s remove root