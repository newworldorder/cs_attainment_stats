library(xlsx)

get_section <- function(s, e){
  # Extracts the rows between the starting s and ending row e (inclusive)
  #
  # Args:
  #   s: starting row index (integer)
  #   e: ending row index (integer)
  # 
  # Returns:
  #   the section of the table specified less any empty rows
  x <- read.xlsx("data/tab5-6.xlsx", 1, startRow = s, endRow = e, header = F)
  colnames(x) <- headings
  x[!is.na(x$field), ]
}

simple_plot <- function(df, title){
  # Plot percentage of degrees attained by year
  #
  # Args:
  #   df: the data frame where the data is coming from
  #   title: the title to use in the plot 
  # Returns:
  #   nothing; only shows a plot in the current output device 
  plot(colnames(df[,-1]), df[6, -1], type = "b", col = "red", main = title)
}

# read in the headings for this dataset 
headings <- read.xlsx("data/tab5-6.xlsx", 1, startRow = 3, endRow = 3, header = F)
headings[1] <- "field"

whites <- get_section(6, 50)
simple_plot(whites, "% of CS Bachelor Degrees Awarded \nto Whites")

asians <- get_section(53, 97)
simple_plot(asians, "% of CS Bachelor Degrees Awarded \nto Asians")

blacks <- get_section(100, 144)
simple_plot(blacks, "% of CS Bachelor Degrees Awarded \nto Blacks")

latinos <- get_section(147, 191)
simple_plot(latinos, "% of CS Bachelor Degrees Awarded \nto Latinos")

natives <- get_section(194, 238)
simple_plot(natives, "% of CS Bachelor Degrees Awarded \nto Native Americans")

# Put relevant data into a single data frame
years <- as.Date(colnames(natives[,-1]), "%Y")
years <- rep(years, 5)
percentages <- c(whites[6, -1], asians[6,-1], blacks[6,-1], latinos[6,-1], natives[6,-1])
colnames(percentages) <- NULL
percentages <- unlist(percentages)
races <- gl(5, 11, labels = c("whites", "asians", "blacks", "latinos", "natives"))

df <- data.frame(year=years, percentage=percentages, race=races)

# Plot all races on a single graph 
library(ggplot2)
p <- qplot(df$year, df$percentage, color = df$race, geom="smooth", main = "CS Degree Attainment Across Races", ylab = "% of Bachelor CS Degrees Awarded", xlab = "Year")
p <- p + labs(colour = "Race")
print(p)