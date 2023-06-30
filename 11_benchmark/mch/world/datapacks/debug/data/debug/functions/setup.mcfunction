scoreboard objectives remove A
scoreboard objectives remove B
scoreboard objectives add A dummy
scoreboard objectives add B dummy
scoreboard players reset * A
scoreboard players reset * B

team remove A
team remove B
team add A
team add B

execute as @e run data merge entity @s {DeathTime:0,DeathLootTable:"",CustomName:''}
execute as @e[type=slime] run data merge entity @s {Size:0}
kill @e