#> entity_storage:get
# 実行者のデータを取得する
# @public

## 既に取得済みの場合は中止
    execute if score estH.now estS.id = @s estS.id run return 0

## マクロ実行
    # 取得
    execute store result storage entity_storage:core macro.a int 1 run scoreboard players get estH.now estS.id
    execute store result storage entity_storage:core macro.b int 1 run scoreboard players operation estH.now estS.id = @s estS.id
    # マクロ実行
    function entity_storage:zzz/main/get_macro with storage entity_storage:core macro

## idが未付与の場合は付与
    execute unless entity @s[tag=estT.] run function entity_storage:zzz/main/id_add