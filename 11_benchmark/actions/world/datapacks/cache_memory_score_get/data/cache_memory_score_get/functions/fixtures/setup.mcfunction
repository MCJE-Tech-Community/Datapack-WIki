scoreboard objectives add cache_memory_score_get dummy
scoreboard players reset *

# java.util.HashMap.hash("p") % java.util.HashMap.DEFAULT_INITIAL_CAPACITY = 0
scoreboard players set p cache_memory_score_get 0

# java.util.HashMap.hash("q") % java.util.HashMap.DEFAULT_INITIAL_CAPACITY = 1
scoreboard players set q cache_memory_score_get 0

# java.util.HashMap.hash("r") % java.util.HashMap.DEFAULT_INITIAL_CAPACITY = 2
scoreboard players set r cache_memory_score_get 0
