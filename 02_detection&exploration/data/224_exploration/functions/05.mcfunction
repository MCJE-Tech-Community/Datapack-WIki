### 視線先ブロックorエンティティ探査 functionループ型 0.5m
# 1mおきに移動してブロックorエンティティの有無を確認

## ブロック探査
# 角8方向に探査点を伸ばしてチェック
scoreboard players set #02:05 _ 1
execute if block ~-0.25 ~-0.25 ~-0.25 #224_exploration:through if block ~-0.25 ~-0.25 ~0.25 #224_exploration:through if block ~0.25 ~-0.25 ~-0.25 #224_exploration:through if block ~0.25 ~-0.25 ~0.25 #224_exploration:through if block ~-0.25 ~0.25 ~-0.25 #224_exploration:through if block ~-0.25 ~0.25 ~0.25 #224_exploration:through if block ~0.25 ~0.25 ~-0.25 #224_exploration:through if block ~0.25 ~0.25 ~0.25 #224_exploration:through run scoreboard players set #02:05 _ 0

## エンティティ探査
# 立方体のdx,dy,dzによる探査範囲を置いてエンティティをチェック
execute positioned ~-0.25 ~-0.25 ~-0.25 as @e[tag=!root,dx=0,dy=0,dz=0] positioned ~-0.5 ~-0.5 ~-0.5 if entity @s[dx=0,dy=0,dz=0] run scoreboard players set #02:05 _ 1

# ブロックかエンティティがあったらさらに細かくチェック
execute if score #02:05 _ matches 1 positioned ^ ^ ^-0.125 run function 224_exploration:025
execute if score #02:05 _ matches 1 positioned ^ ^ ^0.125 run function 224_exploration:025