#> entity_storage:zz/init
# ロード時
# @within
#   function tag/function minecraft:load

## 各種定義
    function entity_storage:zz/define

## ガベージコレクタのスケジュールを実行
    schedule clear entity_storage:zz/gc/schedule
    function entity_storage:zz/gc/schedule

## ストレージの初期化
    execute unless data storage entity_storage: gc_duration run data modify storage entity_storage: gc_duration set value 2000