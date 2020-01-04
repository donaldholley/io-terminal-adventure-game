Potion := Object clone do(
  name ::= ""
  ty ::= "potion"
  healthStat ::= 0
  staminaStat ::= 0
  abilityStat ::= 0
  value ::= 0

  use := method(
    Player health = Player health + healthStat
    "Health restored." println
    //Player stamina = Player stamina + staminaStat
    //Player ability = Player ability + abilityStat
  )
)
