### 視線先エンティティ探査 functionループ型 1m
# 1mおきに移動し、エンティティの有無を確認

## 探査
# 立方体のdx,dy,dzによる探査範囲を置いてエンティティをチェック
execute if score #02:loop _ matches 1.. positioned ~-0.5 ~-0.5 ~-0.5 if entity @e[tag=!root,dx=0,dy=0,dz=0] positioned ~0.5 ~0.5 ~0.5 positioned ^ ^ ^-0.25 run function 123_entity_exploration:05
execute if score #02:loop _ matches 1.. positioned ~-0.5 ~-0.5 ~-0.5 if entity @e[tag=!root,dx=0,dy=0,dz=0] positioned ~0.5 ~0.5 ~0.5 positioned ^ ^ ^0.25 run function 123_entity_exploration:05

## ループ
# エンティティがいなかったら1m先へ進む
scoreboard players remove #02:loop _ 1
execute if score #02:loop _ matches 1.. positioned ^ ^ ^1 run function 123_entity_exploration:1