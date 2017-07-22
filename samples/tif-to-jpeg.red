Red [
    Title: "tif to jpeg sample"
    File: %tif-to-jpeg.red
    Author: Koba-yu
]

#include %../libs/redocr.red

ret: redocr/to-jpeg %./images/test_tif.tif %./images/test_jpg.jpg
print ret