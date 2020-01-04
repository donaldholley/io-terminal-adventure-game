GiantHawk := Enemy clone do(
  name = "Giant Hawk"
  maxHealth = 20
  health = 20
  attack = 20
  dodge = 3
  itemList = list(WoodenSword, Staff, WoodenBow, WoodenDagger, WoodenAxe)

  show := method(
    "" println
    "" println
    "#{self name}" interpolate println
    "Health: #{self health}" interpolate println
    "                                     " println
    "        /        / \\\\                " println
    "       / \\       | \\\\            " println
    "      |   \\      |  \\\\              " println
    "       \\   \\    / |||               " println
    "        \\     ~   ///                " println
    "         \\  . .  ///                " println
    "          \\  A   ///\\                 " println
    "          \\  V  ///\\                " println
    "           \\___///\\                  " println
    "            |  | \\\\                  " println
    "           /\\\\//\\                 " println
    "                                     " println
    "" println
  )
)
