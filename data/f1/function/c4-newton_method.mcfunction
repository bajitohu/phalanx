#ra-r=a,ra-rb+5ey=b
execute as @e[tag=phalanx] run scoreboard players operation @s vk = @s v
execute as @e[tag=phalanx] run scoreboard players add @s vk 1
execute as @e[tag=phalanx] run scoreboard players operation @s vk *= @s vk
scoreboard players set world_score tmp2 250000 
execute as @e[tag=phalanx] run scoreboard players operation @s vk -= world_score tmp2
#tellraw @p ["vk:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: vk}, bold: true}]
#目標の情報を取得
execute at @e[tag=phalanx] as @e[scores={tar=0..}] if score @s tar = @e[tag=phalanx,limit=1,sort=nearest] agmaxpr store result score @e[tag=phalanx,limit=1,sort=nearest] rax run data get entity @s Pos[0] 100000
execute at @e[tag=phalanx] as @e[scores={tar=0..}] if score @s tar = @e[tag=phalanx,limit=1,sort=nearest] agmaxpr store result score @e[tag=phalanx,limit=1,sort=nearest] ray run data get entity @s Pos[1] 100000
execute at @e[tag=phalanx] as @e[scores={tar=0..}] if score @s tar = @e[tag=phalanx,limit=1,sort=nearest] agmaxpr store result score @e[tag=phalanx,limit=1,sort=nearest] raz run data get entity @s Pos[2] 100000
execute at @e[tag=phalanx] as @e[scores={tar=0..}] if score @s tar = @e[tag=phalanx,limit=1,sort=nearest] agmaxpr run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] rbx = @s rbx
execute at @e[tag=phalanx] as @e[scores={tar=0..}] if score @s tar = @e[tag=phalanx,limit=1,sort=nearest] agmaxpr run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] rby = @s rby
execute at @e[tag=phalanx] as @e[scores={tar=0..}] if score @s tar = @e[tag=phalanx,limit=1,sort=nearest] agmaxpr run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] rbz = @s rbz
execute as @e[tag=phalanx] run scoreboard players add @s ray 10000000
execute unless entity @e[scores={tar=0..}] as @e[tag=phalanx] run scoreboard players operation @s rax = @s rx
execute unless entity @e[scores={tar=0..}] as @e[tag=phalanx] run scoreboard players operation @s ray = @s ry
execute unless entity @e[scores={tar=0..}] as @e[tag=phalanx] run scoreboard players operation @s raz = @s rz
execute unless entity @e[scores={tar=0..}] as @e[tag=phalanx] run scoreboard players add @s rax 10000
execute unless entity @e[scores={tar=0..}] as @e[tag=phalanx] run scoreboard players set @s rbx 0
execute unless entity @e[scores={tar=0..}] as @e[tag=phalanx] run scoreboard players set @s rby 0
execute unless entity @e[scores={tar=0..}] as @e[tag=phalanx] run scoreboard players set @s rbz 0
#数値計算
#tellraw @p ["test:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: ray}, bold: true}]
execute as @e[tag=phalanx] run scoreboard players operation @s rax -= @s rx
execute as @e[tag=phalanx] run scoreboard players operation @s ray -= @s ry
execute as @e[tag=phalanx] run scoreboard players operation @s raz -= @s rz
execute as @e[tag=phalanx] run scoreboard players set @s tmp1 100
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s rbx
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= @s v
execute as @e[tag=phalanx] run scoreboard players operation @s rax += @s tmp1
execute as @e[tag=phalanx] run scoreboard players set @s tmp1 100
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= @s v
execute as @e[tag=phalanx] run scoreboard players operation @s ray += @s tmp1
execute as @e[tag=phalanx] run scoreboard players set @s tmp1 100
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s rbz
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= @s v
execute as @e[tag=phalanx] run scoreboard players operation @s raz += @s tmp1
scoreboard players set world_score r 500000
execute as @e[tag=phalanx] run scoreboard players operation @s rby -= world_score r

#ここまでで標的位置1/7tick戻した状態のaがraに、-bがrbにできる
#tellraw @p ["ray:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: ray}, bold: true}]
#tellraw @p ["rby:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: rby}, bold: true}]

