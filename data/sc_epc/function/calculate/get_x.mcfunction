#> CALCULATE: st.x = kth0 - kth1 + throw1.z - throw0.z:
    scoreboard players operation st.x scepc.TEMP = kth0 scepc.TEMP
    scoreboard players operation st.x scepc.TEMP -= kth1 scepc.TEMP
    scoreboard players operation st.x scepc.TEMP += throw1.z scepc.TEMP
    scoreboard players operation st.x scepc.TEMP -= throw0.z scepc.TEMP
    scoreboard players operation st.x scepc.TEMP *= 10000 scepc.CONST

#> CALCULATE: tan0 - tan1:
    scoreboard players operation tan0 scepc.TEMP -= tan1 scepc.TEMP

#> CALCULATE: st.x /= (tan0 - tan1):
    scoreboard players operation st.x scepc.TEMP /= tan0 scepc.TEMP