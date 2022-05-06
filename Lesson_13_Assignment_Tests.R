library(testthat)

# each call to test_that() produces one test
# each test represents one point value
# you can have multiple tests for each question

library(readr)
library(dplyr)
library(ggplot2)
mvskey <- read_csv("Regression Challenge Data.csv")
movieselkey <- read_csv("Regression Challenge Selection Data.csv")
mvskey <- data.frame(mvskey)
movieselkey <- data.frame(movieselkey)

mvskey$Day <- factor(mvskey$Day)
mvskey$Hour <- factor(mvskey$Hour)
mvskey$Stars <- factor(mvskey$Stars)
mvskey$TrueStory <- factor(mvskey$TrueStory)
mvskey$ChickFlick <- factor(mvskey$ChickFlick)
mvskey$Action <- factor(mvskey$Action)
mvskey$TVPremiere <- factor(mvskey$TVPremiere)
mvskey$NetworkPremiere <- factor(mvskey$NetworkPremiere)
mvskey$ReRun <- factor(mvskey$ReRun)

mod2key <- lm(Rating ~ Stars + Day + Hour + TrueStory + ChickFlick + Action + TVPremiere +
             ReRun + PrevRating + SpotRatings + DomesticGross, data = mvskey)

residplotkey <- ggplot(mvskey, aes(x = DomesticGross, y = mod2key$residuals)) +
  geom_point()

modans <- lm(Rating ~ Stars + Day + Hour + TrueStory + ChickFlick + Action + TVPremiere + NetworkPremiere + ReRun + PrevRating + SpotRatings + DomesticGross + DG2, data = mvs)
modans$coefficients <- c(.7, .9, 1.4, 1.4, -.5, .4, 1, -.5, -.5, -.5, 1.1, .7, .7, .7, 1.25, .3, -.4, .35, .9, .3, -1.2, .18, .1, .04, -.00012)
finsel <- moviesel[MovieSelect[,1],]
finsel$Day <- factor(MovieSelect[,2])
finsel$Hour <- factor(MovieSelect[,3])
finsel$SpotRatings <- MovieSelect[,4]
finsel$ReRun <- c(0, 0, 0)
if(finsel$MovieID[2] == finsel$MovieID[1]) {
  finsel$ReRun[2] <- 1
  finsel$License.Fee[2] <- finsel$License.Fee[2] * .75
}
if(finsel$MovieID[3] == finsel$MovieID[1]) {
  finsel$ReRun[3] <- 1
  finsel$License.Fee[3] <- finsel$License.Fee[3] * .75
}
if(finsel$MovieID[3] == finsel$MovieID[2]) {
  finsel$ReRun[3] <- 1
  if(finsel$MovieID[3] != finsel$MovieID[1]) {
    finsel$License.Fee[3] <- finsel$License.Fee[3] * .75
  }
}
finsel$ReRun <- factor(finsel$ReRun)
finsel$PrevRating <- c(3, 3, 3)

profit <- sum(predict(modans, newdata = finsel))*2400000 - sum(finsel$License.Fee)

test_that("Q2 (visible)", {
  
  expect_true(class(mvs$Day) == "factor")
  
})

test_that("Q10 (visible)", {
  
  expect_true(class(mvs$TrueStory) == "factor")
  expect_true(class(mvs$ChickFlick) == "factor")
  expect_true(class(mvs$TVPremiere) == "factor")
  
})

test_that("Q11 (visible)", {
  
  expect_equal(as.numeric(mod1$coefficients[5]), -.3298399, tolerance = 1e-3)
  expect_equal(as.numeric(mod1$coefficients[9]), -.2730736, tolerance = 1e-3)
  expect_equal(as.numeric(mod1$coefficients[17]), -.529862, tolerance = 1e-3)
  
})

test_that("Q26 (visible)", {
  
  expect_equal(as.numeric(mod2$coefficients[5]), -.2816094, tolerance = 1e-2)
  expect_equal(as.numeric(mod2$coefficients[9]), -.3120968, tolerance = 1e-2)
  expect_equal(as.numeric(mod2$coefficients[17]), -.5371966, tolerance = 1e-2)
  
})

