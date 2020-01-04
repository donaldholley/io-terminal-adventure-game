//Parent proto for all enemies

Enemy := Object clone do(
  name ::= ""
  maxHealth ::= 0
  health ::= 0
  attack ::= 0
  dodge ::= 0
  itemList ::= list()
  hitBox ::= list()
  boxPositions ::= list(list(0, 0), list(1, 0), list(2, 0),
                        list(0, 1), list(1, 1), list(2, 1),
                        list(0, 2), list(1, 2), list(2, 2))

  restoreHealth := method(h,
    health = maxHealth
  )

  addHealth := method(h,
    health = health + h
    if(health > maxHealth, health = maxHealth)
  )

  subtractHealth := method(h,
    health = health - h
    if(health < 0, health = 0)
  )

  attackPlayer := method(
    Player subtractHealth(attack)
  )

  getDodge := method(
    return hitBox
  )

  dropItem := method(
    return itemList at((Random value * (itemList size)) floor)
  )

  dodgeAttack := method(
    copy := boxPositions clone
    for(i, 0, dodge - 1,
      randVal := (Random value * (copy size)) floor
      hitBox append(copy at(randVal))
      copy removeAt(randVal)
    )
  )

  getStars := method(
    stars := list()
    for(i, 0, 8,
      hitBox foreach(box,
        if(box == boxPositions at(i), stars append("*"); break)
      )
      if(stars at(i) == nil, stars append(" "))
    )
    return stars
  )

  resetHitbox := method(
    hitBox = list()
  )
)
