Red [
    Title: "tessered"
    File: %tessered.red
    Author: Koba-yu
]

#include %tesseract-api.red

; #alias rect!: object [
;     left: top: width: height: 0
; ]

tessered!: object [

    api: tesseract-api

    settings: context [
        tessdata: %./tessdata
        lang: 'eng
    ]

    ocr-image: function [
        filepath [file! string!]
        ; /area rect [rect!] 
        return: [string!]
    ] [
        handle: api/create
        ini-code: api/init handle to-local-file settings/tessdata to string! settings/lang
                    
        unless ini-code = 0 [
            throw rejoin ["api initialization failed. result code:" ini-code]
        ]

        pix: api/read-image to-local-file filepath        
        api/set-image handle pix

        ; if area [api/set-rectangle rect/left rect/top rect/width rect/height]

        text: api/get-utf8-text handle        

        api/dispose handle
        api/dispose-pix pix
        text
    ]
]