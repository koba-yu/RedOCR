Red [
    Title: "ocr-view"
    File: %ocr-view.red
    Author: Koba-yu
    Needs: 'View
]

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
    button "select..." [file/text: to-string request-file/title "Select an image file."]
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
            face/size: img1/size
            face/draw: drawBlk
        ]
    ]	
    do [sl1/data: 0.5]
]