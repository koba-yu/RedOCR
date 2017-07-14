Red [
    Title: "tif to jpeg sample"
    File: %tif-to-jpeg.red
]

#include %../libs/tessered.red

tess: make tessered []
ret: tess/to-jpeg %./images/test_tif.tif %./images/test_jpg.jpg
print ret