scoreboard objectives remove A
scoreboard objectives remove B
scoreboard players reset * A
scoreboard players reset * B

team remove A
team remove B

execute as @e run data merge entity @s {DeathTime:0,DeathLootTable:"",CustomName:''}
execute as @e[type=slime] run data merge entity @s {Size:0}
kill @e