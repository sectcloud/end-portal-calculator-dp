summon marker 0.0 0.0 0.0 {Tags:["sc_trig_marker"]}
$data modify storage sc_math:temp deg set value $(deg)f

#> NORMALIZE DEGREES:
    execute store result score deg_m10 scmth.TEMP run data get storage sc_math:temp deg 10
    scoreboard players operation deg_m10 scmth.TEMP *= -1 scmth.CONST

execute store result storage sc_math:temp deg float 0.1 run scoreboard players get deg_m10 scmth.TEMP

execute as @e[tag=sc_trig_marker, limit=1] at @s run function sc_math:trig/rotate_marker with storage sc_math:temp
execute as @e[tag=sc_trig_marker, limit=1] at @s run summon marker ^ ^ ^1 {Tags:["sc_trig_marker_temp"]}
execute as @e[tag=sc_trig_marker_temp] run function sc_math:trig/save_vector
kill @e[tag=sc_trig_marker]
kill @e[tag=sc_trig_marker_temp]