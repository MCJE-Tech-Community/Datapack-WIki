#> entity_storage:zzz/main/get_macro
# マクロ実行
# @within
#   function entity_storage:get

## データのコピー
    $data modify storage entity_storage:core data[$(a)].$(a_path) set from storage entity_storage: data
    $data modify storage entity_storage: data set from storage entity_storage:core data[$(b)].$(b_path)