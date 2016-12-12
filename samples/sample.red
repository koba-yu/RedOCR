Red [
    Title: "tesseract sample"
    File: %sample.red
    Author: Koba-yu
]

#include %../libs/tessered.red

; make tessered object with default setting.
; It expects tessdata folder exists in the program executing folder.
tess: make tessered! []

; If you want to change tessdata folder, specify it in the spec block, as follows. 
; tess: make tessered [settings/tessdata: %"/C/Program Files (x86)/Tesseract-OCR"]

text: tess/ocr-image %./images/test_eng.png
print ["result:" text ]

; English is default OCR language. 
; you need to specify language if you do OCR in other languages.
tess: make tessered! [settings/lang: 'jpn]
text: tess/ocr-image %./images/test_jpn.png
print ["result:" text ]