execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_name":"phalanx"},count: 1, id: "minecraft:slime_ball"}},scores={sneak=1..},tag=!done] at @s positioned ~ ~101 ~ run summon minecraft:armor_stand ~ ~ ~ {Invisible:1,Tags:[phalanx,new],Marker:1}
tag @a[nbt={SelectedItem:{components:{"minecraft:custom_name":"phalanx"}}},scores={sneak=1..},tag=!done] add done
scoreboard players set @a sneak 0
tag @a[nbt=!{SelectedItem:{components:{"minecraft:custom_name":"phalanx"}}}] remove done
execute at @e[tag=new] run scoreboard players add world_score id 1
execute at @e[tag=phalanx,tag=new] positioned ~ ~-100 ~ run summon minecraft:item_display ~ ~ ~ {Tags:[new,p1,g1],teleport_duration:1,item:{id:"minecraft:quartz_block"},transformation:{translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],scale:[0.75f,1.5f,0.75f],right_rotation:[0f,0f,0f,1f]}}
execute at @e[tag=phalanx,tag=new] positioned ~ ~-100 ~ run summon minecraft:item_display ~ ~ ~ {Tags:[new,p3,g1],teleport_duration:1,item:{id:"minecraft:stone_slab"},transformation:{translation:[0f,0.2f,0f],left_rotation:[0f,0f,0f,1f],scale:[0.75f,0.75f,0.75f],right_rotation:[0f,0f,0f,1f]}}
execute at @e[tag=phalanx,tag=new] positioned ~ ~-100 ~ run summon minecraft:item_display ~ ~ ~ {Tags:[new,p4],item:{id:"minecraft:grindstone"},transformation:{translation:[0f,0f,0f],left_rotation:{angle:3.14159265f,axis:[0,0,1]},scale:[0.6f,0.6f,0.6f],right_rotation:{angle:1.5707963f,axis:[0,1,0]}}}
execute at @e[tag=phalanx,tag=new] positioned ~ ~-100 ~ run summon minecraft:item_display ~ ~ ~ {Tags:[new,p5,g1],teleport_duration:1,interpolation_duration:1,item:{id:"minecraft:waxed_exposed_lightning_rod"},transformation:{left_rotation:{angle:0.0f,axis:[0,0,1]},translation:[0.0f,0.0f,0.0f],right_rotation:{angle:1.5707963f,axis:[1,0,0]},scale:[1.0f,1.0f,1.0f]}}
execute at @e[tag=phalanx,tag=new] positioned ~ ~-100 ~ run summon minecraft:armor_stand ~ ~ ~ {Invisible:1,Tags:[new,p6],equipment:{feet:{count:1,id:"minecraft:iron_boots"},legs:{count:1,id:"minecraft:iron_leggings"}}}
execute at @e[tag=phalanx,tag=new] positioned ~ ~-100 ~ run summon minecraft:armor_stand ~ ~ ~ {Invisible:1,Tags:[new,p7],equipment:{feet:{count:1,id:"minecraft:iron_boots"},legs:{count:1,id:"minecraft:iron_leggings"}}}
execute at @e[tag=phalanx,tag=new] positioned ~ ~ ~ run summon minecraft:armor_stand ~ ~ ~ {Invisible:1,Tags:[new,a],Marker:1}
#execute at @e[tag=phalanx,tag=new] positioned ~ ~ ~ run summon minecraft:armor_stand ~ ~ ~ {Invisible:1,Tags:[new,b],Marker:1}
scoreboard players operation @e[tag=new] id = world_score id
scoreboard players set @e[tag=new] num 0
execute as @e[tag=phalanx,tag=new] store result score @s rx run data get entity @s Pos[0] 100000
execute as @e[tag=phalanx,tag=new] store result score @s ry run data get entity @s Pos[1] 100000
execute as @e[tag=phalanx,tag=new] store result score @s rz run data get entity @s Pos[2] 100000
execute as @e[tag=phalanx,tag=new] run scoreboard players set @s v 1000
execute at @e[tag=phalanx,tag=new] run forceload add ~-6 ~-6 ~6 ~6
tag @e remove new
data merge storage _: {_:{left_rotation:{angle:0.0f,axis:[0,0,1]},translation:[0.0f,0.0f,0.0f],right_rotation:[0.7068252f,0.0f,0.0f,0.7073883f],scale:[1.0f,1.0f,1.0f]}}