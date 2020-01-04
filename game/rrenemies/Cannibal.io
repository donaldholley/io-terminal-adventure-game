Cannibal := Enemy clone do(
  name = "Cannibal"
  maxHealth = 75
  health = 75
  attack = 20
  dodge = 6
  itemList = list(IronSword, IronBow, AdeptStaff)

  show := method(
    "" println
    "" println
    "#{self name}" interpolate println
    "Health: #{self health}" interpolate println
    "                                  " println
    "           / // /   \\\\          " println
    "          / /   ---- \\\\\\\\\\   " println
    "          //    \\--/   \\ \\ \\    " println
    "         ///   @    @    \\\\ \\  " println
    "        ///      /        ||      " println
    "        /        ~    | ||        " println
    "         ||    MMMMM    |||       " println
    "        ||| \\   W    / |||      " println
    "         ||  \\______/ |||       " println
    "              |       |            " println
    "              |       |            " println
    "                                  " println
    "" println
  )
)
