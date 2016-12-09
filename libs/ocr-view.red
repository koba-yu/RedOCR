Red [
    Title: "ocr-view"
    File: %ocr-view.red
    Author: Koba-yu
    Needs: 'View
    Comments: {
        This code uses redCV (https://github.com/ldci/redCV)
        Image scaling function & UI is based on the redCV sample.
    }
]

; needs redCV library
#include %../../redCV/libs/redcv.red

margins: 10x10
factor: 1.0
drawBlk: []
img1: none

view [
    title "ocr-view"
    origin margins
    text "Image File"
    return
    file: field 400x30
    button "select..." [
        f: request-file/title "Select an image file."
        if f [file/text: to-string f]
    ]
    return
    sl1: slider 290 [
        sz/text: form face/data * 2
        factor:  0.005 + face/data * 2
    ]
	sz: field 50 "1.0"
    return 
    canvas: base 600x600 black react [
        if not none? file/text [
            clear drawBlk
            img1: rcvLoadImage to-red-file file/text
            drawBlk: rcvScaleImage factor
            append drawBlk [img1]
            drawBlk/2 0.005 + sl1/data * 2
            drawBlk/3 0.005 + sl1/data * 2
            face/draw: drawBlk
        ]
    ]	
    do [sl1/data: 0.5]
]