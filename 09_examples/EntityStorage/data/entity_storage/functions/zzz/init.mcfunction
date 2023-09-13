#> entity_storage:zzz/init
# ロード時
# @within
#   function tag/function minecraft:load

## 各種定義
    function entity_storage:zzz/define

## ストレージの初期化
    execute unless data storage entity_storage: gc_duration run data modify storage entity_storage: gc_duration set value 2000
    execute unless data storage entity_storage: path run data modify storage entity_storage: path set value {}
    execute unless data storage entity_storage:core macro.a_path run data modify storage entity_storage:core macro.a_path set value {}