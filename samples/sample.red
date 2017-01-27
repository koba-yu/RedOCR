Red [
    Title: "tesseract sample"
    File: %sample.red
    Author: Koba-yu
]

#include %../libs/tessered.red

; make tessered object with default setting.
; It expects tessdata folder exists in the program executing folder.
; If you want to change tessdata folder, specify it in the spec block, as follows. 
; tess: make tessered [settings/tessdata: %"/C/Program Files (x86)/Tesseract-OCR"]
tess: make tessered! []

; Whole image OCR
text: tess/ocr-image %./images/test_eng.png
print ["result:" text ]

; OCR within the specified area by /rect refinement 
text: tess/ocr-image/rect %./images/test_eng.png 311 307 60 30
print ["result:" text ]
tess/dispose


; English is default OCR language. 
; you need to specify language if you do OCR in other languages.
tess: make tessered! [settings/lang: 'jpn]
text: tess/ocr-image %./images/test_jpn.png
print ["result:" text ]
tess/dispose