# ディスプレイの更新
# ディスプレイエンティティ(tag=display01_00)をasで指定して常時実行させる
# 一番近くのプレイヤーの視線をもとに各種イベントが実行される

# billboard : fix のentity限定
execute at @s run tp @e[tag=display01_pos1,limit=1] ^ ^ ^0.1 ~ ~
execute at @s run tp @e[tag=display01_pos2,limit=1] ^ ^ ^-0.1 ~ ~
execute at @p as @e[tag=display01_pos,limit=1,sort=nearest] positioned as @s run tp @s ~ ~ ~ ~ ~ 
execute at @p as @e[tag=display01_pos,limit=1,sort=furthest] positioned as @s facing ^ ^ ^-1 run tp @s ~ ~ ~ ~ ~ 

# 二分探査
execute as @p anchored eyes at @p rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^16 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^8 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^4 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^2 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^1 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^0.5 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^0.25 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^0.125 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^0.0625 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^0.03125 rotated as @e[tag=display01_pos,limit=1,sort=nearest] positioned ^ ^ ^0.015625 run tp @e[tag=display01_marker] ~ ~ ~

# 座標の計算
# データの取得
execute at @s positioned ^ ^ ^-100 as @e[tag=display01_marker,limit=1] facing entity @s feet positioned as @s run tp @s ~ ~ ~ ~ ~
data modify storage _: Rot1 set from entity @e[tag=display01_marker,limit=1] Rotation
data modify storage _: Rot2 set from entity @s Rotation
# 角度差の計算
execute store result score #x _ run data get storage _: Rot1[0] -1000000
execute store result score #x1 _ run data get storage _: Rot2[0] -1000000
execute store result score #y _ run data get storage _: Rot1[1] -1000000
execute store result score #y1 _ run data get storage _: Rot2[1] -1000000
scoreboard players operation #x _ -= #x1 _
scoreboard players add #x _ 360000000
scoreboard players operation #x _ %= #360000000 _
execute if score #x _ matches 180000000.. run scoreboard players remove #x _ 360000000
scoreboard players operation #y _ -= #y1 _
scoreboard players add #y _ 360000000
scoreboard players operation #y _ %= #360000000 _
execute if score #y _ matches 180000000.. run scoreboard players remove #y _ 360000000
# 面上座標の計算
scoreboard players operation #x _ *= #175 _
scoreboard players operation #x _ /= #1000000 _
scoreboard players operation #y _ *= #175 _
scoreboard players operation #y _ /= #1000000 _

# 座標の表示
execute if score #x _ matches -100..100 if score #y _ matches 0..70 run title @p actionbar {"translate":"(%s,%s)","with":[{"score":{"objective": "_","name":"#x"}},{"score":{"objective": "_","name":"#y"}}]}

# 表示演出
# execute at @e[tag=display01_marker,limit=1] if score #x _ matches -100..100 if score #y _ matches 0..70 run particle composter ~ ~ ~ 0 0 0 0 1 normal @p
execute on passengers if entity @s[tag=display01,nbt=!{background:0}] run data modify entity @s background set value 0
execute if score #x _ matches -35..40 if score #y _ matches 40..63 on passengers if entity @s[tag=display01_11] run data modify entity @s background set value 1090453504
execute if score #x _ matches -90..-10 if score #y _ matches 1..27 on passengers if entity @s[tag=display01_21] run data modify entity @s background set value 1090453504
execute if score #x _ matches 15..97 if score #y _ matches 1..27 on passengers if entity @s[tag=display01_31] run data modify entity @s background set value 1090453504