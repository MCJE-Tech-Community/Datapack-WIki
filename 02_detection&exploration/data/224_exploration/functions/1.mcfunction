### 視線先ブロックorエンティティ探査 functionループ型 1m
# 1mおきに移動してブロックorエンティティの有無を確認

## エンティティ探査
# 立方体のdx,dy,dzによる探査範囲を置いてエンティティをチェック
scoreboard players set #expl:1 _ 0
execute if score #expl:loop _ matches 1.. positioned ~-0.5 ~-0.5 ~-0.5 if entity @e[tag=!root,dx=0,dy=0,dz=0] positioned ~0.5 ~0.5 ~0.5 positioned ^ ^ ^-0.25 run function 223_exploration:05
execute if score #expl:loop _ matches 1.. positioned ~-0.5 ~-0.5 ~-0.5 if entity @e[tag=!root,dx=0,dy=0,dz=0] positioned ~0.5 ~0.5 ~0.5 positioned ^ ^ ^0.25 run function 223_exploration:05

## ブロック探査
# 角8方向に探査点を伸ばしてチェック
execute unless block ~-0.5 ~-0.5 ~-0.5 #223_exploration:through run scoreboard players set #expl:1 _ 1
execute unless block ~-0.5 ~-0.5 ~0.5 #223_exploration:through run scoreboard players set #expl:1 _ 1
execute unless block ~0.5 ~-0.5 ~-0.5 #223_exploration:through run scoreboard players set #expl:1 _ 1
execute unless block ~0.5 ~-0.5 ~0.5 #223_exploration:through run scoreboard players set #expl:1 _ 1
execute unless block ~-0.5 ~0.5 ~-0.5 #223_exploration:through run scoreboard players set #expl:1 _ 1
execute unless block ~-0.5 ~0.5 ~0.5 #223_exploration:through run scoreboard players set #expl:1 _ 1
execute unless block ~0.5 ~0.5 ~-0.5 #223_exploration:through run scoreboard players set #expl:1 _ 1
execute unless block ~0.5 ~0.5 ~0.5 #223_exploration:through run scoreboard players set #expl:1 _ 1

# ブロックがあったらさらに細かくチェック
execute if score #expl:1 _ matches 1.. positioned ^ ^ ^-0.25 run function 223_exploration:05
execute if score #expl:1 _ matches 1.. positioned ^ ^ ^0.25 run function 223_exploration:05

## ループ
# ブロックがなかったら1m先に進む
scoreboard players remove #expl:loop _ 1
execute if score #expl:loop _ matches 1.. positioned ^ ^ ^1 run function 223_exploration:1