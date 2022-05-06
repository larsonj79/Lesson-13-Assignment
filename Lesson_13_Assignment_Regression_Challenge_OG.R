# Lesson 12 Assignment - Regression Part 2

# Your assignment is to write the commands instructed in the comments below. To run your
# commands, simply hit Ctrl+Enter (command+return on a MAC) when the cursor is on that 
# command line. You can also type commands directly into the Console below, but you must
# save them in this file for your assignment.

# Do not change these six lines or GradeScope will not work
library(readr)
library(ggplot2)
mvs <- read_csv("Regression Challenge Data.csv")
moviesel <- read_csv("Regression Challenge Selection Data.csv")
mvs <- data.frame(mvs)
moviesel <- data.frame(moviesel)


## Data Preparation

# You are VP in charge of programming at TNT, a popular cable network. One of your most 
# important roles is to acquire and decide when to air movies from the major motion 
# picture studios. Licensing for these movies is expensive, but is well worth the 
# expense if it attracts a lot of viewers and hence a lot of ad revenue. Predicting the 
# ratings (viewership) of a movie is likely to bring in is very useful for several 
# decisions, many of which you have to make regularly.

# To help you with these predictions, you have collected information on all the movies 
# you have aired in the past on TNT. That data is found in the data frame called *mvs*. 
# Take a look at the first several rows of the data so you understand each variable as 
# they are described below.

#1. Display the first several rows of the data.


# **MovieID**: Simple identifier variable for each movie. Notice that some movies have 
# multiple entries. This occurs when the same movie was shown multiple times on the 
# channel. For example, the movie with MovieID 1 was shown on Friday and then again 
# on Saturday.
# **Rating**: This is the key dependent variable. It is a numeric variable that reports 
# the number of millions of people who watched the movie. Your goal is to find the 
# movies that will yield the most profit, and a key profit input is the number of 
# millions of people who watch the movie.
# **Stars**: The number of A-list celebrities that star in the movie.
# **Day**: Day of the week the movie aired on TNT.
# **Hour**: Hour of the day the movie began it airing.
# **TrueStory**: Indicator variable. 1 = movie was a true story or was "inspired by 
# true events"; 0 = not a true story.
# **ClickFlick**: Indicator variable. 1 = movie is considered a movie targeted to 
# women; 0 = not explicitly targeted to women.
# **Action**: Indicator variable. 1 = movie is considered an action movie; 0 = not an 
# action movie.
# **TVPremiere**: Indicator variable. 1 = movie airing was a TV premiere, which means 
# this airing was the first time the movie was shown on network television. 0 = movie 
# airing was not a TV premiere, meaning it had been aired on network television prior 
# to this airing (on TNT or another network).
# **NetworkPremiere**: Indicator variable. 1 = movie airing was a network premiere, 
# meaning this airing was the first time the movie was shown on TNT. 0 = movie was 
# not a network premiere, meaning it had previously aired on TNT.
# **ReRun**: Indicator variable. 1 = this airing of the movie occurred within a week of 
# a previous airing of the same movie, something TNT often does with major movies.
# **PrevRating**: The rating (in millions) of the show or movie that aired right before 
# the movie.
# **SpotRatings**: The rating (in millions) of all the TV spots for the airing of the 
# movie. TNT typically advertises the movies that are going to air. This is the total 
# number of viewers that should have seen an advertisement for the movie.
# **DomesticGross**: The amount of money (in millions) the movie made when it was in
# theaters. 

# Make sure you understand each variable before you get started running models.

# The central task of this Regression Challenge is to construct a comprehensive 
# regression model to predict Rating (the number of people who will watch a movie) from 
# the movie characteristics and from the airing day and time. Once you have constructed 
# this regression model, you will apply the model to predict the number of people 
# likely to watch the twenty movies available for TNT to show. These 20 movies are 
# found in Regression Challenge Selection Data.

# To prepare the data to be used in a regression model, we first need to factor any 
# variables that aren't strictly numeric variables. The *Day* variable is a character 
# variable, so R will automatically factor that variable if it is included in a 
# regression model. But instead of relying on R to do it for us, let's do it ourselves.

#2. Factor the *Day* variable.


# Consider the *Hour* variable. It is recorded as a number: 7, 8, 9, 10, 11, or 12. But 
# we need to factor this variable before including it in a regression model.

