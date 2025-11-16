#> CALCULATE: tcos = t * math.cos(a0)
    function sc_math:cos with storage sc_epc:temp a0
    data modify storage sc_epc:temp fn set value "cos"
    execute store result storage sc_epc:temp x int 1 run scoreboard players get t scepc.TEMP
    execute store result score tcos scepc.TEMP run function sc_epc:calculate/multiplicate_function_and_x with storage sc_epc:temp

#> CALCULATE: st.z = throw0.z + tcos
    scoreboard players operation st.z scepc.TEMP = throw0.z scepc.TEMP
    scoreboard players operation st.z scepc.TEMP += tcos scepc.TEMP