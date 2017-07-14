Red [
    Title: "tessered"
    File: %tessered.red
    Author: Koba-yu
]

tessapi: context [
    #include %tessapi.red 
]

tessered: context [

    tessdata: %./tessdata
    lang: "eng"   

    init: function [
        return: [integer!]
    ] [
        handle: tessapi/create
        ret: tessapi/init handle to-local-file tessdata lang
        unless ret = 0 [ throw rejoin ["API initialization failed. result code:" ret] ]
        handle
    ]

    ocr-image: function [
        filepath [file! string!]
        /rect left top width height
        return: [string!]
    ] [
        handle: init        

        pix: tessapi/read-image to-local-file filepath
        tessapi/set-image handle pix
        
        if rect [
            tessapi/set-rectangle handle left top width height
            tessapi/recognize handle
        ]
        
        text: tessapi/get-utf8-text handle
        tessapi/dispose-pix pix
        tessapi/dispose handle
        text
    ]

    to-jpeg: function [
        read-file [file! string!]
        destination [file! string!]
        return: [integer!]
    ] [
        pix: tessapi/read-image to-local-file read-file
        ret: tessapi/write-jpeg to-local-file destination pix
        tessapi/dispose-pix pix
        ret
    ]
]