#3. Why should we factor the *Hour* variable?
# * ENTER ANSWER HERE*

#4. Factor the *Hour* variable.


# Consider the *Stars* variable. It is recorded as a number: 0, 1, 2, or 3, and it is
# numeric. It is a simple count of the number of A-list celebrities in the movie. You 
# can convert *Stars* to a factor variable or leave it as a numeric variable. To help 
# you understand the trade-offs involved in this choice, answer the following questions.

#5. If you leave *Stars* as a numeric variable, and a regression equation (with Rating 
# as the dependent variable) yields a regression coefficient for *Stars* of .75, what 
# would the interpretation of the coefficient be?
# *ENTER ANSWER HERE*

#6. If you convert *Stars* to a factor variable, how many regression coefficients would 
# be reported for *Stars*?
# *ENTER ANSWER HERE*

#7. If you convert *Stars* to a factor variable, and the coefficient on *Stars2* was 
# .75, what would the interpretation of the coefficient be?
# *ENTER ANSWER HERE*

#8. Because *Stars* only takes values of 0, 1, 2, or 3, we know all of our movies have 
# had 3 A-list celebrities or fewer. But what if a movie had 10 A-list celebrities? If 
# we left *Stars* as a numeric variable, and the regression coefficient were .75, what 
# would be the total predicted effect of the 10 A-list celebrities? Would this be 
# reasonable? (Take a look at the *Rating* values within the data.)
# *ENTER ANSWER HERE*

# The previous question should help you understand the disadvantage of leaving *Stars* 
# as a numeric variable. The disadvantage of factoring the *Stars* variable is that the 
# regression model will report multiple coefficients for this variable, and since each 
# coefficient is based on a subset of the data, these estimates will be less reliable.

#9. I recommend you factor *Stars*. Do that below.


# Now consider the indicator variables (TrueStory through ReRun). They are already coded 
# as 1s and 0s, so we don't have to factor them, but it's good practice to factor them, 
# so do that below.

#10. Factor the indicator variables.


## Creating the Regression Model

# Now that you have factored the variables needing to be factored, you have several 
# options for finding the best regression model. I recommend you take a “spaghetti 
# against the wall” approach. Put in all the variables into the model at once. Then, 
# little by little, remove the variables that are not significant, until you have a 
# comprehensive but statistically significant model.

#11. Run a regression model (mod1) predicting *Rating* from all other variables in the 
# dataset (except MovieID), and output a summary of the model.


#12. What is the marginal effect of adding an A-list celebrity to a movie that has none?
#  *ENTER ANSWER HERE*

#13. What is the marginal effect of adding a second A-list celebrity to a movie that 
# already has one?
# *ENTER ANSWER HERE*

#14. What is the marginal effect of adding a third A-list celebrity to a movie that 
# already has two?
# *ENTER ANSWER HERE*

#15. Why was it necessary to factor *Stars* to find diminishing marginal returns to 
# A-list celebrities?
# *ENTER ANSWER HERE*

#16. How many *Day* coefficients are there?
# *ENTER ANSWER HERE*

#17. Which day is missing?
# *ENTER ANSWER HERE*

#18. Keeping this in mind, what is the interpretation of the *DayWednesday* coefficient?
# *ENTER ANSWER HERE*

#19. Is the *DayTuesday* coefficient statistically significant?
# *ENTER ANSWER HERE*

#20. What is your interpretation of this significance/lack of significance?
# *ENTER ANSWER HERE.*

#21. Some of the *Day* coefficients are not significant, but our decision rule is to 
# keep the *Day* variable if at least one of the coefficients is significant. According
# to this decision rule, should we keep *Day* or get rid of it?
# *ENTER ANSWER HERE.*

#22. Apply this same decision rule to the *Hour* variable. Should we keep *Hour* or get 
# rid of it?
# *ENTER ANSWER HERE*

#23. What is the interpretation of the *Hour12* coefficient?
# *ENTER ANSWER HERE*

#24. What is the interpretation of the *ReRun* coefficient?
# *ENTER ANSWER HERE*

#25. Which variable(s) is/are not statistically significant and should be removed from 
# the model?
# *ENTER ANSWER HERE*

