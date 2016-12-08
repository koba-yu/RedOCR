Red [
    Title: "tessered"
    File: %tessered.red
    Author: Koba-yu
]

#include %tesseract-api.red

tessered: context [

    api: tesseract-api

    settings: context [
        tessdata: %./tessdata
        lang: 'eng
    ]

    ocr-image: func [
        filepath [file! string!]
        return: [string!]
        /local pix text ini-code handle
    ] [
        handle: api/create
        ini-code: api/init handle to-local-file settings/tessdata to string! settings/lang
                    
        unless ini-code = 0 [
            throw rejoin ["api initialization failed. result code:" ini-code]
        ]

        pix: api/read-image to-local-file filepath        
        api/set-image handle pix

        text: api/get-utf8-text handle        

        api/dispose handle
        api/dispose-pix pix
        text
    ]
]