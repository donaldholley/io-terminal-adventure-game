RabidWolf := Enemy clone do(
  name = "Rabid Wolf"
  maxHealth = 40
  health = 40
  attack = 20
  dodge = 5
  itemList = list(WoodenSword, Staff, WoodenBow, WoodenDagger, WoodenAxe)

  show := method(
    "" println
    "" println
    "#{self name}" interpolate println
    "Health: #{self health}" interpolate println
    "                               " println
    "                               " println
    "               //             " println
    "               \\              " println
    "                |              " println
    "             /    \\           " println
    "           /      /            " println
    "         /  |  /   //          " println
    "       Y   |   Y    \\\\       " println
    "       |  • • |      \\\\      " println
    "     _//\\WWWW/  \\\\          " println
    "   //-   \\WWW/  \\\\           " println
    "                 \\\\          " println
    "" println
  )
)
