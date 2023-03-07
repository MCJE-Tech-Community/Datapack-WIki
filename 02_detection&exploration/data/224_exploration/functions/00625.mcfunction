### 視線先ブロックorエンティティ探査 functionループ型 0.0625m
# 1mおきに移動してブロックorエンティティの有無を確認

## ブロック探査
# 角8方向に探査点を伸ばしてチェック
scoreboard players set #02:00625 _ 1
execute if block ~-0.03125 ~-0.03125 ~-0.03125 #224_exploration:through if block ~-0.03125 ~-0.03125 ~0.03125 #224_exploration:through if block ~0.03125 ~-0.03125 ~-0.03125 #224_exploration:through if block ~0.03125 ~-0.03125 ~0.03125 #224_exploration:through if block ~-0.03125 ~0.03125 ~-0.03125 #224_exploration:through if block ~-0.03125 ~0.03125 ~0.03125 #224_exploration:through if block ~0.03125 ~0.03125 ~-0.03125 #224_exploration:through if block ~0.03125 ~0.03125 ~0.03125 #224_exploration:through run scoreboard players set #02:00625 _ 0

## エンティティ探査
# 立方体のdx,dy,dzによる探査範囲を置いてエンティティをチェック
execute positioned ~-0.03125 ~-0.03125 ~-0.03125 as @e[tag=!root,dx=0,dy=0,dz=0] positioned ~-0.9375 ~-0.9375 ~-0.9375 if entity @s[dx=0,dy=0,dz=0] run scoreboard players set #02:00625 _ 1

# ブロックがあったらさらに細かくチェック
execute if score #02:00625 _ matches 1 positioned ^ ^ ^-0.015625 run function 224_exploration:003125
execute if score #02:00625 _ matches 1 positioned ^ ^ ^0.015625 run function 224_exploration:003125