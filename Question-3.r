# Import necessary libraries
library ( arules )

# (a) Import the data to R
trans.csv <- read.csv("transactions.csv")

# (b) Set Support to 0.01 , Confidence to 0.10 , and Min Length to 2. Run apriori to obtain
#the rules . Sort the rules according to " Lift " with descending order .
trans.csv.df <- trans.csv[,-1]
trans.csv.df1 <- ifelse(trans.csv.df > 0, 1, 0)
trans.mat <- as.matrix(trans.csv.df1)
trans <- as(trans.mat, "transactions")
inspect(trans)
itemFrequencyPlot(trans)
rules <- apriori(trans, parameter = list(supp = 0.4, conf = 0.8, target = "rules",minlen=2))
inspect(rules)
# sorting in descending order by Lift( Refer Figure 1)
inspect(head(sort(rules, by = "lift"), n = 37))
# (c) Show the top ten Association Rules ( Refer Figure 2)
inspect(head(sort(rules, by = "lift"), n = 10))

# (d) Find the highest lift value and the corresponding rule ( Refer Figure 3)
inspect(head(sort(rules, by = "lift"), n = 1))
