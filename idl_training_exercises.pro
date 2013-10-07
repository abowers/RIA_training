pro idl_training_exercises

; Section 2.3
;The second print statement prints the division as a float.

;Exercise 2.1
print, "Exercise 2.1:"
print, findgen(15,start=1) * 0.1
print
print

;Exercise 2.2
print, "Exercise 2.2:"
print, findgen(16, start=1) * (-0.2)
print
print

;Exercise 2.3
print, "Exercise 2.3:"
a = fltarr(2,3)
a[0,0]=10
a[0,1]=10
a[0,2]=10
a[1,0]=10
a[1,2]=10
a[1,1]=10
print, a
print

;Exercise 2.4
print, "Exercise 2.4:"
a = fltarr(3,3)
a[0,0]=14
a[0,1]=90
a[0,2]=10
a[1,0]=7
a[1,2]=1
a[1,1]=12
a[2,2]=4
a[2,0]=6
a[2,1]=10

b= fltarr(3,3)
b[0,0]=12
b[0,1]=5
b[0,2]=9
b[1,0]=67
b[1,2]=17
b[1,1]=3
b[2,2]=2
b[2,0]=11
b[2,1]=14
print, a
print
print, b
print, "a+b:"
print, a+b
print, "a/b:"
print, a/b
print, "a*b:"
print, a*b
print
print

;Exercise 2.5
print, "Exercise 2.5:"
print, a
print
print, invert(a)
print
print

;Exercise 2.6
print, "Exercise 2.6:"
a = randomn(1,1000)
print, a
b = where(a lt 0.5 and a gt -0.5,count)
print
print, "Count:", count
print, a[b]
print
print

;Exercise 2.7
print, "Exercise 2.7:"
str = "j12345678_flt.fits"
print, strmid(str,0,9)
print
print

;Exercise 2.8
print, "Exercise 2.8:"
a = [4,3,7,1,2]
b = reverse(a[sort(a)])
print, b
print
print

;Exercise 2.9
print, "Exercise 2.9:"
a = randomn(10,1000)
momt = moment(a)
print, "Mean: ", momt[0] 
print, "Variance: ", momt[1]
print, "Skewness: ", momt[2]
print, "Kurtosis: ", momt[3]
print
print

;Exercise 2.10
print, "Exercise 2.10:"
path = "/Users/abowers/Desktop/Training/IDL/"
readcol, path + "infile.txt", ra, dec, totMag, format = "F,F,F"
print, "Ra: ", ra
print, "Dec: ", dec
print, "TotalMag: ", totMag
print
print

;Exercise 2.11
print, "Exercise 2.11"
forprint, totMag, dec, ra, textout = path + "output.txt"
print 
print

;Exercise 2.12
print, "Exercise 2.12"
;spawn, "ds9 -frame 1 u9w10107m_drz.fits &"
;spawn, "ds9 -frame 2 j8hm01xaq_flt.fits &"
print
print

;Exercise 2.13
print, "Exercise 2.13"
;spawn, "ds9 -frame 3 -multiframe -blink interval 1 j91c12biq_flt.fits"
print
print

;Exercise 2.14
print, "Exercise 2.14:"
nic = mrdfits(path + "n8ws10siq_ima.fits", 1, hdr)
help, nic, /str
print
print

;Exercise 2.15
print, "Exercise 2.15:"
set_plot, "ps"
plot_left=8
plot_bottom=15
xsize=10.
ysize=10.
page_height=27.94
page_width=21.59
psname=path + "plot.ps"

device, $
filename=psname, $
xsize=page_width, $
ysize=page_height, $
xoffset=0, $
yoffset=0, $
scale_factor=1.0, $
/portrait

image = mrdfits(path + "ib6w71lxq_flt.fits", 4, head)
image = image[2000:2699,700:1399]
data = 255b-bytscl(image, min=0.,max=30.)
cgimage,data, position = [plot_left/page_width, plot_bottom/page_height,(plot_left+xsize)/page_width,(plot_bottom+ysize)/page_height]
device,/close
print
print

