Wraith := Enemy clone do(
  name = "Wraith"
  maxHealth = 100
  health = 100
  attack = 50
  dodge = 5
  itemList = list(IronAxe, IronBow, IronDagger, IronSword, AdeptStaff)

  show := method(
    "" println
    "" println
    "#{self name}" interpolate println
    "Health: #{self health}" interpolate println
    "                               " println
    "                /\\\\            " println
    "               /''\\\\           " println
    "              |\\   \\\\           " println
    "             /\\ \\  //           " println
    "            /    \\ ||\\\\         " println
    "            \\     \\\\\\ \\\\       " println
    "            |\\      \\\\//       " println
    "            / |     /\\\\\\       " println
    "           /  |     // \\\\      " println
    "           \\  /    //  //    " println
    "            \\ \\    ||  ||      " println
    "             \\ \\   || /|\\      " println
    "               |   ||          " println
    "               /   \\\\\\\\        " println
    "              /     \\\\\\\\        " println
    "            //      //\\\\\\\\       " println
    "           //          \\\\\\\\\\\\     " println
    "                               " println
    "" println
  )
)
