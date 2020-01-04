Whisp := Enemy clone do(
  name = "Whisp"
  maxHealth = 10
  health = 10
  attack = 5
  dodge = 1
  itemList = list(HealthPotion)

  show := method(
    "" println
    "" println
    "#{self name}" interpolate println
    "Health: #{self health}" interpolate println
    "                               " println
    "                               " println
    "                               " println
    "           | \\_               " println
    "            \\_  \\_           " println
    "              \\_  .\\         " println
    "                \\__/          " println
    "                               " println
    "                               " println
    "                               " println
    "                               " println
    "                               " println
    "                               " println
    "" println
  )
)