#expテスト
#execute as @e[tag=phalanx] run scoreboard players set @s t -10000
#function f1:test-exp
#tellraw @p ["exp:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: exp}, bold: true}]

#内積計算
#bn.bn/n
scoreboard players set world_score r 1000
scoreboard players set world_score k 100
execute as @e[tag=phalanx] run scoreboard players operation @s bb = @s rbx
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 = @s rbx
execute as @e[tag=phalanx] run scoreboard players operation @s bb %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s bb *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s bb /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s rbx
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s bb += @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 = @s rbx
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s bb += @s tmp1

execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s bb += @s r2

execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rbz
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 = @s rbz
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s rbz
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 = @s rbz
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s bb += @s r2

#tellraw @p ["bb:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: bb}, bold: true}]

#aa:αn・αn/10^7
scoreboard players set world_score r 10000
scoreboard players set world_score k 1000
execute as @e[tag=phalanx] run scoreboard players operation @s aa = @s rax
execute as @e[tag=phalanx] run scoreboard players operation @s aa /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s rax
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s aa
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k 
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s rax
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s aa *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s aa += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s rax
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s aa += @s r4

execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s aa += @s r2

execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s raz
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s raz
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s raz
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s raz
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s aa += @s r2

#tellraw @p ["aa:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: aa}, bold: true}]

#-ab/10^6
execute as @e[tag=phalanx] run scoreboard players operation @s ab = @s rax
execute as @e[tag=phalanx] run scoreboard players operation @s ab /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s rbx
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s rbx
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s ab *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s ab += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s rax
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s ab += @s r4

execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s ab += @s r2

execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s raz
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s rbz
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s rbz
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s raz
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s ab += @s r2

#tellraw @p ["ab:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: ab}, bold: true}]
#f''(0)の符号判定
#f''(0)=20by+48.2802-0.1ay-2|b|^2
# 1000000*f''(0)  2147483647
execute as @e[tag=phalanx] run scoreboard players set @s f2 200
execute as @e[tag=phalanx] run scoreboard players operation @s f2 *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 = @s rby
scoreboard players set world_score r -200
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f2 += @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s f2 -= @s ray
scoreboard players set world_score r 20
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f2 -= @s tmp1

#tellraw @p ["f2-1:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f2}, bold: true}]

tag @e[tag=phalanx,scores={f2=..0}] add next
execute as @e[tag=phalanx,tag=next] run scoreboard players set @s t 0
#f'''(0)=-0.3by+0.001ay-0.06k  *-10000
#tellraw @p ["ray:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: ray}, bold: true}]
#tellraw @p ["rby:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: rby}, bold: true}]
execute as @e[tag=phalanx] run scoreboard players set @s f3 6
execute as @e[tag=phalanx] run scoreboard players operation @s f3 *= @s vk
scoreboard players set world_score r 100
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 /= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s tmp1 3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 *= @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 -= @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s ray
scoreboard players set world_score r 10000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 -= @s tmp1
#ここまででf'''(0)がf3に完成した
#tellraw @p ["f3-1:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: f3}, bold: true}]
#ここでスコアf2は更新幅に
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 /= @s f3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s t = @s f2
#tellraw @p ["t-1:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: t}, bold: true}]
#exp に100exp()
function f1:exp
#tellraw @p ["exp:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: exp}, bold: true}]
#f''(t)*10^6
scoreboard players set world_score k 100
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s k 4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k *= @s f2
scoreboard players set world_score k 1000000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k /= world_score k
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s f2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 %= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s k

#tellraw @p ["4kexp^2*10^6:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: f2}, bold: true}]

scoreboard players set world_score k 100
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 %= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 *= @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s tmp2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s r2
#第2項完成
#tellraw @p ["exp:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: exp}, bold: true}]

execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 *= @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 -= @s r2
#tellraw @p ["(0.1ay+2k-20by)exp*10^6:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r2}, bold: true}]


execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 20
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s bb
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 -= @s r2
#ここまででf''完成
#f'''*10^4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
#tellraw @p ["-byt*10^5:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r2}, bold: true}]

