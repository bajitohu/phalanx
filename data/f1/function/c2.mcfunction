#破壊判定
#execute as @e[tag=phalanx] at @e[scores={id=0..}] if score @s id = @e[limit=1,sort=nearest] id run scoreboard players add @s r 1
#execute as @e[tag=phalanx,scores={r=..9}] at @e[scores={id=0..}] if score @s id = @e[limit=1,sort=nearest] id run kill @e[limit=1,sort=nearest]
#偏差(速:6)
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ~ ~-100 ~ at @e[tag=target,limit=1,sort=nearest] anchored feet positioned ^ ^ ^ run teleport ~ ~100 ~
#execute at @e[tag=a] positioned ~ ~-100 ~ run particle minecraft:composter ~ ~ ~
#execute at @e[tag=b] positioned ~ ~-100 ~ run particle minecraft:bubble ~ ~ ~
##座標取得
execute as @e[tag=phalanx] store result score @s rx run data get entity @s Pos[0] 100000
execute as @e[tag=phalanx] store result score @s ry run data get entity @s Pos[1] 100000
execute as @e[tag=phalanx] store result score @s rz run data get entity @s Pos[2] 100000
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
execute as @e[tag=phalanx] run scoreboard players operation @s rbx -= @s rx
execute as @e[tag=phalanx] run scoreboard players operation @s rby -= @s ry
execute as @e[tag=phalanx] run scoreboard players operation @s rbz -= @s rz
execute as @e[tag=phalanx] run scoreboard players operation @s rax -= @s rx
execute as @e[tag=phalanx] run scoreboard players operation @s ray -= @s ry
execute as @e[tag=phalanx] run scoreboard players operation @s raz -= @s rz

scoreboard players set world_score r 5
execute as @e[tag=phalanx] run scoreboard players operation @s rax *= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s ray *= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s raz *= world_score r

execute as @e[tag=phalanx] run scoreboard players operation @s rax += @s rbx
execute as @e[tag=phalanx] run scoreboard players operation @s ray += @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s raz += @s rbz
scoreboard players set world_score r 6
execute as @e[tag=phalanx] run scoreboard players operation @s rax /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s ray /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s raz /= world_score r
#test code
#execute as @e[tag=phalanx,limit=1,sort=nearest] run scoreboard players operation world_score num = @s rax
#execute as @e[tag=phalanx,limit=1,sort=furthest] run scoreboard players operation world_score num -= @s rax
#tellraw @p ["num:", {score: {name: "world_score", objective: num}, bold: true}]
#内積(概算でも精度に影響ないのでオーバーフロー対策で各要素1000で割る)
scoreboard players set world_score r5 1000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rax
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s rbx
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s raz
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s rbz
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2

execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rax
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s raz
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s r3
scoreboard players set world_score r3 100
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r3
execute as @e[tag=phalanx] run scoreboard players operation @s r /= @s r2

#tellraw @p ["r_1:", {score: {name: "@e[tag=phalanx,limit=1,sort=furthest]", objective: r}, bold: true}]
#tellraw @p ["r_2:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: r}, bold: true}]
execute as @e[tag=phalanx] run scoreboard players operation @s rax *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s ray *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s raz *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s rax /= world_score r3
execute as @e[tag=phalanx] run scoreboard players operation @s ray /= world_score r3
execute as @e[tag=phalanx] run scoreboard players operation @s raz /= world_score r3

#tellraw @p ["rax_1:", {score: {name: "@e[tag=phalanx,limit=1,sort=furthest]", objective: rax}, bold: true}]
#tellraw @p ["rax_2:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: rax}, bold: true}]

execute as @e[tag=phalanx] run scoreboard players operation @s rbx -= @s rax
execute as @e[tag=phalanx] run scoreboard players operation @s rby -= @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s rbz -= @s raz

# execute at @p run #tellraw @p ["rx_1:", {score: {name: "@e[tag=phalanx,limit=1,sort=furthest]", objective: rx}, bold: true}]
# execute at @p run #tellraw @p ["rx_2:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: rx}, bold: true}]
# execute at @p run #tellraw @p ["rbx_1:", {score: {name: "@e[tag=phalanx,limit=1,sort=furthest]", objective: rbx}, bold: true}]
# execute at @p run #tellraw @p ["rbx_2:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: rbx}, bold: true}]

execute if entity @e[tag=target] at @e[tag=phalanx] as @e[tag=a] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result entity @s Pos[0] double 0.00001 run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] rbx += @e[tag=phalanx,limit=1,sort=nearest] rx
execute if entity @e[tag=target] at @e[tag=phalanx] as @e[tag=a] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result entity @s Pos[1] double 0.00001 run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] rby += @e[tag=phalanx,limit=1,sort=nearest] ry
execute if entity @e[tag=target] at @e[tag=phalanx] as @e[tag=a] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result entity @s Pos[2] double 0.00001 run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] rbz += @e[tag=phalanx,limit=1,sort=nearest] rz

