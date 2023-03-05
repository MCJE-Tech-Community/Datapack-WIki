### 左クリされたinteractionを検知 / 進捗+execute on
# interaction エンティティ限定
# 負荷を気にせずコンパクトさを気にするなら、interactionエンティティ用のinteractとattack検知は一つの進捗とファンクションにまとめてもいいと思う
# このコマンドを、プレイヤーを実行者として常時実行しても動作する

## クリック先のエンティティの検索
# on attackerでは直接の検索ができないので、storeを活用してエンティティを絞る
tag @s add _
execute as @e[type=minecraft:interaction] if data entity @s attack store success score @s _ on attacker if entity @s[tag=_]
execute as @e[type=minecraft:interaction,scores={_=1}] if data entity @s attack run tag @s add attacked

## イベントの実行
# tag=interactedを持つエンティティが対象
execute at @e[type=minecraft:interaction,tag=attacked] run particle angry_villager ~ ~ ~ 0 0 0 0 1
# 左クリで座る
# ride @s mount @e[type=minecraft:interaction,tag=attacked,limit=1,sort=nearest]

## データ/タグ/進捗の解除
execute as @e[tag=attacked] run data remove entity @s attack
tag @s remove _
tag @e[tag=attacked] remove attacked
advancement revoke @s only 211_entity_association01:attack_interaction