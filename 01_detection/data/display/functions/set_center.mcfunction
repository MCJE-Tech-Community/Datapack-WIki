## ディスプレイの召喚 向きが固定されていないディスプレイ(billboard : center)
# 好きな位置と角度で実行するとその向きで召喚されれう

##召喚
summon text_display ~ ~ ~ {Tags:[temp,display,display_00],transformation:[0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,1f],text:'{"text":""}',background:0,billboard:"center",Passengers:[{id:"minecraft:text_display",Tags:[display,display_10],transformation:[1f,0f,0f,0f,0f,1f,0f,0.4f,0f,0f,1f,0.05f,0f,0f,0f,1f],text:'{"text":"Button 1","color":"white"}',background:0,billboard:"center"},{id:"minecraft:text_display",Tags:[display,display_11],transformation:[1f,0f,0f,0f,0f,1f,0f,0.4f,0f,0f,1f,0f,0f,0f,0f,1f],text:'{"text":"Button 1","color":"black"}',background:0,billboard:"center"},{id:"minecraft:text_display",Tags:[display,display_20],transformation:[1f,0f,0f,-0.5f,0f,1f,0f,0f,0f,0f,1f,0.05f,0f,0f,0f,1f],text:'{"text":"Button 2","color":"white"}',background:0,billboard:"center"},{id:"minecraft:text_display",Tags:[display,display_21],transformation:[1f,0f,0f,-0.5f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f],text:'{"text":"Button 2","color":"black"}',background:0,billboard:"center"},{id:"minecraft:text_display",Tags:[display,display_30],transformation:[1f,0f,0f,0.5f,0f,1f,0f,0f,0f,0f,1f,0.05f,0f,0f,0f,1f],text:'{"text":"Button 3","color":"white"}',background:0,billboard:"center"},{id:"minecraft:text_display",Tags:[display,display_31],transformation:[1f,0f,0f,0.5f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f],text:'{"text":"Button 3","color":"black"}',background:0,billboard:"center"}]}
# 向きを設定する
tp @e[tag=temp] ~ ~ ~ ~ ~
execute as @e[tag=temp] on passengers run tp @s ~ ~ ~ ~ ~

# 視点取得用のエンティティを召喚(存在しない場合)
execute unless entity 4fe002bb-0-0-0-1 run summon marker ~ ~ ~ {Tags:[display,display_pos,display_pos1],UUID:[I;1340080827,0,0,1]}
execute unless entity 4fe002bb-0-0-0-2 run summon marker ~ ~ ~ {Tags:[display,display_pos,display_pos2],UUID:[I;1340080827,0,0,2]}
execute unless entity 4fe002bb-0-0-0-3 run summon marker ~ ~ ~ {Tags:[display,display_marker],UUID:[I;1340080827,0,0,3]}

# タグ削除
tag @e[tag=temp] remove temp