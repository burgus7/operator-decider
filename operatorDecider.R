rm(list = ls())

#variables
num <- c(14, 2, 7, 3, 9)
ans <- 10
temp <- vector(mode = "numeric", length = (length(num)-1)*4+1)
base <- temp
result <- ans + 1 
yay <- temp

## initialize temp
m <- 4
while (m < length(base)) {
  base[m] <- 1
  base[m + 1] <- 1
  m <- m + 4
}
temp <- base
temp[1] <- num[1]

## iterate through num
for (a in 1:4) {
  temp[a+1] <- num[2]
  for (b in 1:4) {
    temp[b+5] <- num[3]
    for (c in 1:4) {
      temp[c+9] <- num[4]
      for (d in 1:4) {
        temp[d+13] <- num[5]
        # print(temp)
        
        ## calculate result
        k <- 2
        result <- num[1]
        
        while (k < (length(temp) - 2)) {
          result <- (result + temp[k] - temp[k + 1]) * temp[k + 2] / temp[k + 3]
          k <- k + 4
        }
        
        # print(result)
        if (result == ans) {
          # print ("success!")
          yay <- temp
        }
        temp[d+13] <- base[d + 13]
      }
      temp[c + 9] <- base[c + 9]
    }
    temp[b+5] <- base[b + 5]
  }
  temp[a+1] <- base[a + 1]
}

#print yay
final <- c("Answer:", num[1])
print (yay)
for (i in 2:length(yay)){
  for (j in 2:length(num)) {
    if(yay[i]==num[j]) {
      if(i %% 4 == 2){
        final <- c(final, "+", num[j])
      } else if (i %% 4 == 3) {
        final <- c(final, "-", num[j])
      } else if (i %% 4 == 0) {
        final <- c(final, "*", num[j])
      } else if (i %%4 == 1) {
        final <- c(final, "/", num[j])
      }
    }
  }
}

paste(final, sep = " ")