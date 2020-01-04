Giant := Enemy clone do(
  name = "Giant"
  maxHealth = 500
  health = 500
  attack = 100
  dodge = 8
  itemList = list(SteelSword, SteelBow, SteelAxe, SteelDagger, MasterStaff)

  show := method(
    "" println
    "" println
    "#{self name}" interpolate println
    "Health: #{self health}" interpolate println
    "                                                              " println
    "                        /  - \\\\\\\\\                  \\||  " println
    "                      //      \\\\\\\\                | //    " println
    "                       |6  6  ||||                 | ||       " println
    "                    .  \\\\l |||//|  \\             / ||      " println
    "                 /    ///  | |||\\  \\ - \\ _ - -     //       " println
    "              /   /   /////      \\               //|          " println
    "             /   /                      ___ -     /           " println
    "            .                          //                     " println
    "            |     \\ .     \\/   . //  //                      " println
    "\\          |    |                  ...                       " println
    "  \\       /   |      /    \\     .//                         " println
    "    \\     |   |               | //\\                         " println
    "      \\   |  |   |           | //   \\                      /" println
    "        \\   |  |   |       -     ||  \\                    / " println
    "          \\ | |    |          /  |||   \\    /\\          /  " println
    "            \\ |    | \\      /    |||    \\ /  \\       /    " println
    "              \\   | \\          / \\\\     /    \\     /     " println
    "                \\          _       ||     /      \\   /      " println
    "                  \\/      / \\     ||             \\ /       " println
    "                   \\         \\   ||                /       /" println
    "                    \\     |  |      \\             /      /  " println
    "                      \\              \\                      " println
    "                                                              " println
    "                                                              " println
    "" println
  )
)
