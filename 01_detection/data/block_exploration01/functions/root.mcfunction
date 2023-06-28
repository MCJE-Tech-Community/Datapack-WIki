### 角をすり抜けない視線先ブロック探査 (functionループ)
# 好きな位置と向きで実行するとそこから視線上のブロックを探査する
# tags/blocks/throughに入っているブロックをスルーする

## ループの開始
# 探査距離の上限 m
scoreboard players set #loop _ 25
# ループの開始
# エンティティから実行する前提でanchoredがついているので注意
execute anchored eyes positioned ^ ^ ^0.5 run function block_exploration01:1