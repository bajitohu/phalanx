execute as @e[tag=a] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id run tag @s add anow
execute positioned ~ ~-100 ~ facing entity @s feet as @e[tag=anow] positioned 0.0 0.0 0.0 run teleport @s ^ ^ ^1 ~ ~
execute as @e[tag=anow] store result score @s rx run data get entity @s Pos[0] 1000
execute as @e[tag=anow] store result score @s ry run data get entity @s Pos[1] 1000
execute as @e[tag=anow] store result score @s rz run data get entity @s Pos[2] 1000
execute as @e[tag=anow] store result score @s tmp1 run data get entity @s Rotation[0] 1
execute as @e[tag=anow] store result score @s tmp2 run data get entity @s Rotation[1] 1
scoreboard players operation @s r3 = @e[tag=anow] rx
scoreboard players operation @s r4 = @e[tag=anow] ry
scoreboard players operation @s r5 = @e[tag=anow] rz
scoreboard players operation @s tmp1 = @e[tag=anow] tmp1
scoreboard players operation @s tmp2 = @e[tag=anow] tmp2
tag @e remove anow
