set
t        "Time"  /1*36/
t1(t)  /1*12/
t2(t)  /13*24/
t3(t)  /25*36/
;


Parameter
LambdaD(t)   "Cost of domestic natural gas produced in India and assigned for power sector($/MMBTU)"
/
$include LambdaD.inc
/;

parameter
LambdaI(t)  "Cost of imported natural gas($/MMBTU)"
/
$include LambdaI.inc
/;

parameter
CapD(t)     "Capacity of NG that is assigned for power sector(MMcf)"
/
$include CD.inc
/;

scalar
Preq     "Required system power demand that should be supplied by NG(MW)"
/225000000/

CapI     "Capacity of pipelines for importing NG(MMcf)"
/6260000/

B_Y1     "The annual Budget that is assigned for importing NG for the purpose of power sector($)"
/2000000000/

B_Y2
/1500000000/

B_Y3
/2500000000/

eta
/0.65/

H
/10.55/
;

Positive variables
P(t)     "Total power generated in time t (MW)"
FD(t)   "The quantity of domestic NG in time t that is assigned to the power sector(MMcf)"
FI(t)   "The quantity of imported NG in time t that is assigned to the power sector(MMcf)";

variables Z      "Minimimun cost of using NG in power sector($)";

Equations
Eq0
Eq1(t)
Eq2
Eq3(t)
Eq4(t)
Eq5(t1)
Eq6(t2)
Eq7(t3)
;

Eq0.. Z=e=sum(t,LambdaD(t)*FD(t)+LambdaI(t)*FI(t));
Eq1(t)..   P(t)=e=0.028*eta*H*(FD(t)+FI(t));
Eq2..   sum(t,P(t))=g=Preq;
Eq3(t)..   FI(t)=l=CapI;
Eq4(t)..   FD(t)=l=CapD(t);
Eq5(t1)..  sum(t,LambdaI(t)*FI(t))=l=B_Y1;
Eq6(t2)..  sum(t,LambdaI(t)*FI(t))=l=B_Y2;
Eq7(t3)..  sum(t,LambdaI(t)*FI(t))=l=B_Y3;

Model Costmin /all/;

Solve Costmin using lp minimizing Z;

Display Z.l, P.l, FI.l, FD.l;








