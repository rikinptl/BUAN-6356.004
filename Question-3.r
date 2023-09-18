# (a) Import the data to R
library(arules)

trans.csv <- read.csv("transactions (1).csv")

# (b) Set Support to 0.01, Confidence to 0.10, and Min Length to 2. Run apriori to obtain the rules. Sort the rules according to “Lift” with descending order.

trans.csv.df <- trans.csv[,-1]

trans.csv.df1 <- ifelse(trans.csv.df > 0, 1, 0)

trans.mat <- as.matrix(trans.csv.df1)

trans <- as(trans.mat, "transactions")

inspect(trans)

rules <- apriori(trans, parameter = list(supp = 0.01, conf = 0.1, target = "rules",minlen=2))
rules <- sort(rules, by = "lift", decreasing = TRUE)

inspect(rules)

# (c) Show the top ten Association Rule

inspect(head(sort(rules, by = "lift"), n = 10))

# (d) Find the highest lift value and the corresponding rule
inspect(head(sort(rules, by = "lift"), n = 1))


