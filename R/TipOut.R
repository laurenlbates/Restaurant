
setGeneric("the_tipout",
           function(employee, sales, tipout) {
             standardGeneric("the_tipout")
           })

setMethod("the_tipout", "Server", function(employee, sales, tipout) {
  food_out <- sales@food_sales * tipout@food_tipout_percent
  bar_out  <- sales@bar_sales  * tipout@bar_tipout_percent

  list(
    to_food_runner = food_out,
    to_bartender  = bar_out,
    all_tipout = food_out + bar_out
  )
})

setMethod("the_tipout", "Bartender", function(employee, sales, tipout) {
  food_out <- sales@food_sales * tipout@food_tipout_percent

  list(
    to_food_runner = food_out,
    to_bartender  = 0,
    all_tipout = food_out
  )
})
