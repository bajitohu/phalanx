#破壊判定
#execute as @e[tag=phalanx] at @e[scores={id=0..}] if score @s id = @e[limit=1,sort=nearest] id run scoreboard players add @s r 1
#execute as @e[tag=phalanx,scores={r=..9}] at @e[scores={id=0..}] if score @s id = @e[limit=1,sort=nearest] id run kill @e[limit=1,sort=nearest]
#偏差(速:6)
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[limit=1,sort=nearest] id positioned ~ ~-100 ~ at @e[tag=target,limit=1,sort=nearest] anchored feet positioned ^ ^ ^ run teleport ~ ~100 ~

#aをbのいる方の反対向きにするだけ
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=b] if score @s id = @e[tag=b,limit=1,sort=nearest] id facing entity @s feet positioned as @s run teleport @s ~ ~ ~ ~ ~
execute at @e[tag=a] positioned ~ ~-100 ~ run particle minecraft:composter ~ ~ ~
execute at @e[tag=b] positioned ~ ~-100 ~ run particle minecraft:composter ~ ~ ~
#aをa,bの内分点に移動
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=b] if score @s id = @e[tag=b,limit=1,sort=nearest] id facing entity @s feet positioned ^400 ^ ^ facing entity @s feet positioned ^ ^ ^333.33 rotated as @s positioned ^-66.66 ^ ^ run teleport @s ~ ~ ~ ~ ~
execute at @e[tag=a] positioned ~ ~-100 ~ run particle minecraft:bubble ~ ~ ~
#bを移動することに注意
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id facing entity @s feet as @e[tag=b] if score @s id = @e[limit=1,sort=nearest] id positioned ^ ^ ^-400 facing entity @s feet positioned ^ ^ ^397.5 run teleport @s ~ ~ ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=b] if score @s id = @e[tag=b,limit=1,sort=nearest] id run teleport @s ~ ~ ~ ~ ~
#2分探索
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-1.25
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^1.25
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.32
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.32
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.16
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.16
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.08
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.08
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.04
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.04
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.02
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.02
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.01
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.01
execute if entity @e[tag=target] as @e[tag=b] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ~ ~-100 ~ at @e[tag=target,limit=1,sort=nearest] anchored feet positioned ^ ^ ^ run teleport ~ ~100 ~
#本体旋回

tag @e remove fire
tag @e remove xp
tag @e remove xm
tag @e remove yp
tag @e remove ym
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^500 ^ ^ if entity @s[distance=500..] positioned ^-500 ^ ^ run tag @e[tag=phalanx,limit=1,sort=nearest] add xp
execute as @e[tag=xp] at @s run teleport @s ~ ~ ~ ~-5 ~
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^500 ^ ^ if entity @s[distance=..500] positioned ^-500 ^ ^ run tag @e[tag=phalanx,limit=1,sort=nearest] add xm
execute as @e[tag=xm] at @s run teleport @s ~ ~ ~ ~5 ~
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^500 ^ ^ if entity @s[distance=500..] positioned ^-500 ^ ^ run tag @e[tag=phalanx,limit=1,sort=nearest] add xp
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^ ^ ^500 if entity @s[distance=500..] positioned ^ ^ ^-500 positioned ^ ^500 ^ if entity @s[distance=500..] positioned ^ ^-500 ^ run tag @e[tag=phalanx,limit=1,sort=nearest] add yp
execute as @e[tag=yp] at @s run teleport @s ~ ~ ~ ~ ~-5
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^ ^ ^500 if entity @s[distance=500..] positioned ^ ^ ^-500 positioned ^ ^500 ^ if entity @s[distance=..500] positioned ^ ^-500 ^ run tag @e[tag=phalanx,limit=1,sort=nearest] add ym
execute as @e[tag=ym] at @s run teleport @s ~ ~ ~ ~ ~5
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^ ^ ^500 if entity @s[distance=500..] positioned ^ ^ ^-500 positioned ^ ^500 ^ if entity @s[distance=500..] positioned ^ ^-500 ^ run tag @e[tag=phalanx,limit=1,sort=nearest] add yp
tag @e[tag=xp,tag=xm,tag=yp,tag=ym] add fire
#tag @e[tag=phalanx] add fire
#execute as @p at @e[tag=phalanx] positioned ~ ~-100 ~ facing entity @s eyes positioned ^ ^ ^-5 positioned ~ ~100 ~ run teleport @e[tag=a] ~ ~ ~ ~ ~
execute at @e[tag=fire] as @e[tag=a] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id facing entity @s feet facing ^ ^ ^-1 as @e[tag=fire,limit=1,sort=nearest] run teleport @s ~ ~ ~ ~ ~
#パーツ移動
execute as @e[tag=p1] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^-0.4 ^1.05 ^-0.4 positioned ~ ~-100 ~ run teleport @s ~ ~ ~ ~ ~
execute as @e[tag=p2] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^-0.4 ^0.35 ^-0.4 positioned ~ ~-100 ~ run teleport @s ~ ~ ~ ~ ~
execute as @e[tag=p3] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^-0.4 ^ ^-0.4 positioned ~ ~-100 ~ run teleport @s ~ ~ ~ ~ ~
execute as @e[tag=g1] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id run data modify entity @s Pose.Head[0] set from entity @e[tag=phalanx,limit=1,sort=nearest] Rotation[1]
execute as @e[tag=p4] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^ ^ ^-0.2 facing ^-1 ^ ^ positioned ~ ~-100.7 ~ run teleport @s ~ ~ ~ ~ ~
execute as @e[tag=p4] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id run data modify entity @s Pose.Head[2] set from entity @e[tag=phalanx,limit=1,sort=nearest] Rotation[1]
execute as @e[tag=p5] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^0.3 ^ ^0.2 facing ^-1 ^ ^ positioned ~ ~-101.3 ~ run teleport @s ~ ~ ~ ~ ~
execute as @e[tag=p6] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^0.5 ^ ^ facing ^1 ^ ^ positioned ~ ~-101 ~ run teleport @s ~ ~ ~ ~ ~
execute as @e[tag=p7] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^-0.5 ^ ^ facing ^-1 ^ ^ positioned ~ ~-101 ~ run teleport @s ~ ~ ~ ~ ~
#射撃
execute if entity @e[tag=target] as @e[tag=fire] at @s positioned ^ ^ ^1 positioned ~ ~-100 ~ run summon minecraft:arrow ~ ~ ~ {Tags:[new,ar],NoGravity:1,HasVisualFire:0,life:1200s}
execute as @e[tag=a] at @e[tag=fire] if score @s id = @e[limit=1,sort=nearest] id facing entity @s feet positioned 0.0 0.0 0.0 positioned ^ ^ ^-6 run teleport @s ~ ~ ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=fire] if score @s id = @e[tag=fire,limit=1,sort=nearest] id positioned ~ ~-100 ~ run data modify entity @e[type=arrow,tag=new,limit=1,distance=0.5..1.3] Motion set from entity @s Pos
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id run teleport ~1 ~ ~
execute unless entity @e[tag=target] as @e[tag=b] at @e[tag=a] if score @s id = @e[tag=a,limit=1,sort=nearest] id run teleport ~ ~ ~
tag @e remove new
execute as @e[tag=phalanx] at @s run teleport ~ ~ ~
scoreboard players set @e[tag=phalanx] r 0
scoreboard players add @e[tag=ar] r 1
kill @e[tag=ar,scores={r=50..}]