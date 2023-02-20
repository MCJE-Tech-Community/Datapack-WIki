# ディスプレイの召喚
# 好きな位置と向きで実行するとその位置と向きで召喚される

#召喚
summon text_display ~ ~ ~ {Tags:[temp,display01,display01_00],transformation:[0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,1.],text:'{"text":""}',background:0,billboard:"fix",Passengers:[{id:"minecraft:text_display",Tags:[display01,display01_10],transformation:[1.,0.,0.,0.,0.,1.,0.,0.4,0.,0.,1.,0.05,0.,0.,0.,1.],text:'{"text":"Button 1","color":"white"}',background:0},{id:"minecraft:text_display",Tags:[display01,display01_11],transformation:[1.,0.,0.,0.,0.,1.,0.,0.4,0.,0.,1.,0.,0.,0.,0.,1.],text:'{"text":"Button 1","color":"black"}',background:0},{id:"minecraft:text_display",Tags:[display01,display01_20],transformation:[1.,0.,0.,-0.5,0.,1.,0.,0.,0.,0.,1.,0.05,0.,0.,0.,1.],text:'{"text":"Button 2","color":"white"}',background:0},{id:"minecraft:text_display",Tags:[display01,display01_21],transformation:[1.,0.,0.,-0.5,0.,1.,0.,0.,0.,0.,1.,0.,0.,0.,0.,1.],text:'{"text":"Button 2","color":"black"}',background:0},{id:"minecraft:text_display",Tags:[display01,display01_30],transformation:[1.,0.,0.,0.5,0.,1.,0.,0.,0.,0.,1.,0.05,0.,0.,0.,1.],text:'{"text":"Button 3","color":"white"}',background:0},{id:"minecraft:text_display",Tags:[display01,display01_31],transformation:[1.,0.,0.,0.5,0.,1.,0.,0.,0.,0.,1.,0.,0.,0.,0.,1.],text:'{"text":"Button 3","color":"black"}',background:0}]}
# 向きを設定する
tp @e[tag=temp] ~ ~ ~ ~ ~
execute as @e[tag=temp] on passengers run tp @s ~ ~ ~ ~ ~
# 視点取得用のエンティティを召喚(存在しない場合)
execute unless entity @e[tag=display01_pos1] run summon marker ~ ~ ~ {Tags:[display01,display01_pos,display01_pos1]}
execute unless entity @e[tag=display01_pos2] run summon marker ~ ~ ~ {Tags:[display01,display01_pos,display01_pos2]}
execute unless entity @e[tag=display01_marker] run summon marker ~ ~ ~ {Tags:[display01,display01_marker]}
# タグ削除
tag @e[tag=temp] remove temp