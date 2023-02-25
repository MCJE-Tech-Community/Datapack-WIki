## ディスプレイの召喚 向きが固定されたディスプレイ(billboard : fixed)
# 好きな位置と角度で実行するとその向きで召喚されれう

##召喚
summon text_display ~ ~ ~ {Tags:[temp,display,display_00],transformation:[0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,1.],text:'{"text":""}',background:0,billboard:"fixed",Passengers:[{id:"minecraft:text_display",Tags:[display,display_10],transformation:[1.,0.,0.,0.,0.,1.,0.,0.4,0.,0.,1.,0.05,0.,0.,0.,1.],text:'{"text":"Button 1","color":"white"}',background:0},{id:"minecraft:text_display",Tags:[display,display_11],transformation:[1.,0.,0.,0.,0.,1.,0.,0.4,0.,0.,1.,0.,0.,0.,0.,1.],text:'{"text":"Button 1","color":"black"}',background:0},{id:"minecraft:text_display",Tags:[display,display_20],transformation:[1.,0.,0.,-0.5,0.,1.,0.,0.,0.,0.,1.,0.05,0.,0.,0.,1.],text:'{"text":"Button 2","color":"white"}',background:0},{id:"minecraft:text_display",Tags:[display,display_21],transformation:[1.,0.,0.,-0.5,0.,1.,0.,0.,0.,0.,1.,0.,0.,0.,0.,1.],text:'{"text":"Button 2","color":"black"}',background:0},{id:"minecraft:text_display",Tags:[display,display_30],transformation:[1.,0.,0.,0.5,0.,1.,0.,0.,0.,0.,1.,0.05,0.,0.,0.,1.],text:'{"text":"Button 3","color":"white"}',background:0},{id:"minecraft:text_display",Tags:[display,display_31],transformation:[1.,0.,0.,0.5,0.,1.,0.,0.,0.,0.,1.,0.,0.,0.,0.,1.],text:'{"text":"Button 3","color":"black"}',background:0}]}
# 向きを設定する
tp @e[tag=temp] ~ ~ ~ ~ ~
execute as @e[tag=temp] on passengers run tp @s ~ ~ ~ ~ ~

# 視点取得用のエンティティを召喚(存在しない場合)
execute unless entity @e[tag=display_pos1] run summon marker ~ ~ ~ {Tags:[display,display_pos,display_pos1]}
execute unless entity @e[tag=display_pos2] run summon marker ~ ~ ~ {Tags:[display,display_pos,display_pos2]}
execute unless entity @e[tag=display_marker] run summon marker ~ ~ ~ {Tags:[display,display_marker]}

# タグ削除
tag @e[tag=temp] remove temp