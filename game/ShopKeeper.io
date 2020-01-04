ShopKeeper := Object clone do(
  gold ::= 10000
  weapons ::= Map clone do(
    atPut("NoviceStaff", 10)
    atPut("WoodenSword", 10)
    atPut("WoodenBow", 10)
    atPut("AdeptStaff", 10)
    atPut("IronSword", 10)
    atPut("IronBow", 10)
    atPut("MasterStaff", 10)
    atPut("SteelBow", 10)
    atPut("SteelSword", 10)
  )
  ammo ::= Map clone do(
    atPut("WoodenArrow", 1000)
    atPut("IronArrow", 1000)
    atPut("SteelArrow", 1000)
  )
  potions ::= Map clone do(
    atPut("HealthPotion", 100)
    //atPut("StaminaPotion", 100)
    //atPut("AbilityPotion", 100)
  )
  spellBooks ::= Map clone do(
    atPut("Fireball", Fireball)
    atPut("IceSpike", IceSpike)
    atPut("Incinerate", Incinerate)
    atPut("Electricute", Electricute)
    atPut("Immolate", Immolate)
    atPut("Maim", Maim)
    atPut("TouchOfAnubis", TouchOfAnubis)
  )

  keeperHas := method(key,
    return weapons hasKey(key) or ammo hasKey(key) or potions hasKey(key) or spellBooks hasKey(key)
  )

  buy := method(
    //method for the shopkeeper buying from the player
    loop(
      "item => " print
      name := File standardInput readLine
      item := ItemLists at(name)
      if(item != nil and Player hasItem(name),
        if(item ty == "weapon",
          Player addStore(name, weapons)
          Player removeStore(name, Player weapons),
          if(item ty == "ammo",
            Player addStore(name, ammo)
            Player removeStore(name, Player ammo),
            Player addStore(name, potions)
            Player removeStore(name, Player potions)))
      gold = gold - (item value / 2) floor
      Player gold = Player gold + (item value / 2) floor
      "Here's the gold, thanks." println
      break,
      "No thanks." println; break)
    )
  )

  sell := method(
    //method for the shopkeeper selling to the player
    loop(
    "item => " print
    name := File standardInput readLine
    item := ItemLists at(name)
    if(keeperHas(name),
      if(Player gold >= item value,
        if(item ty == "weapon",
          Player removeStore(name, weapons)
          Player addStore(name, Player weapons),
          if(item ty == "ammo",
            Player removeStore(name, ammo)
            Player addStore(name, Player ammo),
            if(item ty == "potion",
              Player removeStore(name, potions)
              Player addStore(name, Player potions),
              Player spells atPut(name, item))))
        gold = gold + item value
        Player gold = Player gold - item value
        "Here ya go, thanks for the business." println
        break,
        "You don't have enough for that." println
        break),
      "Sorry, I don't have that." println; break)
    )
  )

  show := method(
    """                                            ,
                                        ,/(.((*(%((
             ______                    ##,.     ,*((%
            |      |                  .,         ./(/*.
            | SALE |                  &&.   .#(   #(##
            |______|                 /. @   (@%   (((/
                                    % ...         #., ,
               __      __      __  .   ** ...       / (
               ||      ||      ||  #         *      /
               ||      ||      ||   #@ ,(  ./#   .   &
             ==  ==  ==  ==  ==  ==   &@&&&&@%(,      %/
              |--|    |--|    |--&%,*/ * ..          , . ((
              |  |    |  |  %*.*.,(.,             .(./,/,*.,*,&
              |  |    |  (......,  ../        ./.. *,.,..,     ,/&
              |  |    | /..  @. ....   / .*..,..., , ,.*          .*
              |  |    |.#..,%&      .,  . ..,* * ,  ., ... ,... .,*(.
              |  |    ..,.*,* ,. , ., . . ,, . /  ., (*#/ ,.,   ,,* %
              |  |  ,*   ,.(,  &  . . ./*.   , .  ,@%(///%*(  . .*, ,
              |  / *.  .((   ,@@@,..         ..**#*( (.        (*,,
              | / ./            .*&                     ,        /*/
              |/  %..             ,&                             .*(
                  * .              ./&,                       ,   (
                  ( ..             ..(#(/.               .    .,,*
                  .                 .&@(/%/           ,      ..@.
                     .#       . .&@%***.,/( (*.,..,.,.   ....@,
                         /.,,**,/..,.. ,* . ,,(/(%((#&&&%/*(/%.
                         #.  .   .,  .  .     *.  , ., *,./,.&
                           . ..,  ,..,. .,. . ,..  * .,,*,**/,
                          @.,.  *,, ,.,. ,  .,*    ,,,,, ,,,**
                          *  ,.*  *.. .,   .... , ... ,,** ***
                           %.**, ,, ,. * .*.*   ..,,,,.,*.*,*
                           #., /*, * .. / ,, ...*. .*/..,/*./@
--------------------------------------------------------------------------------
Hey #{Player name}, how can I help you today?
ShopKeeper gold: #{gold}
""" interpolate println
    "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" println
    "WEAPONS:" println
    DataHandler viewWeapons(DataHandler getItems(weapons), weapons)
    "" println
    "AMMO:" println
    DataHandler viewAmmo(DataHandler getItems(ammo), ammo)
    "" println
    "POTIONS:" println
    DataHandler viewPotions(DataHandler getItems(potions), potions)
    "SPELLS:" println
    DataHandler viewSpells(DataHandler getSpells(spellBooks))
    "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" println
  )
)
