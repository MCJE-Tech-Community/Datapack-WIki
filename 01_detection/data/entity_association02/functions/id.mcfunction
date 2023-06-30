## エンティティにタグを付与する
# タグを付与したいエンティティを対象に実行する

## すでにidを持っている場合は中断
    execute if entity @s[tag=enas02.id] run return 0

## idの保存
    scoreboard players add _ enas02.id 1
    scoreboard players operation _ _ = _ enas02.id
    scoreboard players operation @s enas02.id = _ enas02.id
    tag @s add enas02.id

## 2分探査でタグ付与
    # 最大512まで
    execute if score _ _ matches ..511 run tag @s add enas02.90
    execute if score _ _ matches 512.. run tag @s add enas02.91
    execute if score _ _ matches 512.. run scoreboard players remove _ _ 512
    execute if score _ _ matches ..255 run tag @s add enas02.80
    execute if score _ _ matches 256.. run tag @s add enas02.81
    execute if score _ _ matches 256.. run scoreboard players remove _ _ 256
    execute if score _ _ matches ..127 run tag @s add enas02.70
    execute if score _ _ matches 128.. run tag @s add enas02.71
    execute if score _ _ matches 128.. run scoreboard players remove _ _ 128
    execute if score _ _ matches ..63 run tag @s add enas02.60
    execute if score _ _ matches 64.. run tag @s add enas02.61
    execute if score _ _ matches 64.. run scoreboard players remove _ _ 64
    execute if score _ _ matches ..31 run tag @s add enas02.50
    execute if score _ _ matches 32.. run tag @s add enas02.51
    execute if score _ _ matches 32.. run scoreboard players remove _ _ 32
    execute if score _ _ matches ..15 run tag @s add enas02.40
    execute if score _ _ matches 16.. run tag @s add enas02.41
    execute if score _ _ matches 16.. run scoreboard players remove _ _ 16
    execute if score _ _ matches ..7 run tag @s add enas02.30
    execute if score _ _ matches 8.. run tag @s add enas02.31
    execute if score _ _ matches 8.. run scoreboard players remove _ _ 8
    execute if score _ _ matches ..3 run tag @s add enas02.20
    execute if score _ _ matches 4.. run tag @s add enas02.21
    execute if score _ _ matches 4.. run scoreboard players remove _ _ 4
    execute if score _ _ matches ..1 run tag @s add enas02.10
    execute if score _ _ matches 2.. run tag @s add enas02.11
    execute if score _ _ matches 2.. run scoreboard players remove _ _ 2
    execute if score _ _ matches ..0 run tag @s add enas02.00
    execute if score _ _ matches 1.. run tag @s add enas02.01
    execute if score _ _ matches 1.. run scoreboard players remove _ _ 1
