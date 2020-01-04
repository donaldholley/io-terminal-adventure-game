Weapon := Object clone do(
  name ::= ""
  ty ::= "weapon"
  damage ::= 0
  durability ::= 0
  scope ::= 0
  class ::= ""
  value ::= 0
  abilities ::= list()

  addAbility := method(a,
    abilities append(a)
  )
  getInfo := method(
    "Weapon: #{name}" interpolate println
    "Class: #{class}" interpolate println
    "Damage: #{damage}" interpolate println
    "Scope: #{scope}" interpolate println
    "Value: #{value} gold" interpolate println
  )
  guess := method(enemy,
    hit := enemy getDodge
    coordList := list()
    adjDamage := damage
    if(Player class != class, adjDamage = (damage / 2) floor)
    for(i, 0, scope - 1,
      loop(
        "attack x value" println
        "#{Player name} => " interpolate print
        xval := File standardInput readLine
        if(xval asNumber >= 0 and xval asNumber <= 2, break)
      )
      loop(
        "attack y value" println
        "#{Player name} => " interpolate print
        yval := File standardInput readLine
        if(yval asNumber >= 0 and yval asNumber <= 2, break)
      )
      coordList append(list(xval asNumber, yval asNumber))
    )
    coordList foreach(coord,
      coord println
      if(hit contains(coord), enemy subtractHealth(adjDamage); break)
    )
  hit println
  coordList println
  )
)
