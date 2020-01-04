StrayWolf := Enemy clone do(
  name = "Stray Wolf"
  maxHealth = 30
  health = 30
  attack = 15
  dodge = 6
  itemList = list(WoodenSword, Staff, WoodenBow, WoodenDagger, WoodenAxe)

  show := method(
    "" println
    "" println
    "#{self name}" interpolate println
    "Health: #{self health}" interpolate println
    "                               " println
    "                               " println
    "             \\                " println
    "               \\              " println
    "                |              " println
    "             /    \\           " println
    "           /      /            " println
    "         /     /   //          " println
    "       A   -   A    \\\\       " println
    "       |  . . |      \\\\      " println
    "      //\\____/  \\\\          " println
    "     //   WWW   \\\\           " println
    "    //           \\\\          " println
    "" println
  )
)
