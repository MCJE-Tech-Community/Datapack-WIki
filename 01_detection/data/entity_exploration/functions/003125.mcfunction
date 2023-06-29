### 視線先エンティティ探査 functionループ型 0.03125m
# 1mおきに移動してエンティティの有無を確認

## 探査
# 立方体のdx,dy,dzによる探査範囲を置いてエンティティをチェック
scoreboard players set #003125 _ 0
execute positioned ~-0.015625 ~-0.015625 ~-0.015625 as @e[tag=!root,dx=0,dy=0,dz=0] positioned ~-0.96875 ~-0.96875 ~-0.96875 if entity @s[dx=0,dy=0,dz=0] store success score #003125 _ run tag @s add targets
execute if score #003125 _ matches 1 positioned ~-0.015625 ~-0.015625 ~-0.015625 run function entity_exploration:targets

## 後処理
# タグ削除
tag @e[tag=targets] remove targets
# ループの強制停止 ここをなくせば貫通型になる
execute if score #003125 _ matches 1 store result score #05 _ store result score #025 _ store result score #0125 _ store result score #00625 _ run scoreboard players set #loop _ 0