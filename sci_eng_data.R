library(xlsx)
# read in the headings for this dataset 
headings <- read.xlsx("data/tab5-6.xlsx", 1, startRow = 3, endRow = 3, header = F)
headings[1] <- "field"

get_section <- function(s, e){
  x <- read.xlsx("data/tab5-6.xlsx", 1, startRow = s, endRow = e, header = F)
  colnames(x) <- headings
  x[!is.na(x$field), ]
}

whites <- get_section(6, 50)
plot(colnames(whites[,-1]), whites[6, -1], type = "b", col = "red", main = "% of CS Bachelor Degrees Awarded \nto Whites")

asians <- get_section(53, 97)
plot(colnames(asians[,-1]), asians[6, -1], type = "b", col = "red", main = "% of CS Bachelor Degrees Awarded \nto Asians")

blacks <- get_section(100, 144)
plot(colnames(blacks[,-1]), blacks[6, -1], type = "b", col = "red", main = "% of CS Bachelor Degrees Awarded \nto Blacks")

latinos <- get_section(147, 191)
plot(colnames(latinos[,-1]), latinos[6, -1], type = "b", col = "red", main = "% of CS Bachelor Degrees Awarded \nto Latinos")

natives <- get_section(194, 238)
plot(colnames(natives[,-1]), natives[6, -1], type = "b", col = "red", main = "% of CS Bachelor Degrees Awarded \nto American Indians")

# create a new data frame that makes the data easier to plot together
# df --> year (Date), percentage (numeric), race (factor)

#xval <- as.Date(colnames(whites[,-1]), "%Y")
#ggplot(df1,aes(x,y))+geom_line(aes(color="First line"))+
#geom_line(data=df2,aes(color="Second line"))+
#  labs(color="Legend text")

# Read in data for each other race

# Plot these separately and together 
