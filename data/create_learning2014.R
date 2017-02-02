# Antti Virtanen 30012017

lrn2014 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep= "\t", header = TRUE)
dim(lrn2014)
str(lrn2014)

# # # mitä näistä pitäisi sitten kirjoittaa? 184 obs ja 60 variables löytyi

library(dplyr)

deep_questions <- c("D03", "D06", "D07", "D11", "D14", "D15", "D19", "D22", "D23", "D27", "D30", "D31") 
surface_questions <- c("SU02", "SU05", "SU08", "SU10", "SU13", "SU16", "SU18", "SU21", "SU24", "SU26", "SU29", "SU32")
strategic_questions <- c("ST01", "ST04", "ST09", "ST12", "ST17", "ST20", "ST25", "ST28")

deep_columns <- select(lrn2014, one_of(deep_questions))
lrn2014$deep <- rowMeans(deep_columns)

surface_columns <- select(lrn2014, one_of(surface_questions))
lrn2014$surf <- rowMeans(surface_columns)

strategic_columns <- select(lrn2014, one_of(strategic_questions))
lrn2014$stra <- rowMeans(strategic_columns)

keep_columns <- c("gender", "Age", "Attitude", "deep", "stra", "surf", "Points")

learning2014 <- select(lrn2014, one_of(keep_columns))

learning2014 <- filter(learning2014, Points > 0)
str(learning2014)

# # # done

write.csv(learning2014, file = "mylea2014.csv")
read.csv("mylea2014.csv", row.names = 1)
