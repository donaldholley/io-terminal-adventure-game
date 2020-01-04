Staff := Weapon clone do(
  comp ::= 0
  guess := method(enemy,
    s := Player getSpell(self)
    damage = s damage
    scope = s scope
    super(guess(enemy))
    damage = 0
    scope = 0
  )
)
