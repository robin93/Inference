mydata <- read.csv("raw_data.csv")
#summary(mydata)
#str(mydata)
useful_columns <- mydata[,c(5,11,12,18,19,21,23,26,27,28)]
#summary(useful_columns)
win_loss_data <- subset(useful_columns,Opp.Status...Recoded == 1 |Opp.Status...Recoded ==3 & OMAT > -10)
win_data <- subset(useful_columns, Opp.Status...Recoded == 1)
loss_data <- subset(useful_columns, Opp.Status...Recoded == 3)
#summary(win_loss_data)
#plot(win_loss_data$Service.Offering...Recoded,win_loss_data$Opp.Status...Recoded)
#table(win_loss_data$Opp.Status...Recoded,win_loss_data$Service.Offering...Recoded)
#barplot(table(win_loss_data$Opp.Status...Recoded,win_loss_data$Service.Offering...Recoded),beside =T,xlab = "Service Offering",ylab = "Win Loss",legend = rownames(table(win_loss_data$Opp.Status...Recoded,win_loss_data$Service.Offering...Recoded)))
#hist(loss_data$Offshore.Effort..pm.,xlim = c(0,1000))
#barplot(table(win_data$Opp.Status...Recoded,(win_data$Offshore.Effort..pm./win_data$offshore.Total.Effort)),beside =T,xlab = "Offshore Effort",ylab = "Win Loss",ylim = c(0,300))
#offshore_effort <- table(win_loss_data$Opp.Status...Recoded,win_loss_data$Offshore.Effort..pm.)
#Offshore_leverage
win_loss_data$Offshore_leverage <- win_loss_data$Offshore.Effort..pm./win_loss_data$Total.Effort
win_data$Offshore_leverage <- win_data$Offshore.Effort..pm./win_data$Total.Effort
loss_data$Offshore_leverage <- loss_data$Offshore.Effort..pm./loss_data$Total.Effort
#barplot(table(win_loss_data$Opp.Status...Recoded,win_loss_data$Offshore_leverage),beside =T,xlab = "Service Offering",ylab = "Win Loss",legend = rownames(table(win_loss_data$Opp.Status...Recoded,win_loss_data$Offshore_leverage)))
#hist(win_data$Offshore_leverage,xlab = "Offshore leverage",ylab = "Win Frequency")
#hist(loss_data$Offshore_leverage,xlab = "Offshore leverage",ylab = "Loss Frequency")
total_rev_useful_data <- subset(win_data, Total.Rev <= 600000)
total_rev_useful_data_loss <- subset(loss_data, Total.Rev <= 600000)
#hist(total_rev_useful_data$Total.Rev)
#hist(total_rev_useful_data_loss$Total.Rev)

omat_useful_data_win <- subset(win_data, OMAT >=0)
omat_useful_data_loss <- subset(loss_data, OMAT >=0)
#hist(omat_useful_data_win$OMAT)
#hist(omat_useful_data_loss$OMAT)

#barplot(table(win_loss_data$Opp.Status...Recoded,win_loss_data$Alliance),beside =T,xlab = "Alliance",ylab = "Win Loss",legend = rownames(table(win_loss_data$Opp.Status...Recoded,win_loss_data$Alliance)))
#table(win_loss_data$Opp.Status...Recoded,win_loss_data$Alliance)
#barplot(table(win_loss_data$Opp.Status...Recoded,win_loss_data$Project.type),beside =T,xlab = "Project.type",ylab = "Win Loss",legend = rownames(table(win_loss_data$Opp.Status...Recoded,win_loss_data$Project.type)))
#barplot(table(win_loss_data$Opp.Status...Recoded,win_loss_data$Sole.Sourced),beside =T,xlab = "Sole.Sourced",ylab = "Win Loss",legend = rownames(table(win_loss_data$Opp.Status...Recoded,win_loss_data$Sole.Sourced)))
#table(win_loss_data$Opp.Status...Recoded,win_loss_data$Sole.Sourced)

