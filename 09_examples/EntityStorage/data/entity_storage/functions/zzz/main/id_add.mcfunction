#> entity_storage:zzz/main/id_add
# idを追加
# @within
#   function entity_storage:get

## idを付与
    # 未使用idがない時
    execute unless data storage entity_storage:core unused_id[-1] run scoreboard players add estH.new estS.id 1
    execute unless data storage entity_storage:core unused_id[-1] store result score estH.now estS.id run scoreboard players operation @s estS.id = estH.new estS.id
    execute unless data storage entity_storage:core unused_id[-1] run data modify storage entity_storage:core data append value {}
    # 未使用idがあるとき
    execute if data storage entity_storage:core unused_id[-1] store result score estH.now estS.id store result score @s estS.id run data get storage entity_storage:core unused_id[-1]
    execute if data storage entity_storage:core unused_id[-1] run data remove storage entity_storage:core unused_id[-1]

## UUIDまたは名前を取得
    # データ
    data modify storage entity_storage: data set value {}
    tag @s add estT.temp
    # 召喚,データを取得
    summon text_display ~ ~ ~ {UUID:[I;1340080827,3,1,1],text:'{"selector":"@e[tag=estT.temp,limit=1,distance=..1]"}'}
    function entity_storage:zzz/main/get_name with entity 4fe002bb-0-3-0-100000001
    # 名前とUUIDを保存
    data modify storage entity_storage: data.score_name set from storage entity_storage:core text.insertion
    data modify storage entity_storage: data.str_uuid set from storage entity_storage:core text.hoverEvent.contents.id
    # 後処理
    tag @s remove estT.temp
    kill 4fe002bb-0-3-0-100000001

## フラグを付与
    tag @s add estT.