#byt
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r3 300
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 -= @s r2

#tellraw @p ["(0.001byt-0.3by)*10^8:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r3}, bold: true}]

execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 8
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 -= @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 200
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 = @s r3

#tellraw @p ["(-0.08kexp+0.001byt-0.3by+0.02k+0.01ay)*10^8:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f3}, bold: true}]

scoreboard players set world_score r 10000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 /= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 += @s r3 
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 /= world_score r

#tellraw @p ["f3-2:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f3}, bold: true}]
#tellraw @p ["f2-2:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f2}, bold: true}]
#f'''完成,tを更新(1)
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 /= @s f3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s t -= @s f2

function f1:exp
#f''(t)*10^6
scoreboard players set world_score k 100
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s k 4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k *= @s f2
scoreboard players set world_score k 1000000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k /= world_score k
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s f2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 %= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s k

#tellraw @p ["4kexp^2*10^6:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: f2}, bold: true}]

scoreboard players set world_score k 100
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 %= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 *= @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s tmp2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s r2
#第2項完成
#tellraw @p ["exp:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: exp}, bold: true}]

execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 *= @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 -= @s r2
#tellraw @p ["(0.1ay+2k-20by)exp*10^6:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r2}, bold: true}]


execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 20
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s bb
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 -= @s r2
#ここまででf''完成
#f'''*10^4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
#tellraw @p ["-byt*10^5:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r2}, bold: true}]

#byt
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r3 300
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 -= @s r2

#tellraw @p ["(0.001byt-0.3by)*10^8:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r3}, bold: true}]

execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 8
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 -= @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 200
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 = @s r3

#tellraw @p ["(-0.08kexp+0.001byt-0.3by+0.02k+0.01ay)*10^8:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f3}, bold: true}]

scoreboard players set world_score r 10000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 /= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 += @s r3 
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 /= world_score r

#tellraw @p ["f2-3:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f2}, bold: true}]
#f'''完成,tを更新(2)
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 /= @s f3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s t -= @s f2
#tellraw @p ["t-3:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: t}, bold: true}]

function f1:exp
#f''(t)*10^6
scoreboard players set world_score k 100
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s k 4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k *= @s f2
scoreboard players set world_score k 1000000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k /= world_score k
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s f2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 %= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s k

#tellraw @p ["4kexp^2*10^6:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: f2}, bold: true}]

scoreboard players set world_score k 100
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 %= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 *= @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s tmp2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s r2
#第2項完成
#tellraw @p ["exp:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: exp}, bold: true}]

execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 *= @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 -= @s r2
#tellraw @p ["(0.1ay+2k-20by)exp*10^6:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r2}, bold: true}]


execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 20
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s bb
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 -= @s r2
#ここまででf''完成
#f'''*10^4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
#tellraw @p ["-byt*10^5:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r2}, bold: true}]

#byt
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r3 300
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 -= @s r2

#tellraw @p ["(0.001byt-0.3by)*10^8:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r3}, bold: true}]

execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 8
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 -= @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 200
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 = @s r3

#tellraw @p ["(-0.08kexp+0.001byt-0.3by+0.02k+0.01ay)*10^8:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f3}, bold: true}]

scoreboard players set world_score r 10000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 /= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 += @s r3 
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 /= world_score r
#f'''完成,tを更新(3)
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 /= @s f3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s t -= @s f2


function f1:exp
#f''(t)*10^6
scoreboard players set world_score k 100
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s k 4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k *= @s f2
scoreboard players set world_score k 1000000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k /= world_score k
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s f2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 %= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s k

#tellraw @p ["4kexp^2*10^6:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: f2}, bold: true}]

scoreboard players set world_score k 100
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 %= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 *= @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s tmp2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s r2
#第2項完成
#tellraw @p ["exp:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: exp}, bold: true}]

execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 *= @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 -= @s r2
#tellraw @p ["(0.1ay+2k-20by)exp*10^6:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r2}, bold: true}]


execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 20
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s bb
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 -= @s r2
#ここまででf''完成
#f'''*10^4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
#tellraw @p ["-byt*10^5:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r2}, bold: true}]

#byt
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r3 300
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 -= @s r2

#tellraw @p ["(0.001byt-0.3by)*10^8:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r3}, bold: true}]

execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 8
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 -= @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 200
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 = @s r3

#tellraw @p ["(-0.08kexp+0.001byt-0.3by+0.02k+0.01ay)*10^8:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f3}, bold: true}]

scoreboard players set world_score r 10000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 /= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 += @s r3 
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 /= world_score r
#tellraw @p ["f2-5:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f2}, bold: true}]
#f'''完成,tを更新(4)
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 /= @s f3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s t -= @s f2
#tellraw @p ["t-5:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: t}, bold: true}]
function f1:exp
#f''(t)*10^6
scoreboard players set world_score k 100
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s k 4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k *= @s f2
scoreboard players set world_score k 1000000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s k /= world_score k
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s f2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 %= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s k

#tellraw @p ["4kexp^2*10^6:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: f2}, bold: true}]

scoreboard players set world_score k 100
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 %= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 *= @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s tmp2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 += @s r2
#第2項完成
#tellraw @p ["exp:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: exp}, bold: true}]

execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s tmp1 = @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 *= @s tmp1
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 -= @s r2
#tellraw @p ["(0.1ay+2k-20by)exp*10^6:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r2}, bold: true}]


execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 20
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s bb
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 -= @s r2
#ここまででf''完成
#f'''*10^4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 = @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s t
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r3
#tellraw @p ["-byt*10^5:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r2}, bold: true}]

#byt
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r3 300
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s rby
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 -= @s r2

#tellraw @p ["(0.001byt-0.3by)*10^8:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: r3}, bold: true}]

execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 8
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r5 = @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 %= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 *= @s r5
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 += @s r4
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 -= @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players set @s r2 200
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r2 *= @s vk
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s r2
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 += @s ray
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 = @s r3

#tellraw @p ["(-0.08kexp+0.001byt-0.3by+0.02k+0.01ay)*10^8:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f3}, bold: true}]

scoreboard players set world_score r 10000
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 /= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 *= @s exp
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 += @s r3 
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f3 /= world_score r

#tellraw @p ["f3-6:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: f3}, bold: true}]
#tellraw @p ["f2-6:", {score: {name: "@e[tag=phalanx,tag=!next,limit=1,sort=nearest]", objective: f2}, bold: true}]
#f'''完成,tを更新(5)
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s f2 /= @s f3
execute as @e[tag=phalanx,tag=!next] run scoreboard players operation @s t -= @s f2
#tellraw @p ["t-6:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: t}, bold: true}]
#ここからf(t)のnewton法だよ
#10*f
function f1:exp
scoreboard players set world_score k 1000
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx] run scoreboard players set @s tmp1 10000
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 -= @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s f /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s f
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r2
scoreboard players set world_score r 100

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r -= @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s aa
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r
#10*fが完成

#tellraw @p ["f-1:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]

scoreboard players set world_score k 100000
scoreboard players set world_score r5 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s exp
execute as @e[tag=phalanx] run scoreboard players set @s f1 -2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score k

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players set @s r 2
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
scoreboard players set world_score r 1000
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t 
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
#f'完成,t更新(1)
#tellraw @p ["f1-1:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f1}, bold: true}]
#tellraw @p ["f-1:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]

execute as @e[tag=phalanx] run scoreboard players operation @s f /= @s f1

#tellraw @p ["dt:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]

execute as @e[tag=phalanx] run scoreboard players operation @s t -= @s f
#10*f
function f1:exp
scoreboard players set world_score k 1000
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx] run scoreboard players set @s tmp1 10000
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 -= @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s f /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s f
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r2
scoreboard players set world_score r 100

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r -= @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s aa
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r
#10*fが完成

#tellraw @p ["f-1:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]

scoreboard players set world_score k 100000
scoreboard players set world_score r5 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s exp
execute as @e[tag=phalanx] run scoreboard players set @s f1 -2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score k

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players set @s r 2
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
scoreboard players set world_score r 1000
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t 
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r

