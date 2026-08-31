#破壊判定
#execute as @e[tag=phalanx] at @e[scores={id=0..}] if score @s id = @e[limit=1,sort=nearest] id run scoreboard players add @s r 1
#execute as @e[tag=phalanx,scores={r=..9}] at @e[scores={id=0..}] if score @s id = @e[limit=1,sort=nearest] id run kill @e[limit=1,sort=nearest]
#偏差(速:6)
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ~ ~-100 ~ at @e[tag=target,limit=1,sort=nearest] anchored feet positioned ^ ^ ^ run teleport ~ ~100 ~
#execute at @e[tag=a] positioned ~ ~-100 ~ run particle minecraft:composter ~ ~ ~
#execute at @e[tag=b] positioned ~ ~-100 ~ run particle minecraft:bubble ~ ~ ~
##座標取得
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result score @e[tag=phalanx,limit=1,sort=nearest] rax run data get entity @s Pos[0] 100000
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result score @e[tag=phalanx,limit=1,sort=nearest] ray run data get entity @s Pos[1] 100000
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result score @e[tag=phalanx,limit=1,sort=nearest] raz run data get entity @s Pos[2] 100000
execute as @e[tag=b] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result score @e[tag=phalanx,limit=1,sort=nearest] rbx run data get entity @s Pos[0] 100000
execute as @e[tag=b] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result score @e[tag=phalanx,limit=1,sort=nearest] rby run data get entity @s Pos[1] 100000
execute as @e[tag=b] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result score @e[tag=phalanx,limit=1,sort=nearest] rbz run data get entity @s Pos[2] 100000
#tellraw @p ["rx1:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: rx}, bold: true}]
#tellraw @p ["rx2:", {score: {name: "@e[tag=phalanx,limit=1,sort=furthest]", objective: rx}, bold: true}]
#tellraw @p ["rby:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: ray}, bold: true}]
#tellraw @p ["rbz:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: raz}, bold: true}]
#数値計算
scoreboard players set world_score r 5
execute as @e[tag=phalanx] run scoreboard players operation @s rax *= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s ray *= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s raz *= world_score r

execute as @e[tag=phalanx] run scoreboard players operation @s rax += @s rbx
execute as @e[tag=phalanx] run scoreboard players operation @s ray += @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s raz += @s rbz
scoreboard players set world_score r 6
execute if entity @e[tag=target] at @e[tag=phalanx] as @e[tag=a] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result entity @s Pos[0] double 0.00001 run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] rax /= world_score r
execute if entity @e[tag=target] at @e[tag=phalanx] as @e[tag=a] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result entity @s Pos[1] double 0.00001 run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] ray /= world_score r
execute if entity @e[tag=target] at @e[tag=phalanx] as @e[tag=a] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result entity @s Pos[2] double 0.00001 run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] raz /= world_score r
execute at @e[tag=a] positioned ~ ~-97 ~ run particle minecraft:bubble ~ ~ ~
#test code
#execute as @e[tag=phalanx,limit=1,sort=nearest] run scoreboard players operation world_score num = @s rax
#execute as @e[tag=phalanx,limit=1,sort=furthest] run scoreboard players operation world_score num -= @s rax
#tellraw @p ["num:", {score: {name: "world_score", objective: num}, bold: true}]
#2分探索(ここから)
#ここ　bが読み込み範囲外に出がち
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id facing entity @s feet as @e[tag=b] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned as @s run teleport @s ^ ^ ^-128 ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=b] if score @s id = @e[tag=b,limit=1,sort=nearest] id run teleport @s ~ ~ ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @s positioned ^ ^ ^500 at @e[tag=phalanx,distance=..500] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport @s ^ ^ ^64 ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @s positioned ^ ^ ^500 at @e[tag=phalanx,distance=500..] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport @s ^ ^ ^-64 ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @s positioned ^ ^ ^500 at @e[tag=phalanx,distance=..500] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport @s ^ ^ ^32 ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @s positioned ^ ^ ^500 at @e[tag=phalanx,distance=500..] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport @s ^ ^ ^-32 ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @s positioned ^ ^ ^500 at @e[tag=phalanx,distance=..500] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport @s ^ ^ ^16 ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @s positioned ^ ^ ^500 at @e[tag=phalanx,distance=500..] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport @s ^ ^ ^-16 ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @s positioned ^ ^ ^500 at @e[tag=phalanx,distance=..500] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport @s ^ ^ ^8 ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @s positioned ^ ^ ^500 at @e[tag=phalanx,distance=500..] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport @s ^ ^ ^-8 ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @s positioned ^ ^ ^500 at @e[tag=phalanx,distance=..500] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport @s ^ ^ ^4 ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @s positioned ^ ^ ^500 at @e[tag=phalanx,distance=500..] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport @s ^ ^ ^-4 ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-2
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^2
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-1
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^1
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.5
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.5
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.25
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.25
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.125
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.125
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.0625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.0625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.03125
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.03125
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.015625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.015625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.0078125
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.0078125
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.00390625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.00390625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.001953125
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.001953125
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.0009765625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.0009765625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.00048828125
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.00048828125
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.000244140625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.000244140625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.0001220703125
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.0001220703125
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.00006103515625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.00006103515625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.000030517578125
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.000030517578125
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-0.0000152587890625
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^0.0000152587890625

