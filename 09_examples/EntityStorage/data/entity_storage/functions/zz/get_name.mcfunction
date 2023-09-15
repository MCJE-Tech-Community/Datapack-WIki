#> entity_storage:zz/get_name
# マクロでエンティティのJSONをコンパウンド化
# @within
#   function entity_storage:regist

## マクロで取得
    $data modify storage entity_storage:core text set value $(text)
    # 名前とUUIDを保存
    data remove storage entity_storage:core _
    data modify storage entity_storage:core _.score_name set from storage entity_storage:core text.insertion
    data modify storage entity_storage:core _.str_uuid set from storage entity_storage:core text.hoverEvent.contents.id
    # データに反映
    $data modify storage entity_storage: data[$(id)] set from storage entity_storage:core _