## ディスプレイの更新
# ディスプレイエンティティ(tag=display_00)をasで指定して常時実行させる

## 準備
    execute unless entity 4fe002bb-0-0-0-1 run summon marker ~ ~ ~ {Tags:[display,display_pos],UUID:[I;1340080827,0,0,1]}
    execute unless entity 4fe002bb-0-0-0-2 run summon marker ~ ~ ~ {Tags:[display,display_pos],UUID:[I;1340080827,0,0,2]}

## 視点の二分探査
    # billboard : fixed のとき
    execute if entity @s[tag=display_fixed] at @s run tp 4fe002bb-0-0-0-1 ^ ^ ^0.1 ~ ~
    execute if entity @s[tag=display_fixed] at @s run tp 4fe002bb-0-0-0-2 ^ ^ ^-0.1 ~ ~
    execute if entity @s[tag=display_fixed] as @p at @s anchored eyes positioned ^ ^ ^ as @e[tag=display_pos,type=marker,limit=1,sort=nearest] positioned as @s run tp @s ~ ~ ~ ~ ~ 
    execute if entity @s[tag=display_fixed] as @p at @s anchored eyes positioned ^ ^ ^ as @e[tag=display_pos,type=marker,limit=1,sort=furthest] positioned as @s facing ^ ^ ^-1 run tp @s ~ ~ ~ ~ ~ 
    # 二分探査
    execute if entity @s[tag=display_fixed] as @p at @s anchored eyes positioned ^ ^ ^ rotated as @e[tag=display_pos,type=marker,limit=1,sort=nearest] positioned ^ ^ ^16 rotated as @e[tag=display_pos,type=marker,limit=1,sort=nearest] positioned ^ ^ ^8 rotated as @e[tag=display_pos,type=marker,limit=1,sort=nearest] positioned ^ ^ ^4 rotated as @e[tag=display_pos,type=marker,limit=1,sort=nearest] positioned ^ ^ ^2 rotated as @e[tag=display_pos,type=marker,limit=1,sort=nearest] positioned ^ ^ ^1 rotated as @e[tag=display_pos,type=marker,limit=1,sort=nearest] positioned ^ ^ ^0.5 rotated as @e[tag=display_pos,type=marker,limit=1,sort=nearest] positioned ^ ^ ^0.25 rotated as @e[tag=display_pos,type=marker,limit=1,sort=nearest] positioned ^ ^ ^0.125 rotated as @e[tag=display_pos,type=marker,limit=1,sort=nearest] positioned ^ ^ ^0.0625 rotated as @e[tag=display_pos,type=marker,limit=1,sort=nearest] positioned ^ ^ ^0.03125 rotated as @e[tag=display_pos,type=marker,limit=1,sort=nearest] positioned ^ ^ ^0.015625 run tp 4fe002bb-0-0-0-1 ~ ~ ~
    execute at 4fe002bb-0-0-0-1 run particle composter ~ ~ ~ 0 0 0 0 1 normal @p

