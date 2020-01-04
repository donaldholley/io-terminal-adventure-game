//Proto that brings the game together

Importer addSearchPath("weapons/")
Importer addSearchPath("mmenemies/")
Importer addSearchPath("rrenemies/")
Importer addSearchPath("kkenemies/")
Importer addSearchPath("potions/")
Importer addSearchPath("spells/")
Importer addSearchPath("notes/")
Importer addSearchPath("ammo/")

Game := Object clone do(

  start := method(
    "Start new or load game." println
    "=> " print
    mode := File standardInput readLine
    if(mode == "new", Tutorial start)
    if(mode == "load", Sys load(File standardInput readLine); home; runHome)
  )

  home := method(
    "" println
    "   ___    _______   " println
    "   | |   /   _   \\ " println
    "   | |  /   | |   \\" println
    "--------------------" println
    "|   _          _   |" println
    "|  | |        | |  |" println
    "|                  |" println
    "|        __        |" println
    "|       | .|       |" println
    "|_______|__|_______|" println
    "Welcome home." println
    ""println
    Player setLocation("home")
    Player refillStats
    Player depth = 0
    Player adv = 0
  )

  openMap := method(
    "--------------------------------------------------    " println
    "|home                                            |    " println
    "|       /\\        /\\       //                    |  " println
    "|    Meandering Mountains  //                    |    " println
    "|     /\\ /\\   /\\          //                     | " println
    "|           /\\            \\\\                     | " println
    "|        /\\     /\\          \\\\                   |" println
    "|             /\\            \\\\                   | " println
    "|                          //         |\\         |   " println
    "|                         //          |/         |    " println
    "|                 Rippling River   ___|_         |    " println
    "|                      //         |     |        |    " println
    "| \\\\      //\\\\         ||         |     |        |" println
    "|   \\\\  //    \\\\       //          |   |         |" println
    "|      \\\\     ||     //         _  |   |  _      |  " println
    "|             \\\\    //          |  |   |  |      |  " println
    "|               \\\\//            |  |   |  |      |  " println
    "|     ???          \\\\           |  |   |  |      |  " println
    "|                   \\\\        Kindred Kingdom    |  " println
    "--------------------------------------------------    " println
  )

  hitBox := method(spots,
    "" println
    "-------------------------------" println
    "|         |         |         |" println
    "|    #{spots at(0)}    |    #{spots at(1)}    |    #{spots at(2)}    |"\
    interpolate println
    "|         |         |         |" println
    "|-----------------------------|" println
    "|         |         |         |" println
    "|    #{spots at(3)}    |    #{spots at(4)}    |    #{spots at(5)}    |"\
    interpolate println
    "|         |         |         |" println
    "|-----------------------------|" println
    "|         |         |         |" println
    "|    #{spots at(6)}    |    #{spots at(7)}    |    #{spots at(8)}    |"\
    interpolate println
    "|         |         |         |" println
    "-------------------------------" println
    "" println
  )

  MM := method(
    "
                 &  #*
                / %   &
              / .        .
             , .(         %
            , (      .   #
          *%  #           . %
         #  ,,,,             %%       %..%
       (&              &       *%   ( ,   /
    #&&&           %   /%&&,     %%#         ,
  &@* .     .&&  @@  /,%#%    . /&(     /&& %
 &%&@&&&/      #   &%& &&&    /   ,.#         & ,
&%%%&&&      (,       (          .#&%*.    ,(&&%
 &&&&&       #    ..   /@%    ,&     &//  &   &&( # %
%(#&/       # %,         && (&@% &(  (#&/ /&%  %     (,(
*,%        , &         ..,&&&  # ..% /% /&%&.&    & &/   #
,   *   /&&&(#./&@@. .%%#&&((  *#* .,&.%&&&((,&&&&&%&(    (
  *  .% %@&&&&%&%*#./&&&. #.(.( &.(.,.*.*& &&.%&%&%,@*     %,#
   */  @&&&%#(%#/##&@&(#  //&&  &&*%  % /&&.**&.*&& . .   (  &
   ,&&(&&(#&&(.%*%&..(#**/&&&  /@&@&&  &.#&*,/&&&&&&      ,    *#
 &&(&&%%&,(. .@(/%  %** (%&*&&&@&&%,%&&(.&&*&&&%.&      #.
*(.**,*&&. *&(* (  #.(  **&./&%@&&&@,,**&&, @##(%%#( &%.    ,
.*,( ( , .@&&&( *   (/(    #  &&@&&&&&&/, #&&&&,&&%#%&&@/% /#,    &%&" println
    Player setLocation("mm")
  )

  RR := method(
      "    .  .  ...           ..      .  .. .....  .     ..  .   .     ......
....              ...  ......  ... ... ... .            .          .
         .      ..  .       ,, .,..,.  .     ........  .         ..
........  .,       ...  ..   . .............,,....            . ... .
......              . .. .   . .,,     .....  .....   ...........
............,........   ..    .       .        ..
          ...,,,,..... . .       ...    .
.,.,,,,,..,....,..  .  *#(. ..  .*.,,*.***,..,*,,........  .. ..*,*,,
.    .. ,(/(/   ...,,,,,,,%&@@,,/#(#.*&(#..#/#... .#*,,      .    ...
....(#(.     . .,##%.  ..&.%#.%#&*  .((%&%&(#(#/,...../*%%#%.,...
.. ...    ..*%(.#*(,###%*&/%#%,(&%*      ,./(@(%%/#(*.  . ..     ..
  .          .#/%&&%(#*@(#%%%&&(*//,          (., ...  .  . ...
........,,%,#(##&%/%(&(%#%(/(%(**, ,.../**,*,,&%(*..&(%(.,*(%#*......
.......  .%*/%#%%.**&&*/((//*/.,   (*%*%%#(#%#/%,/,#@/(/*%*(.,#/%##..
... ....((##((/.*%#%#/,,**          **(&&%&%*&//%(((#((%%%&,&/*#*#.#/
 ...  //*(/(,/,*#%(,*(                  *.(/(/(#&&&@&%*%&***%(*,*,.
..... ..  /**.,*,,*#/#*&(&/.                 .,,/#(**/,(.,##.%((/*((.
,......//,*(###(,/%(&(*(##*%#(                    .,*/**(/*((,/#(.,*/
(..(/#/*#,(*%#/*%((((%,(,#((/#                          ,//,*(/((*/,*
#/(#%#*//,/(*//(#%&%#/%*%@%                               #*..,&,#/
**,.,*((%,(%,((.**#%((%###*,*/                          . .(** ,,.#%.
*.,(*((,/(**,%#*/(/(*(*/****                         .(##(%/.((,*./#,
,*/,,(/,****,(*,//***/*//.                           ##/#(*((*,((%&,.
,,***/////*/***///,**,                             ,#,**.#(*/%&/#....
////##(/(//*                                       (.,,**,/*/#,. .  .
*,*,/,..,                                          ///(***/*#*......
                   (*/./.**,**,/,*/**/  ,*/,.//,**                  " println
    Player setLocation("rr")
  )

  KK := method(
    "
                                      @
                                      @
                                      @
                                      @
                                      @
                                     &% /
                                     @@
                                    @@% .@*
                                  .@ @@@#.@@@
                                @ @@ @   &% @
                                @@% @       . #
                               %@@&          /@&
                          . @@@@@@&@   @   @ ,#(* #
                         . @@ #/  %   .      @.  (%(
                         & @  &@@%           /#%,
                        .@ .@  @  @  .@  @@  %  , @@
                        @    @ @  &   %   (  @  @  @
                       @     @                     @
               .      @   @@.% %@@@@@@@@@@@@@@@/   @
               %    %@@,,#&@@@                  ,@@@
              #@   ,@@@@,@%@/@@# &    ,   @        @
              @@  @ ,%        @@      @@  %      . @
              @@  @   &@   @ %@ %@    @@  @(       @
              @@@ @@ &@          @   & ,(&@##      @
             @ ,@@@              %      #          @
            ,@%   @*.,@@..* *# @@@      @ .   @    @
           @  @* @@  % @      @@%       @ %   @    %
   @*     @@@@@@ .@.@@%#@    @@         @@@@@ @    # .
  @@@    @/   @@   @  @ % #   @       .@@    %@@   * %
 @( &@@%  . @@ /%%/. @  % * @ @  @   @       @@.#  . @@
@& ,@@&%@ #         @%* # , @ @  @   @       @,,@    @@%
/@@@@@@*  @%@ ,@  &   @ /   @ ,  @   @      &@  @@ #/   @
@% #,@ @ @@  . @    * @ ,  .@    @   @      @&   @     *
#@ @ &@  .         .  # ,  @(    @   @    *@#%(#@/@     *   &
(% @. @#@(#./     /# %# . @ .    @   @    ,,        @#@#    @
  &@# @@  @.%  #   @ %. .      @   @     @.               #
  ,@   @  @.&  %  /. %  % .,     @   @    ,@&%%@,    #    @
%@  % @   @ @     %. @* @ .*     @   @   @@%@@@@@@@@@@@@    @%
  * @ @   @  @@@@  @ @@ @  %    (@   @    @ %       @&(/   %@ @
@@@@.,%@@@ #@&.   @ @ @ @  &     @   @  /@@@%          @   @@  @
   @#     #&  @@    &@@ %  @     @@  @ ,@  @          . @,@(   @@
 @@ * @@  ,@@/ &     @@ &  #     @@  @  @@@@@%@@@@ @(@, @/  ,  % @
 @@ . @@   @ *%      @@       (  &@@ @  @*@ @        @@@@ @, @@@@@@&
,@%   @@  @@  &@@@@@@@@ .@@#  @@@(   @ @@ @@@          @@@@@@@@@@@@@.
@@,   @@  @(   .                @@  . @  @  @.         ,  (  (
                                @%   .@   @                  #
(@@@*   *&@@@@@@@@@@@@@&%%#(*,..     #@@@
  @@          & @/(   ,* , #     .@@     @ @         @@@@@@@@@@    ,&
  @@      @          #&,          @           *             @ ,&  @,
  @&             @&     *  &     %@    @ /  /   %  ,   @ %" println
    Player setLocation("kk")
  )

  enterCombat := method(
    if(Player location == "mm", enemy := EnemyLists mmGet)
    if(Player location == "rr", enemy := EnemyLists rrGet)
    if(Player location == "kk", enemy := EnemyLists kkGet)
    Player viewCurrentStats
    loop(
      action := mainLoop(list("use", "attack"))
      if(action == "use", Player useItem; continue)
      if(action == "attack")then(hitBox(list(" ", " ", " ",
         " ", " ", " ",
         " ", " ", " "))
      weapon := Player selectWeapon;
      enemy dodgeAttack;
      weapon guess(enemy)
      hitBox(enemy getStars)
      enemy hitBox println
      Enemy resetHitbox
      enemy attackPlayer
      enemy show
      Player viewCurrentStats
      if(Player health < 1,
        "YOU LOSE" println
        Player weapons = Map clone
        Player ammo = Map clone
        Player potions = Map clone
        enemy restoreHealth; break)
      if(enemy health < 1,
        "YOU WIN" println
        Player addInventory(enemy dropItem)
        enemy restoreHealth; Player depth = Player depth + 1;
        Player addXp((enemy health + enemy attack * 2) * (10 - enemy dodge))
        if(enemy name == "Wraith" and Player unlockedlocs contains("rr") not,
          Player unlockedlocs append("rr")
          "Unlocked area Rippling River!" println)
        if(enemy name == "Giant" and Player unlockedlocs contains("kk") not,
          Player unlockedlocs append("kk")
          "Unlocked area Kindred Kingdom!" println)
        if(enemy name == "Anubis",
          "CONGRATULATIONS, YOU WIN!" println
          "gold x10000 added" println
          gold = gold + 10000)
        break))
    )
  )

  runHome := method(
    loop(
      action := mainLoop(list("view m", "view s", "mm", "rr", "kk", "shop",
                              "store", "ret", "quit"))
      if(action == "view m", openMap; continue)
      if(action == "view s", Player viewStorage; continue)
      if(action == "mm", MM; runMM; continue)
      if(action == "rr",
        if(Player unlockedlocs contains("rr"), RR; runRR; continue,
          "area locked." println))
      if(action == "kk",
        if(Player unlockedlocs contains("kk"), KK; runKK; continue,
          "area locked." println))
      if(action == "shop", runShop; continue)
      if(action == "store", Player storeItem; continue)
      if(action == "ret", Player retrieveItem; continue)
      if(action == "quit", break)
    )
  )

  runMM := method(
    "You have entered Meandering Mountains." println
    loop(
      if(Player health <= 0, home; break)
      if(Player depth == 6, home; break)
      if(Player depth == 3 or Player depth == 5,
        loop(
          "Enter next area? (y, n) => " print
          ans := File standardInput readLine
          if(ans == "y",
            Player adv = Player adv + 1
            break,
            if(ans == "n", Player depth = 0; break, continue))))
      action := mainLoop(list("home", "l", "r"))
      if(action == "home", home; break)
      if(action == "l", enterCombat; MM; continue)
      if(action == "r", enterCombat; MM; continue)
    )
  )

  runRR := method(
    "You have entered Rippling River."
    loop(
      if(Player health <= 0, home; break)
      if(Player depth == 6, home; break)
      if(Player depth == 3 or Player depth == 5,
        loop(
          "Enter next area? (y, n) => " print
          ans := File standardInput readLine
          if(ans == "y",
            Player adv = Player adv + 1
            break,
            if(ans == "n", Player depth = 0; break, continue))))
      action := mainLoop(list("home", "l", "r"))
      if(action == "home", home; break)
      if(action == "l", enterCombat; RR; continue)
      if(action == "r", enterCombat; RR; continue)
    )
  )

  runKK := method(
    "You have entered Kindred Kingdom."
    loop(
      if(Player health <= 0, home; break)
      if(Player depth == 6, home; break)
      if(Player depth == 3 or Player depth == 5,
        loop(
          "Enter next area? (y, n) => " print
          ans := File standardInput readLine
          if(ans == "y",
            Player adv = Player adv + 1
            break,
            if(ans == "n", Player depth = 0; break, continue))))
      action := mainLoop(list("home", "l", "r"))
      if(action == "home", home; break)
      if(action == "l", enterCombat; KK; continue)
      if(action == "r", enterCombat; KK; continue)
    )
  )

  runShop := method(
    ShopKeeper show
    loop(
      action := mainLoop(list("buy", "sell", "home"))
      if(action == "home", home; break)
      if(action == "buy", ShopKeeper sell)
      if(action == "sell", ShopKeeper buy)
    )
  )

  mainLoop := method(keyWords,
    loop(
      "#{Player name} => " interpolate print
      action := File standardInput readLine
      if(action == "view i", Player viewInventory; continue)
      if(action == "view stat", Player viewStats; continue)
      if(action == "view spells", Player viewSpells; continue)
      if(action == "save", Sys save; continue)
      if(action == "help", Tutorial help; continue)
      if(keyWords contains(action), return action)
    )
  )
)

Game start
