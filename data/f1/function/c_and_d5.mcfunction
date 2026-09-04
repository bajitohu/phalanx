scoreboard players set @e[limit=1,sort=nearest,tag=phalanx] pr -2147483648
execute as @e[scores={tar=0..},tag=!checked] run scoreboard players operation @e[limit=1,sort=nearest,tag=phalanx] pr > @s pr
execute as @e[scores={tar=0..},tag=!checked] if score @s pr = @e[limit=1,sort=nearest,tag=phalanx] pr positioned ~ ~-100 ~ facing entity @s feet run function f1:c_and_d4
execute if entity @e[tag=target] run return run tag @e remove target
execute unless entity @e[scores={tar=0..},tag=!checked] run tag @e[limit=1,sort=nearest,tag=phalanx] add oh
execute unless entity @e[scores={tar=0..},tag=!checked] run return 0
return run function f1:c_and_d5