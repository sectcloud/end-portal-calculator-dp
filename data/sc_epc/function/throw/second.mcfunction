tag @s add epc.second_throw
execute store result storage sc_epc:throws th1x int 1 run data get entity @s Pos[0]
execute store result storage sc_epc:throws th1z int 1 run data get entity @s Pos[2]
execute store result storage sc_epc:throws th1a float 1 run data get entity @s Rotation[0]

function sc_epc:chat/info/second_throw with storage sc_epc:throws

function sc_epc:throw/request_calculation