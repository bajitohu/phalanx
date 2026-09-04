#ra(標的が持っている)
execute as @e[scores={tar=0..}] run scoreboard players operation @s rax = @s rx
execute as @e[scores={tar=0..}] run scoreboard players operation @s ray = @s ry
execute as @e[scores={tar=0..}] run scoreboard players operation @s raz = @s rz
execute as @e[scores={tar=0..}] run scoreboard players add @s ray 10000000

execute as @e[scores={tar=0..}] run scoreboard players operation @s rax -= @e[limit=1,sort=nearest,tag=phalanx] rx
execute as @e[scores={tar=0..}] run scoreboard players operation @s ray -= @e[limit=1,sort=nearest,tag=phalanx] ry
execute as @e[scores={tar=0..}] run scoreboard players operation @s raz -= @e[limit=1,sort=nearest,tag=phalanx] rz

#方向ベクトルdir,相対位置ベクトルr,速度vとして、暫定最大値とそのid(tar)をそれぞれpr,agmaxprとして本体に保持しておく
#r方向の単位ベクトル作れたら楽かも。a,bはそれぞれr方向とdir方向の単位ベクトルe_r,e_dirとして使う
#このとき、距離r.e_r,仮想到達時間r.e_r//-v.e_r,方向近さ(e_r.e_dir)Rotation値をそれぞれ取得し比較する方法に変更(tmp1,tmp2),ヒステリシス(同一目標をねらう長さを記録しておく),被りペナルティ
#e_r作成(標的のr3~r5に格納),Rotation値を取得 
execute as @e[scores={tar=0..}] run function f1:c_and_d3


#r.e_rをtarのaaに格納,aaの数値はおかしい<--かけた後に割る順番ミスでオーバーフロー説
scoreboard players set world_score r 100
execute as @e[scores={tar=0..}] run scoreboard players operation @s aa = @s rax
execute as @e[scores={tar=0..}] run scoreboard players operation @s aa *= @s r3
execute as @e[scores={tar=0..}] run scoreboard players operation @s aa /= world_score r
execute as @e[scores={tar=0..}] run scoreboard players operation @s r = @s ray
execute as @e[scores={tar=0..}] run scoreboard players operation @s r *= @s r4
execute as @e[scores={tar=0..}] run scoreboard players operation @s r /= world_score r
execute as @e[scores={tar=0..}] run scoreboard players operation @s aa += @s r
execute as @e[scores={tar=0..}] run scoreboard players operation @s r = @s raz
execute as @e[scores={tar=0..}] run scoreboard players operation @s r *= @s r5
execute as @e[scores={tar=0..}] run scoreboard players operation @s r /= world_score r
execute as @e[scores={tar=0..}] run scoreboard players operation @s aa += @s r
#v.e_rをtarのabに格納
execute as @e[scores={tar=0..}] run scoreboard players operation @s ab = @s rbx
execute as @e[scores={tar=0..}] run scoreboard players operation @s ab *= @s r3
execute as @e[scores={tar=0..}] run scoreboard players operation @s r = @s rby
execute as @e[scores={tar=0..}] run scoreboard players operation @s r *= @s r4
execute as @e[scores={tar=0..}] run scoreboard players operation @s ab += @s r
execute as @e[scores={tar=0..}] run scoreboard players operation @s r = @s rbz
execute as @e[scores={tar=0..}] run scoreboard players operation @s r *= @s r5
execute as @e[scores={tar=0..}] run scoreboard players operation @s ab += @s r
scoreboard players set world_score r2 10000
execute as @e[scores={tar=0..}] run scoreboard players operation @s ab /= world_score r2
#r.e_r/v.e_r(符号は反対であることに注意)をtarのtに格納
execute as @e[scores={tar=0..}] run scoreboard players operation @s t = @s aa
execute as @e[scores={tar=0..,ab=..-1}] run scoreboard players operation @s t /= @s ab
scoreboard players set world_score r2 -1
execute as @e[scores={tar=0..,ab=0..}] run scoreboard players operation @s t *= world_score r2

