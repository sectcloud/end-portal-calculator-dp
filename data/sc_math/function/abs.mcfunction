$scoreboard players set abs scmth.TEMP $(x)
execute if score abs scmth.TEMP matches ..-1 run scoreboard players operation abs scmth.TEMP *= -1 scmth.CONST
execute store result storage sc_math:fn abs int 1 run scoreboard players get abs scmth.TEMP
tellraw @a ["", {storage:"sc_math:fn", nbt:"abs"}]