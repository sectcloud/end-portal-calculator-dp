#> CALCULATE: t0 = dx * cos(a1)
    function sc_math:cos with storage sc_epc:temp a1
    data modify storage sc_epc:temp fn set value "cos"
    execute store result storage sc_epc:temp x int 1 run scoreboard players get dx scepc.TEMP
    execute store result score t0 scepc.TEMP run function sc_epc:calculate/multiplicate_function_and_x with storage sc_epc:temp

#> CALCULATE: t1 = dz * sin(a1)
    function sc_math:sin with storage sc_epc:temp a1
    data modify storage sc_epc:temp fn set value "sin"
    execute store result storage sc_epc:temp x int 1 run scoreboard players get dz scepc.TEMP
    execute store result score t1 scepc.TEMP run function sc_epc:calculate/multiplicate_function_and_x with storage sc_epc:temp

#> CALCULATE: num = (t0 + t1) * 10000
    scoreboard players operation num scepc.TEMP = t0 scepc.TEMP
    scoreboard players operation num scepc.TEMP += t1 scepc.TEMP
    scoreboard players operation num scepc.TEMP *= 10000 scepc.CONST

#> CALCULATE: den = -sin(da) * 10000
    function sc_math:sin with storage sc_epc:temp da
    data modify storage sc_epc:temp fn set value "sin"
    data modify storage sc_epc:temp x set value -10000
    execute store result score den scepc.TEMP run function sc_epc:calculate/multiplicate_function_and_x with storage sc_epc:temp

#> CALCULATE: t = num / den
    scoreboard players operation t scepc.TEMP = num scepc.TEMP
    scoreboard players operation t scepc.TEMP /= den scepc.TEMP