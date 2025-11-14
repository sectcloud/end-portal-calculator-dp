$function sc_math:trig/main {deg:$(deg)}

execute store result storage sc_math:temp x int 1 run data get storage sc_math:vector x 1000000000
execute store result storage sc_math:temp z int 1 run data get storage sc_math:vector z 100000
execute store result score x scmth.TEMP run data get storage sc_math:temp x
execute store result score z scmth.TEMP run data get storage sc_math:temp z
scoreboard players operation x scmth.TEMP /= z scmth.TEMP
execute store result storage sc_math:fn tan double 0.0001 run scoreboard players get x scmth.TEMP