#tellraw @p ["f1-2:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f1}, bold: true}]
#tellraw @p ["f-2:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]
#f'完成,t更新(2)
execute as @e[tag=phalanx] run scoreboard players operation @s f /= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s t -= @s f
#10*f
function f1:exp
scoreboard players set world_score k 1000
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx] run scoreboard players set @s tmp1 10000
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 -= @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s f /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s f
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r2
scoreboard players set world_score r 100

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r -= @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s aa
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r
#10*fが完成

#tellraw @p ["f-1:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]

scoreboard players set world_score k 100000
scoreboard players set world_score r5 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s exp
execute as @e[tag=phalanx] run scoreboard players set @s f1 -2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score k

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players set @s r 2
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
scoreboard players set world_score r 1000
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t 
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r

#tellraw @p ["f1-3:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f1}, bold: true}]
#tellraw @p ["f-3:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]
#f'完成,t更新(3)
execute as @e[tag=phalanx] run scoreboard players operation @s f /= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s t -= @s f
#10*f
function f1:exp
scoreboard players set world_score k 1000
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx] run scoreboard players set @s tmp1 10000
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 -= @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s f /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s f
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r2
scoreboard players set world_score r 100

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r -= @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s aa
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r
#10*fが完成

scoreboard players set world_score k 100000
scoreboard players set world_score r5 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s exp
execute as @e[tag=phalanx] run scoreboard players set @s f1 -2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score k

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players set @s r 2
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
scoreboard players set world_score r 1000
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t 
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r

#tellraw @p ["f1-4:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f1}, bold: true}]
#tellraw @p ["f-4:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]
#f'完成,t更新(4)
execute as @e[tag=phalanx] run scoreboard players operation @s f /= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s t -= @s f
#10*f
function f1:exp
scoreboard players set world_score k 1000
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx] run scoreboard players set @s tmp1 10000
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 -= @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s f /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s f
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r2
scoreboard players set world_score r 100

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r -= @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s aa
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r
#10*fが完成

#tellraw @p ["f-1:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]

scoreboard players set world_score k 100000
scoreboard players set world_score r5 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s exp
execute as @e[tag=phalanx] run scoreboard players set @s f1 -2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score k

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players set @s r 2
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
scoreboard players set world_score r 1000
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t 
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
#f'完成,t更新(5)
#tellraw @p ["f1-5:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f1}, bold: true}]
#tellraw @p ["f-5:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]

execute as @e[tag=phalanx] run scoreboard players operation @s f /= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s t -= @s f


#10*f
function f1:exp
scoreboard players set world_score k 1000
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx] run scoreboard players set @s tmp1 10000
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 -= @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s f /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s f
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r2
scoreboard players set world_score r 100

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r -= @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s aa
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r
#10*fが完成

scoreboard players set world_score k 100000
scoreboard players set world_score r5 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s exp
execute as @e[tag=phalanx] run scoreboard players set @s f1 -2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score k

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players set @s r 2
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
scoreboard players set world_score r 1000
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t 
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
#tellraw @p ["f1-6:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f1}, bold: true}]
#tellraw @p ["f-6:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]

#f'完成,t更新(6)
execute as @e[tag=phalanx] run scoreboard players operation @s f /= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s t -= @s f
#tellraw @p ["t'-6:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: t}, bold: true}]

#10*f
function f1:exp
scoreboard players set world_score k 1000
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx] run scoreboard players set @s tmp1 10000
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 -= @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s f /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s f
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r2
scoreboard players set world_score r 100

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r -= @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s aa
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r
#10*fが完成

scoreboard players set world_score k 100000
scoreboard players set world_score r5 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s exp
execute as @e[tag=phalanx] run scoreboard players set @s f1 -2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score k

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players set @s r 2
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
scoreboard players set world_score r 1000
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t 
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
#tellraw @p ["f1-7:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f1}, bold: true}]
#tellraw @p ["f-7:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]

#f'完成,t更新(7)
execute as @e[tag=phalanx] run scoreboard players operation @s f /= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s t -= @s f
#tellraw @p ["t'-7:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: t}, bold: true}]

