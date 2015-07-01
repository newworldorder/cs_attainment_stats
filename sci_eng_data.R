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

years <- as.Date(colnames(natives[,-1]), "%Y")
years <- rep(years, 5)
percentages <- c(whites[6, -1], asians[6,-1], blacks[6,-1], latinos[6,-1], natives[6,-1])
colnames(percentages) <- NULL
percentages <- unlist(percentages)
races <- gl(5, 11, labels = c("whites", "asians", "blacks", "latinos", "natives"))

df <- data.frame(year=years, percentage=percentages, race=races)
library(ggplot2)
p <- qplot(df$year, df$percentage, color = df$race, geom="smooth", main = "CS Degree Attainment Across Races", ylab = "% of Bachelor CS Degrees Awarded", xlab = "Year")
p <- p + labs(colour = "Race")
print(p)