scoreboard players set world_score r2 1000000
execute as @e[scores={tar=0..}] run scoreboard players operation @s aa /= world_score r2
#旋回量(参考：yaw,pitchいずれも5deg/tick)
#0~180で表示したい,mod360->180より大きければ360から引く
execute as @e[scores={tar=0..}] run scoreboard players operation @s tmp1 -= @e[limit=1,sort=nearest,tag=phalanx] tmp1
execute as @e[scores={tar=0..}] run scoreboard players operation @s tmp2 -= @e[limit=1,sort=nearest,tag=phalanx] tmp2

scoreboard players set world_score r2 360
execute as @e[scores={tar=0..}] run scoreboard players operation @s tmp1 %= world_score r2
execute as @e[scores={tar=0..,tmp1=181..}] run scoreboard players remove @s tmp1 360
scoreboard players set world_score r2 -1
execute as @e[scores={tar=0..,tmp1=..0}] run scoreboard players operation @s tmp1 *= world_score r2
execute as @e[scores={tar=0..,tmp2=..0}] run scoreboard players operation @s tmp2 *= world_score r2
execute at @p as @e[scores={tar=0..},limit=1,sort=nearest] run scoreboard players operation world_score6 test = @s tmp1
execute at @p as @e[scores={tar=0..},limit=1,sort=nearest] run scoreboard players operation world_score7 test = @s tmp2
scoreboard players set world_score r2 1
execute as @e[scores={tar=0..}] run scoreboard players operation @s tmp1 /= world_score r2
execute as @e[scores={tar=0..}] run scoreboard players operation @s tmp2 /= world_score r2
execute as @e[scores={tar=0..}] run scoreboard players operation @s tmp1 > @s tmp2
execute as @e[scores={tar=0..}] run scoreboard players add @s tmp1 1
tellraw @p ["tmp1:", {score: {name: "@p", objective: tmp1}, bold: true}]

#r.e_r,r.e_r/-v.e_r,e_r.e_dir,abを線形結合-->pr,一旦被りペナルティは無視で進める
execute as @e[scores={tar=0..}] run scoreboard players operation @s pr = @s aa
execute as @e[scores={tar=0..}] run scoreboard players operation @s pr *= world_score w1
execute as @e[scores={tar=0..,ab=..-1}] run scoreboard players operation @s tmp2 = @s t
execute as @e[scores={tar=0..,ab=..-1}] run scoreboard players operation @s tmp2 *= world_score w2
execute as @e[scores={tar=0..,ab=..-1}] run scoreboard players operation @s pr += @s tmp2
execute as @e[scores={tar=0..}] run scoreboard players operation @s tmp2 = @s tmp1
execute as @e[scores={tar=0..}] run scoreboard players operation @s tmp2 *= world_score w3
execute as @e[scores={tar=0..}] run scoreboard players operation @s pr += @s tmp2
execute as @e[scores={tar=0..}] run scoreboard players operation @s tmp2 = @s ab
execute as @e[scores={tar=0..}] run scoreboard players operation @s tmp2 *= world_score w4
execute as @e[scores={tar=0..}] run scoreboard players operation @s pr += @s tmp2
#間に合わないものをはじく
execute as @e[scores={tar=0..,ab=..-1}] run scoreboard players operation @s tmp2 = @s t
execute as @e[scores={tar=0..,ab=..-1}] run scoreboard players operation @s tmp2 += @s tmp1
#↓反応まばら、うまくいっていない。
#execute as @e[scores={tar=0..,ab=..-1,tmp2=..-5}] run scoreboard players set @s pr -2000000000
#前のtickでの標的に対しヒステリシス(本体格納)加算
execute as @e[scores={tar=0..}] if score @s tar = @e[limit=1,sort=nearest,tag=phalanx] agmaxpr run scoreboard players operation @s pr += @e[limit=1,sort=nearest,tag=phalanx] hys
#最大値決定(本体pr更新)
function f1:c_and_d5
tag @e remove checked
execute if entity @e[limit=1,sort=nearest,tag=oh,distance=..0.5] as @e[scores={tar=0..}] run scoreboard players operation @e[limit=1,sort=nearest,tag=phalanx] pr > @s pr

