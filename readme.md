# tessered: tesseract-ocr Red binding
[tesseract-ocr](https://github.com/tesseract-ocr/tesseract) for [Red programming language](https://github.com/red/red)

So far, this program is a personal studying and might have many changes frequently.  
But any advices or suggestions are welcomed.

To execute the sample code, install tesseract, by following the instruction below.  
https://github.com/tesseract-ocr/tesseract

You need to compile to execute the sample command line code or the UI sample.  
Put the compiled files to tesseract dll folder.  
Also you have to specify the "tessdata" folder (the language training data folder) in the code.  
See comments in the code sample.

## Files
#### tesseract-api.red
import and routine definition for tesseract API

#### tessered.red  
object for ocr

#### sample.red
a sample command line code.

#### ocr-view.red
A sample OCR UI, it can select an image file, tessdata folder and language.
To compile this code, you need to set [redCV](https://github.com/ldci/redCV) repository folder 
on the same hierarchy of this repository.