#26. Run a new regression model (mod2) with this/these nonsignificant variable(s) 
# removed.


# When you remove a variable from a multiple regression model, the coefficients of the 
# remaining variables can change, and sometimes variables that were previously 
# significant are no longer significant.

#27. Are any of the variables now not statistically significant?
# *ENTER ANSWER HERE*

# 28. If so, run another regression model (mod3) in the code chunk below that removes
# this/these non-significant variable(s). Otherwise, leave the space below blank.


# A linear regression model can only find linear relationships. If there is a 
# curvilinear relationship in our data, a regression model won't find it. 

#29. To illustrate this potential problem, create a scatter plot with *DomesticGross* 
# on the x-axis and the residuals from your last model on the y-axis. (The residuals 
# are stored in *modelname$residuals*.)


# Residuals are sometimes called "errors", because they should only contain random 
# noise. That means that if we plot residuals against a variable in our equation (like 
# you just did), you should only see a random sea of point, with no systematic 
# relationships.

#30. What is the systematic relationship shown in the plot you just created? Phrase 
# your answer in this way: "For movies with low values of DomesticGross, our model 
# tends to over/underpredict Rating. For movies with medium values of DomesticGross, 
# our model tends to . . ."
# *ENTER ANSWER HERE*

# To learn how to correct the problem apparent in this plot, you'll have to watch 
# the Lesson 13 Supplementary Instruction video. 

#31. Create the new variable needed to fix this problem.


#32. Run your new model (as mod4), incorporating this new variable, and output a 
# summary of the model.


# The interpretation of your new variable is the same as any other variable: A 
# one-unit increase in the variable produces a *coefficient*-sized increase in 
# *Rating*. The problem is that a one-unit increase in this new variable is not 
# straightforward.

# 33. Did incorporating this new variable improve your model? By how much did 
# R-Squared improve?
# *ENTER ANSWER HERE*

# Because this new variable improved our model so much, it is possible that variables 
# that previously were not statistically significant are now significant. 

#34. Run a new regression model (mod5) incorporating both the new variable you just 
# created and any variables you previously removed from the model due to non-
# significance. Output a summary of the model.


#35. Did the significance of any of those variables change? Which variables?
# *ENTER ANSWER HERE*

# That illustrates the complexity of obtaining a best possible prediction model. 
# Because all variables in a multiple regression model can affect all other variables, 
# the complexity increases exponentially as the number of variables increases.

# Speaking of variable affecting one another, we have not looked for any 
# interactions. It may be that the effect of one variable depends on the value of 
# another variable. For example, perhaps *TrueStory* generates a larger audience when 
# it is also an *Action* movie compared to when it is not. To test for this, we would 
# add a *TrueStory:Action* interaction.

#36. Check for one possible interaction by incorporating it into a regression model 
# (as mod6) and outputting the summary. 


#37. Report whether your proposed interaction was statistically significant. Also 
# report what the interpretation of that interaction would be if it were significant.
# *ENTER ANSWER HERE*

# If your interaction term was statistically significant, you will want to use mod6
# to predict Rating for the 20 movies in the Regression Challenge Selection Data. 
# Otherwise, use mod5.

# Applying the Regression Model

# We will use the *predict()* function to apply our best regression model to the new 
# movies (found in *moviesel*). In order to apply a model to new data, the new data 
# must have all of the same variables, and the variables must be formatted the same. 

#38. First, you must factor all of the variables that were previously factored (in
# Questions 2, 4, 9, and 10).


#39. Next, you need to create the same variable we created in our previous model to 
# account for the nonlinear relationship.


#Now, take stock of the variables that are missing from the Selection Data. We are 
# missing all of the data that is not a characteristic of the movie itself. So we 
# are missing *Day*, *Hour*, *ReRun*, *PrevRating*, and *SpotRatings*. These are 
# variables that you as the VP of programming at TNT choose. You choose what *Day* 
# to air a movie, what time (*Hour*) to start the movie, whether you will air the 
# movie multiple times (thereby creating a *ReRun* airing), and how much to 
# advertise the upcoming airing of the movie (*SpotRatings*). You don't directly 
# control the *PrevRating*, but by airing the movie after a show that is more or 
# less popular, you influence how many people might be available to stick around 
# for the movie.

