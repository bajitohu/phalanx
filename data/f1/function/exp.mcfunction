#score t--> score exp s.t.100t-->10000exp(-t/100)
execute as @e[tag=phalanx] run scoreboard players set @s exp 10000
#tellraw @p ["第一項:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: exp}, bold: true}]
execute as @e[tag=phalanx] run scoreboard players operation @s exp -= @s t
#tellraw @p ["第ニ項:-", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: t}, bold: true}]
scoreboard players set world_score inc 2
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 = @s t
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score inc
execute as @e[tag=phalanx] run scoreboard players operation @s k = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s k %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r2
#tellraw @p ["第三項:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: tmp1}, bold: true}]
execute as @e[tag=phalanx] run scoreboard players operation @s exp += @s tmp1
scoreboard players add world_score inc 1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score inc
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s k -= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r2
#tellraw @p ["第四項:-", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: tmp1}, bold: true}]
execute as @e[tag=phalanx] run scoreboard players operation @s exp -= @s tmp1
scoreboard players add world_score inc 1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score inc
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s k += @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r2
#tellraw @p ["第五項:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: tmp1}, bold: true}]
execute as @e[tag=phalanx] run scoreboard players operation @s exp += @s tmp1
scoreboard players add world_score inc 1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score inc
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s k -= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r2
#tellraw @p ["第六項:-", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: tmp1}, bold: true}]
execute as @e[tag=phalanx] run scoreboard players operation @s exp -= @s tmp1
scoreboard players add world_score inc 1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score inc
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s k += @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s exp += @s tmp1
scoreboard players add world_score inc 1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score inc
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s k -= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s exp -= @s tmp1
scoreboard players add world_score inc 1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score inc
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s k += @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s exp += @s tmp1
scoreboard players add world_score inc 1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score inc
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s k -= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s exp -= @s tmp1
scoreboard players add world_score inc 1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score inc
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s k += @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s exp += @s tmp1
scoreboard players add world_score inc 1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score inc
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s k -= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s exp -= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s k /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s exp += @s k