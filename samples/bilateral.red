Red [
	Title:	"bilateral"
	File:	%bilateral.red
	Tabs:	4
	Author:	Koba-yu    
]

#include %../libs/redocr.red

write-result: function [path pix][
	redocr/save pix to-local-file path 'BMP
]

pix: redocr/read to-local-file %./images/lena.bmp

pix: redocr/do-bilateral pix
write-result %./images/lena-bilateral_1.bmp pix

pix: redocr/do-bilateral pix
write-result %./images/lena-bilateral_2.bmp pix

pix: redocr/do-bilateral pix
write-result %./images/lena-bilateral_3.bmp pix

pix: redocr/do-bilateral pix
write-result %./images/lena-bilateral_4.bmp pix

pix: redocr/do-bilateral pix
write-result %./images/lena-bilateral_5.bmp pix