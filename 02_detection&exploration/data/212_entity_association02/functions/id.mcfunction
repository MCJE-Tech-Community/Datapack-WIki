## エンティティにタグを付与する
# タグを付与したいエンティティを対象に実行する

## idの保存
scoreboard players add #entityassociation02id _ 1
scoreboard players operation _ _ = #entityassociation02id _

## 2分探査でタグ付与
# 最大512まで
execute unless entity @s[tag=entityassociation02id] if score _ _ matches ..511 run tag @s add 90
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 512.. run tag @s add 91
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 512.. run scoreboard players remove _ _ 512
execute unless entity @s[tag=entityassociation02id] if score _ _ matches ..255 run tag @s add 80
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 256.. run tag @s add 81
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 256.. run scoreboard players remove _ _ 256
execute unless entity @s[tag=entityassociation02id] if score _ _ matches ..127 run tag @s add 70
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 128.. run tag @s add 71
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 128.. run scoreboard players remove _ _ 128
execute unless entity @s[tag=entityassociation02id] if score _ _ matches ..63 run tag @s add 60
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 64.. run tag @s add 61
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 64.. run scoreboard players remove _ _ 64
execute unless entity @s[tag=entityassociation02id] if score _ _ matches ..31 run tag @s add 50
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 32.. run tag @s add 51
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 32.. run scoreboard players remove _ _ 32
execute unless entity @s[tag=entityassociation02id] if score _ _ matches ..15 run tag @s add 40
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 16.. run tag @s add 41
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 16.. run scoreboard players remove _ _ 16
execute unless entity @s[tag=entityassociation02id] if score _ _ matches ..7 run tag @s add 30
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 8.. run tag @s add 31
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 8.. run scoreboard players remove _ _ 8
execute unless entity @s[tag=entityassociation02id] if score _ _ matches ..3 run tag @s add 20
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 4.. run tag @s add 21
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 4.. run scoreboard players remove _ _ 4
execute unless entity @s[tag=entityassociation02id] if score _ _ matches ..1 run tag @s add 10
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 2.. run tag @s add 11
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 2.. run scoreboard players remove _ _ 2
execute unless entity @s[tag=entityassociation02id] if score _ _ matches ..0 run tag @s add 00
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 1.. run tag @s add 01
execute unless entity @s[tag=entityassociation02id] if score _ _ matches 1.. run scoreboard players remove _ _ 1

execute unless entity @s[tag=entityassociation02id] run tag @s add entityassociation02id