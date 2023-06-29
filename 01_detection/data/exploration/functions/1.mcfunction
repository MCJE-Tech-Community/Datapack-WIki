### 視線先ブロックorエンティティ探査 functionループ型 1m
# 1mおきに移動してブロックorエンティティの有無を確認

## ブロック探査
# 角8方向に探査点を伸ばしてチェック
scoreboard players set #1 _ 1
execute if block ~-0.5 ~-0.5 ~-0.5 #exploration:through if block ~-0.5 ~-0.5 ~0.5 #exploration:through if block ~0.5 ~-0.5 ~-0.5 #exploration:through if block ~0.5 ~-0.5 ~0.5 #exploration:through if block ~-0.5 ~0.5 ~-0.5 #exploration:through if block ~-0.5 ~0.5 ~0.5 #exploration:through if block ~0.5 ~0.5 ~-0.5 #exploration:through if block ~0.5 ~0.5 ~0.5 #exploration:through run scoreboard players set #1 _ 0

## エンティティ探査
# 立方体のdx,dy,dzによる探査範囲を置いてエンティティをチェック
execute positioned ~-0.5 ~-0.5 ~-0.5 if entity @e[tag=!root,dx=0,dy=0,dz=0] run scoreboard players set #1 _ 1

# ブロックかエンティティがあったらさらに細かくチェック
execute if score #1 _ matches 1 positioned ^ ^ ^-0.25 run function exploration:05
execute if score #1 _ matches 1 positioned ^ ^ ^0.25 run function exploration:05

## ループ
# ブロックがなかったら1m先に進む
scoreboard players remove #loop _ 1
execute if score #loop _ matches 1.. positioned ^ ^ ^1 run function exploration:1