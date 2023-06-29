## ディスプレイの召喚 向きが固定されたディスプレイ(billboard : fixed)
# 好きな位置と角度で実行するとその向きで召喚されれう

##召喚
summon text_display ~ ~ ~ {Tags:[temp,display,display_00,display_fixed],transformation:[0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,1f],text:'{"text":""}',background:0,billboard:"fixed",Passengers:[{id:"minecraft:text_display",Tags:[display,display_10],transformation:[1f,0f,0f,0f,0f,1f,0f,0.4f,0f,0f,1f,0.05f,0f,0f,0f,1f],text:'{"text":"Button 1","color":"white"}',background:0},{id:"minecraft:text_display",Tags:[display,display_11],transformation:[1f,0f,0f,0f,0f,1f,0f,0.4f,0f,0f,1f,0f,0f,0f,0f,1f],text:'{"text":"Button 1","color":"black"}',background:0},{id:"minecraft:text_display",Tags:[display,display_20],transformation:[1f,0f,0f,-0.5f,0f,1f,0f,0f,0f,0f,1f,0.05f,0f,0f,0f,1f],text:'{"text":"Button 2","color":"white"}',background:0},{id:"minecraft:text_display",Tags:[display,display_21],transformation:[1f,0f,0f,-0.5f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f],text:'{"text":"Button 2","color":"black"}',background:0},{id:"minecraft:text_display",Tags:[display,display_30],transformation:[1f,0f,0f,0.5f,0f,1f,0f,0f,0f,0f,1f,0.05f,0f,0f,0f,1f],text:'{"text":"Button 3","color":"white"}',background:0},{id:"minecraft:text_display",Tags:[display,display_31],transformation:[1f,0f,0f,0.5f,0f,1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f],text:'{"text":"Button 3","color":"black"}',background:0}]}
# 向きを設定する
tp @e[tag=temp] ~ ~ ~ ~ ~
execute as @e[tag=temp] on passengers run tp @s ~ ~ ~ ~ ~

# タグ削除
tag @e[tag=temp] remove temp