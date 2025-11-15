$scoreboard players set throw0.x scmth.TEMP $(th0x)
$scoreboard players set throw1.x scmth.TEMP $(th1x)
$scoreboard players set throw0.z scmth.TEMP $(th0z)
$scoreboard players set throw1.z scmth.TEMP $(th1z)

$function sc_math:tan {deg:$(th0a)}
$execute store result score kth0 scmth.TEMP run data get storage sc_math:fn tan $(th0x)
$function sc_math:tan {deg:$(th1a)}
$execute store result score kth1 scmth.TEMP run data get storage sc_math:fn tan $(th1x)

$function sc_math:tan {deg:$(th0a)}
execute store result score tan0 scmth.TEMP run data get storage sc_math:fn tan 10000
$function sc_math:tan {deg:$(th1a)}
execute store result score tan1 scmth.TEMP run data get storage sc_math:fn tan 10000

scoreboard players operation st.x scmth.TEMP = throw1.z scmth.TEMP

scoreboard players operation st.x scmth.TEMP -= throw0.z scmth.TEMP
scoreboard players operation st.x scmth.TEMP += kth0 scmth.TEMP
scoreboard players operation st.x scmth.TEMP -= kth1 scmth.TEMP

tellraw @a ["", {score:{name:"tan0", objective:scmth.TEMP}}, " / ", {score:{name:"tan1", objective:scmth.TEMP}}]

scoreboard players operation tan0 scmth.TEMP -= tan1 scmth.TEMP

scoreboard players operation st.x scmth.TEMP *= 10000 scmth.CONST
scoreboard players operation st.x scmth.TEMP /= tan0 scmth.TEMP

execute store result storage sc_epc:stronghold x int 1 run scoreboard players get st.x scmth.TEMP

scoreboard players operation st.z scmth.TEMP = st.x scmth.TEMP

scoreboard players operation st.z scmth.TEMP -= throw0.x scmth.TEMP
execute store result storage sc_epc:stronghold temp int 1 run scoreboard players get st.z scmth.TEMP

$function sc_math:tan {deg:$(th0a)}
function sc_epc:temp with storage sc_epc:stronghold

scoreboard players operation st.z scmth.TEMP += throw0.z scmth.TEMP

execute store result storage sc_epc:stronghold z int 1 run scoreboard players get st.z scmth.TEMP