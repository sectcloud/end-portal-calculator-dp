#> PREPARE VARIABLES FOR CALCULATION:
    $scoreboard players set throw0.x scmth.TEMP $(th0x)
    $scoreboard players set throw1.x scmth.TEMP $(th1x)
    $scoreboard players set throw0.z scmth.TEMP $(th0z)
    $scoreboard players set throw1.z scmth.TEMP $(th1z)

#> PREPARE: kth0 = tan(th0a) * th0x AND tan0 = tan(th0a) * 10000:
    $function sc_math:tan {deg:$(th0a)}
    $execute store result score kth0 scmth.TEMP run function sc_epc:calculate/multiplicate_tan_and_x {x:$(th0x)}
    execute store result score tan0 scmth.TEMP run function sc_epc:calculate/multiplicate_tan_and_x {x:10000}

#> PREPARE: kth1 = tan(th1a) * th1x AND tan1 = tan(th1a) * 10000:
    $function sc_math:tan {deg:$(th1a)}
    $execute store result score kth1 scmth.TEMP run function sc_epc:calculate/multiplicate_tan_and_x {x:$(th1x)}
    execute store result score tan1 scmth.TEMP run function sc_epc:calculate/multiplicate_tan_and_x {x:10000}

#> CALCULATE st.x and st.z:
    function sc_epc:calculate/get_x
    function sc_epc:calculate/get_z

#> STORE FINAL RESULTS:
    execute store result storage sc_epc:stronghold x int 1 run scoreboard players get st.x scmth.TEMP
    execute store result storage sc_epc:stronghold z int 1 run scoreboard players get st.z scmth.TEMP