test_that("Q29 plot (visible)", {
  
  expect_equal(residplot$layers[[1]], residplotkey$layers[[1]])
  expect_equal(residplot$scales, residplotkey$scales)
  expect_equal(residplot$labels$x, residplotkey$labels$x)
  
})

test_that("Q31 (visible)", {
  
  expect_equal(mvs$DG2[4], 18757.01, tolerance = 1)
  expect_equal(mvs$DG2[56], 1305.012, tolerance = 1)
  expect_equal(mvs$DG2[162], 1297.53, tolerance = 1)
  
})

test_that("Q32 (visible)", {
  
  expect_equal(as.numeric(mod4$coefficients[6]), .2925681, tolerance = 1e-2)
  expect_equal(as.numeric(mod4$coefficients[10]), -.7225117, tolerance = 1e-2)
  expect_equal(as.numeric(mod4$coefficients[19]), .8964456, tolerance = 1e-2)
  
})

test_that("Q34 (visible)", {
  
  expect_equal(as.numeric(mod5$coefficients[7]), 1.095948, tolerance = 1e-2)
  expect_equal(as.numeric(mod5$coefficients[12]), .855947, tolerance = 1e-2)
  expect_equal(as.numeric(mod5$coefficients[23]), .1059828, tolerance = 1e-2)
  
})

test_that("Q36 (visible)", {
  
  expect_true(grepl(":", as.character(mod6$call)[2]))
  
})

test_that("Q38 (visible)", {
  
  expect_true(class(moviesel$Stars) == "factor")
  expect_true(class(moviesel$Action) == "factor")
  expect_true(class(moviesel$NetworkPremiere) == "factor")
  
})

test_that("Q39 (visible)", {
  
  expect_equal(moviesel$DG2[3], 110883.2, tolerance = 1)
  expect_equal(moviesel$DG2[8], 14137.04, tolerance = 1)
  expect_equal(moviesel$DG2[16], 46805.46, tolerance = 1)
  
})

test_that("Q45 (visible)", {
  
  expect_equal(as.numeric(predrats[3]), 3.823966, tolerance = 1e-2)
  expect_equal(as.numeric(predrats[7]), 6.86406, tolerance = 1e-2)
  expect_equal(as.numeric(predrats[18]), 7.407939, tolerance = 1e-2)
  
})

test_that("Q46 (visible)", {
  
  expect_equal(as.numeric(highrat), 16, tolerance = 1e-3)

})

test_that("Q47 (visible)", {
  
  expect_equal(as.numeric(predprofs[3]), -5822481, tolerance = 1e-2)
  expect_equal(as.numeric(predprofs[7]), -526254.9, tolerance = 1e-2)
  expect_equal(as.numeric(predprofs[18]), 2779055, tolerance = 1e-2)
  
})

test_that("Q48 (visible)", {
  
  expect_true(sum(MovieSelect$SpotRatings) <= 50)
  
})


test_that("Extra Credit Top10 Point1 (visible)", {
  
  expect_true(profit > 41850000)
  
})

test_that("Extra Credit Top10 Point2 (visible)", {
  
  expect_true(profit > 41850000)
  
})

test_that("Extra Credit Top10 Point3 (visible)", {
  
  expect_true(profit > 41850000)
  
})

test_that("Extra Credit Top10 Point4 (visible)", {
  
  expect_true(profit > 41850000)
  
})

test_that("Extra Credit Top10 Point5 (visible)", {
  
  expect_true(profit > 41850000)
  
})

test_that("Extra Credit Top5 Point1 (visible)", {
  
  expect_true(profit > 44300000)
  
})

test_that("Extra Credit Top5 Point2 (visible)", {
  
  expect_true(profit > 44300000)
  
})

test_that("Extra Credit Top5 Point3 (visible)", {
  
  expect_true(profit > 44300000)
  
})

test_that("Extra Credit Top5 Point4 (visible)", {
  
  expect_true(profit > 44300000)
  
})

test_that("Extra Credit Top5 Point5 (visible)", {
  
  expect_true(profit > 44300000)
  
})






