execute store result storage _ d int 1 run scoreboard players add p _ 1
function random_access:fixtures/setup_macro with storage _
execute if score p _ matches ..65534 run function random_access:fixtures/setup_loop
