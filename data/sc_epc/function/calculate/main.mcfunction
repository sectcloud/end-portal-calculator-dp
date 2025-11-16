#> PREPARE VARIABLES FOR CALCULATION:
    $scoreboard players set throw0.x scepc.TEMP $(th0x)
    $scoreboard players set throw1.x scepc.TEMP $(th1x)
    $scoreboard players set throw0.z scepc.TEMP $(th0z)
    $scoreboard players set throw1.z scepc.TEMP $(th1z)
    
    #> PREPARE: Remove 90deg from angles:
        $data modify storage sc_epc:temp th0a set value $(th0a)
        $data modify storage sc_epc:temp th1a set value $(th1a)
        execute store result score throw0.a scepc.TEMP run data get storage sc_epc:temp th0a 10
        execute store result score throw1.a scepc.TEMP run data get storage sc_epc:temp th1a 10
        scoreboard players remove throw0.a scepc.TEMP 900
        scoreboard players remove throw1.a scepc.TEMP 900
        execute store result storage sc_epc:temp throw0.deg int 0.1 run scoreboard players get throw0.a scepc.TEMP
        execute store result storage sc_epc:temp throw1.deg int 0.1 run scoreboard players get throw1.a scepc.TEMP

#> PREPARE: kth0 = tan(th0a) * th0x AND tan0 = tan(th0a) * 10000:
    function sc_math:tan with storage sc_epc:temp throw0
    $execute store result score kth0 scepc.TEMP run function sc_epc:calculate/multiplicate_tan_and_x {x:$(th0x)}
    execute store result score tan0 scepc.TEMP run function sc_epc:calculate/multiplicate_tan_and_x {x:10000}

#> PREPARE: kth1 = tan(th1a) * th1x AND tan1 = tan(th1a) * 10000:
    function sc_math:tan with storage sc_epc:temp throw1
    $execute store result score kth1 scepc.TEMP run function sc_epc:calculate/multiplicate_tan_and_x {x:$(th1x)}
    execute store result score tan1 scepc.TEMP run function sc_epc:calculate/multiplicate_tan_and_x {x:10000}

#> CALCULATE st.x and st.z:
    function sc_epc:calculate/get_x
    $function sc_epc:calculate/get_z {th0a:$(th0a)} 

#> STORE FINAL RESULTS:
    execute store result storage sc_epc:stronghold x int 1 run scoreboard players get st.x scepc.TEMP
    execute store result storage sc_epc:stronghold z int 1 run scoreboard players get st.z scepc.TEMP

