summon marker 0.0 0.0 0.0 {Tags:["sc_trig_marker"]}
$execute as @e[tag=sc_trig_marker, limit=1] at @s run rotate @s -$(deg) 0.0
execute as @e[tag=sc_trig_marker, limit=1] at @s run rotate @s ~90 0.0
execute as @e[tag=sc_trig_marker, limit=1] at @s run summon marker ^ ^ ^1 {Tags:["sc_trig_marker_temp"]}
execute as @e[tag=sc_trig_marker_temp] run function sc_math:trig/save_vector
kill @e[tag=sc_trig_marker]
kill @e[tag=sc_trig_marker_temp]