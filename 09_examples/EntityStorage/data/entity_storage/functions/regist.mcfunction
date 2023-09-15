#> entity_storage:regist
# idを追加
# @public

## idを付与
    # 未使用idがない時
    execute unless data storage entity_storage:core unused_id[-1] run scoreboard players add estH.new estS.id 1
    execute unless data storage entity_storage:core unused_id[-1] run scoreboard players operation @s estS.id = estH.new estS.id
    execute unless data storage entity_storage:core unused_id[-1] run data modify storage entity_storage:core data append value {}
    # 未使用idがあるとき
    execute if data storage entity_storage:core unused_id[-1] store result score @s estS.id run data get storage entity_storage:core unused_id[-1]
    execute if data storage entity_storage:core unused_id[-1] run data remove storage entity_storage:core unused_id[-1]

## UUIDまたは名前を取得
    # データ
    execute store result storage entity_storage:core macro.index int 1 run scoreboard players get @s estS.id
    # 召喚
    tag @s add estT.temp
    summon text_display ~ ~ ~ {UUID:[I;1340080827,3,1,1],text:'{"selector":"@e[tag=estT.temp,limit=1]"}'}
    data modify storage entity_storage:core macro.text set from entity 4fe002bb-0-3-0-100000001 text
    kill 4fe002bb-0-3-0-100000001
    tag @s remove estT.temp
    # データを取得
    function entity_storage:zz/macro/get_name with storage entity_storage: macro

## フラグを付与
    tag @s add estT.