Vampire := Enemy clone do(
    name = "Vampire"
    maxHealth = 150
    health = 150
    attack = 40
    dodge = 6
    itemList = list(AdeptStaff, IronDagger)

    show := method(
    "" println
    "" println
    "#{self name}" interpolate println
    "Health: #{self health}" interpolate println
    "                               " println
    "                               " println
    "                               " println
    "           \\ ______ /          " println
    "          /         \\\\          " println
    "         |         ||          " println
    "        \\|   `    `||/         " println
    "          |     \\\\ ||           " println
    "         _|     __ ||__        " println
    "        / |    V  V||  \\\\         " println
    "       /  \\       //  \\ \\\\       " println
    "     /       \\ __//       \\\\    " println
    "                               " println
    "" println
  )
)
