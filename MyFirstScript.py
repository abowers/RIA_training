#! /usr/bin/env python

#Header

__author__ = 'Ariel B'
__version__ = 0.2


import numpy as np
import matplotlib.pyplot as plt
import argparse
import pdb

def mkplot(outfile,xx,yy1,yy2,yy3,yy4,ylab='Slope Unc. [e-/s]'):
    figure, ax = plt.subplots()
    
    ax.set_xlabel('Slope [e-/s]')
    ax.set_ylabel('Slope Uncertainty [e-/s]')
    ax.plot(xx, yy1, ls='--', color='b', label='Random Unc.')
    ax.plot(xx, yy2, ls=':', color='r', label='Correlated Unc.')
    ax.plot(xx, yy3, ls='-', color='g', label='Both')
    ax.plot(xx, yy4, ls='-.', color='m', label='Equation')
    ax.legend(loc='best')
    #figure.show()
    figure.savefig(outfile)
    figure.clf()
    print 'Saved file to: ', outfile
    return

if __name__=='__main__':
    pdb.set_trace()
    parser = argparse.ArgumentParser(description='Make a plot.')
    parser.add_argument('-f','--file', default='Gordon2005_Fig16.txt', type=str, help='Input file.')
    options = parser.parse_args()

    infile = options.file
    slope_outfile = 'fig16_slope.pdf'
    yint_outfile = 'fig16_yint.pdf'
    slope, ran_slope_unc, corr_slope_unc, both_slope_unc, eqn_slope_unc, ran_yint_unc, corr_yint_unc, both_yint_unc, eqn_yint_unc = np.loadtxt(infile, unpack=True)
    #slope, ran_slope_unc, corr_slope_unc, both_slope_unc, eqn_slope_unc = np.loadtxt(infile, usecols=(0,1,2,3,4), unpack=True)
    mkplot(slope_outfile,slope, ran_slope_unc, corr_slope_unc, both_slope_unc, eqn_slope_unc)
    mkplot(yint_outfile, ran_yint_unc, corr_yint_unc, both_yint_unc, eqn_yint_unc, ylab='Y-Intercept Unc. [e-]')