#10*f
function f1:exp
scoreboard players set world_score k 1000
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx] run scoreboard players set @s tmp1 10000
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 -= @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s f /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s f
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r2
scoreboard players set world_score r 100

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r -= @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s aa
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r
#10*fが完成

scoreboard players set world_score k 100000
scoreboard players set world_score r5 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s exp
execute as @e[tag=phalanx] run scoreboard players set @s f1 -2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score k

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players set @s r 2
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
scoreboard players set world_score r 1000
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t 
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
#tellraw @p ["f1-8:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f1}, bold: true}]
#tellraw @p ["f-8:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]

#f'完成,t更新(8)
execute as @e[tag=phalanx] run scoreboard players operation @s f /= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s t -= @s f
#tellraw @p ["t'-8:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: t}, bold: true}]
#10*f
function f1:exp
scoreboard players set world_score k 1000
scoreboard players set world_score r2 10000
execute as @e[tag=phalanx] run scoreboard players set @s tmp1 10000
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 -= @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s f /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s f
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[tag=phalanx] run scoreboard players operation @s f *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r2
scoreboard players set world_score r 100

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r -= @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s aa
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f += @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f -= @s r
#10*fが完成

scoreboard players set world_score k 100000
scoreboard players set world_score r5 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s exp
execute as @e[tag=phalanx] run scoreboard players set @s f1 -2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r5
execute as @e[tag=phalanx] run scoreboard players operation @s f1 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s f1 /= world_score k

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

scoreboard players set world_score k 10000
execute as @e[tag=phalanx] run scoreboard players set @s r 2
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s vk
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s exp
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r4
scoreboard players set world_score r 1000
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r

scoreboard players set world_score k 100000
execute as @e[tag=phalanx] run scoreboard players operation @s r = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r *= @s t 
execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s bb
execute as @e[tag=phalanx] run scoreboard players operation @s r2 %= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r += @s r2
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 -= @s r

execute as @e[tag=phalanx] run scoreboard players operation @s r = @s ab
execute as @e[tag=phalanx] run scoreboard players operation @s r /= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
execute as @e[tag=phalanx] run scoreboard players operation @s f1 += @s r
#tellraw @p ["f1-9:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f1}, bold: true}]
#tellraw @p ["f-9:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]

#execute at @p as @e[tag=phalanx,limit=1,sort=nearest] run scoreboard players operation world_score7 test = @s f
#f'完成,t更新(9)
execute as @e[tag=phalanx] run scoreboard players operation @s f /= @s f1
execute as @e[tag=phalanx] run scoreboard players operation @s t -= @s f
execute as @e[tag=phalanx,scores={f=-100..100}] run tag @s add ok
#tellraw @p ["f:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: f}, bold: true}]
#tellraw @p ["t'-9:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: t}, bold: true}]
#vを求める
function f1:exp
#tellraw @p ["exp:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: exp}, bold: true}]
scoreboard players set world_score k 100
execute as @e[tag=phalanx] run scoreboard players set @s r 10000
execute as @e[tag=phalanx] run scoreboard players operation @s r -= @s exp
#tellraw @p ["1-exp:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: r}, bold: true}]


execute as @e[tag=phalanx] run scoreboard players operation @s r2 = @s rbx
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s rbx
execute as @e[tag=phalanx] run scoreboard players operation @s r3 %= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 = @s rax
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 %= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 -= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s r3
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s rax
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r2 -= @s r3


scoreboard players set world_score r4 500000
execute as @e[tag=phalanx] run scoreboard players set @s tmp2 500000
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 /= @s v
execute as @e[tag=phalanx] run scoreboard players operation @s tmp2 += world_score r4
execute as @e[tag=phalanx] run scoreboard players operation @s r3 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s rby
execute as @e[tag=phalanx] run scoreboard players operation @s r4 %= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 %= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r4 -= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r3 += @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s ray
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r3 -= @s r4
execute as @e[tag=phalanx] run scoreboard players operation @s r3 += @s tmp2
#tellraw @p ["before:", {score: {name: "@e[tag=phalanx,limit=1,sort=nearest]", objective: r2}, bold: true}]

