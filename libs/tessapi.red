Red [
    Title: "tessapi"
    File: "%tessapi.red"
    Author: Koba-yu
]

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
                handle [int-ptr!]
                left [integer!]
                top [integer!]
                width [integer!]
                height [integer!]
            ]
            _recognize: "TessBaseAPIRecognize" [
                handle [integer!]
                monitor [integer!]
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
do-ocr: routine [
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
    handle [integer!]
    left [integer!]
    top [integer!]
    width [integer!]
    height [integer!]
] [
    _set-rectangle as int-ptr! handle left top width height
]
recognize: routine [
    handle [integer!]
] [
    _recognize handle null
]