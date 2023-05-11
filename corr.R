corr <- function(directory, threshold = 0) {
        #select the IDs which are above the threshold
        
        thres_dat <- complete(directory)
        thres_nobs <- thres_dat["nobs"]
        id <- thres_dat["id"]
        thres_check <- thres_nobs > threshold
        thres_check <- as.vector(thres_check)
        id <- id[thres_check,]
        #get the data for ids which are above the threshold
        # check for too high threshold and read data
        if(length(id) == 0){
                solution <- as.numeric(id)
        } else {
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
                        test_data_cor <- read.csv(file = read_dir)
                        
                        #remove NA
                        
                        good_cor <- complete.cases(test_data_cor)
                        test_data_cor <- test_data_cor[good_cor,]
                        
                        #separete nitr and sulf
                        
                        nitr_val <- test_data_cor[,"nitrate"]
                        sulfate_val <- test_data_cor[,"sulfate"]
                        cor_val <- cor(sulfate_val,nitr_val)
                        
                        #create solution
                        
                        if(exists("solution") == TRUE) {
                                solution <- append(solution, cor_val)
                        } else {
                                solution <- cor_val
                        }
                }  
        }
        
solution
}

corr("specdata", 5000)
