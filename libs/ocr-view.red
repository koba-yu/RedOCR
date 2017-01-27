Red [
    Title: "ocr-view"
    File: %ocr-view.red
    Author: Koba-yu
    Needs: 'View
]

; include tessered
#include %tessered.red

margins: 10x10
factor: 1.0
draw-block: []
image: none
result: ""
default-tessdata: to-local-file clean-path %./tessdata

; Scaling function taught on the Red Google Group (https://groups.google.com/forum/#!topic/red-lang/IDA_EJOcJtE)
ScaleImage: function [
    factor [float!]
    return: [block!] "Returns a Draw block for image scaling"
][
	compose [scale (factor) (factor) image]
]

view [
    title "ocr-view"
    origin margins
    text "Image File"
    file: field 430x30
    button "select..." [
        f: request-file/title "Select an image file."
        if f [file/text: to-string f]
    ]
    return
    text "tessdata folder"
    tessdata: field 200x30 default-tessdata
    text "language"
    lang: field 100x30 "eng"
    button "OCR" [
        tess: make tessered! [
            settings/tessdata: tessdata/text
            settings/lang: lang/text
        ]
        result: tess/ocr-image file/text
        ocr-result/text: result
    ]
    zoom: slider 290 [
        size/text: form face/data * 2
        factor:  0.005 + face/data * 2
    ]
	size: field 50 "1.0"
    return 
    canvas: base 600x600 black react [
        if not none? file/text [
            clear draw-block
            image: load to-red-file file/text
            draw-block: ScaleImage factor
            append draw-block [image]
            draw-block/2 0.005 + zoom/data * 2
            draw-block/3 0.005 + zoom/data * 2
            face/draw: draw-block
        ]
    ]
    ocr-result: field 300x600
    do [zoom/data: 0.5]
]