Tutorial := Object clone do(

  //REALLY LONG UGLY SCRIPT FOR STARTING A NEW GAME
  start := method(
    Sys screenSize
    Player setName
    Player getClass
    "" println
    "Here's your inventory:" println
    Player setUp
    Player viewInventory
    "" println
    "Here are you stats:" println
    Player viewStats
    "" println
    Sys save
    "Type 'home' to continue" println
    loop(
      "#{Player name} => " interpolate print
      home := File standardInput readLine
      if(home == "home", break))
    Game home
    "Here your stats get refilled after fighting." println
    Player refillStats
    "" println
    "Type 'view i' to view your inventory" println
    loop(
      "#{Player name} => " interpolate print
      viewi := File standardInput readLine
      if(viewi == "view i", break))
    Player viewInventory
    "" println
    "Type view m to open your map" println
    loop(
      "#{Player name} => " interpolate print
      viewm := File standardInput readLine
      if(viewm == "view m", break))
    Game openMap
    "Here is where your adventure begins, to travel to a destination," println
    "abbreviate the name of the location you want to go, type mm now to travel" println
    "to Meandering Mountains." println
    loop(
      "#{Player name} => " interpolate print
      mm := File standardInput readLine
      if(mm == "mm", break))
    Game MM
    "Before proceeding through each area, there will be two options of" println
    "where to go indicated by '*', you can choose where to go by " println
    "typing either l or r for left or right.  Lets try going left." println
    loop(
      "#{Player name} => " interpolate print
      l := File standardInput readLine;
      if(l == "l", break))
    enterCombat
    "Nice, now that you've won, you can safetly return home, just" println
    "type 'home' now to go home." println
    loop(
      "#{Player name} => " interpolate print
      h := File standardInput readLine;
      if(h == "home", break))
    Game home
    "Now that you have aquired extra items, you can sell them at the shop," println
    "or, if you have enough gold, buy shop items." println
    "" println
    "Type 'shop' to go to theShop Keeper." println
    loop(
      "#{Player name} => " interpolate print
      shop := File standardInput readLine
      if(shop == "shop", break))
    ShopKeeper show
    "To sell an item, type 'sell' and then the item name to sell it." println
    "To buy an item, type 'buy' and then the item name displayed above." println
    "" println
    "Now, type 'home' to return home." println
    loop(
      "#{Player name} => " interpolate print
      h := File standardInput readLine
      if(h == "home", break))
    Game home
    "Some final tips:" println
    "- Make sure you keep some weapons in storage when you can, since" println
    "  if you die on the road, you lose everything you are carrying." println
    "- If you are a rogue using a bow, make sure you always have" println
    "  enough ammo going into combat, every coordinate you pick" println
    "  consumes an arrow." println
    "" println
    "If you need any additional help while exploring the game," println
    "type 'help'." println
    Game runHome
  )

  enterCombat := method(
    enemy := StrayWolf
    enemy show
    "You encountered a #{enemy name}" interpolate println
    Player viewCurrentStats
    "To attack the enemy, type 'attack' and then the name of the weapon" println
    "you want to use, after this a promt will pop up for an x value and a" println
    "y value, just type 0-2 for both to pick the coordinates you want to" println
    "attack."  println
    "" println
    "If you have a ranged weapon (bow) then after chosing it you" println
    "will be asked for which ammo to use, if you are unsure of what" println
    "you have, you can always type 'view i' to view your inventory." println
    "" println
    "Similarly, if you are using a staff, you will be asked for" println
    "which spell to use, in which case if you are not sure what" println
    "what you have, you can type 'view spells' to view the spells" println
    "you know." println
    "" println
    "You can also use your health potion during combat.  Just type" println
    "'use' and then 'HealthPotion'." println
    loop(
      "#{Player name} action => " interpolate print
      action := File standardInput readLine
      if(action == "view i", Player viewInventory; continue)
      if(action == "view spells", Player viewSpells; continue)
      if(action == "use", Player useItem; continue)
      if(action == "attack")then(Game hitBox(list(" ", " ", " ",
         " ", " ", " ",
         " ", " ", " "));
      weapon := Player selectWeapon;
      enemy dodgeAttack;
      weapon guess(enemy);
      Game hitBox(enemy getStars)
      enemy resetHitbox
      enemy attackPlayer
      enemy show
      Player viewCurrentStats
      if(enemy health < 1,
        "YOU WIN" println
        Player addInventory(enemy dropItem)
        enemy restoreHealth; break)
      if(Player health < 1,
        "YOU LOSE" println
        Player weapons = Map clone
        Player ammo = Map clone
        Player potions = Map clone
        enemy restoreHealth; break))
    )
  )

  help := method(
    "" println
    "view stat : view stats" println
    "view i : view inventory" println
    "quit : quit game" println
    "" println
    "save : save game (home)" println
    "view s : view storage (home)" println
    "view m : view map (home)" println
    "shop : go to shop (home)" println
    "store : put item in storage (home)" println
    "ret : retrieve item from storage (home)" println
    "mm : go to meandering mountains (home)" println
    "rr : go to rippling river (home)" println
    "kk : go to kindred kingdom (home)" println
    "" println
    "home : return home (exploring)" println
    "" println
    "attack : attack enemy (combat)" println
    "use : use item (combat)" println
    "" println
    "buy : buy shop item (shop)" println
    "sell : sell inventory item (shop)" println
    "" println
  )

)
