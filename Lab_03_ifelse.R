# Task1
x<-10

if(x>10){
  print("x is greater than 10")
} else{
    print("x is not greater than 10")
  }





#Task2
v=1:10
for(i in v){
  print(i)
}
#Task3
function_name <- function(x, y) {
  print(x+y)
}

function_name(1,3)

#Task4
result <- substring("Hello, world", 8, 12)
print(result)
#Task5
v=c(1,2,3,4,5)
length(v)
#Task6

name=c("Nadeem","Hamid","Sahil")
age=c(20,21,35)
c1=list(name,age)
names(c1)<- c("name is","age is")
print(c1)

# Task7
i <- 1
while (i <= 10) {
  print(i)
  i <- i + 1
}
# Task8
sum_vector <- function(vec) {
  total <- sum(vec)
  return(total)
}
my_vector <- c(1, 2, 3, 4, 5)
result <- sum_vector(my_vector)
print(result)

# Task9

c="Hello World"
toupper(c)


# Task10

# Create a vector containing the numbers 1 through 10
my_vector <- 1:10

# Use a for loop to print the square of each number
for (num in my_vector) {
  square <- num^2
  print(square)
}


# Create an empty list
list <- c()
# Create a for statement to populate the list

for (i in seq(1, 4, by=2)) {
  list[[i]] <- i*i
}
print(list)

# Create a matrix
mat <- matrix(data = seq(10, 20, by=1), nrow = 6, ncol =2)
# Create the loop with r and c to iterate over the matrix
for (r in 1:nrow(mat))   
  for (c in 1:ncol(mat))  
    print(paste("Row", r, "and column",c, "have values of", mat[r,c]))  


x <- list(a = 1:5, b = rnorm(10))

sapply(x, mean)
lapply(x,mean)




















 