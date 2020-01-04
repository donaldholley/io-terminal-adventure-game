//proto for player

Player := Object clone do(
  name ::= ""
  class ::= ""
  health ::= 0
  maxHealth ::= 0
  stamina ::= 0
  maxStamina ::= 0
  ability ::= 0
  maxAbility ::= 0
  level ::= 1
  experience ::= 0
  gold ::= 0
  weapons ::= Map clone
  spells ::= Map clone
  ammo ::= Map clone
  potions ::= Map clone
  storageWeapons ::= Map clone
  storageAmmo ::= Map clone
  storagePotions ::= Map clone
  abilities ::= Map clone
  location ::= "home"
  unlockedlocs ::= list()
  depth ::= 0
  adv ::= 0

  setName := method(
    loop(
      "Choose a name.(Can be anything)" println
      "=> " print
      name = File standardInput readLine
      if(name != "", break))
  )

  refillStats := method(
    health = maxHealth
    stamina = maxStamina
    ability = maxAbility
  )

  addHealth := method(h,
    health = health + h
    if(health > maxHealth, health = maxHealth)
  )

  subtractHealth := method(d,
    health = health - d
    if(health < 0, health = 0)
  )

  getClass := method(
    while(class != "warrior"\
    and class != "mage"\
    and class != "rogue",
    "Choose a class.(Can be 'warrior', 'mage', or 'rogue')" println
    "#{name} => " interpolate print
    class = File standardInput readLine
    )
  )

  setUp := method(
    if(class == "warrior")\
    then(maxHealth = 120; maxStamina = 100; maxAbility = 60;
    addStore("WoodenSword", weapons))\
    elseif(class == "mage")\
    then(maxHealth = 80; maxStamina = 80; maxAbility = 150;
    addStore("NoviceStaff", weapons); spells atPut("Fireball", Fireball);
    spells atPut("IceSpike", IceSpike))\
    else(maxHealth = 100; maxStamina = 120; maxAbility = 80;
    addStore("WoodenBow", weapons)
    for(i, 0, 49, addStore("WoodenArrow", ammo)))
    addStore("HealthPotion", potions)
  )

  viewStats := method(
    "name: #{name}" interpolate println
    "class: #{class}" interpolate println
    "level: #{level}" interpolate println
    "experience: #{experience}" interpolate println
    "max health: #{maxHealth}" interpolate println
    //"max stamina: #{maxStamina}" interpolate println
    //"max ability: #{maxAbility}" interpolate println
    "gold: #{gold}" interpolate println
  )

  viewCurrentStats := method(
    "health: #{health}" interpolate println
    "stamina: #{stamina}" interpolate println
    "ability: #{ability}" interpolate println
  )

  viewSpells := method(
    DataHandler viewSpells(DataHandler getItems(spells))
  )

  addStore := method(item, store,
    if(store hasKey(item),
      store atPut(item, store at(item) + 1),
      store atPut(item, 1))
  )

  removeStore := method(item, store,
    if(store at(item) > 1,
      store atPut(item, store at(item) - 1),
      store removeAt(item))
  )

  viewInventory := method(
    DataHandler viewWeapons(DataHandler getItems(weapons), weapons)
    DataHandler viewAmmo(DataHandler getItems(ammo), ammo)
    DataHandler viewPotions(DataHandler getItems(potions), potions)
  )

  viewStorage := method(
    DataHandler viewWeapons(DataHandler getItems(storageWeapons), storageWeapons)
    DataHandler viewAmmo(DataHandler getItems(storageAmmo), storageAmmo)
    DataHandler viewPotions(DataHandler getItems(storagePotions), storagePotions)
  )

  storeItem := method(
    "Choose item." println
    item := File standardInput readLine
    if(weapons hasKey(item) not,
      if(ammo hasKey(item) not,
        if(potions hasKey(item) not,
          "No such item." println,
          removeStore(item, potions)
          addStore(item, storagePotions)
          "Stored." println),
      removeStore(item, ammo)
      addStore(item, storageAmmo)
      "Stored." println),
    removeStore(item, weapons)
    addStore(item, storageWeapons)
    "Stored." println)
  )

  retrieveItem := method(
    "Choose item." println
    item := File standardInput readLine
    if(storageWeapons hasKey(item) not,
      if(storageAmmo hasKey(item) not,
        if(storagePotions hasKey(item) not,
          "No such item." println,
          removeStore(item, storagePotions)
          addStore(item, potions)
          "Retrieved." println),
      removeStore(item, storageAmmo)
      addStore(item, ammo)
      "Retrieved." println),
    removeStore(item, storageWeapons)
    addStore(item, weapons)
    "Retrieved." println)
  )

  addInventory := method(item,
    if(item ty != "weapon",
      if(item ty != "ammo",
        addStore(item name, potions)
        "potion added: #{item name} x1" interpolate println,
        addStore(item name, ammo)
        "ammo added: #{item name} x1" interpolate println),
      addStore(item name, weapons)
      "weapon added: #{item name} x1" interpolate println)
  )

  hasItem := method(name,
    return weapons hasKey(name) or ammo hasKey(name) or potions hasKey(name)
  )

  selectWeapon := method(
    loop(
      "Choose weapon." println
      "#{name} => " interpolate print
      choice := File standardInput readLine
      if(choice == "view i", viewInventory; continue)
      if(weapons hasKey(choice) not, continue,
        return ItemLists at(choice))
    )
  )

  useItem := method(
    "item => " print
    item := File standardInput readLine
    if(potions hasKey(item),
      ItemLists at(item) use; removeStore(item, potions),
      "You don't have that item." println
    )
  )

  getAmmo := method(bow,
    loop(
      "choose ammo => " print
      choice := ItemLists at(File standardInput readLine)
      if(choice != nil,
        if(ammo hasKey(choice name),
          if(choice weapon == bow name, break)))
      if(action == "view i", Player viewInventory; continue)
    )
    for(i, 0, bow scope, removeStore(choice name, ammo))
    return choice
  )

  getSpell := method(staff,
    loop(
      "choose spell => " print
      choice := ItemLists at(File standardInput readLine)
      if(choice != nil,
        if(choice comp <= staff comp,
          if(spells hasKey(choice name), break)))
      if(action == "view i", Player viewInventory; continue)
      if(action == "view spells", Player viewSpells; continue)
    )
    return choice
  )

  addXp := method(xp,
    experience = experience + xp
    "xp +#{xp}" interpolate println
    if(experience >= level ** 2 * 30,
      "Level up!\nhealth +#{level * 10}" interpolate println
      maxHealth = maxHealth + level * 10
      level = level + 1
      refillStats
    )
  )

)
