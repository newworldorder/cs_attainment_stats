# read in the headings for this dataset 
headings <- read.xlsx("tab5-6.xlsx", 1, startRow = 3, endRow = 3, header = F)
headings[1] <- "field"
# read in the data for whites 
x <- read.xlsx("tab5-6.xlsx", 1, startRow = 6, endRow = 50, header = F)
colnames(x) <- headings
whites <- x[!is.na(x$field),]
# plot trend over years 
plot(colnames(whites[,-1]), whites[6, -1], type = "b", col = "red", main = "% of CS Bachelor Degrees Awarded \nto Whites")