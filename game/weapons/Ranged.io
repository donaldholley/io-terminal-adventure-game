Ranged := Weapon clone do(
  guess := method(enemy,
    a := Player getAmmo(self)
    damage = damage + a damage
    super(guess(enemy))
    damage = damage - a damage
  )
)