execute if entity @e[tag=target] as @e[tag=b] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ~ ~-100 ~ at @e[tag=target,limit=1,sort=nearest] anchored feet positioned ^ ^ ^ run teleport ~ ~100 ~
#execute unless entity @e[tag=target] run teleport @e[tag=a] 1.0 0.0 0.0 ~ ~
#execute unless entity @e[tag=target] as @e[tag=phalanx] at @p positioned ~ ~100 ~ facing entity @s feet positioned 0.0 0.0 0.0 run teleport @e[tag=a] ^ ^ ^1 ~ ~
#execute at @e[tag=a] positioned ~ ~-97 ~ run particle minecraft:bubble ~ ~ ~
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
execute if entity @e[tag=target] as @e[tag=fire,scores={num=0}] at @s positioned ^ ^ ^1 positioned ~ ~-100 ~ run summon minecraft:arrow ~ ~ ~ {Tags:[newar,ar],NoGravity:1,HasVisualFire:0,life:1200s}
execute if entity @e[tag=target] as @e[tag=fire,scores={num=1}] at @s positioned ^ ^ ^1 positioned ~ ~-100 ~ run summon minecraft:wind_charge ~ ~ ~ {Tags:[newar,ar]}
execute if entity @e[tag=target] as @e[tag=fire,scores={num=2}] at @s positioned ^ ^ ^1 positioned ~ ~-100 ~ run summon minecraft:small_fireball ~ ~ ~ {Tags:[newar,ar]}
execute if entity @e[tag=target] as @e[tag=fire,scores={num=3}] at @s positioned ^ ^ ^1 positioned ~ ~-100 ~ run summon minecraft:fireball ~ ~ ~ {Tags:[newar,ar]}
execute if entity @e[tag=target] as @e[tag=fire,scores={num=4..}] at @s positioned ^ ^ ^1 positioned ~ ~-100 ~ run summon minecraft:dragon_fireball ~ ~ ~ {Tags:[newar,ar]}
execute as @e[tag=a] at @e[tag=fire] if score @s id = @e[limit=1,sort=nearest] id facing entity @s feet positioned 0.0 0.0 0.0 positioned ^ ^ ^-6 run teleport @s ~ ~ ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=fire] if score @s id = @e[tag=fire,limit=1,sort=nearest] id positioned ~ ~-100 ~ run data modify entity @e[tag=newar,limit=1,distance=0.5..1.3] Motion set from entity @s Pos
#蛇足
execute if entity @e[tag=target] at @e[tag=fire] positioned ~ ~-100 ~ run data modify entity @e[type=arrow,tag=newar,limit=1,distance=0.5..1.3] Owner set from entity @p UUID

execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id run teleport ~1 ~ ~
execute unless entity @e[tag=target] as @e[tag=b] at @e[tag=a] if score @s id = @e[tag=a,limit=1,sort=nearest] id run teleport ~ ~ ~
tag @e remove newar
execute as @e[tag=phalanx] at @s run teleport ~ ~ ~
scoreboard players set @e[tag=phalanx] r 0
scoreboard players add @e[tag=ar] r 1
kill @e[tag=ar,scores={r=50..}]