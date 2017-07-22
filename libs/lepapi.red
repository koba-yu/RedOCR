Red [
    Title: "lepapi"
    File: "%lepapi.red"
    Author: Koba-yu
]

;
; imports Leptonica API
;
#system [        
    #import  [
        "liblept-5.dll" cdecl [
            _pixRead: "pixRead" [
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
            _pixDeskew: "pixDeskew" [
                pix [int-ptr!]
                redsearch [integer!]
                return: [int-ptr!]
            ]
        ]
    ]
]
;
; Definitions of routines
;    
read-pix: routine [
    filepath [string!]
    return: [integer!]
] [
    as integer! _pixRead as c-string! string/rs-head filepath
]
dispose: routine [
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
    /local t  
] [
    _pixWriteJpeg as c-string! string/rs-head filename as int-ptr! pix 75 0
]
deskew: routine [
    pix [integer!]
    return: [integer!]
] [
    as integer! _pixDeskew as int-ptr! pix 0
]