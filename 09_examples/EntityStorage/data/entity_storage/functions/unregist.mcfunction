#> entity_storage:unregist
# 登録の解除
# @public
# in:
#   id -> 解除するid

## すでにidが廃棄されているかを確認
    execute store result score estH.1 estS.id run data get storage entity_storage:core unused_id
    data modify storage entity_storage:core _ set from storage entity_storage:core unused_id
    $execute store result score estH.2 estS.id run data modify storage entity_storage:core _[] set value $(id)
    # 廃棄済みじゃない場合はidを保管
    execute unless score estH.1 estS.id = estH.2 estS.id run data modify storage entity_storage:core unused_id append from storage entity_storage:core _[-1]

## 登録の解除
    # データをリセット
    $execute store success score estH. estS.id run data modify storage entity_storage: data[$(id)] set value {}

## 後処理
    scoreboard players reset estH.1 estS.id
    scoreboard players reset estH.2 estS.id