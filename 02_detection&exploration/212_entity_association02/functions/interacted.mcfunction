### 右クリ先検知 / 進捗+二分探査
# 村人やinteraction、額縁やそのほか諸々、player_interact_with_entityで反応するエンティティ全部検知可能
# 同時に複数体いる場合、一体ずつ順番に実行される
# 先に対象にしたいエンティティにid付与のファンクションを実行する必要がある
# idの上限は512体まで

## 攻撃先のエンティティの検索
# 二分探査
# 進捗内のcriteriaの解除状況と一致しているエンティティのみにタグが残る
tag @s add _
execute if entity @s[advancements={212_entity_association02:interact={00=true}}] as @e[tag=00] run tag @s add interacted
execute if entity @s[advancements={212_entity_association02:interact={01=true}}] as @e[tag=01] run tag @s add interacted
execute if entity @s[advancements={212_entity_association02:interact={10=false}}] as @e[tag=10] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={11=false}}] as @e[tag=11] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={20=false}}] as @e[tag=20] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={21=false}}] as @e[tag=21] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={30=false}}] as @e[tag=30] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={31=false}}] as @e[tag=31] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={40=false}}] as @e[tag=40] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={41=false}}] as @e[tag=41] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={50=false}}] as @e[tag=50] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={51=false}}] as @e[tag=51] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={60=false}}] as @e[tag=60] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={61=false}}] as @e[tag=61] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={70=false}}] as @e[tag=70] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={71=false}}] as @e[tag=71] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={80=false}}] as @e[tag=80] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={81=false}}] as @e[tag=81] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={90=false}}] as @e[tag=90] run tag @s[tag=interacted] remove interacted
execute if entity @s[advancements={212_entity_association02:interact={91=false}}] as @e[tag=91] run tag @s[tag=interacted] remove interacted

## イベントの実行
# tag=interactedを持つエンティティが対象
execute as @e[tag=interacted] anchored eyes at @s run particle heart ^ ^ ^ 0 0 0 0 1

## タグ/進捗の解除
tag @s remove _
tag @e[tag=interacted] remove interacted
advancement revoke @s only 212_entity_association02:interact