;Exercise 2.16
print, "Exercise 2.16:"
hdr = headfits(path + "ib6w71lxq_flt.fits", exten=0)
help,hdr
;print, hdr
print
print

;Exercise 2.17
print, "Exercise 2.17"
print, "Filter: ", sxpar(hdr,"FILTER")
print, "Bias: ", sxpar(hdr,"BIASCORR")
print, "DarkFile: ", sxpar(hdr,"DARKFILE")
print, "Gain D: ",sxpar(hdr,"ATODGND")
print
print

;Exercise 2.18
print, "Exercise 2.18:"
for k = 1,10 do begin
  print, k, k^2
endfor
print
print

;Exercise 2.19
print, "Exercise 2.19:"
for k=1,4 do begin 
  print, '2001',"-0",strtrim(k,2),"-01"
endfor
print
print

;Exercise 2.20
print, "Exercise 2.20:"
;for k=1,4 do begin
  set_plot,"x"
  wfpc2 = mrdfits(path + "n8ws10siq_ima.fits",1, hdr)
  data = bytscl(wfpc2,min=0.,max=30.)
  cgimage,data,/keep_aspect_ratio
;endfor
print
print


;Exercise 2.22
print, "Exercise 2.22:"
root = ["j12345678","u12345678","n12345678","i12345678","l12345678"]
for k=0,4 do begin
  x = 0
  case x of
    strpos(root[k], "j"):print,"ACS"
    strpos(root[k], "i"):print,"WFC3"
    strpos(root[k], "l"):print, "COS"
    strpos(root[k], "u"):print, "WFPC2"
    strpos(root[k], "n"):print, "NICMOS"
    endcase
endfor
print
print

;Exercise 2.23
print, "Exercise 2.23:"
print
print, "function area,rad"
print, "return, ((2*!PI)*(rad^2))"
print, "end"
print
print

;Exercise 2.24
print, "Exercise 2.24:"
print
print,"function line, p1,p2"
print, "rise = p2[1]-p1[1]"
print, "run = p2[0]-p1[0]"
print, "if run eq 0 then begin"
  print, "return, 'Vertical line case'"
print, "endif"
print, "slope = rise/run"
print, "y_int = p2[1]-(slope*p2[0])"
print, "return, slope, y_int"
print
print

;Exercise 3.1
print, "Exercise 3.1:"
set_plot, "ps"
pltname = path + "plot2.ps"
page_height=27.94
page_width=21.59
plot_left=5
plot_bottom=5
xsize=14.
ysize=10.

device, $
  filename=pltname, $
  xsize=page_width, $
  ysize=page_height, $
  xoffset=0, $
  yoffset=0, $
  scale_factor=1.0, $
  /portrait

x = findgen(2001) * 0.1  
y = exp(x)
u = x^2

cgplot, x, y*u, $
  /noerase, /nodata, $
  xrange = [0,5], $
  yrange = [0,4000], $
  xstyle = 1, ystyle = 1, $
  color = cgcolor("black"), $
  xtitle = "X Axis", ytitle = "Y Axis", $
  position = [plot_left/page_width, plot_bottom/page_height,(plot_left+xsize)/page_width,(plot_bottom+ysize)/page_height]
  
oplot, x, y*u, color = cgcolor("red")

device,/close
cgps2pdf, pltname
print
print

;Exercise 3.2
print, "Exercise 3.2:"
set_plot, "ps"
plname = path + "plot3.ps"
page_height=27.94
page_width=21.59


device, $
  filename=plname, $
  xsize=page_width, $
  ysize=page_height, $
  xoffset=0, $
  yoffset=0, $
  scale_factor=1.0, $
  /portrait

plot_left=5
plot_bottom=5
xsize=5.
ysize=5.
  
