#> CALCULATE: st.z = st.x - throw0.x:
    scoreboard players operation st.z scmth.TEMP = st.x scmth.TEMP
    scoreboard players operation st.z scmth.TEMP -= throw0.x scmth.TEMP

#> SAVE INTERMEDIATE RESULT: st.z in temp storage as x:
    execute store result storage sc_epc:temp x int 1 run scoreboard players get st.z scmth.TEMP

#> CALCULATE: multiply tan0 and x:
$function sc_math:tan {deg:$(th0a)}
    execute store result score st.z scmth.TEMP run function sc_epc:calculate/multiplicate_tan_and_x with storage sc_epc:temp

#> CALCULATE: st.z += throw0.z:
    scoreboard players operation st.z scmth.TEMP += throw0.z scmth.TEMP