Red [
    Title: "tessered"
    File: %tessered.red
    Author: Koba-yu
]

lepapi: context [
    #include %lepapi.red    
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

        pix: lepapi/read to-local-file filepath
        tessapi/set-image handle pix
        
        if rect [
            tessapi/set-rectangle handle left top width height
            tessapi/recognize handle
        ]
        
        text: tessapi/do-ocr handle
        lepapi/dispose pix
        tessapi/dispose handle
        text
    ]

    to-jpeg: function [
        read-file [file! string!]
        destination [file! string!]
        return: [integer!]
    ] [
        pix: lepapi/read to-local-file read-file
        ret: lepapi/write-jpeg to-local-file destination pix
        lepapi/dispose pix
        ret
    ]
]