#前の標的と一致するか判定->ヒステリシス更新
execute as @e[scores={tar=0..}] if score @s tar = @e[limit=1,sort=nearest,tag=phalanx] agmaxpr if score @s pr = @e[limit=1,sort=nearest,tag=phalanx] pr run tag @e[limit=1,sort=nearest,tag=phalanx] add continue
execute as @e[limit=1,sort=nearest,tag=phalanx] if entity @s[tag=continue] run scoreboard players add @s t_hys 1
execute as @e[limit=1,sort=nearest,tag=phalanx] unless entity @s[tag=continue] run scoreboard players set @s t_hys 0

execute as @e[scores={tar=0..}] if score @s tar = @e[limit=1,sort=nearest,tag=phalanx,tag=!continue] agmaxpr run data modify entity @s Glowing set value 0b

execute as @e[limit=1,sort=nearest,tag=phalanx,scores={t_hys=..100}] run scoreboard players set @s hys 499
# execute as @e[limit=1,sort=nearest,tag=phalanx,scores={t_hys=101..200}] run scoreboard players set @s hys 999
# execute as @e[limit=1,sort=nearest,tag=phalanx,scores={t_hys=101..200}] run scoreboard players set @s tmp2 5
# execute as @e[limit=1,sort=nearest,tag=phalanx,scores={t_hys=101..200}] run scoreboard players operation @s tmp2 *= @s t_hys
# execute as @e[limit=1,sort=nearest,tag=phalanx,scores={t_hys=101..200}] run scoreboard players operation @s hys -= @s tmp2
# execute as @e[limit=1,sort=nearest,tag=phalanx,scores={t_hys=201..300}] run scoreboard players set @s hys -1
# execute as @e[limit=1,sort=nearest,tag=phalanx,scores={t_hys=301..400}] run scoreboard players set @s hys 299
# execute as @e[limit=1,sort=nearest,tag=phalanx,scores={t_hys=301..400}] run scoreboard players operation @s hys -= @s t_hys
# execute as @e[limit=1,sort=nearest,tag=phalanx,scores={t_hys=401..}] run scoreboard players set @s hys -101
execute as @e[limit=1,sort=nearest,tag=phalanx,scores={t_hys=101..}] run scoreboard players set @s hys -499
#execute as @e[limit=1,sort=nearest,tag=phalanx] run scoreboard players set @s hys 0

execute as @e[scores={tar=0..}] if score @s pr = @e[limit=1,sort=nearest,tag=phalanx] pr run scoreboard players operation @e[limit=1,sort=nearest,tag=phalanx] agmaxpr = @s tar
tellraw @p ["pr:", {score: {name: "@e[limit=1,sort=nearest,tag=phalanx]", objective: pr}, bold: true}]

#execute at @p as @e[tag=phalanx,limit=1,sort=nearest] run scoreboard players operation world_score1 test = @s agmaxpr
#scoreboard players operation world_score2 test = world_score tar
#execute at @p as @e[scores={tar=0..},limit=1,sort=nearest] run scoreboard players operation world_score3 test = @s aa
#execute as @e[tag=phalanx,limit=1,sort=nearest] at @p run scoreboard players operation world_score4 test = @s pr
#execute at @p as @e[scores={tar=0..},limit=1,sort=nearest] run scoreboard players operation world_score5 test = @s tmp1
execute as @e[scores={tar=0..}] if score @s tar = @e[limit=1,sort=nearest,tag=phalanx,tag=!continue] agmaxpr run data modify entity @s Glowing set value 1b
tag @e remove continue