#from svgpathtools import svg2paths
#import numpy as np
#
# this code extracts d tags out of an svg file
#paths, attributes = svg2paths('multipathtest.svg')
#
#for k, v in enumerate(attributes):
#        print (v['d'])
#

import numpy as np
import matplotlib.pyplot as plt
from scipy import arange

#the code below is testing out the bezierpull function
coord1 = np.array([0,0])
coord2 = np.array([1.7, -10.9])
coord3 = np.array([26.4, -3.8])
coord4 = np.array([27.2, 14.5])

def bezierpull(coord1, coord2, coord3, coord4, t):
    P_0 = ((1 - t) * coord1) + (t * coord2)
    P_1 = ((1 - t) * coord2) + (t * coord3)
    P_2 = ((1 - t) * coord3) + (t * coord4)

    D_0 = ((1 - t) * P_0) + (t * P_1)
    D_1 = ((1 - t) * P_1) + (t * P_2)

    R_0 = ((1 - t) * D_0) + (t * D_1)

    return R_0;

for t in arange(0.0, 1.01, .01):
    currCoord = bezierpull(coord1, coord2, coord3, coord4, t)
    print(t, '> ', currCoord)
