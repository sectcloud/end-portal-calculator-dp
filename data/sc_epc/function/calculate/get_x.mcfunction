#> CALCULATE: tsin = t * math.sin(a0)
    function sc_math:sin with storage sc_epc:temp a0
    data modify storage sc_epc:temp fn set value "sin"
    execute store result storage sc_epc:temp x int 1 run scoreboard players get t scepc.TEMP
    execute store result score tsin scepc.TEMP run function sc_epc:calculate/multiplicate_function_and_x with storage sc_epc:temp

#> CALCULATE: st.x = throw0.x - tsin
    scoreboard players operation st.x scepc.TEMP = throw0.x scepc.TEMP
    scoreboard players operation st.x scepc.TEMP -= tsin scepc.TEMP