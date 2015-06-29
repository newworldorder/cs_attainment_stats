# read in the headings for this dataset 
headings <- read.xlsx("data/tab5-6.xlsx", 1, startRow = 3, endRow = 3, header = F)
headings[1] <- "field"
# read in the data for whites 
x <- read.xlsx("data/tab5-6.xlsx", 1, startRow = 6, endRow = 50, header = F)
colnames(x) <- headings
whites <- x[!is.na(x$field),]
# plot trend over years 
plot(colnames(whites[,-1]), whites[6, -1], type = "b", col = "red", main = "% of CS Bachelor Degrees Awarded \nto Whites")

x <- read.xlsx("data/tab5-6.xlsx", 1, startRow = 53, endRow = 97, header = F)
colnames(x) <- headings
asians <- x[!is.na(x$field), ]
plot(colnames(asians[,-1]), asians[6, -1], type = "b", col = "red", main = "% of CS Bachelor Degrees Awarded \nto Asians")

x <- read.xlsx("data/tab5-6.xlsx", 1, startRow = 100, endRow = 144, header = F)
colnames(x) <- headings
blacks <- x[!is.na(x$field), ]
plot(colnames(blacks[,-1]), blacks[6, -1], type = "b", col = "red", main = "% of CS Bachelor Degrees Awarded \nto Blacks")

x <- read.xlsx("data/tab5-6.xlsx", 1, startRow = 147, endRow = 191, header = F)
colnames(x) <- headings
latinos <- x[!is.na(x$field), ]
plot(colnames(latinos[,-1]), latinos[6, -1], type = "b", col = "red", main = "% of CS Bachelor Degrees Awarded \nto Latinos")

x <- read.xlsx("data/tab5-6.xlsx", 1, startRow = 194, endRow = 238, header = F)
colnames(x) <- headings
natives <- x[!is.na(x$field), ]
plot(colnames(natives[,-1]), natives[6, -1], type = "b", col = "red", main = "% of CS Bachelor Degrees Awarded \nto American Indians")

# create a new data frame that makes the data easier to plot together
# df --> year (Date), percentage (numeric), race (factor)

#xval <- as.Date(colnames(whites[,-1]), "%Y")
#ggplot(df1,aes(x,y))+geom_line(aes(color="First line"))+
#geom_line(data=df2,aes(color="Second line"))+
#  labs(color="Legend text")

# Read in data for each other race

# Plot these separately and together 
