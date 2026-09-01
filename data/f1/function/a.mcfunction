scoreboard objectives add sneak custom:sneak_time
scoreboard objectives add id dummy
scoreboard objectives add rx dummy
scoreboard objectives add ry dummy
scoreboard objectives add rz dummy
scoreboard objectives add rax dummy
scoreboard objectives add ray dummy
scoreboard objectives add raz dummy
scoreboard objectives add rbx dummy
scoreboard objectives add rby dummy
scoreboard objectives add rbz dummy
scoreboard objectives add r dummy
scoreboard objectives add r2 dummy
scoreboard objectives add r3 dummy
scoreboard objectives add r4 dummy
scoreboard objectives add r5 dummy
scoreboard objectives add v dummy
scoreboard objectives add vk dummy
scoreboard objectives add rot dummy
#score:f,f1,f2,f3,exp,tmp1,tmp2,t,k,inc,dt
scoreboard objectives add f dummy
scoreboard objectives add f1 dummy
scoreboard objectives add f2 dummy
scoreboard objectives add f3 dummy
scoreboard objectives add exp dummy
scoreboard objectives add tmp1 dummy
scoreboard objectives add tmp2 dummy
scoreboard objectives add t dummy
scoreboard objectives add k dummy
scoreboard objectives add inc dummy
#一時変数の名称統合、rx~rzもtmpに、新スコアaa,bb,abを作る
scoreboard objectives add aa dummy
scoreboard objectives add ab dummy
scoreboard objectives add bb dummy

scoreboard objectives add tar dummy
scoreboard objectives add pr dummy
scoreboard objectives add agmaxpr dummy
scoreboard objectives add t_hys dummy
scoreboard objectives add hys dummy

#標的優先度重みの初期設定
scoreboard objectives add w1 dummy
scoreboard objectives add w2 dummy
scoreboard objectives add w3 dummy
scoreboard objectives add w4 dummy
#オーバーフローしないように大きさを調整する必要あり
scoreboard players set world_score w1 0
scoreboard players set world_score w2 0
scoreboard players set world_score w3 -1
scoreboard players set world_score w4 0

scoreboard objectives add test dummy
forceload add -10 -10 10 10