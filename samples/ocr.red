Red [
	Title:	"ocr sample"
	File:	%sample.red
	Tabs:	4
	Author:	Koba-yu
]

#include %../libs/redocr.red

; By default, redocr expects tessdata folder exists in the program executing folder.
; If you want to change tessdata folder, specify it in the spec block, as follows. 
; ocrda [settings/tessdata: %"/C/Program Files (x86)/Tesseract-OCR"]

; Whole image OCR
text: redocr/ocr %./images/test_eng.png
print ["result:" text]

; OCR within the specified area by /rect refinement 
text: redocr/ocr/rect %./images/test_eng.png 311 307 60 30
print ["result:" text]

; English is default OCR language. 
; you need to specify language if you do OCR in other languages.
redocr/lang: "jpn"

; By default, redocr expects tessdata folder exists in the program executing folder.
; If you want to change tessdata folder, specify it in the spec block, as follows. 
redocr/tessdata: %./tessdata
text: redocr/ocr %./images/test_jpn.png
print ["result:" text]