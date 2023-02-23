## ディスプレイの更新
# ディスプレイエンティティ(tag=display01_00)をasで指定して常時実行させる

## 視点の二分探査
# billboard : fixed のentity限定
execute if data entity @s {billboard:"fixed"} at @s run tp @e[tag=display01_pos1,limit=1] ^ ^ ^0.1 ~ ~
execute if data entity @s {billboard:"fixed"} at @s run tp @e[tag=display01_pos2,limit=1] ^ ^ ^-0.1 ~ ~
execute if data entity @s {billboard:"fixed"} as @p at @s anchored eyes positioned ^ ^ ^ as @e[tag=display01_pos,limit=1,sort=nearest] positioned as @s run tp @s ~ ~ ~ ~ ~ 
execute if data entity @s {billboard:"fixed"} as @p at @s anchored eyes positioned ^ ^ ^ as @e[tag=display01_pos,limit=1,sort=furthest] positioned as @s facing ^ ^ ^-1 run tp @s ~ ~ ~ ~ ~ 
# billboard : center のentity限定
execute if data entity @s {billboard:"center"} at @s rotated as @p run tp @e[tag=display01_pos1,limit=1] ^ ^ ^-0.1 ~ ~
execute if data entity @s {billboard:"center"} at @s rotated as @p facing ^ ^ ^-1 run tp @e[tag=display01_pos2,limit=1] ^ ^ ^-0.1 ~ ~
# 二分探査
execute as @p at @s anchored eyes positioned ^ ^ ^ rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^16 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^8 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^4 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^2 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^1 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^0.5 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^0.25 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^0.125 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^0.0625 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^0.03125 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^0.015625 run tp @e[tag=display01_marker,limit=1] ~ ~ ~

## 座標の計算
# データの取得
execute if data entity @s {billboard:"center"} at @s rotated as @p facing ^ ^ ^-1 run tp @s ~ ~ ~ ~ ~
data modify storage _: Pos1 set from entity @e[tag=display01_marker,limit=1] Pos
data modify storage _: Pos2 set from entity @s Pos
data modify storage _: Rot1 set from entity @s Rotation

# クオータニオンによるsincosの計算
data modify storage _: Tls set value {translation:[0.,0.,0.],scale:[0.,0.,0.,],left_rotation:{axis:[1.,0.,0.,],angle:0.0f},right_rotation:{axis:[1.,0.,0.,],angle:0.0f}}
execute store result storage _: Tls.left_rotation.angle float 0.00001 run data get storage _: Rot1[0] -3491
execute store result storage _: Tls.right_rotation.angle float 0.00001 run data get storage _: Rot1[1] -3491
data modify entity @s transformation set from storage _: Tls
data modify storage _: Tls set from entity @s transformation
execute store result score #sin1 _ run data get storage _: Tls.left_rotation[0] 1000
execute store result score #cos1 _ run data get storage _: Tls.left_rotation[3] 1000
execute store result score #sin2 _ run data get storage _: Tls.right_rotation[0] 1000
execute store result score #cos2 _ run data get storage _: Tls.right_rotation[3] 1000
execute if entity @s[y_rotation=0..180] unless entity @s[y_rotation=0] run scoreboard players operation #sin1 _ *= #-1 _
execute if entity @s[y_rotation=0..180] unless entity @s[y_rotation=0] run scoreboard players operation #cos1 _ *= #-1 _
execute if entity @s[x_rotation=0..180] unless entity @s[x_rotation=0] run scoreboard players operation #sin2 _ *= #-1 _
execute if entity @s[x_rotation=0..180] unless entity @s[x_rotation=0] run scoreboard players operation #cos2 _ *= #-1 _

# 座標の取得
execute store result score #x _ run data get storage _: Pos1[0] 1000
execute store result score #y _ run data get storage _: Pos1[1] 1000
execute store result score #z _ run data get storage _: Pos1[2] 1000
execute store result score #x1 _ run data get storage _: Pos2[0] 1000
execute store result score #y1 _ run data get storage _: Pos2[1] 1000
execute store result score #z1 _ run data get storage _: Pos2[2] 1000

# 面上座標の計算 ベクトルと回転行列を使った計算
execute store result score #xsin _ store result score #X _ run scoreboard players operation #x _ -= #x1 _
execute store result score #Y _ run scoreboard players operation #y _ -= #y1 _
execute store result score #zsin _ store result score #zcos _ run scoreboard players operation #z _ -= #z1 _
scoreboard players operation #X _ *= #cos1 _
scoreboard players operation #zsin _ *= #sin1 _
scoreboard players operation #xsin _ *= #sin1 _
scoreboard players operation #xsin _ *= #sin2 _
scoreboard players operation #xsin _ /= #1000 _
scoreboard players operation #zcos _ *= #cos1 _
scoreboard players operation #zcos _ *= #sin2 _
scoreboard players operation #zcos _ /= #1000 _
scoreboard players operation #Y _ *= #cos2 _
scoreboard players operation #X _ -= #zsin _
scoreboard players operation #Y _ -= #xsin _
scoreboard players operation #Y _ -= #zcos _
scoreboard players operation #X _ /= #1000 _
scoreboard players operation #Y _ /= #1000 _

## 座標の表示
# execute if score #X _ matches -100..100 if score #Y _ matches 0..70 run title @p actionbar {"translate":"(%s,%s)","with":[{"score":{"objective": "_","name":"#X"}},{"score":{"objective": "_","name":"#Y"}}]}
#title @p actionbar {"translate":"(%s,%s)","with":[{"score":{"objective": "_","name":"#X"}},{"score":{"objective": "_","name":"#Y"}}]}
#title @p actionbar {"translate":"(%s,%s,%s,%s)","with":[{"score":{"objective": "_","name":"#sin1"}},{"score":{"objective": "_","name":"#cos1"}},{"score":{"objective": "_","name":"#sin2"}},{"score":{"objective": "_","name":"#cos2"}}]}

## ホバーイベント演出
# execute at @e[tag=display01_marker,limit=1] if score #x _ matches -100..100 if score #y _ matches 0..70 run particle composter ~ ~ ~ 0 0 0 0 1 normal @p
# execute at @e[tag=display01_marker,limit=1] run particle composter ~ ~ ~ 0 0 0 0 1 normal @p
execute on passengers if entity @s[tag=display01,nbt=!{background:0}] run data modify entity @s background set value 0
execute if score #X _ matches -350..400 if score #Y _ matches 385..660 on passengers if entity @s[tag=display01_11] run data modify entity @s background set value 1090453504
execute if score #X _ matches -870..-100 if score #Y _ matches 1..270 on passengers if entity @s[tag=display01_21] run data modify entity @s background set value 1090453504
execute if score #X _ matches 125..900 if score #Y _ matches 1..270 on passengers if entity @s[tag=display01_31] run data modify entity @s background set value 1090453504