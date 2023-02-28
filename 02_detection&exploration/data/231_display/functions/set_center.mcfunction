## ディスプレイの召喚 向きが固定されていないディスプレイ(billboard : center)
# 好きな位置と角度で実行するとその向きで召喚されれう

##召喚
summon text_display ~ ~ ~ {Tags:[temp,display,display_00],transformation:[0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,1.],text:'{"text":""}',background:0,billboard:"center",Passengers:[{id:"minecraft:text_display",Tags:[display,display_10],transformation:[1.,0.,0.,0.,0.,1.,0.,0.4,0.,0.,1.,0.05,0.,0.,0.,1.],text:'{"text":"Button 1","color":"white"}',background:0,billboard:"center"},{id:"minecraft:text_display",Tags:[display,display_11],transformation:[1.,0.,0.,0.,0.,1.,0.,0.4,0.,0.,1.,0.,0.,0.,0.,1.],text:'{"text":"Button 1","color":"black"}',background:0,billboard:"center"},{id:"minecraft:text_display",Tags:[display,display_20],transformation:[1.,0.,0.,-0.5,0.,1.,0.,0.,0.,0.,1.,0.05,0.,0.,0.,1.],text:'{"text":"Button 2","color":"white"}',background:0,billboard:"center"},{id:"minecraft:text_display",Tags:[display,display_21],transformation:[1.,0.,0.,-0.5,0.,1.,0.,0.,0.,0.,1.,0.,0.,0.,0.,1.],text:'{"text":"Button 2","color":"black"}',background:0,billboard:"center"},{id:"minecraft:text_display",Tags:[display,display_30],transformation:[1.,0.,0.,0.5,0.,1.,0.,0.,0.,0.,1.,0.05,0.,0.,0.,1.],text:'{"text":"Button 3","color":"white"}',background:0,billboard:"center"},{id:"minecraft:text_display",Tags:[display,display_31],transformation:[1.,0.,0.,0.5,0.,1.,0.,0.,0.,0.,1.,0.,0.,0.,0.,1.],text:'{"text":"Button 3","color":"black"}',background:0,billboard:"center"}]}
# 向きを設定する
tp @e[tag=temp] ~ ~ ~ ~ ~
execute as @e[tag=temp] on passengers run tp @s ~ ~ ~ ~ ~

# 視点取得用のエンティティを召喚(存在しない場合)
execute unless entity 0-0-0-0-1000000e7 run summon marker ~ ~ ~ {Tags:[display,display_pos,display_pos1],UUID:[I;0,0,1,231]}
execute unless entity 0-0-0-0-2000000e7 run summon marker ~ ~ ~ {Tags:[display,display_pos,display_pos2],UUID:[I;0,0,2,231]}
execute unless entity 0-0-0-0-3000000e7 run summon marker ~ ~ ~ {Tags:[display,display_marker],UUID:[I;0,0,3,231]}

# タグ削除
tag @e[tag=temp] remove temp