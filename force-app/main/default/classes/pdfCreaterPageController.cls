public with sharing class pdfCreaterPageController {
    public String pdfText{get;set;}
    public pdfCreaterPageController() {
        pdfText = string.escapeSingleQuotes(
            ApexPages.currentPage().getParameters().get('pdfText')
        );

    }
}