#候補にスコアを割り振り
tag @e[scores={tar=0..}] add lock
execute as @e[tag=phalanx,limit=1,sort=random] at @s positioned ~ ~-100 ~ run scoreboard players operation @e[type=!minecraft:armor_stand,type=!minecraft:item_display,type=!minecraft:villager,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:area_effect_cloud,tag=!ar,type=!minecraft:shulker,type=!minecraft:firework_rocket,type=!minecraft:block_display,type=!player,tag=!lock,distance=..1000,limit=1,sort=random] tar = world_score tar
execute if entity @e[tag=!lock,scores={tar=0..}] run scoreboard players add world_score tar 1
tag @e remove lock
#標的のrx-zに位置座標、rbx-zにvを格納
execute as @e[tag=phalanx] at @s positioned ~ ~-100 ~ run scoreboard players set @e[scores={tar=0..},distance=1000..] tar -1

execute as @e[scores={tar=0..}] run scoreboard players operation @s rbx = @s rx
execute as @e[scores={tar=0..}] run scoreboard players operation @s rby = @s ry
execute as @e[scores={tar=0..}] run scoreboard players operation @s rbz = @s rz

execute as @e[scores={tar=0..}] store result score @s rx run data get entity @s Pos[0] 100000
execute as @e[scores={tar=0..}] store result score @s ry run data get entity @s Pos[1] 100000
execute as @e[scores={tar=0..}] store result score @s rz run data get entity @s Pos[2] 100000

execute as @e[scores={tar=0..}] run scoreboard players operation @s rbx -= @s rx
execute as @e[scores={tar=0..}] run scoreboard players operation @s rby -= @s ry
execute as @e[scores={tar=0..}] run scoreboard players operation @s rbz -= @s rz

#Rotation(本体tmp1,2に格納)
execute as @e[tag=phalanx] store result score @s tmp1 run data get entity @s Rotation[0] 1
execute as @e[tag=phalanx] store result score @s tmp2 run data get entity @s Rotation[1] 1
#優先順位決定
execute at @e[tag=phalanx] run function f1:c_and_d2
#かぶり量更新(各標的が持っておく)