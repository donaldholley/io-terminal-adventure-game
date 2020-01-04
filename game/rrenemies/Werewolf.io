Werewolf := Enemy clone do(
  name = "Werewolf"
  maxHealth = 260
  health = 260
  attack = 75
  dodge = 4
  itemList = list(SteelDagger, IronDagger, IronBow, IronAxe)

  show := method(
    "" println
    "" println
    "#{self name}" interpolate println
    "Health: #{self health}" interpolate println
    "                               " println
    "     \\ _\\       //_           " println
    "      /    '  '    \\          " println
    "       /  \\.. //   \\ \\       " println
    "   //  /   VVVV  \\\\    \\    " println
    "   /   / / \\  /  \\        \\\\      " println
    "  /         VV         \\    \\\\     " println
    "  |         --        |||   \\\\   " println
    "   /\\                       \\ \\ " println
    "  /  \\      /\\      ///  |   || " println
    "      \\            ///    |   || " println
    "       \\          ///     /   || " println
    "        |     |_   ||  _   /  // " println
    "        |     |_   || /     //  " println
    "        |     |       /   /     " println
    "        /            / | \\      " println
    "                               " println
  )
)
