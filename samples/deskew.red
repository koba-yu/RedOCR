Red [
    Title: "deskew an image"
    File: %deskew.red
    Author: Koba-yu
]

#include %../libs/lepapi.red

pix: read to-local-file %./images/skewed-image.jpg
pix: deskew pix
write-jpeg to-local-file %./images/deskewed-image.jpg pix