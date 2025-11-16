#> PREPARE: Load angles of both throws into scores angle0 and angle1 and reset opp0 and opp1:
    execute store result score angle0 scepc.TEMP run data get storage sc_epc:throws th0a 10
    execute store result score angle1 scepc.TEMP run data get storage sc_epc:throws th1a 10
    scoreboard players set opp0 scepc.TEMP 0
    scoreboard players set opp1 scepc.TEMP 0

#> EXCEPTION: Check if angles are equal:
    #> CALCULATE: abs(angle0 - angle1) and save result in angle_diff:
        scoreboard players operation angle_diff scepc.TEMP = angle0 scepc.TEMP
        scoreboard players operation angle_diff scepc.TEMP -= angle1 scepc.TEMP

    #> CALCULATE: abs(angle_diff):
        execute store result storage sc_epc:temp x int 1 run scoreboard players get angle_diff scepc.TEMP
        function sc_math:abs with storage sc_epc:temp
        execute store result score angle_diff scepc.TEMP run data get storage sc_math:fn abs

    #> CHECK AND THROW EXCEPTION IF TRUE:
        execute if score angle_diff scepc.TEMP matches ..10 run return run function sc_epc:exception/angles_equal

#> EXCEPTION: Check if angles are opposite:
    #> Check if (angle0 * angle1) < 0 and save result in opp0:
        scoreboard players operation ang0 scepc.TEMP = angle0 scepc.TEMP
        scoreboard players operation ang0 scepc.TEMP *= angle1 scepc.TEMP
        execute if score ang0 scepc.TEMP matches ..-1 run scoreboard players set opp0 scepc.TEMP 1

    #> Check if abs(abs(abs(angle0) - 1800) - abs(angle1)) < 10 and save result in opp1:
        execute store result storage sc_epc:temp x int 1 run scoreboard players get angle0 scepc.TEMP
        function sc_math:abs with storage sc_epc:temp
        execute store result score at0 scepc.TEMP run data get storage sc_math:fn abs
        scoreboard players operation at0 scepc.TEMP -= 1800 scepc.CONST
        
        execute store result storage sc_epc:temp x int 1 run scoreboard players get at0 scepc.TEMP
        function sc_math:abs with storage sc_epc:temp
        execute store result score at0 scepc.TEMP run data get storage sc_math:fn abs
        
        execute store result storage sc_epc:temp x int 1 run scoreboard players get angle1 scepc.TEMP
        function sc_math:abs with storage sc_epc:temp
        execute store result score at1 scepc.TEMP run data get storage sc_math:fn abs
        
        scoreboard players operation at0 scepc.TEMP -= at1 scepc.TEMP
        
        execute store result storage sc_epc:temp x int 1 run scoreboard players get at0 scepc.TEMP
        function sc_math:abs with storage sc_epc:temp
        execute store result score anx scepc.TEMP run data get storage sc_math:fn abs
        
        execute if score anx scepc.TEMP matches ..10 run scoreboard players set opp1 scepc.TEMP 1

    #>CHECK AND THROW EXCEPTION IF TRUE: opp0 == 1 && opp1 == 1
        execute if score opp0 scepc.TEMP matches 1 if score opp1 scepc.TEMP matches 1 run return run function sc_epc:exception/angles_opposite

#> PROCEED TO CALCULATION:
    function sc_epc:calculate/main with storage sc_epc:throws
    function sc_epc:chat/success/stronghold_found
    tag @s remove epc.first_throw
    tag @s remove epc.second_throw