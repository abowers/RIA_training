# -*- coding: utf-8 -*-
# <nbformat>3.0</nbformat>

# <codecell>

#Exercise 1
d = {'Ariel':21, 'Alana':19}
print d

# <codecell>

#Exercise 2
a = 'Ariel'
b = 'sister'
c = 3
d = 'younger'

print 'My name is {} and I have a {} who is {} years {} than me.' .format(a,b,c,d)

# <codecell>

#Exercise 3
help()

# <headingcell level=1>

# Ariel Bowers - Python Training

# <codecell>

#Exercise 4
a = range(10)
for x in a: 
    print x ** 2

# <codecell>

#Exercise 5
a = range(1,4,1)
for x in a:
    print '2001-0{}-01' .format(x)

# <codecell>

#Exercise 6
a = range(7)
for x in a:
    try:
        print 1./x
    except ZeroDivisionError:
        print 'This division does not work, dividing by zero.', x

# <codecell>

#Exercise 7
import glob
datadir = '/Users/abowers/Desktop/Training/Python/'
glob.glob(datadir + '*.py')

# <codecell>

#Exercise 8 & 9
import numpy as np
a = [1,2,3,4]
b = np.array(a)
# The list duplicates itself inside the list and the arrray multiplies each element by two.
print a * 2
print b * 2
# The list cannot perform to addition because two different types cannot be added together and the array add two to each element.
#print a + 2
print b + 2
#When c is added to the list it is appended to the end and in the array the elements are added together
c = [10,20,30,40]
print a + c
print b + c

# <codecell>

#Exercise 10
print np.arange(1,15,dtype=float)*0.1

# <codecell>

#Exercise 11
print np.arange(32,9,-2,dtype=float)*-0.1

# <codecell>

import numpy as np
infile = '/Users/abowers/Desktop/Training/Python/Gordon2005_Fig16.txt'
data = np.loadtxt(infile)
print data
print 'Data Shape: ', data.shape
slope, ran_slope_unc, corr_slope_unc, both_slope_unc, eqn_slope_unc, ran_yint_unc, corr_yint_unc, both_yint_unc, eqn_yint_unc = np.loadtxt(infile, unpack=True)
print 'Slope: ', slope
print 'Slope Shape: ', slope.shape
yint_data = np.loadtxt(infile, usecols=(0,5,6,7,8))
print 'Y-intercept data only: ', yint_data
print 'Yint data shape: ', yint_data.shape
yint_data2 = np.loadtxt(infile, usecols=(0,5,6,7,8), unpack=True)
print 'Yint data shape with unpack: ', yint_data2.shape

# <codecell>

import numpy as np
import matplotlib.pyplot as plt

infile = '/Users/abowers/Desktop/Training/Python/Gordon2005_Fig16.txt'
slope, ran_slope_unc, corr_slope_unc, both_slope_unc, eqn_slope_unc = np.loadtxt(infile, usecols=(0,1,2,3,4), unpack=True)
xx = slope
yy1 = ran_slope_unc
yy2 = corr_slope_unc
yy3 = both_slope_unc
yy4 = eqn_slope_unc

figure, ax = plt.subplots()
#ax.plot(xx, yy1, ls='--', color='b')
#ax.plot(xx, yy2, ls=':', color='r')
#ax.plot(xx, yy3, ls='-', color='g')
#ax.plot(xx, yy4, ls='-.', color='m')

ax.set_xlabel('Slope [e-/s]')
ax.set_ylabel('Slope Uncertainty [e-/s]')
#ax.plot(xx, yy1, ls='--', color='b', label='Random Unc.')
#ax.plot(xx, yy2, ls=':', color='r', label='Correlated Unc.')
#ax.plot(xx, yy3, ls='-', color='g', label='Both')
#ax.plot(xx, yy4, ls='-.', color='m', label='Equation')

ax.loglog(xx, yy1, ls='--', lw =3, color='b', label='Random Unc.')
ax.loglog(xx, yy2, ls=':', lw =3, color='r', label='Correlated Unc.')
ax.loglog(xx, yy3, ls='-', lw =3, color='g', label='Both')
ax.loglog(xx, yy4, ls='-.', lw =3, color='m', label='Equation')
ax.legend(loc='best')
#figure.show()
figure.savefig('fig16.pdf')
figure.clf()

# <codecell>

#Exercise 15
import numpy
numpy.__version__
#numpy.__author__
#The version of NumPy I'm running is 1.6.2 and there is no author listed.

# <codecell>

#Exercise 18
# Instance = area
# Attribute = side
# Method = GetArea
# Function = __int__()

# <codecell>

#Exercise 19
import pyfits
class FitsClass(object):
    def __int__(self,f):
        self.filename = f
        self.header = hdr
        self.data = dat
    def SaveFits(self, outfits):
        pyfits.writeto(outfits, self.dat, self.hdr)
        return
        

# <codecell>