## 座標の計算
    # 座標の取得
    execute if entity @s[tag=display_center] as @p at @s anchored eyes positioned ^ ^ ^ run tp 4fe002bb-0-0-0-1 ~ ~ ~
    data modify storage _: temp.pos1 set from entity 4fe002bb-0-0-0-1 Pos
    data modify storage _: temp.pos2 set from entity @s Pos
    execute store result score #x1 _ run data get storage _: temp.pos1[0] 1000
    execute store result score #y1 _ run data get storage _: temp.pos1[1] 1000
    execute store result score #z1 _ run data get storage _: temp.pos1[2] 1000
    execute store result score #x2 _ run data get storage _: temp.pos2[0] 1000
    execute store result score #y2 _ run data get storage _: temp.pos2[1] 1000
    execute store result score #z2 _ run data get storage _: temp.pos2[2] 1000
    execute store result score #x2 _ run scoreboard players operation #x1 _ -= #x2 _
    execute store result score #y2 _ run scoreboard players operation #y1 _ -= #y2 _
    execute store result score #z2 _ run scoreboard players operation #z1 _ -= #z2 _
    # sinとcosの取得 (ついでに原点に2体とも移動)
    execute if entity @s[tag=display_center] as 4fe002bb-0-0-0-1 positioned 0. 0. 0. rotated as @p rotated ~ 0 positioned ^ ^ ^1 run tp @s ~ ~ ~
    execute if entity @s[tag=display_center] as 4fe002bb-0-0-0-2 positioned 0. 0. 0. rotated as @p rotated 0 ~ positioned ^ ^ ^1 run tp @s ~ ~ ~
    execute if entity @s[tag=display_fixed] rotated as @s as 4fe002bb-0-0-0-1 positioned 0. 0. 0. rotated ~180 0 positioned ^ ^ ^1 run tp @s ~ ~ ~
    execute if entity @s[tag=display_fixed] rotated as @s as 4fe002bb-0-0-0-2 positioned 0. 0. 0. rotated 0 ~ positioned ^ ^ ^1 run tp @s ~ ~ ~
    data modify storage _: temp.pos1 set from entity 4fe002bb-0-0-0-1 Pos
    data modify storage _: temp.pos2 set from entity 4fe002bb-0-0-0-2 Pos
    # 面上座標の計算 ベクトルと回転行列を使った計算
    scoreboard players set #const. _ 1000
    execute store result score #sin _ run data get storage _: temp.pos1[0] -1000
    execute store result score #cos _ run data get storage _: temp.pos1[2] -1000
    scoreboard players operation #x2 _ *= #sin _
    scoreboard players operation #z1 _ *= #sin _
    scoreboard players operation #x1 _ *= #cos _
    scoreboard players operation #z2 _ *= #cos _
    execute store result score #sin _ run data get storage _: temp.pos2[1] -1000
    execute store result score #cos _ run data get storage _: temp.pos2[2] 1000
    scoreboard players operation #x2 _ *= #sin _
    scoreboard players operation #z2 _ *= #sin _
    scoreboard players operation #y1 _ *= #cos _
    scoreboard players operation #x2 _ /= #const. _
    scoreboard players operation #z2 _ /= #const. _
    scoreboard players operation #x1 _ -= #z1 _
    scoreboard players operation #y1 _ -= #x2 _
    scoreboard players operation #y1 _ -= #z2 _
    scoreboard players operation #x1 _ /= #const. _
    scoreboard players operation #y1 _ /= #const. _

## 座標の表示
    # execute if score #X _ matches -100..100 if score #Y _ matches 0..70 run title @p actionbar {"translate":"(%s,%s)","with":[{"score":{"objective": "_","name":"#X"}},{"score":{"objective": "_","name":"#Y"}}]}
    # title @p actionbar {"translate":"(%s,%s)","with":[{"score":{"objective": "_","name":"#x1"}},{"score":{"objective": "_","name":"#y1"}}]}
    # title @p actionbar {"translate":"(%s,%s,%s,%s)","with":[{"score":{"objective": "_","name":"#sin1"}},{"score":{"objective": "_","name":"#cos1"}},{"score":{"objective": "_","name":"#sin2"}},{"score":{"objective": "_","name":"#cos2"}}]}

## ホバーイベント演出
    # execute at @e[tag=display_marker,limit=1] if score #x _ matches -100..100 if score #y _ matches 0..70 run particle composter ~ ~ ~ 0 0 0 0 1 normal @p
    # execute at @e[tag=display_marker,limit=1] run particle composter ~ ~ ~ 0 0 0 0 1 normal @p
    execute on passengers if entity @s[tag=display,nbt=!{background:0}] run data modify entity @s background set value 0
    execute if score #x1 _ matches -350..400 if score #y1 _ matches 385..660 on passengers if entity @s[tag=display_11] run data modify entity @s background set value 1090453504
    execute if score #x1 _ matches -870..-100 if score #y1 _ matches 1..270 on passengers if entity @s[tag=display_21] run data modify entity @s background set value 1090453504
    execute if score #x1 _ matches 125..900 if score #y1 _ matches 1..270 on passengers if entity @s[tag=display_31] run data modify entity @s background set value 1090453504

## 後処理
    kill 4fe002bb-0-0-0-1
    kill 4fe002bb-0-0-0-2