#> CALCULATE: st.z = st.x - throw0.x:
    scoreboard players operation st.z scepc.TEMP = st.x scepc.TEMP
    scoreboard players operation st.z scepc.TEMP -= throw0.x scepc.TEMP

#> SAVE INTERMEDIATE RESULT: st.z in temp storage as x:
    execute store result storage sc_epc:temp x int 1 run scoreboard players get st.z scepc.TEMP

#> CALCULATE: multiply tan0 and x:
    function sc_math:tan with storage sc_epc:temp throw0
    execute store result score st.z scepc.TEMP run function sc_epc:calculate/multiplicate_tan_and_x with storage sc_epc:temp

#> CALCULATE: st.z += throw0.z:
    scoreboard players operation st.z scepc.TEMP += throw0.z scepc.TEMP