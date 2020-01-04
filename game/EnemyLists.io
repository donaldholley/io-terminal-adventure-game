EnemyLists := Object clone do(
  mmList02 ::= list(StrayWolf, RabidWolf, GiantHawk)
  mmList34 ::= list(MountainLion, Whisp)
  mmBoss ::= Wraith
  rrList02 ::= list(Cannibal, Skeleton, Vampire)
  rrList34 ::= list(LizardMutant, Werewolf)
  rrBoss ::= Giant
  kkList02 ::= list(Centaur, Senmurv, Griffin)
  kkList34 ::= list(Dragon, Chimera)
  kkBoss ::= Anubis

  mmGet := method(
    if(Player adv == 0,
      en := mmList02 at((Random value * mmList02 size) floor),
      if(Player adv == 1,
        en := mmList34 at((Random value * mmList34 size) floor),
        en := mmBoss))
    en show
    "You encountered a #{en name}" interpolate println
    return en
  )
  rrGet := method(
    if(Player adv == 0,
      en := rrList02 at((Random value * rrList02 size) floor),
      if(Player adv == 1,
        en := rrList34 at((Random value * mmList34 size) floor),
        en := mmBoss))
    en show
    "You encountered a #{en name}" interpolate println
    return en
  )
  kkGet := method(
    if(Player adv == 0,
      en := kkList02 at((Random value * kkList02 size) floor),
      if(Player adv == 1,
        en := kkList34 at((Random value * kkList34 size) floor),
        en := kkBoss))
    en show
    "You encountered a #{en name}" interpolate println
    return en
  )
)
