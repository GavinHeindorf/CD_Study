CD_CheckAppleData <- function (filepath){

  if(!require(XML)){
    install.packages("XML")
    library(XML)
  } else{
    library(XML)
  }
  
  if (!require(xml2)){
    install.packages("xml2")
    library(xml2)
  } else{
    library(xml2)
  }

  if (file.exists(filepath)){

    data <- xmlParse(read_xml(filepath))
    df_record <-   XML:::xmlAttrsToDataFrame(data["//Record"])
    
    valid <- df_record[grepl("Sleep", df_record$type),]
    sourcenames <- unique(valid$sourceName)
    if (length(sourcenames) > 0){
      print("Source Names with Sleep Data:")
      return(sourcenames)
    } else{
      print("No valid data found!")
    }
  } else{
    stop("File path provided does not exist!")
  }

}
