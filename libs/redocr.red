Red [
	Title:	"redocr"
	File:	%redocr.red
	Tabs:	4
	Author:	Koba-yu
]

lepapi: context [
	#include %lepapi.red    
]

tessapi: context [
	#include %tessapi.red 
]

redocr: context [

	tessdata: %./tessdata
	lang: "eng"   

	_init: function [
		return: [integer!]
	][
		handle: tessapi/create
		ret: tessapi/init handle to-local-file tessdata lang
		unless ret = 0 [ throw rejoin ["API initialization failed. result code:" ret] ]
		handle
	]

	read: function [
		filepath	[file! string!]
		return:		[integer!]        
	][
		lepapi/read-pix to-local-file filepath
	]

	ocr: function [
		filepath	[file! string!]
		/rect 
			left 
			top 
			width 
			height
		return:		[string!]
	][
		handle: _init        

		pix: lepapi/read-pix to-local-file filepath
		tessapi/set-image handle pix
        
		if rect [
			tessapi/set-rectangle handle left top width height
			tessapi/recognize handle
		]
        
		text: tessapi/ocr handle
		lepapi/dispose pix
		tessapi/dispose handle
		text
	]

	deskew: function [
		pix		[integer!]
		return:	[integer!]
	][
		dpix: lepapi/deskew pix

		if pix <> dpix [lepapi/dispose pix]
	]

	do-bilateral: function [
		pix		[integer!]
		return:	[integer!]        
    ][
		lepapi/do-bilateral pix 5.0 10.0 10 1
    ]

	save: function [
		pix			[integer!]
		destination	[string!]
		type		[word!]
		return:		[integer!]
	][
		type: formats/:type
		lepapi/write-pix to-local-file destination pix type
	]

	to-jpeg: function [
		file		[file! string!]
		destination	[file! string!]
		return:		[integer!]
	][
		pix: lepapi/read-pix to-local-file file
		ret: lepapi/write-jpeg to-local-file destination pix
		lepapi/dispose pix
		ret
	]

	formats: #(
		; UNKNOWN: 0
		BMP: 1
		JPEG: 2
		PNG: 3
		TIFF: 4
		TIFF_PACKBITS: 5
		TIFF_RLE: 6
		TIFF_G3: 7
		TIFF_G4: 8	
		TIFF_LZW: 9	
		TIFF_ZIP: 10
		PNM: 11
		PS: 12
		GIF: 13
		JP2: 14
		WEBP: 15
		LPDF: 16
		; DEFAULT: 17
		SPIX: 18
	)
]