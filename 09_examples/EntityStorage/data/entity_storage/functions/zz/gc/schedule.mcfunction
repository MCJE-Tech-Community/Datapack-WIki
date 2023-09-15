#> entity_storage:zz/gc/schedule
# スケジュールで一定時間のループ
# @within
#   function entity_storage:zz/gc/schedule_macro
#   function entity_storage:zz/init

## マクロでスケジュールの実行
    function entity_storage:zz/macro/schedule with storage entity_storage:

## スコアが消えているかどうかをチェック
    # チェック用idを加算
    scoreboard players add estH.gc estS.id 1
    execute if score estH.gc estS.id > estH.new estS.id run scoreboard players set estH.gc estS.id 0
    # 取得
    execute store result storage entity_storage:core macro.a_index int 1 run scoreboard players get estH.call.now estS.id
    execute store result storage entity_storage:core macro.b_index int 1 run scoreboard players operation estH.call.now estS.id = estH.gc estS.id
    # データ取得のマクロ実行
    function entity_storage:zz/macro/call with storage entity_storage:core macro
    # パスをリセット
    data modify storage entity_storage:core macro.a_path set value ""
    # スコアの有無チェック
    function entity_storage:zz/gc/gc with storage entity_storage: data