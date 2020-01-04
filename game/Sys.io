Sys := Object clone do(
  save := method(
    saveFile := File with("saves/#{Player name}.save" interpolate)
    saveFile remove
    saveFile openForUpdating
    saveFile write("#{Player name}\n#{Player class}\n" interpolate)
    saveFile write("#{Player maxHealth}\n#{Player maxStamina}\n" interpolate)
    saveFile write("#{Player maxAbility}\n#{Player gold}\n" interpolate)
    saveFile write("#{Player level}\n#{Player experience}" interpolate)
    Player weapons keys foreach(item,
      saveFile write("\n#{item}\n#{Player weapons at(item)}" interpolate)
    )
    saveFile write("\nAMMO")
    Player ammo keys foreach(item,
      saveFile write("\n#{item}\n#{Player ammo at(item)}" interpolate)
    )
    saveFile write("\nPOTIONS")
    Player potions keys foreach(item,
      saveFile write("\n#{item}\n#{Player potions at(item)}" interpolate)
    )
    saveFile write("\nSWEAPONS")
    Player storageWeapons keys foreach(item,
      saveFile write("\n#{item}\n#{Player storageWeapons at(item)}" interpolate)
    )
    saveFile write("\nSAMMO")
    Player storageAmmo keys foreach(item,
      saveFile write("\n#{item}\n#{Player storageAmmo at(item)}" interpolate)
    )
    saveFile write("\nSPOTIONS")
    Player storagePotions keys foreach(item,
      saveFile write("\n#{item}\n#{Player storagePotions at(item)}" interpolate)
    )
    saveFile write("\nSPELLS")
    Player spells keys foreach(item,
      saveFile write("\n#{item}" interpolate)
    )
    saveFile write("\nULOCS")
    Player unlockedlocs foreach(loc,
      saveFile write("\n#{loc}" interpolate)
    )
    saveFile close
    "Saved." println
  )

  load := method(sym,
    loadFile := File with("saves/#{sym}.save" interpolate)
    loadFile openForReading
    info := loadFile readLine
    Player name = info asString
    info = loadFile readLine
    Player class = info asString
    info = loadFile readLine
    Player maxHealth = info asNumber
    info = loadFile readLine
    Player maxStamina = info asNumber
    info = loadFile readLine
    Player maxAbility = info asNumber
    info = loadFile readLine
    Player gold = info asNumber
    info = loadFile readLine
    Player level = info asNumber
    info = loadFile readLine
    Player experience = info asNumber
    loop(info = loadFile readLine
      if(info == "AMMO", break)
      Player weapons atPut(info asString, loadFile readLine asNumber)
    )
    loop(info = loadFile readLine
      if(info == "POTIONS", break)
      Player ammo atPut(info asString, loadFile readLine asNumber)
    )
    loop(info = loadFile readLine
      if(info == "SWEAPONS", break)
      Player potions atPut(info asString, loadFile readLine asNumber)
    )
    loop(info = loadFile readLine
      if(info == "SAMMO", break)
      Player storageWeapons atPut(info asString, loadFile readLine asNumber)
    )
    loop(info = loadFile readLine
      if(info == "SPOTIONS", break)
      Player storageAmmo atPut(info asString, loadFile readLine asNumber)
    )
    loop(info = loadFile readLine
      if(info == "SPELLS", break)
      Player storagePotions atPut(info asString, loadFile readLine asNumber)
    )
    loop(info = loadFile readLine
      if(info == "ULOCS", break)
      Player spells atPut(info asString, ItemLists at(info asString))
    )
    loop(info = loadFile readLine
      if(info == nil, break)
      Player unlockedlocs append(info asString)
    )
    loadFile close
    "Loaded." println
  )

  screenSize := method(
  "........................................................................................................................" println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  ".                                                                                                                      ." println
  "........................................................................................................................" println
  "Set your window's size to at least the above box for best experience." println
  )
)
