Red [
    Title: "tesseract-api"
    File: %tesseract-api.red
    Author: Koba-yu
]

tesseract-api: context [
    ;
    ; imports tesseract and Leptonica API
    ;
    #system [        
        #import  [
            "libtesseract-3.dll" cdecl [                          
                _create: "TessBaseAPICreate" [
                        return: [int-ptr!]
                ]
                _dispose: "TessBaseAPIEnd" [
                    handle [int-ptr!]
                ]
                _init: "TessBaseAPIInit3" [
                    handle [int-ptr!]
                    datapath [c-string!]
                    lang [c-string!]
                    return: [integer!]
                ]
                _set-image: "TessBaseAPISetImage2" [
                    handle [int-ptr!]
                    pix [int-ptr!]
                ]
                _get-utf8-text: "TessBaseAPIGetUTF8Text" [
                    handle [int-ptr!]
                    return: [c-string!]
                ]
                _set-rectangle: "TessBaseAPISetRectangle" [
                    left [integer!]
                    top [integer!]
                    width [integer!]
                    height [integer!]
                ]
            ]
            "liblept-5.dll" cdecl [
                _read-image: "pixRead" [
                    filename [c-string!]
                    return: [int-ptr!]
                ]
                _pixDestroy: "pixDestroy" [
                    ppix [int-ptr!] "pointer of pix, not pix itself"
                ]
                _pixWriteJpeg: "pixWriteJpeg" [
                    filename [c-string!]
                    pix [int-ptr!]
                    quality [integer!]
                    progressive [integer!]
                    return: [integer!]
                ]
            ]
        ]
    ]
    
    ;
    ; Definitions of routines
    ;
    create: routine [
        return: [integer!]
    ] [
        as integer! _create
    ]

    dispose: routine [
        handle [integer!]
    ] [
        _dispose as int-ptr! handle
    ]

    init: routine [
        handle [integer!]
        datapath [string!]
        lang [string!]
        return: [integer!]
    ] [
        _init as int-ptr! handle as c-string! string/rs-head datapath as c-string! string/rs-head lang
    ]

    read-image: routine [
        filepath [string!]
        return: [integer!]
    ] [
        as integer! _read-image as c-string! string/rs-head filepath
    ]

    get-utf8-text: routine [
        handle [integer!]        
        /local text [c-string!] size [integer!]
    ] [
        text: _get-utf8-text as int-ptr! handle
        size: length? text
        SET_RETURN((string/load text size UTF-8))
    ]

    set-image: routine [
        handle [integer!]
        pix [integer!]
    ] [
        _set-image as int-ptr! handle as int-ptr! pix
    ]

    set-rectangle: routine [
        left [integer!]
        top [integer!]
        width [integer!]
        height [integer!]
    ] [
        _set-rectangle left top width height
    ]

    dispose-pix: routine [
        pix [integer!]
    ] [
        ; pixDestroy requires pointer of pix
        _pixDestroy :pix
    ]

    write-jpeg: routine [
        filename [string!]
        pix [integer!]
        ; quality [integer!]
        ; progressive [integer!]
        return: [integer!]        
    ] [
        _pixWriteJpeg as c-string! string/rs-head filename as int-ptr! pix 75 0
    ]
]