x = findgen(2001) * 0.1
y = exp(x)
u = x^2
z = sin(x)

cgplot, x, y*u, $
  /noerase, /nodata, $
  xrange = [0,5], $
  yrange = [0,4000], $
  xstyle = 1, ystyle = 1, $
  color = cgcolor("black"), $
  xtitle = "X Axis", ytitle = "Y Axis", $
  position = [plot_left/page_width, plot_bottom/page_height,(plot_left+xsize)/page_width,(plot_bottom+ysize)/page_height]
  
oplot, x, y*u, color = cgcolor("red")
;--
plot_left=10.5
plot_bottom=5
xsize=5.
ysize=5.

cgplot, x, z, $
  /noerase, /nodata, $
  xrange = [0,50], $
  yrange = [0,4000], $
  xstyle = 1, ystyle = 1, $
  color = cgcolor("black"), $
  xtitle = "X Axis", $
  ytickname = replicate(" ",60), $
  position = [plot_left/page_width, plot_bottom/page_height,(plot_left+xsize)/page_width,(plot_bottom+ysize)/page_height]
  
oplot, x, z, psym = 4, symsize = 0.5, color = cgcolor("orange")
;--
plot_left=15.5
plot_bottom=5
xsize=5.
ysize=5.

cgplot, x, z*u, $
  /noerase, /nodata, $
  xrange = [0,50], $
  yrange = [0,4000], $
  xstyle = 1, ystyle = 1, $
  color = cgcolor("black"), $
  xtitle = "X Axis", $
  ytickname = replicate(" ",60), $
  position = [plot_left/page_width, plot_bottom/page_height,(plot_left+xsize)/page_width,(plot_bottom+ysize)/page_height]
  
oplot, x, z*u, psym = 3, symsize = 0.5, color = cgcolor("purple")

device,/close
cgps2pdf, plname
print
print

;Exercise 3.3
print, "Exercise 3.3:"
set_plot, "ps"
phname = path + "plot4.ps"
page_height=27.94
page_width=21.59
plot_left=3
plot_bottom=5
xsize=10.
ysize=10.

device, $
  filename=phname, $
  xsize=page_width, $
  ysize=page_height, $
  xoffset=0, $
  yoffset=0, $
  scale_factor=1.0, $
  /portrait
  
readcol, path+ "ngc4214_336.dat", vector

cghistoplot, vector, $
  binsize = 0.5, $
  charsize = 0.5, $
  xrange = [15,30], $
  yrange = [0,4000], $
  polycolor = "red", $
  datacolorname = "dark red", $
  xstyle = 9, ystyle = 1, $
  xcharsize = 2.5, $
  ycharsize = 2.5, $
  /normal, $
  position = [plot_left/page_width, plot_bottom/page_height,(plot_left+xsize)/page_width,(plot_bottom+ysize)/page_height]
  
device,/close
cgps2pdf, phname
print
print

;Exercise 3.3
print, "Exercise 3.3:"
set_plot, "ps"
pcname = path + "plot5.ps"
page_height=27.94
page_width=21.59
plot_left=4
plot_bottom=5
xsize=14.
ysize=14.

device, $
  filename=pcname, $
  xsize=page_width, $
  ysize=page_height, $
  xoffset=0, $
  yoffset=0, $
  scale_factor=1.0, $
  /portrait

image = mrdfits(path + "m101_blue.fits",0,hdr)
image = image[300:800,300:800]
data = 255b-bytscl(image, min=0.0, max = 1800)
cgloadct, 3, ncolors = 256, bottom=0, clip=[90,200]
tvlct, redvector, greenvector, bluevector, /get

tam=size(image,/dim)
contour_x = findgen(tam[0])
contour_y = findgen(tam[1])

