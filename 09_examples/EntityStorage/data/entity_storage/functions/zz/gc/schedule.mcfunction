#> entity_storage:zz/gc/schedule
# スケジュールで一定時間のループ
# @within
#   function entity_storage:zz/gc/schedule_macro
#   function entity_storage:zz/init

## スコアが消えているかどうかをチェック
    # チェック用idを加算
    scoreboard players add estH.gc estS.id 1
    execute if score estH.gc estS.id > estH.new estS.id run scoreboard players set estH.gc estS.id 0
    # 取得
        data modify storage entity_storage:core macro set value {id:0,type:"storage",target:"entity_storage:core",path:"macro.name",from:"score_name"}
        execute store result storage entity_storage:core macro.id int 1 run scoreboard players get estH.gc estS.id
        # gcの設定
        data modify storage entity_storage:core macro.gc_duration set from storage entity_storage: gc_duration
    # データ取得のマクロ実行
    function entity_storage:copy with storage entity_storage:core macro
    # スコアの有無チェック/gcの実行
    function entity_storage:zz/gc/gc with storage entity_storage:core macro