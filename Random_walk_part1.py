#Question 1

import numpy as np
import matplotlib.pyplot as pt
pt.style.use('ggplot')
Ns=100000 # Number of Steps
Nw= 1000 # Number of walkers
#diff = 0 # To calculate the Diffusion
Xfinal=[]
Xfinal2=[]
for i in range(Nw):
Xi=0
Xf=sum(np.random.uniform(-1,1,Ns))
Xfinal.append(Xf)
Xfinal2.append(Xf*Xf)
print(((sum(Xfinal2)/Nw)-(sum(Xfinal)/Nw)**2)/(2*Ns))

#Ans. 0.167819158518