execute as @e[tag=phalanx] run scoreboard players operation @s r4 = @s rbz
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s r5 = @s rbz
execute as @e[tag=phalanx] run scoreboard players operation @s r5 %= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r5 *= @s t
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 = @s raz
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 %= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s tmp1 *= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r5 -= @s tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r5 /= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r4 += @s r5
execute as @e[tag=phalanx] run scoreboard players operation @s r5 = @s raz
execute as @e[tag=phalanx] run scoreboard players operation @s r5 /= @s r
execute as @e[tag=phalanx] run scoreboard players operation @s r5 *= world_score k
execute as @e[tag=phalanx] run scoreboard players operation @s r4 -= @s r5

#微ランダム拡散
#scoreboard players set world_score tmp1 100000
#execute as @e[tag=phalanx] store result score @s r run random value -1000..1000
#execute as @e[tag=phalanx] run scoreboard players operation @s rbx = @s r
#execute as @e[tag=phalanx] run scoreboard players operation @s rbx *= @s r
#execute as @e[tag=phalanx] run scoreboard players operation @s rbx *= @s r
#execute as @e[tag=phalanx] run scoreboard players operation @s rbx /= world_score tmp1
#execute as @e[tag=phalanx] store result score @s r run random value -1000..1000
#execute as @e[tag=phalanx] run scoreboard players operation @s rby = @s r
#execute as @e[tag=phalanx] run scoreboard players operation @s rby *= @s r
#execute as @e[tag=phalanx] run scoreboard players operation @s rby *= @s r
#execute as @e[tag=phalanx] run scoreboard players operation @s rby /= world_score tmp1
#execute as @e[tag=phalanx] store result score @s r run random value -1000..1000
#execute as @e[tag=phalanx] run scoreboard players operation @s rbz = @s r
#execute as @e[tag=phalanx] run scoreboard players operation @s rbz *= @s r
#execute as @e[tag=phalanx] run scoreboard players operation @s rbz *= @s r
#execute as @e[tag=phalanx] run scoreboard players operation @s rbz /= world_score tmp1
#execute as @e[tag=phalanx] run scoreboard players operation @s r2 += @s rbx
#execute as @e[tag=phalanx] run scoreboard players operation @s r3 += @s rby
#execute as @e[tag=phalanx] run scoreboard players operation @s r4 += @s rbz
#検証
#execute as @e[tag=phalanx] run scoreboard players operation @s rbx = @s r2
#execute as @e[tag=phalanx] run scoreboard players operation @s rby = @s r3
#execute as @e[tag=phalanx] run scoreboard players operation @s rbz = @s r4
scoreboard players set world_score tmp1 2
execute as @e[tag=phalanx] run scoreboard players operation @s r2 /= world_score tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r3 /= world_score tmp1
execute as @e[tag=phalanx] run scoreboard players operation @s r4 /= world_score tmp1

#検証コード
# execute as @e[tag=phalanx] run scoreboard players operation world_score1 test > @s r2
# execute as @e[tag=phalanx] run scoreboard players operation world_score2 test < @s r2
# execute as @e[tag=phalanx] run scoreboard players operation world_score3 test > @s r3
# execute as @e[tag=phalanx] run scoreboard players operation world_score4 test < @s r3
# execute as @e[tag=phalanx] run scoreboard players operation world_score5 test > @s r4
# execute as @e[tag=phalanx] run scoreboard players operation world_score6 test < @s r4
execute as @e[tag=phalanx] at @e[tag=a] if score @s id = @e[tag=a,limit=1,sort=nearest] id run tag @s add remain

execute if entity @e[scores={tar=0..}] at @e[tag=phalanx,tag=ok] as @e[tag=a] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result entity @s Pos[0] double 0.00001 run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] r2 += @e[tag=phalanx,limit=1,sort=nearest] rx
execute if entity @e[scores={tar=0..}] at @e[tag=phalanx,tag=ok] as @e[tag=a] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result entity @s Pos[1] double 0.00001 run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] r3 += @e[tag=phalanx,limit=1,sort=nearest] ry
execute if entity @e[scores={tar=0..}] at @e[tag=phalanx,tag=ok] as @e[tag=a] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id store result entity @s Pos[2] double 0.00001 run scoreboard players operation @e[tag=phalanx,limit=1,sort=nearest] r4 += @e[tag=phalanx,limit=1,sort=nearest] rz

