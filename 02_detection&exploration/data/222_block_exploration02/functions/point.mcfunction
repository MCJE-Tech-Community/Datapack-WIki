### 探査の終了点、ブロックの判定内で実行されるコマンド
# 好きなコマンドを入れよう

## 定点にパーティクル
particle dust 255 0 0 0.5 ~ ~ ~ 0 0 0 0 1

## ブロックの各面にパーティクル
execute align xyz positioned ~ ~0.5 ~0.5 run particle dust 0 0.7 0 0.5 ~ ~ ~ 0 0 0 0 1
execute align xyz positioned ~1 ~0.5 ~0.5 run particle dust 0 0.7 0 0.5 ~ ~ ~ 0 0 0 0 1
execute align xyz positioned ~0.5 ~ ~0.5 run particle dust 0 0.7 0 0.5 ~ ~ ~ 0 0 0 0 1
execute align xyz positioned ~0.5 ~1 ~0.5 run particle dust 0 0.7 0 0.5 ~ ~ ~ 0 0 0 0 1
execute align xyz positioned ~0.5 ~0.5 ~ run particle dust 0 0.7 0 0.5 ~ ~ ~ 0 0 0 0 1
execute align xyz positioned ~0.5 ~0.5 ~1 run particle dust 0 0.7 0 0.5 ~ ~ ~ 0 0 0 0 1

## 見ている面にパーティクル
execute if score #face _ matches 1 align xyz positioned ~1 ~0.5 ~0.5 run particle dust 0 0 1 0.5 ~ ~ ~ 0 0 0 0 1
execute if score #face _ matches 2 align xyz positioned ~0.5 ~0.5 ~ run particle dust 0 0 1 0.5 ~ ~ ~ 0 0 0 0 1
execute if score #face _ matches 3 align xyz positioned ~ ~0.5 ~0.5 run particle dust 0 0 1 0.5 ~ ~ ~ 0 0 0 0 1
execute if score #face _ matches 4 align xyz positioned ~0.5 ~0.5 ~1 run particle dust 0 0 1 0.5 ~ ~ ~ 0 0 0 0 1
execute if score #face _ matches 5 align xyz positioned ~0.5 ~1 ~0.5 run particle dust 0 0 1 0.5 ~ ~ ~ 0 0 0 0 1
execute if score #face _ matches 6 align xyz positioned ~0.5 ~ ~0.5 run particle dust 0 0 1 0.5 ~ ~ ~ 0 0 0 0 1