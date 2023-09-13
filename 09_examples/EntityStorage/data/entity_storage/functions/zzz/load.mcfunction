#> entity_storage:zzz/load
# ロード時
# @within
#   function tag/function minecraft:load

## 各種定義
    function entity_storage:zzz/define

## ストレージの初期化
    execute unless data storage entity_storage: gc_duration run data modify storage entity_storage: gc_duration set value 2000