#> entity_storage:zzz/gc/schedule
# スケジュールで一定時間のループ
# @within
#   function entity_storage:zzz/gc/schedule_macro
#   function entity_storage:zzz/load

## マクロでスケジュールの実行
    function entity_storage:zzz/gc/schedule_macro with storage entity_storage:

## スコアが消えているかどうかをチェック
    # チェック用idを加算
    scoreboard players add estH.gc estS.id 1
    execute if score estH.gc estS.id > estH.new estS.id run scoreboard players set estH.gc estS.id 0
    # 取得
    execute store result storage entity_storage:core macro.a int 1 run scoreboard players get estH.now estS.id
    execute store result storage entity_storage:core macro.b int 1 run scoreboard players operation estH.now estS.id = estH.gc estS.id
    # データ取得のマクロ実行
    function entity_storage:zzz/main/get_macro with storage entity_storage:core macro
    # スコアの有無チェック
    function entity_storage:zzz/gc/gc with storage entity_storage: data