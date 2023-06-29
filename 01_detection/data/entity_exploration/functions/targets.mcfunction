### 探査の終了点で実行されるコマンド
# 対象のエンティティには"targets"というタグが付与されている (複数の可能性もあり)
# 好きなコマンドを入れよう

## 定点にパーティクル
    particle dust 255 0 0 0.5 ~ ~ ~ 0 0 0 0 1

## 一番手前側のエンティティを発光
    execute positioned ^ ^ ^0.5 as @e[tag=targets,limit=1,sort=nearest] run tag @s add 02_glow
    execute positioned ^ ^ ^0.5 as @e[tag=targets,limit=1,sort=nearest] run data merge entity @s {Glowing:1b}