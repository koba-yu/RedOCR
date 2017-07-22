# RedOCR
OCR and image processing for [Red programming language](https://github.com/red/red).  
This code needs following libraries.  

## [tesseract-ocr](https://github.com/tesseract-ocr/tesseract)  
C/C++ OCR library.

## [Leptonica](https://github.com/DanBloomberg/leptonica)   
Image processing library of C.

# Instruction
This program is under developing and might have many changes frequently.  
But any advices or suggestions are welcomed.

To execute the sample code, install tesseract(it includes Leptonica), by following the instruction below.  
https://github.com/tesseract-ocr/tesseract

You need to compile to execute the sample codes because they use routines.  
Put the compiled executable and depending libraries on the same folder.  
Also, if you use OCR function, you have to specify the "tessdata" folder (the language training data folder) in the code.  

# Repository Structure
## Folder
### images
Sample images.

### libs
Library files.

### samples
Sample codes.

## Library Files
### lepapi.red
Routine definiiton for Leptonica API.  

### tessapi.red
Routine definition for tesseract-ocr API

### redocr.red  
Main object containing Leptonica and tesseract APIs.

## Sample Codes
### deskew.red
Auto detection of image skew and make the deskewed image.

### ocr-view.red
A Sample UI to select an image, specify tesseract settings and do OCR.

### ocr.red
A simple hard-coded ocr sample.

### tif-to-jpeg.red
A sample to convert a tif file to a jpeg file.