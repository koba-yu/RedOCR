Red [
    Title: "tessered"
    File: %tessered.red
    Author: Koba-yu
]

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
        hdl: routines/create
        ret: routines/init hdl to-local-file settings/tessdata to string! settings/lang
        unless ret = 0 [ throw rejoin ["api initialization failed. result code:" ret] ]
        hdl
    ]

    ocr-image: function [
        filepath [file! string!]
        /rect left top width height
        return: [string!]
    ] [
        handle: init        

        pix: routines/read-image to-local-file filepath
        routines/set-image handle pix
        
        if rect [
            routines/set-rectangle handle left top width height
            routines/recognize handle
        ]
        
        text: routines/get-utf8-text handle
        routines/dispose-pix pix
        routines/dispose handle
        text
    ]

    to-jpeg: function [
        read-file [file! string!]
        destination [file! string!]
        return: [integer!]
    ] [
        pix: routines/read-image to-local-file read-file
        ret: routines/write-jpeg to-local-file destination pix
        dispose-pix pix
        ret
    ]
]