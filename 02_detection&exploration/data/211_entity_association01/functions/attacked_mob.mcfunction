### 攻撃先モブ検知 /　進捗+execute on
# 攻撃先のモブを探索する (HurtTimeが機能するエンティティ)
# 同時に複数体いる場合は全員同時に検知する
# 自分が過去に攻撃したモブが、新たに攻撃したモブと同時に非モブからダメージを受けたときに誤動作する可能性がある
# 攻撃によって倒れたモブには反応しない
# このコマンドを、プレイヤーを実行者として常時実行しても動作する

## 攻撃先のエンティティの検索
# on attackerでは直接の検索ができないので、storeを活用してエンティティを絞る
tag @s add _
execute as @e[distance=..100,nbt={HurtTime:10s}] store success score @s _ on attacker if entity @s[tag=_]
execute as @e[distance=..100,nbt={HurtTime:10s},scores={_=1}] run tag @s add attacked

## イベントの実行
# tag=attackedを持つエンティティが対象
execute at @e[tag=attacked] run particle angry_villager ~ ~1.2 ~ 0 0 0 0 1

## タグ/進捗の解除
tag @s remove _
tag @e[tag=attacked] remove attacked
advancement revoke @s only 211_entity_association01:attack_mob