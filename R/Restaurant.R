Restaurant / R / Classes.R

library(methods)

setClass("Employee",
         slots = list(
           id = "numeric",
           name = "character"
         ))

setClass("Server", contains = "Employee")
setClass("Bartender", contains = "Employee")
setClass("FoodRunner", contains = "Employee")

setClass("Sales",
         slots = list(
           employee = "Employee",
           date = "Date",
           food_sales = "numeric",
           bar_sales = "numeric",
           tips = "numeric"
         ))

setClass("Tipout",
         slots = list(
           food_tipout_percent = "numeric",
           bar_tipout_percent = "numeric"
         ))

setClass("CheckoutReport",
         slots = list(
           employee = "Employee",
           month = "numeric",
           year = "numeric",
           total_hours = "numeric",
           total_tips = "numeric",
           bar_tipout = "numeric",
           food_tipout = "numeric",
           net_tips = "numeric"
         ))

setClass("HoursLog",
         slots = list(
           employee = "Employee",
           clock_in = "POSIXct",
           clock_out = "POSIXct",
           hours = "numeric"
         ))

setClass("TheRestaurant",
         slots = list(
           name = "character",
           employees = "list",
           hourslog = "list",
           sales = "list",
           tipout = "Tipout"
         ))
