scoreboard objectives add _ dummy
scoreboard players reset *

data modify storage _ a set value [0]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]
data modify storage _ a append from storage _ a[]

scoreboard players set p _ -1
function random_access:fixtures/setup_loop
data remove storage _ c