cgcontour, image, contour_x, contour_y, $
  levels = [8000,12000, 14000], $
  xstyle = 1, ystyle = 1, $
  axiscolor = "black", $
  label = 0, $
  xtickformat="(a1)", ytickformat="(a1)", $
  c_colors = cgcolor("green"),/noerase, $
  position = [plot_left/page_width, plot_bottom/page_height,(plot_left+xsize)/page_width,(plot_bottom+ysize)/page_height]
  
device,/close
cgps2pdf, pcname
print
print

;Exercise 4.1
print, "Exercise 4.1:"
im = mrdfits(path + "j8hm01xaq_flt.fits",1,hdr) 
help,im

;Exercise 4.2
print, "Exercise 4.2"
head = headfits(path + "j8hm01xaq_flt.fits", exten=0)
print, sxpar(head, "DATE")
print, sxpar(head, "PR_INV_L")
print, sxpar(head, "EXPTIME")
print
print

;Exercise 4.3
print, "Exercise 4.3:"
set_plot, "ps"
ppname = path + "photometry_01.ps"
page_height=27.94
page_width=21.59
plot_left=5
plot_bottom=5
xsize=14.
ysize=14.

device, $
  filename=ppname, $
  xsize=page_width, $
  ysize=page_height, $
  xoffset=0, $
  yoffset=0, $
  scale_factor=1.0, $
  /portrait
  
image = mrdfits(path + "j8hm01xaq_flt.fits",4,hdr)
image500 = image[900:1399,800:1299]
data = 255b-bytscl(image500, min=1, max = 40)
ss = size(data,/dimensions)
cgloadct, 0
tvlct, redvector, greenvector, bluevector, /get

cgimage, data, position = [plot_left/page_width, plot_bottom/page_height,(plot_left+xsize)/page_width,(plot_bottom+ysize)/page_height]

cgplot, [0], [0], $
  xcharsize = 1, ycharsize = 1, $
  thick = 2, $
  xrange = [0,ss[0]], $
  yrange = [0,ss[1]], $
  xstyle = 1, ystyle = 1, $
  color = cgcolor("black"), $
  xtitle = "X Pixels", ytitle = "Y Pixels", $
  /normal, /noerase, /nodata, $
  position = [plot_left/page_width, plot_bottom/page_height,(plot_left+xsize)/page_width,(plot_bottom+ysize)/page_height]
  
find, image500, xcoo, ycoo

oplot, [xcoo], [ycoo], color = cgcolor("red"), psym = cgsymcat(9)
  
device,/close
cgps2pdf, ppname
print
print

;Exercise 4.4
print, "Exercise 4.4:"
print, " If you omit /flux the results will be in magnitude units instead of flux."
print
print

;Exercise 4.5
print, "Exercise 4.5:"
aper, image500, xcoo, ycoo, flux, eflux, sky, skyerr, /flux
print
print

;Exercise 4.6
print, "Exercise 4.6:"
set_plot, "ps"
pfname = path + "plot_flux.ps"
page_height=27.94
page_width=21.59
plot_left=5
plot_bottom=5
xsize=14.
ysize=14.

device, $
  filename=pfname, $
  xsize=page_width, $
  ysize=page_height, $
  xoffset=0, $
  yoffset=0, $
  scale_factor=1.0, $
  /portrait

cgplot, eflux, flux, $
  /noerase, /nodata, $
  xrange = [0,5], $
  yrange = [0,1000], $
  xstyle = 1, ystyle = 1, $
  color = cgcolor("black"), $
  xtitle = "Flux Error", ytitle = "Flux", $
  position = [plot_left/page_width, plot_bottom/page_height,(plot_left+xsize)/page_width,(plot_bottom+ysize)/page_height]
  
oplot, x, y*u, color = cgcolor("blue"), psym = cgsymcat(16)

device,/close
cgps2pdf, pfname
print
print

