### block_displayで頑張って作ったイス 1
# コロコロのついたシンプルな丸椅子
# 好きな位置と向きで召喚するとその向きになる

## 椅子の脚
# 三又
summon minecraft:block_display ~ ~ ~ {Tags:[chair01,temp],block_state:{Name:"minecraft:black_wool"},view_range:0.2f,transformation:{translation:[-0.0625f,0.15f,-0.0625f],left_rotation:{axis:[0.0f,1.0f,0.0f],angle:0f},scale:[0.125f,0.4f,0.125f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
summon minecraft:block_display ~ ~ ~ {Tags:[chair01,temp],block_state:{Name:"minecraft:black_wool"},view_range:0.2f,transformation:{translation:[-0f,0.20f,-0.05f],left_rotation:{axis:[0.0f,0.0f,1.0f],angle:1.8f},scale:[0.1f,0.35f,0.1f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
summon minecraft:block_display ~ ~ ~ {Tags:[chair01,temp],block_state:{Name:"minecraft:black_wool"},view_range:0.2f,transformation:{translation:[-0.032f,0.29f,-0.05f],left_rotation:{axis:[-0.8660f,0.0f,-0.5f],angle:1.8f},scale:[0.1f,0.35f,0.1f],right_rotation:{axis:[0.0f,1.0f,0.0f],angle:1.0472f}}}
# 柱
summon minecraft:block_display ~ ~ ~ {Tags:[chair01,temp],block_state:{Name:"minecraft:black_wool"},view_range:0.2f,transformation:{translation:[0.05f,0.29f,-0.03f],left_rotation:{axis:[-0.8660f,0.0f,0.5f],angle:-1.8f},scale:[0.1f,0.35f,0.1f],right_rotation:{axis:[0.0f,1.0f,0.0f],angle:-1.0472f}}}

## 椅子のタイヤ
summon minecraft:block_display ~ ~ ~ {Tags:[chair01,temp],block_state:{Name:"minecraft:gray_shulker_box"},view_range:0.2f,transformation:{translation:[-0.36f,0.0f,-0.05f],left_rotation:{axis:[0.0f,1.0f,0.0f],angle:0.0f},scale:[0.125f,0.125f,0.1f],right_rotation:{axis:[0.0f,1.0f,0.0f],angle:0.0f}}}
summon minecraft:block_display ~ ~ ~ {Tags:[chair01,temp],block_state:{Name:"minecraft:gray_shulker_box"},view_range:0.2f,transformation:{translation:[0.075f,0.f,-0.235f],left_rotation:{axis:[0.0f,1.0f,0.0f],angle:1.0472f},scale:[0.125f,0.125f,0.1f],right_rotation:{axis:[0.0f,1.0f,0.0f],angle:0.0f}}}
summon minecraft:block_display ~ ~ ~ {Tags:[chair01,temp],block_state:{Name:"minecraft:gray_shulker_box"},view_range:0.2f,transformation:{translation:[0.16f,0.f,0.16f],left_rotation:{axis:[0.0f,1.0f,0.0f],angle:-1.0472f},scale:[0.125f,0.125f,0.1f],right_rotation:{axis:[0.0f,1.0f,0.0f],angle:0.0f}}}

## 椅子の座版
summon minecraft:block_display ~ ~ ~ {Tags:[chair01,temp],block_state:{Name:"minecraft:birch_slab"},view_range:0.2f,transformation:{translation:[-0.25f,0.55f,-0.25f],left_rotation:{axis:[0.0f,1.0f,0.0f],angle:0.0f},scale:[0.5f,0.3f,0.5f],right_rotation:{axis:[0.0f,1.0f,0.0f],angle:0.0f}}}
summon minecraft:block_display ~ ~ ~ {Tags:[chair01,temp],block_state:{Name:"minecraft:red_carpet"},view_range:0.2f,transformation:{translation:[-0.26f,0.6f,-0.26f],left_rotation:{axis:[0.0f,1.0f,0.0f],angle:0.0f},scale:[0.52f,2.0f,0.52f],right_rotation:{axis:[0.0f,1.0f,0.0f],angle:0.0f}}}

## 向きを反映
execute as @e[tag=temp] run tp @s ~ ~ ~ ~ ~
tag @e[tag=temp] remove temp