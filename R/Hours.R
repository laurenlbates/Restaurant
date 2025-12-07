
clock_in <- function(employee_name) {
  x <- Sys.time()

  cat(employee_name@name, "clocked in at: ", format(x), "\n")

  new("HoursLog",
      employee = employee_name,
      clock_in = x,
      clock_out = as.POSIXct(NA),
      hours = NA_real_)
}

clock_out <- function(x) {
  out_x <- Sys.time()
  hours <- as.numeric(difftime(out_x, x@clock_in, units = "hours"))

  x@clock_out <- out_x
  x@hours <- hours

  emp <- x@employee

  full_report <- report()
  cat("\n----End of Shift Summary----\n")
  cat("Employee: ", x@employee, "\n")
  cat("Clock In: ", format(x@clock_in),"\n")
  cat("Clock Out: ", format(x@clock_out),"\n")
  cat("Total Hours: ", round(x@hours, 2),"\n")

  if(is(emp, "FoodRunner")) {
    return(x)
  }
  else
  cat("\n-----Checkout Report-----\n")
  print(full_report)
  return(x)
}
