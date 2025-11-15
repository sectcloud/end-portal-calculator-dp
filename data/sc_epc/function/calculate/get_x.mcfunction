#> CALCULATE: st.x = kth0 - kth1 + y1 - y0:
    scoreboard players operation st.x scmth.TEMP = throw1.z scmth.TEMP
    scoreboard players operation st.x scmth.TEMP -= throw0.z scmth.TEMP
    scoreboard players operation st.x scmth.TEMP += kth0 scmth.TEMP
    scoreboard players operation st.x scmth.TEMP -= kth1 scmth.TEMP
    scoreboard players operation st.x scmth.TEMP *= 10000 scmth.CONST

#> CALCULATE: tan0 - tan1:
    scoreboard players operation tan0 scmth.TEMP -= tan1 scmth.TEMP

#> CALCULATE: st.x /= (tan0 - tan1):
    scoreboard players operation st.x scmth.TEMP /= tan0 scmth.TEMP
