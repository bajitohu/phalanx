#障害物検知,as:target
execute if entity @s[distance=..0.5] run coreboard players set @s pr 0
execute if entity @s[distance=..0.5] run return 0
execute unless block ~ ~ ~ minecraft:air run scoreboard players set @s pr -2000000000
execute unless block ~ ~ ~ minecraft:air run return 0
return run execute positioned ^ ^ ^0.5 if function f1:c_and_d4