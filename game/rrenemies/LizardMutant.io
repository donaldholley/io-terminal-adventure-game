LizardMutant := Enemy clone do(
  name = "Lizard Mutant"
  maxHealth = 110
  health = 110
  attack = 10
  dodge = 5
  itemList = list(SteelDagger, IronAxe, IronBow, AdeptStaff)

  show := method(
    "" println
    "" println
    "#{self name}" interpolate println
    "Health: #{self health}" interpolate println
    "                                  " println
    "               \\\\ \\  /////     " println
    "            \\\\\\|||/////        " println
    "         \\/           \\\\/      " println
    "         |  &       &  ||         " println
    "         \\             //        " println
    "          \\           ||         " println
    "       /   \\    ''  / // \\      " println
    "     /       \\     //      \\    " println
    "   /            //           \\   " println
    "   |            |                 " println
    "      \\         /\\         /    " println
    "                                  " println
    "" println
  )
)
