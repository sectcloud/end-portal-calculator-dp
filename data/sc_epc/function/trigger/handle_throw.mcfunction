scoreboard players set @s epc.throw 0
execute if entity @s[tag=!epc.first_throw, tag=!epc.second_throw] run return run function sc_epc:throw/first
execute if entity @s[tag=epc.first_throw, tag=!epc.second_throw] run return run function sc_epc:throw/second