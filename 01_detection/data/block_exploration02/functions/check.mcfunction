### ブロックを本当にみているかどうかチェック
# 

##各辺からの視線をもとにチェック
# チェック用のスコア
scoreboard players set #face _ 0

# xy,yz面
scoreboard players set @s _ 0
# 何本の辺に対して右を向いているかをカウント
execute unless entity @s[y_rotation=90..180] align xyz positioned ~ ~ ~ facing entity @s eyes rotated ~ 0 positioned as @s positioned ^ ^ ^1000 rotated as @s rotated ~ 0 positioned ^1000 ^ ^1000 if entity @s[distance=..1000] run scoreboard players add @s _ 1
execute unless entity @s[y_rotation=-180..-90] align xyz positioned ~1 ~ ~ facing entity @s eyes rotated ~ 0 positioned as @s positioned ^ ^ ^1000 rotated as @s rotated ~ 0 positioned ^1000 ^ ^1000 if entity @s[distance=..1000] run scoreboard players add @s _ 1
execute unless entity @s[y_rotation=0..90] align xyz positioned ~ ~ ~1 facing entity @s eyes rotated ~ 0 positioned as @s positioned ^ ^ ^1000 rotated as @s rotated ~ 0 positioned ^1000 ^ ^1000 if entity @s[distance=..1000] run scoreboard players add @s _ 1
execute unless entity @s[y_rotation=-90..0] align xyz positioned ~1 ~ ~1 facing entity @s eyes rotated ~ 0 positioned as @s positioned ^ ^ ^1000 rotated as @s rotated ~ 0 positioned ^1000 ^ ^1000 if entity @s[distance=..1000] run scoreboard players add @s _ 1
# 角度と数をもとに面を取得
execute if entity @s[y_rotation=0..180] if score @s _ matches 1..2 if block ~1 ~ ~ #block_exploration02:through unless entity @s[y_rotation=0..90,scores={_=2}] unless entity @s[y_rotation=90..180,scores={_=1}] run scoreboard players set #face _ 1
execute if entity @s[y_rotation=-90..90] if score @s _ matches 1..2 if block ~ ~ ~-1 #block_exploration02:through unless entity @s[y_rotation=-90..0,scores={_=2}] unless entity @s[y_rotation=0..90,scores={_=1}] run scoreboard players set #face _ 2
execute if entity @s[y_rotation=-180..0] if score @s _ matches 1..2 if block ~-1 ~ ~ #block_exploration02:through unless entity @s[y_rotation=-180..-90,scores={_=2}] unless entity @s[y_rotation=-90..0,scores={_=1}] run scoreboard players set #face _ 3
execute unless entity @s[y_rotation=-90..90] if score @s _ matches 1..2 if block ~ ~ ~1 #block_exploration02:through unless entity @s[y_rotation=90..180,scores={_=2}] unless entity @s[y_rotation=-180..-90,scores={_=1}] run scoreboard players set #face _ 4

# xz上面
scoreboard players set @s _ 0
# 何本の辺に対して上を向いているかをカウント
execute align xyz positioned ~ ~1 ~ facing entity @s eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 facing 0.0 0.0 ~ positioned as @s positioned ^ ^ ^-1000 rotated as 4fe002bb-0-0-0-2 positioned ^ ^-1000 ^1000 if entity @s[distance=..1000] run scoreboard players add @s _ 1
execute align xyz positioned ~1 ~1 ~ facing entity @s eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 facing 0.0 0.0 ~ positioned as @s positioned ^ ^ ^-1000 rotated as 4fe002bb-0-0-0-2 positioned ^ ^-1000 ^1000 if entity @s[distance=..1000] run scoreboard players add @s _ 1
execute align xyz positioned ~ ~1 ~ facing entity @s eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 facing ~ 0.0 0.0 positioned as @s positioned ^ ^ ^-1000 rotated as 4fe002bb-0-0-0-3 positioned ^ ^-1000 ^1000 if entity @s[distance=..1000] run scoreboard players add @s _ 1
execute align xyz positioned ~ ~1 ~1 facing entity @s eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 facing ~ 0.0 0.0 positioned as @s positioned ^ ^ ^-1000 rotated as 4fe002bb-0-0-0-3 positioned ^ ^-1000 ^1000 if entity @s[distance=..1000] run scoreboard players add @s _ 1
# 角度と数をもとに面を取得 
execute if entity @s[x_rotation=-180..0,scores={_=3..}] run scoreboard players set #face _ 0
execute if entity @s[x_rotation=0..180,scores={_=3..}] run scoreboard players set #face _ 0
execute if entity @s[x_rotation=0..180,scores={_=2}] if block ~ ~1 ~ #block_exploration02:through run scoreboard players set #face _ 5

