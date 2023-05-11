complete <- function(directory, id = 1:332) {
        
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

                test_data <- read.csv(file = read_dir)
                good <- complete.cases(test_data)
                number <- sum(good)
                if(exists("almost") == TRUE) {
                        almost <- append(almost, number)
                } else {
                        almost <- number
                }
        }
        nobs <- almost
        solution <- data.frame(id, nobs)
        solution
}