;Exercise 5.2
print, "Exercise 5.2:"
print
print, "They are given in degrees."
cube = readfits(path + "ngc4151_hband.fits", hdr, exten = 1)
;help, cube
crpix1 = sxpar(hdr, "CRPIX1")
cdelt1 = sxpar(hdr, "CDELT1")
crval1 = sxpar(hdr, "CRVAL1")
cunit1 = sxpar(hdr, "CUNIT1")

pixel = findgen(2040)+1.0
lambda = crval1 + (pixel - crpix1)*cdelt1
;--
crpix2 = sxpar(hdr, "CRPIX2")
cdelt2 = sxpar(hdr, "CDELT2")
crval2 = sxpar(hdr, "CRVAL2")
cunit2 = sxpar(hdr, "CUNIT2")

pixel2 = findgen(2040)+1.0
lambda2 = crval2 + (pixel2 - crpix2)*cdelt2
print
print

;Exercise 5.3
print, "Exercise 5.3:"

;Exercise 6.1
print, "Exercise 6.1:"
readcol, path + "hubble.dat", distance, vel
coeff = linfit(distance, vel, sigma=sig, yfit = y_fit)
print, "Hubble constant= ", coeff[1], "km/(sec*Mpc)"
print, "Error= ", sig
print
print

;Exericse 6.2
print, "Exercise 6.2:"
set_plot, "ps"
phbname = path + "plot_hubble.ps"
page_height=27.94
page_width=21.59
plot_left=5
plot_bottom=5
xsize=14.
ysize=14.

device, $
  filename=phbname, $
  xsize=page_width, $
  ysize=page_height, $
  xoffset=0, $
  yoffset=0, $
  scale_factor=1.0, $
  /portrait
  
cgplot, distance, vel, $
  /noerase, $
  xrange = [0,20], $
  yrange = [0,2000], $
  xstyle = 1, ystyle = 1, $
  color = cgcolor("black"), $
  psym = cgsymcat(16), $
  xtitle = "Distance", ytitle = "Velocity", $
  position = [plot_left/page_width, plot_bottom/page_height,(plot_left+xsize)/page_width,(plot_bottom+ysize)/page_height]
  
oplot, distance, y_fit, color = cgcolor("blue")

device,/close
cgps2pdf, phbname
print
print


;Exercise 6.3
print, "Exercise 6.3:"
spec = mrdfits(path + "o5bn02010_x1d.fits", 1, hdr)
wave = spec.wavelength 
flux = spec.flux

wave = spec.wavelength
flux = spec.flux

i = sort(wave)
swave = wave[i]
sflux = flux[i]

scaled_sflux = sflux /1e-13
wline = swave[34610: 34900]
fline = scaled_sflux[34610: 34900]
fit = gaussfit(wline, fline, coeff, nterms =3)

print, "A = " , coeff[0] 
print, "B = " , coeff[1]
print, "C = " , coeff[2]
print, "FWHM= ", 2*SQRT(2*ALOG(2))*coeff[2]
print

;Exercise 6.4
print,"Exercise 6.4:"
set_plot, "ps"
pspname = path + "plot_spec.ps"
page_height=27.94
page_width=21.59
plot_left=5
plot_bottom=5
xsize=14.
ysize=14.

device, $
  filename=pspname, $
  xsize=page_width, $
  ysize=page_height, $
  xoffset=0, $
  yoffset=0, $
  scale_factor=1.0, $
  /portrait
  
cgplot, wline, fline, $
  /noerase, $
  xrange = [1547.0,1549.0], $
  yrange = [-1,12], $
  xstyle = 1, ystyle = 1, $
  color = cgcolor("blue"), $
  thick = 3, $
  xtitle = "Wavelength", ytitle = "Flux", $
  position = [plot_left/page_width, plot_bottom/page_height,(plot_left+xsize)/page_width,(plot_bottom+ysize)/page_height]
  
oplot, wline, fit, color = cgcolor("red"), linestyle=2, thick=3

device,/close
cgps2pdf, pspname
print
print


end