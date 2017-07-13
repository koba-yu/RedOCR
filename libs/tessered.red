Red [
    Title: "tessered"
    File: %tessered.red
    Author: Koba-yu
]

;
; Routines in nested context should be called by 'do' function
; because of the issue #2405 (https://github.com/red/red/issues/2405)
;
tessered!: object [

    routines: context [
        #include %tessapi.red
    ]

    settings: [
        tessdata: %./tessdata
        lang: 'eng
    ]

    init: function [
        return: [integer!]
    ] [
        hdl: do routines/create
        ret: do routines/init hdl to-local-file settings/tessdata to string! settings/lang
        unless ret = 0 [ throw rejoin ["api initialization failed. result code:" ret] ]
        hdl
    ]

    ocr-image: function [
        filepath [file! string!]
        /rect left top width height
        return: [string!]
    ] [
        handle: init        

        pix: do [routines/read-image to-local-file filepath]
        do [routines/set-image handle pix]
        
        if rect [
            do [routines/set-rectangle handle left top width height] 
            do [routines/recognize handle]
        ]
        
        text: do [routines/get-utf8-text handle]
        do [routines/dispose-pix pix]
        do [routines/dispose handle]
        text
    ]

    to-jpeg: function [
        read-file [file! string!]
        destination [file! string!]
        return: [integer!]
    ] [
        pix: read-image to-local-file read-file
        ret: write-jpeg to-local-file destination pix
        dispose-pix pix
        ret
    ]
]