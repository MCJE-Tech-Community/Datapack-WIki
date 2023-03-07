### 角をすり抜けない視線先ブロック探査 (functionループ)
# 好きな位置と向きで実行するとそこから視線上のブロックを探査する
# tags/blocks/throughに入っているブロックをスルーする

## 準備
# エンティティの召喚
execute unless entity 0-0-0-0-1000000de run summon marker ~ ~ ~ {Tags:[blmo,blmo_pos,blmo_pos1],UUID:[I;0,0,1,222]}
execute unless entity 0-0-0-0-2000000de run summon marker ~ ~ ~ {Tags:[blmo,blmo_pos,blmo_pos2],UUID:[I;0,0,2,222]}
execute unless entity 0-0-0-0-3000000de run summon marker ~ ~ ~ {Tags:[blmo,blmo_pos,blmo_pos3],UUID:[I;0,0,3,222]}
# エンティティ1をプレイヤーの視線をx軸で反転させた角度にする
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^2 positioned 0.0 ~ ~ positioned ^ ^ ^-1 facing 0.0 0.0 0.0 positioned as @s run tp 0-0-0-0-1000000de ~ ~ ~ ~ ~
# エンティティ2をプレイヤーの角度のxy成分の角度にする
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^-1 facing 0.0 0.0 ~ positioned as @s run tp 0-0-0-0-2000000de ~ ~ ~ ~ ~
# エンティティ3をプレイヤーの角度のzy成分の角度にする
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^-1 facing ~ 0.0 0.0 positioned as @s run tp 0-0-0-0-3000000de ~ ~ ~ ~ ~

## ループの開始
# 探査距離の上限 m
scoreboard players set #02:loop _ 25
# ループの開始
# プレイヤーから実行する前提でanchoredがついているので注意
execute anchored eyes positioned ^ ^ ^0.5 run function 222_block_exploration02:1

## 終了
kill 0-0-0-0-1000000de
kill 0-0-0-0-2000000de
kill 0-0-0-0-3000000de