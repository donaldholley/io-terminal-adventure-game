MountainLion := Enemy clone do(
  name = "Mountain Lion"
  maxHealth = 80
  health = 80
  attack = 35
  dodge = 4
  itemList = list(IronAxe, IronBow, IronDagger, IronSword, AdeptStaff)

  show := method(
    "" println
    "" println
    "#{self name}" interpolate println
    "Health: #{self health}" interpolate println
    "                               " println
    "                               " println
    "         \\| |  /  /           " println
    "     \\ _\\       /_           " println
    "      /    *  *    \\          " println
    "       /  \\.. /   \\ \\       " println
    "   //  /   WWWW  \\\\          " println
    "   /   / / \\  /  \\    \\      " println
    "  /         WW         \\      " println
    "  |         --         |      " println
    "   |   |           |   |       " println
    "   |   | \\_____  / |   |       " println
    "   |  |             |  |        " println
    "" println
  )
)
