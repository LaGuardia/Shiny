####################
# DashboardPlus
# Example
# About: This files contain all libraries needed for shiny app 
# Questions: brassman785@gmail.com
####################

if (! ("shiny" %in% rownames(installed.packages()))) { install.packages("shiny") }
if (! ("shinydashboard" %in% rownames(installed.packages()))) { install.packages("shinydashboard") }
if (! ("shinyjs" %in% rownames(installed.packages()))) { install.packages("shinyjs") }
if (! ("shiny" %in% rownames(installed.packages()))) { install.packages("shiny") }

install.packages("styler")
install.packages("shinyAce")
install.packages("shinyWidgets")
install.packages("shinyjqui")

library(styler)
library(shinyAce)
library(shinyWidgets)
library(shinyjqui)
library("shinydashboard")
library("shiny")
library("shinyjs")
library("shinydashboardPlus")