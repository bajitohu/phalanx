#障害物検知,as:target,tag=targetは一時的なもの、消すの忘れず
execute if entity @s[distance=..0.5] run tag @s add target
execute if entity @s[distance=..0.5] run return 0
execute unless block ~ ~ ~ minecraft:air run tag @s add checked
execute unless block ~ ~ ~ minecraft:air run return 0
return run execute positioned ^ ^ ^0.5 run function f1:c_and_d4