# xz下面
scoreboard players set @s _ 0
# 何本の辺に対して下を向いているかをカウント
execute align xyz positioned ~ ~ ~ facing entity @s eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 facing 0.0 0.0 ~ positioned as @s positioned ^ ^ ^-1000 rotated as 4fe002bb-0-0-0-2 positioned ^ ^1000 ^1000 if entity @s[distance=..1000] run scoreboard players add @s _ 1
execute align xyz positioned ~1 ~ ~ facing entity @s eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 facing 0.0 0.0 ~ positioned as @s positioned ^ ^ ^-1000 rotated as 4fe002bb-0-0-0-2 positioned ^ ^1000 ^1000 if entity @s[distance=..1000] run scoreboard players add @s _ 1
execute align xyz positioned ~ ~ ~ facing entity @s eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 facing ~ 0.0 0.0 positioned as @s positioned ^ ^ ^-1000 rotated as 4fe002bb-0-0-0-3 positioned ^ ^1000 ^1000 if entity @s[distance=..1000] run scoreboard players add @s _ 1
execute align xyz positioned ~ ~ ~1 facing entity @s eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 facing ~ 0.0 0.0 positioned as @s positioned ^ ^ ^-1000 rotated as 4fe002bb-0-0-0-3 positioned ^ ^1000 ^1000 if entity @s[distance=..1000] run scoreboard players add @s _ 1
# 角度と数をもとに面を取得 
execute if entity @s[x_rotation=0..180,scores={_=3..}] run scoreboard players set #face _ 0
execute if entity @s[x_rotation=-180..0,scores={_=3..}] run scoreboard players set #face _ 0
execute if entity @s[x_rotation=-180..0,scores={_=2}] if block ~ ~-1 ~ #block_exploration02:through run scoreboard players set #face _ 6

# 辺の位置を表示するやつ
# execute align xyz positioned ~ ~1 ~ facing entity @s eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 facing 0.0 0.0 ~ positioned as @s anchored eyes positioned ^ ^ ^1.5 run particle dust 0 0 0 0.5 ~ ~ ~ 0 0 0 0 1
# execute align xyz positioned ~1 ~1 ~ facing entity @s eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 facing 0.0 0.0 ~ positioned as @s anchored eyes positioned ^ ^ ^1.5 run particle dust 0 0 0 0.5 ~ ~ ~ 0 0 0 0 1
# execute align xyz positioned ~ ~1 ~ facing entity @s eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 facing ~ 0.0 0.0 positioned as @s anchored eyes positioned ^ ^ ^1.5 run particle dust 0 0 0 0.5 ~ ~ ~ 0 0 0 0 1
# execute align xyz positioned ~ ~1 ~1 facing entity @s eyes positioned 0.0 0.0 0.0 positioned ^ ^ ^1 facing ~ 0.0 0.0 positioned as @s anchored eyes positioned ^ ^ ^1.5 run particle dust 0 0 0 0.5 ~ ~ ~ 0 0 0 0 1


## 探査の停止
# スコアのセット
execute if score #face _ matches 1..6 store result score #1 _ store result score #05 _ store result score #025 _ store result score #0125 _ store result score #00625 _ store result score #003125 _ run scoreboard players set #loop _ 0
# 終了点での実行
execute if score #face _ matches 1..6 run function block_exploration02:point