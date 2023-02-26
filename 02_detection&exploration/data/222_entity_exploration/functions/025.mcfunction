### 視線先エンティティ探査 functionループ型 0.25m
# 1mおきに移動してエンティティの有無を確認

## 探査
# 立方体のdx,dy,dzによる探査範囲を置いてエンティティをチェック
scoreboard players set #enex:025 _ 0
execute positioned ~-0.125 ~-0.125 ~-0.125 as @e[tag=!root,dx=0,dy=0,dz=0] positioned ~-0.75 ~-0.75 ~-0.75 if entity @s[dx=0,dy=0,dz=0] run scoreboard players set #enex:025 _ 1

# エンティティが範囲内に居たらさらに細かくチェック
execute if score #enex:025 _ matches 1.. positioned ^ ^ ^-0.0625 run function 222_entity_exploration:0125
execute if score #enex:025 _ matches 1.. positioned ^ ^ ^0.0625 run function 222_entity_exploration:0125