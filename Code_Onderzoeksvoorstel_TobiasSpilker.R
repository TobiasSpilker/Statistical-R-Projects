#########################################################################
#					README:						#
#Je moet de volgende packages hebben gedownload: {ggraph, igraph}		#
#anders werkt een deel van de grafieken niet. Ik heb deze bemachtigd	#
#via Nederland - Dronten. De coden is verder uitgelegd op plekken waar	#
#ik het nodig vondt. De getoonde netwerken zijn voorbeelden. Groetjes!	#
#########################################################################


par(mfrow=c(2,2), las = 1) #to plot multiple at same time

VisualizeNetworks <- function()
{
	library(igraph)
	library(ggraph)

	#CREATING CONNECTIONS FOR TRADITIONAL NETWORK:
	EdgesTrad <- c(1,5, 1,6, 1,7, 1,8, 2,4, 2,5, 
			2,6, 2,7, 2,8, 3,4, 3,5, 3,6, 3,7, 
			3,8, 4,9, 5,9, 6,9, 7,9, 8,9)

	#CREATING TRADITIONAL NETWORK:
	TradNet <- make_empty_graph(n = 9) %>%			#Create 9 nodes
  		add_edges(EdgesTrad) %>%				#Add edges
  		set_edge_attr("color", value = "blue") %>%	#Change color of edges
  		add_edges(c(1,4), color = "blue")			#Add last one??

	#PLOTTING TRADITIONAL NETWORK:
	plot(TradNet, 
		layout = layout_as_tree, 			#Tree structure
		edge.width=2, 					#Edge width
		edge.arrow.size=0.5,				#Edge size
		vertex.size = 30,					#Node size
		main = "Traditional Network:")		#Title

	#CREATING CONNECTIONS FOR MODIFIED NETWORK:
	EdgesTrad <- c(2,7, 3,8, 4,8, 5,9, 6,9, 7,10, 8,11, 9, 12, 10,13, 11,13, 12,13)

	#CREATING MODIFIED NETWORK:
	ModNet <- make_empty_graph(n = 13) %>%
  		add_edges(EdgesTrad) %>%
  		set_edge_attr("color", value = "green") %>%
  		add_edges(c(1,7), color = "green")

	#PLOTTING MODIFIED NETWORK:
	plot(ModNet, 
		layout = layout_as_tree, 
		edge.width=2, 
		edge.arrow.size=0.5,
		vertex.size = 30,
		main = "Modified Network:")
}


PlotPerformance <- function()
{
	#POSSIBLE DATA FOR TRADITIONAL NETWORK:
	Data_X1 <- c(0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 73)
	Data_Y1 <- c(.9, .5, .2, .1, .03, .01, .008, .003, 0.001, 
			0.0005, 0.0001, 0.00003, 0.00001, 0.000005, 0.000001, 0.0000005)

	#PLOTTING GRAPH / TRADITIONAL NETWORK:
	plot(Data_X1, 
		Data_Y1, 
		xlab="Epochs",					#x-axis title
		xlim = c(0, 70),					#x-axis scale
		ylab="Mean Squared Error", 			#y-axis title
		ylim = c((10^(-8)), (10^0)),			#y-axis scale
		log = 'y', 						#changing the y-axis to logarithmic scale
		main = "Performance on training-set:",	#plot title
		cex.axis = 0.8, 					#changes the axis scale
		type = "l", 					#makes it a line-chart
		col = "blue") 					#makes the line color blue

	#POSSIBLE DATA FOR MODIFIED NETWORK:
	Data_X2 <- c(0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 73)
	Data_Y2 <- c(.9, .8, .6, .4, .2, .1, .008, .001, 0.0005, 
			0.0001, 0.00003, 0.00001, 0.000005, 0.0000005, 0.0000001, 0.00000005)

	#PLOTTING MODIFIED NETWORK:
	lines(Data_X2, Data_Y2, col = "green")

	#DRAWING LEGENG:
	legend(0, .00005, 					#Position
		legend=c("Traditional", "Modified"), 	#Labels
		fill = c("blue","green"),			#Colors
		bty = 'n')						#No box lines
}

PlotROC <- function()
{
	#PLOTTING THE GRAPH:
	plot(0.3, 0.65, 
		xlim=c(0,1), 
		ylim=c(0,1), 
		xlab="FALSE ALARM RATE", 
		ylab="HITRATE", 
		pch=16:17, type='b', lty=2,
		main = "Training ROC:")
	
	#CREATING DATAPOINTS FOR TRAD. AND MOD.:
	points(0.3, 0.65, xlim=c(0,1), col= "blue", pch=16:17, type='b', lty=2)
	points(0.15, 0.8, xlim=c(0,1), col= "green", pch=16:17, type='b', lty=2)

	#CREATING CENTER LINE:
	lines(c(-.04, 1.04), c(-.04, 1.04), lty=2) #abline

	#CREATING LEGEND:
	legend("bottomright", 
		legend=c("Traditional", "Modified"), 
		fill = c("blue","green"), 
		bty='n')
}

VisualizeNetworks()
PlotPerformance()
PlotROC()