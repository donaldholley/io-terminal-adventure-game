DataHandler := Object clone do(
  viewWeapons := method(items, store,
    if(items size == 0, return)
    if(items size > 4,
      viewWeapons(items slice(0, 4), store)
      viewWeapons(items slice(4), store)
      return)
    for(i, 0, items size - 1, "---------------------------" print); "---" print
    "\n|" print
    items foreach(item,
      "name: #{item name}" interpolate print
      for(i, 0, 20 - item name size, " " print))
    " | \n|" print
    items foreach(item,
      "class: #{item class}" interpolate print
      for(i, 0, 19 - item class size, " " print))
    " |\n|" print
    items foreach(item,
      "damage: #{item damage}" interpolate print
      for(i, 0, 18 - item damage asString size, " " print))
    " |\n|" print
    items foreach(item,
      "scope: #{item scope}" interpolate print
      for(i, 0, 18, " " print))
    " |\n|" print
    items foreach(item,
      "value: #{item value} gold" interpolate print
      for(i, 0, 14 - item value asString size, " " print))
    " |\n|" print
    items foreach(item,
      "x#{store at(item name)}" interpolate print
      for(i, 0, 25 - store at(item name) asString size, " " print))
    " |" println
    for(i, 0, items size - 1, "---------------------------" print) "---" print
    "" println
  )

  viewAmmo := method(items, store,
    if(items size == 0, return)
    for(i, 0, items size - 1, "---------------------------" print) "---" print
    "\n|" print
    items foreach(item,
      "name: #{item name}" interpolate print
      for(i, 0, 20 - item name size, " " print))
    " |\n|" print
    items foreach(item,
      "damage: #{item damage}" interpolate print
      for(i, 0, 18 - item damage asString size, " " print))
    " |\n|" print
    items foreach(item,
      "compatability: #{item weapon}" interpolate print
      for(i, 0, 11 - item weapon size, " " print))
    " |\n|" print
    items foreach(item,
      "value: #{item value} gold" interpolate print
      for(i, 0, 14 - item value asString size, " " print))
    " |\n|" print
    items foreach(item,
      "x#{store at(item name)}" interpolate print
      for(i, 0, 25 - store at(item name) asString size, " " print))
    " |" println
    for(i, 0, items size - 1, "---------------------------" print) "---" print
    "" println
  )

  viewPotions := method(items, store,
    if(items size == 0, return)
    for(i, 0, items size - 1, "---------------------------" print) "---" print
    "\n|" print
    items foreach(item,
      "name: #{item name}" interpolate print
      for(i, 0, 20 - item name size, " " print))
    " | \n|" print
    items foreach(item,
      "value: #{item value} gold" interpolate print
      for(i, 0, 14 - item value asString size, " " print))
    " |\n|" print
    items foreach(item,
      "x#{store at(item name)}" interpolate print
      for(i, 0, 25 - store at(item name) asString size, " " print))
    " |" println
    for(i, 0, items size - 1, "---------------------------" print) "---" print
    "" println
  )

  viewSpells := method(items,
    if(items size == 0, return)
    if(items size > 4,
      viewSpells(items slice(0, 4))
      viewSpells(items slice(4))
      return)
    for(i, 0, items size - 1, "---------------------------" print) "---" print
    "\n|" print
    items foreach(item,
      "name: #{item name}" interpolate print
      for(i, 0, 20 - item name size, " " print))
    " | \n|" print
    items foreach(item,
      "damage: #{item damage}" interpolate print
      for(i, 0, 18 - item damage asString size, " " print))
    " | \n|" print
    items foreach(item,
      "scope: #{item scope}" interpolate print
      for(i, 0, 19 - item scope asString size, " " print))
    " | \n|" print
    items foreach(item,
      "value: #{item value} gold" interpolate print
      for(i, 0, 14 - item value asString size, " " print))
    " |" println
    for(i, 0, items size - 1, "---------------------------" print) "---" print
    "" println
  )

  getItems := method(hash,
    itemList := list()
    hash keys foreach(key,
      itemList append(ItemLists at(key))
    )
    return itemList
  )

  getSpells := method(hash,
    itemList := list()
    hash keys foreach(key,
      itemList append(hash at(key))
    )
    return itemList
  )
)
