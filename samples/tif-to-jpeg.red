Red [
	Title:	"tif to jpeg sample"
	File:	%tif-to-jpeg.red
	Tabs:	4
	Author:	Koba-yu
]

#include %../libs/redocr.red

ret: redocr/to-jpeg %./images/test_tif.tif %./images/test_jpg.jpg 75
print ret