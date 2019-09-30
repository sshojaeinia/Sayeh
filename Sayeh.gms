set
t        "Time";

Parameter
C(t,D)   "Cost of domestic natural gas produced in India and assigned for power sector($/MMcf)"
C(t,I)   "Cost of imported natural gas($/MMcf)"
P(r)     "Required system power demand that should be supplied by NG(MW)"
V(p)     "Capacity of pipelines for importing NG(MMcf)"
V(e)     "Capacity of NG that is assigned for power sector(MMcf)"
B(t)     "The annual Budget that is assigned for importing NG for the purpose of power sector($)";

Positive variables
P(t)     "Total power generated in time t (MW)"
F(t,D)   "The quantity of domestic NG in time t that is assigned to the power sector(MMcf)"
F(t,I)   "The quantity of imported NG in time t that is assigned to the power sector(MMcf)";

variables Z      "Minimimun cost of using NG in power sector($)";