# These variable have to be in the new Selection Data in order for us to apply our 
# regression model. We don't yet know the values of these variables, so we can just
# fill them in with filler values. Give each of the 20 movies the same value for 
# these variables so we can compare which movie will produce the highest Ratings, 
# all else being equal.

#40. Add the *Day* variable, factored, to the new data frame. Make them all *Friday*.


#41. Add the *Hour* variable, factored, to the new data frame. Make them all 8.


#42. Add the *ReRun* variable, factored, to the new data frame. Make them all 0.


#43. Add the *PrevRating* variable to the new data frame. Make them all take the 
# value of the mean of *PrevRating* from the original data.


#44. Add the *SpotRatings* variable to the new data frame. Make them all take the 
# value of the mean of *SpotRatings* from the original data.


# The new dataset should now be formatted and ready for the *predict()* function. 

#45. Using the *predict()* function, predict the Rating for each of the 20 movies 
# in the new data frame. Save the predictions as predrats.


#46. Which movie is predicted to produce the highest rating (all else being 
# equal)? Save the MovieID of this movie as highrat.


# Having a model to predict *Rating* is useful, but it is only the first step. We 
# want to predict the profit achieved from airing these movies. As a television 
# network, we earn money from ad revenues. Ad revenues accumulate from people 
# watching the commercials that air during the movies. To simplify our profit 
# calculation, we will make the following assumptions. Each movie is 2 hours long, 
# into which we insert 1 hour of commercials, so each movie will air for 3 hours. 
# An hour of commercials comes from 120 30-second spots. Advertisers pay us $20 for 
# every 1,000 people who watch their 30-second spot. So for every 1 million people 
# who watch a movie, we earn $2.4 million ($20 * 1,000 thousands of viewers * 120 
# ads) in ad revenue.

#47. Calculate the predicted profit from each movie by multiplying the predicted 
# rating by $2.4 million minus the licensing fee. Save it as predprofs.


# Now for the fun part. As VP of programming you can choose to air three movies 
# during the course of a single week. You can choose 
# (1) which movie(s) to air, 
# (2) when to air them, and 
# (3) how to advertise them. 
# You may air three different movies or air the same movie three times. If you air 
# the same movie three times, note that the second and third airings will be re-runs. 
# Also note that the License Fee for the second and third airings will be 75% of the 
# original fee (i.e., the studio gives you a 25% discount on the later airings). 

# Your SpotRatings budget is 50. That is, you may advertise the upcoming airings to 
# up to 50 million TNT viewers. You may advertise 50 to one airing and 0 to the 
# others or assign a value of 16.67 to all three airings (or anything in between).

# Keep in mind that the movies may not overlap. If you choose an airing of Saturday 
# at 9, you cannot also choose an airing of Saturday at 11.

# Please make your selections in chronological order. The week begins on Sunday and 
# ends on Saturday.

#48. Fill in your selections using the code below. For example, if you choose to show 
# movie 20 on Tuesday at 7 with a SpotRatings of 17, your first four lines of code 
# should look like this:
#    MovieSelect$MovieID[1] <- 20
#    MovieSelect$Day[1] <- "Tuesday"
#    MovieSelect$Hour[1] <- 7
#    MovieSelect$SpotRatings[1] <- 17

MovieSelect <-data.frame(matrix(rep(0, 12), nrow = 3))
names(MovieSelect) <-c("MovieID", "Day", "Hour", "SpotRatings")

MovieSelect$MovieID[1] <- 
MovieSelect$Day[1] <- 
MovieSelect$Hour[1] <- 
MovieSelect$SpotRatings[1] <- 
MovieSelect$MovieID[2] <- 
MovieSelect$Day[2] <- 
MovieSelect$Hour[2] <- 
MovieSelect$SpotRatings[2] <- 
MovieSelect$MovieID[3] <- 
MovieSelect$Day[3] <- 
MovieSelect$Hour[3] <- 
MovieSelect$SpotRatings[3] <- 
  
  
  #49. Print MovieSelect to the screen to make sure your selections are correct.
  
  
  # I will be granting 10 points extra credit to students whose decisions are in the 
  # top 5% of profitability. I will be granting 5 points extra credit to students whose 
  # decisions are in the next highest 10% of profitability.
  