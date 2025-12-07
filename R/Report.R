
report <- function(employee, sales, tipout_obj) {
  tipout <- the_tipout(employee, sales, tipout_obj)

  net_tips <- sales@tips - tipout$all_tipout

  data.frame(
    Date = sales@date,
    Total_Sales = sales@food_sales + sales@bar_sales,
    Tips_Before_Tipout = sales@tips,
    Food_Runner_Tipout = tipout$to_food_runner,
    Bartender_Tipout = tipout$to_bartender,
    Take_Home = net_tips
  )
}
