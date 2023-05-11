pollutantmean <- function(directory, pollutant, id = 1:132) {
        
        for(i in 1:length(id)){
                id_test <- as.character(id[i])
                if(nchar(id_test) == 1) {
                        filename <- paste("00", id_test, sep = "")
                } else if(nchar(id_test) == 2) {
                        filename <- paste("0", id_test, sep = "")
                } else {
                        filename <- id_test
                }
                read_dir <- paste(directory, "/", filename, ".csv", sep = "")
                if(exists("test_data") == TRUE) {
                        temp_dat <- read.csv(file = read_dir)
                        test_data <- rbind(test_data, temp_dat)
                } else {
                        test_data <- read.csv(file = read_dir)
                }
        }
        
}



