Ammo := Object clone do(
  name ::= ""
  ty ::= "ammo"
  damage ::= 0
  weapon ::= ""
  value  ::= 0

  getInfo := method(
    "Ammo: #{name}" interpolate println
    "Damage: #{damage}" interpolate println
    "Compatability: #{weapon} " interpolate println
    "Value: #{value} gold" interpolate println
  )

)
