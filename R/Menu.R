
create_menu <- function(items = data.frame()) {
  if (nrow(items) == 0) {
    items <- data.frame(
      Name = character(),
      Type = character(),
      Price = numeric(),
      stringsAsFactors = FALSE
    )
  }
  structure(list(items = items), class = "Menu")
}

add_item <- function(menu, name, type, price) {
  new_item <- data.frame(
    Name = name,
    Type = type,
    Price = price,
    stringsAsFactors = FALSE
  )

  menu$items <- rbind(menu$items, new_item)
  menu
}

remove_item <- function(menu, item_name) {
  menu$items <- menu$items[menu$items$Name != item_name, ]
  menu
}

print_menu <- function(menu) {
  items <- menu$items
  types <- sort(unique(items$Type))

  cat("   [Restaurant Name] Menu\n")
  cat("=============================\n")

  for (x in types) {
    cat(past0("-- ", toupper(x), " --\n"))
    type_items <- items[items$Type == x, ]

    for (i in 1:nrow(type_items)) {
      line <- sprintf(" %-20s %5.2f",
                      type_items$Name[i],
                      type_items$Price[i])
      cat(line, "\n")
    }

  }
  invisible(menu)
}
