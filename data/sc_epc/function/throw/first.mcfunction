tag @s add epc.first_throw
execute store result storage sc_epc:throws th0x int 1 run data get entity @s Pos[0]
execute store result storage sc_epc:throws th0z int 1 run data get entity @s Pos[2]
execute store result storage sc_epc:throws th0a float 1 run data get entity @s Rotation[0]

function sc_epc:chat/info/first_throw with storage sc_epc:throws