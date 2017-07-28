Red [
    Title: "bilateral"
    File: %bilateral.red
    Author: Koba-yu    
]

#include %../libs/lepapi.red

bilateralize: function [
    pix
    return: [integer!]
] [
    pix: do-bilateral pix 5.0 10.0 10 1
]

write-result: function [path pix] [
    write-pix to-local-file path pix format/BMP
]

pix: read-pix to-local-file %./images/lena.bmp

pix: bilateralize pix
write-result %./images/lena-bilateral_1.bmp pix

pix: bilateralize pix
write-result %./images/lena-bilateral_2.bmp pix

pix: bilateralize pix
write-result %./images/lena-bilateral_3.bmp pix

pix: bilateralize pix
write-result %./images/lena-bilateral_4.bmp pix

pix: bilateralize pix
write-result %./images/lena-bilateral_5.bmp pix