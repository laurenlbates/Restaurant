
monthly_report.Restaurant <- function(x, year, month, ...) {

  library(ggplot2)
  library(dplyr)

  sales_total <- x@sales

  df <- do.call(rbind, lapply(sales_total, function(s) {
    data.frame(
      date = s@date,
      food_sales = s@food_sales,
      bar_sales = s@bar_sales,
      total_sales = s@food_sales + s@bar_sales,
      food_items = I(list(s@food_items)),
      drink_items = I(list(s@drink_items))
    )
  }))

  df$year  <- format(df$date, "%Y")
  df$month <- format(df$date, "%m")

  df_month <- df[df$year == as.character(year) &
                   df$month == sprintf("%02d", month), ]

  food_vector  <- unlist(df_month$food_items)
  drink_vector <- unlist(df_month$drink_items)

  food_popularity <- sort(table(food_vector), decreasing = TRUE)
  drink_popularity <- sort(table(drink_vector), decreasing = TRUE)

  # Table Summary

  cat("\nMonthly Sales Report: \n")
  cat("Restaurant:", x@name, "\n")
  cat("Month:", month, "Year:", year, "\n")
  cat("--------------------------------\n\n")

  print(df_month[, c("date", "food_sales", "bar_sales", "total_sales")])

  cat("\nTotal Monthly Sales:", sum(df_month$total_sales), "\n\n")

  # Printing Popular Food and Drink Items

  cat("Most Popular Food Items: \n")
  print(food_popularity)

  cat("\nMost Popular Drink Items: \n")
  print(drink_popularity)

  # Monthly Sales Trends

  monthly_plot <- ggplot(df_month, aes(x = date, y = total_sales)) +
    geom_point(size = 3, color = "blue") +
    geom_smooth(method = "lm", se = TRUE, color = "red") +
    labs(
      title = paste("Monthly Sales Trend", x@name),
      x = "Date",
      y = "Sales"
    ) +
    theme_minimal(base_size = 14)

  print(monthly_plot)

  # Regression summary
  model <- lm(total_sales ~ as.numeric(date), data = df_month)

  cat("\nRegression Summary: \n")
  print(summary(model))

  invisible(df_month)
}