#boxplot(win_loss_data$Total.Rev)
#understand the project revenue distribution
total_revenue_winNloss_data <- subset(win_loss_data, Total.Rev <= 105000000 & Total.Rev >= 100)
#hist(total_revenue_winNloss_data$Total.Rev)
#summary(total_revenue_winNloss_data)


#hrd = high revenue data m = medium l= low
hrd <-subset(win_loss_data, Total.Rev >=142059 & Opp.Status...Recoded == 1 & OMAT > -10)
mrd <-subset(win_loss_data, Total.Rev < 142059 & Total.Rev >= 39975 & Opp.Status...Recoded == 1 & OMAT > -10)
lrd <-subset(win_loss_data, Total.Rev <39975 & Opp.Status...Recoded == 1 & OMAT > -10)
hrd$total.rev.tshirtsize <- "1High"
mrd$total.rev.tshirtsize <- "2Medium"
lrd$total.rev.tshirtsize <- "3Low"
rev_category_data <- rbind(hrd,mrd,lrd)
#summary(rev_category_data)
#table(rev_category_data$total.rev.tshirtsize)
#barplot(table(rev_category_data$Opp.Status...Recoded,rev_category_data$total.rev.tshirtsize),beside =T,xlab = "Revenue Category",ylab = "Win Loss",legend = rownames(table(rev_category_data$Opp.Status...Recoded,rev_category_data$total.rev.tshirtsize)))
#plot(hrd$Total.Rev,hrd$Opp.Status...Recoded)

#finding the 33% values for the total revenue
#quantile(win_loss_data$Total.Rev,c(0.33,0.66))

#creating the 3 win categories
hrd$win_cat <- (hrd$Opp.Status...Recoded)*3
mrd$win_cat <- (mrd$Opp.Status...Recoded)*2
lrd$win_cat <- (lrd$Opp.Status...Recoded)*1
win_cat_data <- rbind(hrd,mrd,lrd)
#summary(win_cat_data)
#barplot(table(win_cat_data$win_cat,win_cat_data$Service.Offering...Recoded),beside =T,xlab = "Service Offering",ylab = "number of wins by category",legend = rownames(table(win_cat_data$win_cat,win_cat_data$Service.Offering...Recoded)),main = "wins by service offering")
#hist(hrd$Offshore_leverage,xlab = "Offshore leverage",ylab = "Win Frequency at high revenue",main = "High revenue win frequency against offshore leverage")
#hist(mrd$Offshore_leverage,xlab = "Offshore leverage",ylab = "Win Frequency at medium revenue",main = "Medium revenue win frequency against offshore leverage")
#hist(lrd$Offshore_leverage,xlab = "Offshore leverage",ylab = "Win Frequency at low revenue",main = "Low revenue win frequency against offshore leverage")
#hist(win_cat_data$win_cat,main = "Wins by revenue categories")
#hist(hrd$OMAT,xlab = "OMAT",ylab = "Win Frequency at high revenue",main = "High revenue win frequency against OMAT")
#hist(mrd$OMAT,xlab = "OMAT",ylab = "Win Frequency at medium revenue",main = "Medium revenue win frequency against OMAT")
#hist(lrd$OMAT,xlab = "OMAT",ylab = "Win Frequency at low revenue",main = "Low revenue win frequency against OMAT")
#barplot(table(win_cat_data$win_cat,win_cat_data$Project.type),beside =T,xlab = "Project type",ylab = "Win Frequency",legend = rownames(table(win_cat_data$win_cat,win_cat_data$Project.type)), main = "Win frequency against project type")
#barplot(table(win_cat_data$win_cat,win_cat_data$Sole.Sourced),beside =T,xlab = "Sole Sourced",ylab = "Win Frequency",legend = rownames(table(win_cat_data$win_cat,win_cat_data$Sole.Sourced)), main = "Win frequency against sole sourced")
barplot(table(win_cat_data$win_cat,win_cat_data$Alliance),beside =T,xlab = "Alliance",ylab = "Win Frequency",legend = rownames(table(win_cat_data$win_cat,win_cat_data$Alliance)),main = "Win frequency against Alliance")