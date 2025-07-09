#ASSIGNMENT 1:
data <-  data.frame(repetition=2:8,
                    accuracy=c(.526,.667,.798,.887,.924,.958,.954),
                    latency=c(2.156,1.967,1.762,1.68,1.552,1.467,1.402))

#par(mfrow=c(1, 2))
#plot(data$repetition, data$accuracy)
#plot(data$repetition, data$latency)

#--------------------------------------------------------------------------
#ASSIGNMENT 2:

## Latency equation
# A: activation
# F: scaling parameter
# theta: retrieval threshold
# T: non-retrieval time
latency <- function(A, F=2, theta=.5, T=1) {
    ifelse(A>theta, F*exp(-A), F*exp(-theta)) + T
}

## Probability of recall
# A: activation
# theta: retrieval threshold
# s: noise
prob.recall <- function(A, theta=0.5, s=0.1) {
    1/(1+exp((theta-A)/s))
}

## activation function
# N: number of repetitions
# d: decay of activation
activation <- function(N, d=.5) {
    (1-d)*log(N)
}

repetitions <- 2:8
A <- activation(repetitions)

#par(mfrow=c(1, 2))
#plot(repetitions, prob.recall(A))
#plot(repetitions, latency(A))

#--------------------------------------------------------------------------
#ASSIGNMENT 3:

#--------------------------------------------------------------------------
#ASSIGNMENT 4:

repetitions <- 2:8
A <- activation(repetitions)

par(mfrow=c(1,2), las=1)
plot(data$repetition, data$accuracy, ylim=c(0,1))
lines(repetitions, prob.recall(A))

plot(data$repetition, data$latency,ylim=c(0,3))
lines(repetitions, latency(A))

Optimizer <- function(ParVect)
{
	#takes in vector of all possible parameters
	#finds the optimal fit on the data by looking
	#at the effects of changes in parameters on these
	#differences
}

Optimizer(c(, 2))