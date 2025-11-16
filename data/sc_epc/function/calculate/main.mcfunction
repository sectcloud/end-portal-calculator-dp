#> PREPARE VARIABLES FOR CALCULATION:
    $scoreboard players set throw0.x scepc.TEMP $(th0x)
    $scoreboard players set throw1.x scepc.TEMP $(th1x)
    $scoreboard players set throw0.z scepc.TEMP $(th0z)
    $scoreboard players set throw1.z scepc.TEMP $(th1z)
    
    scoreboard players operation dx scepc.TEMP = throw1.x scepc.TEMP
    scoreboard players operation dx scepc.TEMP -= throw0.x scepc.TEMP
    scoreboard players operation dz scepc.TEMP = throw1.z scepc.TEMP
    scoreboard players operation dz scepc.TEMP -= throw0.z scepc.TEMP

    #> PREPARE: Remove 90deg from angles:
        $data modify storage sc_epc:temp th0a set value $(th0a)
        $data modify storage sc_epc:temp th1a set value $(th1a)
        execute store result score throw0.a scepc.TEMP run data get storage sc_epc:temp th0a 10
        execute store result score throw1.a scepc.TEMP run data get storage sc_epc:temp th1a 10
        scoreboard players operation da scepc.TEMP = throw0.a scepc.TEMP
        scoreboard players operation da scepc.TEMP -= throw1.a scepc.TEMP
        execute store result storage sc_epc:temp a0.deg int 0.1 run scoreboard players get throw0.a scepc.TEMP
        execute store result storage sc_epc:temp a1.deg int 0.1 run scoreboard players get throw1.a scepc.TEMP
        execute store result storage sc_epc:temp da.deg int 0.1 run scoreboard players get da scepc.TEMP

#> CALCULATE:
    function sc_epc:calculate/get_t
    function sc_epc:calculate/get_x
    function sc_epc:calculate/get_z

#> STORE FINAL RESULTS:
    execute store result storage sc_epc:stronghold x int 1 run scoreboard players get st.x scepc.TEMP
    execute store result storage sc_epc:stronghold z int 1 run scoreboard players get st.z scepc.TEMP