execute at @e[tag=remain] unless entity @e[tag=a,distance=..6] run tellraw @p ["x:", {score: {name: "@s", objective: rbx}, bold: true},"\n y:", {score: {name: "@s", objective: rby}, bold: true},"\n z:", {score: {name: "@s", objective: rbx}, bold: true}]

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
execute if entity @e[scores={tar=0..}] as @e[tag=p5] at @e[tag=fire] if score @s id = @e[tag=fire,limit=1,sort=nearest] id run data modify entity @s transformation set from storage _: _
execute as @e[tag=p1] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^ ^0.96 ^ positioned ~ ~-100 ~ run teleport @s ~ ~ ~ ~ ~
execute as @e[tag=p3] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^ ^ ^ positioned ~ ~-100 ~ run teleport @s ~ ~ ~ ~ ~
execute as @e[tag=p4] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^ ^-0.45 ^-0.15 positioned ~ ~-100 ~ run teleport @s ~ ~ ~ ~ ~
execute as @e[tag=p5] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id facing ^ ^ ^-1 positioned ~ ~-100 ~ run teleport @s ^ ^ ^-0.85 ~ ~
execute as @e[tag=p6] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^0.5 ^ ^ facing ^1 ^ ^ positioned ~ ~-101 ~ run teleport @s ~ ~ ~ ~ ~
execute as @e[tag=p7] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id positioned ^-0.5 ^ ^ facing ^-1 ^ ^ positioned ~ ~-101 ~ run teleport @s ~ ~ ~ ~ ~
#射撃
execute if entity @e[scores={tar=0..}] as @e[tag=fire] at @s positioned ^ ^ ^1 positioned ~ ~-100 ~ run summon minecraft:arrow ~ ~ ~ {Tags:[newar,ar],NoGravity:0,HasVisualFire:0,Glowing:0}
#vを変更するときはここも
execute as @e[tag=a] at @e[tag=fire] if score @s id = @e[limit=1,sort=nearest] id facing entity @s feet positioned 0.0 0.0 0.0 positioned ^ ^ ^-10 run teleport @s ~ ~ ~ ~ ~
execute if entity @e[scores={tar=0..}] as @e[tag=a] at @e[tag=fire] if score @s id = @e[tag=fire,limit=1,sort=nearest] id positioned ~ ~-100 ~ run data modify entity @e[tag=newar,limit=1,distance=0.5..1.3] Motion set from entity @s Pos
#蛇足
execute if entity @e[scores={tar=0..}] as @e[tag=fire] at @s positioned ~ ~-100 ~ run data modify entity @e[type=arrow,tag=newar,limit=1,distance=0.5..1.3] Owner set from entity @s UUID
execute if entity @e[scores={tar=0..}] at @e[tag=fire] positioned ^ ^ ^1.5 run particle minecraft:dust_color_transition{from_color:[1.0d, 0.5d, 0.5d],scale:1.5,to_color:[1.0,1.0,1.0]} ~ ~-100 ~
execute if entity @e[scores={tar=0..}] at @e[tag=fire] positioned ^ ^ ^1.5 positioned ~ ~-100 ~ run playsound minecraft:block.ancient_debris.hit master @a ~ ~ ~ 1 1.3
execute as @e[tag=a] at @e[tag=phalanx] if score @s id = @e[tag=phalanx,limit=1,sort=nearest] id run teleport ~-1 ~ ~
tag @e remove newar
tag @e remove next
execute as @e[tag=phalanx] at @s run teleport ~ ~ ~
scoreboard players set @e[tag=phalanx] r 0
scoreboard players add @e[tag=ar] r 1
kill @e[tag=ar,scores={r=1000..}]
kill @e[tag=ar,nbt={inGround:1b}]

#ここで標的の選定、変更
function f1:c_and_d
tag @e remove ok