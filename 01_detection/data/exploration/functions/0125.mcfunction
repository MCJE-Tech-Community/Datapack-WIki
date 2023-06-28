### 視線先ブロックorエンティティ探査 functionループ型 0.125m
# 1mおきに移動してブロックorエンティティの有無を確認

## ブロック探査
# 角8方向に探査点を伸ばしてチェック
scoreboard players set #02:0125 _ 1
execute if block ~-0.0625 ~-0.0625 ~-0.0625 #124_exploration:through if block ~-0.0625 ~-0.0625 ~0.0625 #124_exploration:through if block ~0.0625 ~-0.0625 ~-0.0625 #124_exploration:through if block ~0.0625 ~-0.0625 ~0.0625 #124_exploration:through if block ~-0.0625 ~0.0625 ~-0.0625 #124_exploration:through if block ~-0.0625 ~0.0625 ~0.0625 #124_exploration:through if block ~0.0625 ~0.0625 ~-0.0625 #124_exploration:through if block ~0.0625 ~0.0625 ~0.0625 #124_exploration:through run scoreboard players set #02:0125 _ 0

## エンティティ探査
# 立方体のdx,dy,dzによる探査範囲を置いてエンティティをチェック
execute positioned ~-0.0625 ~-0.0625 ~-0.0625 as @e[tag=!root,dx=0,dy=0,dz=0] positioned ~-0.875 ~-0.875 ~-0.875 if entity @s[dx=0,dy=0,dz=0] run scoreboard players set #02:0125 _ 1

# ブロックかエンティティがあったらさらに細かくチェック
execute if score #02:0125 _ matches 1 positioned ^ ^ ^-0.03125 run function 124_exploration:00625
execute if score #02:0125 _ matches 1 positioned ^ ^ ^0.03125 run function 124_exploration:00625