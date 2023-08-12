# Create a vector.
apple <- c('red','green',"yellow")
print(apple)
# Get the class of the vector.
print(class(apple))


# Create a list.
list1 <- list(c(2,5,3),21.3,sin)
# Print the list.
print(list1[0:1])

a=list1[[1]];
print(a[2])



print(class(list1))
print(list1)


# Create a matrix.
M = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3)
print(M)






# Create an array.
a <- array(c('green','yellow'),dim = c(3,3,2))
print(a)


# Create a vector.
apple_colors <- c('green','green','yellow','red','red','red','green')

# Create a factor object.
factor_apple <- factor(apple_colors)

# Print the factor.
print(factor_apple)
print(nlevels(factor_apple))

# Create the data frame.
BMI <- data.frame(
  gender = c("Male", "Male","Female"),
  height = c(152, 171.5, 165),
  weight = c(81,93, 78),
  Age = c(42,38,26)
)
print(BMI)


number <- c(10,11,20,24,25,23,24)
for (num in number){
  if(num == 24){
    break
  }
  print(num)
  
}
# new_str <- "By"
# Functions
new_function <- function(){
  new_str<<- "Hy"
  paste(new_str,"is")
  
}
new_function()
print(new_str)

"Hello World"


new_dataframe <- data.frame(
  names=c("Nadeem","Zain"),
  age=c(20,19)
)
new_dataframe

numbers <- c(2, 4, 6, 8, 10)
product <- 1
for (num in numbers) {
  product <- product * num
  print(product)
}



#Muhammad Nadeem
#201980050

#Task1
employee <- list(
  list(employee_name="Zain",age=23,jod_title="Data Analyst"),
  list(employee_name="Nadeem",age=24,jod_title="Data Scientist"),
  list(employee_name="Umar",age=25,jod_title="Data Analyst")
)

for (employees in employee)
  print(paste(employees$employee_name))





#Task#2

# Create a matrix of daily sales data
sales <- matrix(c(111, 222, 333, 444, 555, 666, 777,
                  777, 666, 555, 444, 333, 222, 111,
                  777, 666, 555, 444, 333, 222, 111), 
                nrow = 7, ncol = 4, byrow = TRUE,
                dimnames = list(c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"),
                                c("Pro1", "Pro2", "Pro3","Pro4")))

# Calculate and print the total sales for each day
total_sales <- apply(sales, 1, sum)
print(total_sales)


#Task#3

# Create a three-dimensional array of temperature readings
temperature <- array(c(11, 22, 33, 44, 55, 66,
                       66, 55, 44, 33, 22, 11,
                       66, 11, 22, 33, 44, 55,
                       11, 22, 33, 55, 77, 66), 
                     dim = c(31, 24, 2),
                     dimnames = list(paste("Day", 1:31),
                                     paste("Hour", 1:24),
                                     c("Measurement 1", "Measurement 2")))


# Calculate and print the average temperature for each day
avg_temperature_day <- apply(temperature, 1, mean)
print(avg_temperature_day)

# Calculate and print the average temperature for each hour
avg_temperature_hour <- apply(temperature, 2, mean)
print(avg_temperature_hour)




#Task#4

# Create a vector of survey responses
a <- c("red", "blue", "green", "blue", "red", "yellow", "blue", "green", "red", "blue")

# Create a factor variable
f_color <- factor(a, levels = c("red", "blue", "green", "yellow"))

# Calculate the frequency of each color
color_number <- table(f_color)
print(color_number)





#Task#5


# Create a data frame with student information
student_data <- data.frame(
  name = c("Nadeem", "Umar", "Zain", "Zain"),
  age = c(4, 21, 24, 22),
  test_score = c(12, 23, 64, 23)
)

# Calculate the average test score for all students
average_score <- mean(student_data$test_score)
print(average_score)






