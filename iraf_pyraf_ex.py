#! /usr/bin/env python

'''
ABOUT:
Show how python can be used to execute IRAF/PyRAF tasks.
    
AUTHOR:
A.Bowers, 2013

'''

import pyraf, os, glob
from pyraf import iraf
from iraf import noao, digiphot, daophot

#iraf.daofind(image = 'n9vf01hfq_ima.fits[1]')

#Generate a list of all the fits files
file_list = glob.glob('*_ima.fits')
print file_list

#Loops through all the .fits files
for file in file_list:
#Test for old files, and remove them if they exist
    file_query = os.access(file + '1.coo.1', os.R_OK)
    if file_query ==True:
        os.remove(file + '1.coo.1')
#Run daofind on one image
    iraf.daofind(image = file +'[1]', interactive = 'no', verify = 'no')
    iraf.daofind.unlearn()
    iraf.unlearn('daofind')