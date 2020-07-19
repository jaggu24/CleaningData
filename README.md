# CleaningData
For a course in Coursera

# Steps followed are

1. read all tables usimg the `read.table()` seperately for both train and test
2. combine them with their appropriate activity and person_id
3. the train and test using the `row_bind()`
4. Extracting the colums which has mean and sd in their column names using str_detect()
5. using `aggregate()` finding the mean of the values based on the activity and person_id seperately
6. write bak the data using `write.table()`

## There is a Code book attache with this repositery for further references