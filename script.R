rm(list=ls()) # clean out your workspace

#choose.files() # --> select the file 
load("BlastDecisions.Rdata")
#View(dat)

#-----------------------------------------------------------------------

#HITS: = true positive = classification B AND accuracy TRUE
i = 1
HitCounter = 0
for (ding in dat$classification)
{
	if (dat$classification[i] == "B" && dat$accuracy[i] == "TRUE")
	{
		HitCounter = HitCounter + 1
	}	

	i = i + 1
}

#FALSE ALARM: = false positive = classification NB AND accuracy TRUE
j = 1
FalseCounter = 0
for (ding in dat$classification)
{
	if (dat$classification[j] == "NB" && dat$accuracy[j] == "FALSE")
	{
		FalseCounter = FalseCounter + 1
	}	

	j = j + 1
}

#CORRECT REJECTIONS: = true negative = classification NB AND accuracy FALSE
q = 1
CorRecCounter = 0
for (ding in dat$classification)
{
	if (dat$classification[q] == "NB" && dat$accuracy[q] == "TRUE")
	{
		CorRecCounter = CorRecCounter + 1
	}	

	q = q + 1
}

#Misses:
p = 1
MisCounter = 0
for (ding in dat$classification)
{
	if (dat$classification[p] == "B" && dat$accuracy[p] == "FALSE")
	{
		MisCounter = MisCounter + 1
	}	

	p = p + 1
}

#CALCULATING X-RATES:
HitRate = HitCounter / (HitCounter + MisCounter)
FalseAlarmRate = FalseCounter / (FalseCounter + CorRecCounter)
CorrectRate = 1 - FalseAlarmRate
MissRate = 1 - HitRate


#-----------------------------------------------------------------------


#CREATING A TABLE FOR QUICK VISUALIZATION:
rownames = c("TRUE", "FALSE")
colnames = c("YES", "NO")
ValueMatrix <- matrix(c(HitCounter, MisCounter, 
FalseCounter, CorRecCounter), nrow = 2, byrow = TRUE,
dimnames = list(rownames, colnames))
print(ValueMatrix)

#SHIFTING THE VALUES TO THE LEFT:
MinimumLeft = min(ValueMatrix[1, 2], ValueMatrix[2, 2])
ValueMatrix[1, 1] = ValueMatrix[1, 1] + MinimumLeft #A
ValueMatrix[1, 2] = ValueMatrix[1, 2] - MinimumLeft #B
ValueMatrix[2, 1] = ValueMatrix[2, 1] + MinimumLeft #C
ValueMatrix[2, 2] = ValueMatrix[2, 2] - MinimumLeft #D

#INCREMENTALLY SHIFTING THE VALUES TO THE RIGHT:
MinimumRight = min(ValueMatrix[1, 1], ValueMatrix[2, 1])
i = 1
SensitivityVector <- c()
SpecificityVector <- c()
while(i <= MinimumRight)
{
	#SHIFTS VALUES TO THE RIGHT (IN TABLE AND CRITERIUM)
	ValueMatrix[1, 1] = ValueMatrix[1, 1] - 1 #A
	ValueMatrix[1, 2] = ValueMatrix[1, 2] + 1 #B
	ValueMatrix[2, 1] = ValueMatrix[2, 1] - 1 #C
	ValueMatrix[2, 2] = ValueMatrix[2, 2] + 1 #D

	#RE-CALCULATING SENS. AND SPEC. AND STORING THIS IN VECTOR
	Sensitivity <- ValueMatrix[1, 1] / (ValueMatrix[1, 1] + ValueMatrix[1, 2])
	SensitivityVector <- append(SensitivityVector, Sensitivity * 100)
	Specificity = ValueMatrix[2, 1] / (ValueMatrix[2, 1] + ValueMatrix[2, 2])
	SpecificityVector <- append(SpecificityVector, Specificity * 100)

	i = i + 1		
}


#BIJV: EXPERTS MET DIFFICULTY EASY:
par(mfrow=c(2,2), las = 1)
plot(0, 0, 
xlab = "Specificity (FP)", ylab = "Sensitivity (TP)", 
xlim = c(0,100), ylim=c(0,100))

lines(SpecificityVector, SensitivityVector)

plot(0, 0, 
xlab = "Specificity (FP)", ylab = "Sensitivity (TP)", 
xlim = c(0,100), ylim=c(0,100))
plot(0, 0, 
xlab = "Specificity (FP)", ylab = "Sensitivity (TP)", 
xlim = c(0,100), ylim=c(0,100))
plot(0, 0, 
xlab = "Specificity (FP)", ylab = "Sensitivity (TP)", 
xlim = c(0,100), ylim=c(0,100))


