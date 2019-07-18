#Random walk on real axis
#-Mean and error estimate calculation

import numpy as np
import matplotlib.pyplot as plt
plt.style.use('ggplot')
from math import *
Ns=10000 # Number of Steps
Nw= 100 # Number of walkers
Nsample=100
D=[]
D2=[]
for t in range(Nsample):
  Xfinal=[]
  Xfinal2=[]
for i in range(Nw):
  Xi=0
  Xf=sum(np.random.uniform(-1,1,Ns))
Xfinal.append(Xf)
Xfinal2.append(Xf*Xf)
D.append(((sum(Xfinal2)/Nw)-(sum(Xfinal)/Nw)**2)/(2*Ns))
D2.append((((sum(Xfinal2)/Nw)-(sum(Xfinal)/Nw)**2)/(2*Ns))**2)

plt.hist(D, bins='auto')
plt.xlabel('Diffusion')
plt.ylabel('Frequency')
plt.show()
Mean = (sum(D))/Nsample
Error = sqrt((((sum(D2)/Nw)-(sum(D)/Nw)**2)))/sqrt(Nsample)
print(Mean, Error)

#Ans: (0.1661818634144597, 0.00022881575943505862)