# execute at @p run #tellraw @p ["rbx_11:", {score: {name: "@e[tag=phalanx,limit=1,sort=furthest]", objective: rbx}, bold: true}]
# execute at @p run #tellraw @p ["rbx_22:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: rbx}, bold: true}]
execute at @e[tag=a] positioned ~ ~-97 ~ run particle minecraft:composter ~ ~ ~
#2分探索(ここから)
execute if entity @e[tag=target] at @e[tag=a] as @e[tag=b] if score @s id = @e[tag=a,limit=1,sort=nearest] id facing entity @s feet run teleport @e[tag=a,limit=1,sort=nearest] ~ ~ ~ ~ ~
###ここでスコア計算の誤差を吸収したい(distance=..5の範囲に持ち込むことができればうまく収束)
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^32 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-32 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^16 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-16 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^8 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-8 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^4 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-4 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^2 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-2 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^1 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-1 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.5 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.5 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.25 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.25 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.125 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.125 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.0625 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.0625 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.03125 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.03125 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.016 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.016 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.008 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.008 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.004 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.004 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.002 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.002 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.001 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.001 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.0005 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.0005 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.00025 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.00025 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.000125 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.000125 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.00005 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.00005 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.000025 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.000025 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=..500] at @s positioned ^ ^ ^0.0000125 run tp @s ~ ~ ~
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=5..] id = @e[tag=phalanx,limit=1,sort=nearest] id rotated as @s positioned ^ ^ ^-500 if entity @s[distance=500..] at @s positioned ^ ^ ^-0.0000125 run tp @s ~ ~ ~
###
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if entity @s[distance=5..] at @s run teleport ^ ^ ^-0.025
execute if entity @e[tag=target] as @e[tag=a] at @e[tag=phalanx] if score @s[distance=..5] id = @e[tag=phalanx,limit=1,sort=nearest] id at @s run teleport ^ ^ ^-4
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
#微ランダム拡散
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result score @e[tag=phalanx,limit=1,sort=nearest] rax run data get entity @s Pos[0] 100000
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result score @e[tag=phalanx,limit=1,sort=nearest] ray run data get entity @s Pos[1] 100000
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result score @e[tag=phalanx,limit=1,sort=nearest] raz run data get entity @s Pos[2] 100000
scoreboard players set world_score r3 100000
execute as @e[tag=phalanx] store result score @s r run random value -1000..1000
execute as @e[tag=phalanx] run scoreboard players operation @s rbx = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s rbx *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s rbx *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s rbx /= world_score r3
execute as @e[tag=phalanx] store result score @s r run random value -1000..1000
execute as @e[tag=phalanx] run scoreboard players operation @s rby = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s rby *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s rby *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s rby /= world_score r3
execute as @e[tag=phalanx] store result score @s r run random value -1000..1000
execute as @e[tag=phalanx] run scoreboard players operation @s rbz = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s rbz *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s rbz *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s rbz /= world_score r3
#execute at @p run #tellraw @p ["rbx:", {score: {name: "@e[tag=phalanx,limit=1,sort=furthest]", objective: rbx}, bold: true}]
execute if entity @e[tag=target] at @e[tag=phalanx] as @e[tag=a] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result entity @s Pos[0] double 0.00001 run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] rbx += @e[tag=phalanx,limit=1,sort=nearest] rax
execute if entity @e[tag=target] at @e[tag=phalanx] as @e[tag=a] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result entity @s Pos[1] double 0.00001 run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] rby += @e[tag=phalanx,limit=1,sort=nearest] ray
execute if entity @e[tag=target] at @e[tag=phalanx] as @e[tag=a] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result entity @s Pos[2] double 0.00001 run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] rbz += @e[tag=phalanx,limit=1,sort=nearest] raz
execute at @e[tag=a] positioned ~ ~-97 ~ run particle minecraft:bubble ~ ~ ~
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
execute store result storage _: _.left_rotation.angle float 0.01 run scoreboard players add world_score rot 25
execute if entity @e[tag=target] as @e[tag=p5] at @e[tag=fire] if score @s id = @e[tag=fire,limit=1,sort=nearest] id run data modify entity @s transformation set from storage _: _
execute as @e[tag=p1] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^ ^0.96 ^ positioned ~ ~-100 ~ run teleport @s ~ ~ ~ ~ ~
execute as @e[tag=p3] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^ ^ ^ positioned ~ ~-100 ~ run teleport @s ~ ~ ~ ~ ~
execute as @e[tag=p4] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^ ^-0.45 ^-0.15 positioned ~ ~-100 ~ run teleport @s ~ ~ ~ ~ ~
execute as @e[tag=p5] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id facing ^ ^ ^-1 positioned ~ ~-100 ~ run teleport @s ^ ^ ^-0.85 ~ ~
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
execute if entity @e[tag=target] at @e[tag=fire] positioned ^ ^ ^1.5 run particle minecraft:dust_color_transition{from_color:[1.0d, 0.5d, 0.5d],scale:1.5,to_color:[1.0,1.0,1.0]} ~ ~-100 ~
execute if entity @e[tag=target] at @e[tag=fire] positioned ^ ^ ^1.5 positioned ~ ~-100 ~ run playsound minecraft:block.ancient_debris.hit master @a ~ ~ ~ 1 1.3
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id run teleport ~1 ~ ~
execute unless entity @e[tag=target] as @e[tag=b] at @e[tag=a] if score @s id = @e[tag=a,limit=1,sort=nearest] id run teleport ~ ~ ~
tag @e remove newar
execute as @e[tag=phalanx] at @s run teleport ~ ~ ~
scoreboard players set @e[tag=phalanx] r 0
scoreboard players add @e[tag=ar] r 1
kill @e[tag=ar,scores={r=50..}]