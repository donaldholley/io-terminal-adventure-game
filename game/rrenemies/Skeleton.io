Skeleton := Enemy clone do(
  name = "Skeleton"
  maxHealth = 90
  health = 90
  attack = 20
  dodge = 5
  itemList = list(IronSword, AdeptStaff, IronBow)

  show := method(
    "" println
    "#{self name}" interpolate println
    "Health: #{self health}" interpolate println
    "             _________          " println
    "           /           \\        " println
    "         /                \\     " println
    "       |                   |     " println
    "       |                   |     " println
    "        \\  ()    ()     /      " println
    "        |\\    |        / |     " println
    "         |\\           /  |     " println
    "         | \\LLLLLLL/    |     " println
    "         | \\_LLLLL__ /  |     " println
    "         \\              /      " println
    "          \\___________/        " println
    "                -[]-            " println
    "                -[]-            " println
    "" println
  )
)
