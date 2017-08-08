Red [
	Title: "ocr-view"
	File: %ocr-view.red
	Tabs: 4
	Author: Koba-yu
	Needs: 'View
]

; include redocr
#include %../libs/redocr.red

factor: 1.0
draw: []

; Scaling function taught on the Red Google Group (https://groups.google.com/forum/#!topic/red-lang/IDA_EJOcJtE)
scale-image: function [
	factor	[float!]
	return:	[block!] "Returns a Draw block for image scaling"
][
	compose [scale (factor) (factor) image]
]

view compose [
	title "ocr-view"
	origin 10x10
	text "Image File"
	file: field 430x30
	button "select..." [
		f: request-file/title "Select an image file."
		if f [file/text: to-string f]
	]
	return
	text "tessdata folder"
	folder: field 200x30 (to-local-file clean-path %./tessdata)
	text "language"
	language: field 100x30 "eng"
	button "OCR" [
		redocr/tessdata: folder/text
		redocr/lang: language/text

		result: redocr/ocr file/text
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
			clear draw
			image: load to-red-file file/text
			draw: scale-image factor
			append draw [image]
			draw/2 0.005 + zoom/data * 2
			draw/3 0.005 + zoom/data * 2
			face/draw: draw
		]
	]
	ocr-result: field 300x300
	do [zoom/data: 0.5]
]