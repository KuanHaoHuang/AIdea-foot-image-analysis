library(tidyverse)
root_folder_path = "C:/Users/wilsonhuang/Downloads/my_submission/"
sub_folder_name = "my_submission"
p <- str_c(root_folder_path, folder_name, "/")
f <- list.files(p)
f <- f[grep("my_submission.*\\.csv", f)]
f <- f[!grepl("my_submission.*_average.csv", f)]
df <- read_csv(paste0(p, f[1]))
for (i in 2:length(f)) {
    tmp_df <- read_csv(paste0(p, f[i]))
    df[2:5] <- df[2:5] + tmp_df[2:5]
}
df[2:5] <- df[2:5] / length(f)
f
head(df, 5)

write_csv(df, str_c(p, folder_name, "_average", ".csv"))