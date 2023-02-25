### 右クリされたinteractionを検知 / 進捗+execute on
# interaction エンティティ限定 村人などはon targetで検知できないため
# 村人を検知したい場合は entity_association01 (進捗+二分探査)の方を参考
# このコマンドを、プレイヤーを実行者として常時実行しても動作する

## クリック先のエンティティの検索
# on targetでは直接の検索ができないので、storeを活用してエンティティを絞る
tag @s add _
execute as @e[type=minecraft:interaction,distance=..10] if data entity @s interaction store success score @s _ on target if entity @s[tag=_]
execute as @e[type=minecraft:interaction,distance=..10,scores={_=1}] if data entity @s interaction run tag @s add interacted

## イベントの実行
# tag=interactedを持つエンティティが対象
execute at @e[type=minecraft:interaction,distance=..10,tag=interacted] run particle angry_villager ~ ~ ~ 0 0 0 0 1
# 右クリで座る
# ride @s mount @e[type=minecraft:interaction,distance=..10,tag=interacted,limit=1,sort=nearest]

## データ/タグ/進捗の解除
execute as @e[tag=interacted] run data remove entity @s interaction
tag @s remove _
tag @e[tag=interacted] remove interacted
advancement revoke @s only 211_entity_association01:interact_interaction