### 攻撃/左クリ先検知 / 進捗+二分探査
# player_hurt_entityが機能するエンティティ(モブやinteraction)で機能する
# 調べた限りではボートやアマスタ等は対象にならないぽい
# 同時に複数体いる場合、一体ずつ順番に実行される
# 先に対象にしたいエンティティにid付与のファンクションを実行する必要がある
# idの上限は512体まで

## 攻撃先のエンティティの検索
# idを取得
scoreboard players set _ _ 0
execute if entity @s[advancements={112_entity_association02:attacked={01=true}}] run scoreboard players add _ _ 1
execute if entity @s[advancements={112_entity_association02:attacked={11=true}}] run scoreboard players add _ _ 2
execute if entity @s[advancements={112_entity_association02:attacked={21=true}}] run scoreboard players add _ _ 4
execute if entity @s[advancements={112_entity_association02:attacked={31=true}}] run scoreboard players add _ _ 8
execute if entity @s[advancements={112_entity_association02:attacked={41=true}}] run scoreboard players add _ _ 16
execute if entity @s[advancements={112_entity_association02:attacked={51=true}}] run scoreboard players add _ _ 32
execute if entity @s[advancements={112_entity_association02:attacked={61=true}}] run scoreboard players add _ _ 64
execute if entity @s[advancements={112_entity_association02:attacked={71=true}}] run scoreboard players add _ _ 128
execute if entity @s[advancements={112_entity_association02:attacked={81=true}}] run scoreboard players add _ _ 256
execute if entity @s[advancements={112_entity_association02:attacked={91=true}}] run scoreboard players add _ _ 512
# 同じidを持つエンティティにタグ付与
execute as @e[distance=..200] if score @s _ = _ _ run tag @s add interacted

## イベントの実行
# tag=attackedを持つエンティティが対象
execute as @e[tag=attacked] anchored eyes at @s run particle heart ^ ^ ^ 0 0 0 0 1

## タグ/進捗の解除
tag @s remove _
tag @e[tag=attacked] remove attacked
advancement revoke @s only 112_entity_association02:attack