LuaQ     @./LRLib_Scroller.lua                 A@   E  À  \@ J   G  E  ¤   IE  ¤@  I E  ¤  IE  ¤À  I E  ¤  IE  ¤@ I E  ¤     IE  ¤À I E  ¤  IE  ¤@ I E  ¤ IE  ¤À I E  ¤  IE  ¤@ I E  ¤ IE  ¤À I E  ¤  IE  ¤@ I E  ¤ IE  ¤À I E  ¤  IE  ¤@ I E  ¤ IE  ¤À I E  ¤  IE  ¤@ I E  ¤ IE  ¤À I E  ¤  IE  ¤@ I E  ¤ IE  ¤À I E  ¤  IE  ¤@     I E  ¤ IE  ¤À I E  ¤ 	 IE  ¤@	 I E  ¤	 I  ,      import    LrTasks    require    LRLib_Serialise    LRLib_Scroller    new    setPropertyTable    bindID    bindIDForMappings    bindIDForNumberOfMappings    bindIDForScrollOffset    getRows    setRows    getNumRows    setNumRows    setMaxRows    setDynamic    setHeaderOnTop    setScrollBarAtSide    setCanAddRows    setDisplayControls    setDisplayQuickMenu    setHorizontal    getScrollOffset    setScrollOffset    exportPresetFields    startFieldUpdate    endFieldUpdate    isUpdating    setCustomIndexDisplayCallback !   setQuickMenuIndexDisplayCallback !   setQuickMenuWidthInCharsCallback    defaultIndexDisplay    defaultQuickMenuIndexDisplay %   defaultQuickMenuWidthInCharsCallback    refreshQuickMenu    saveVisible    loadVisible    startDialog 
   endDialog    deleteMapping    addRow    scroll    sectionForDialog '       "   d     ³   J  IA II IÁIÁIÁAIABIABIAÂIAIÁIAIÁA DIA EIA EI ÁA  IÁ GÅA ÆÇÂ GAB Â IÁ GÅA ÆÇÂ GAB B IÁ GÅA ÆÇÂ GAB Â IÁ GÅA ÆÇÂ GAB B	 IIÁIA JIA AJIA JIA ÁJIA KIA AKIA KIA ÁKIA LIA ALIA LIA ÁLIA MIA AMIA MIA ÁMIA NIA ANIA NIA ÁNIA OIA AOIA OIA ÁOIA PI A API A PI¡A ÁPI¡A QI¢A AQI¢A QI£A ÁQI£A RI¤A ARI¤A RI¥^   K      baseid    numVisibleMappings    fields    atLeastOne     createRowFn    maxRows         
   isDynamic    canAddRows    displayControls    displayQuickMenu    scrollBarAtSide    headerRowOnTop    horizontal    customIndexDisplayCallback    LRLib_Scroller    defaultIndexDisplay $   customQuickMenuIndexDisplayCallback    defaultQuickMenuIndexDisplay $   customQuickMenuWidthInCharsCallback %   defaultQuickMenuWidthInCharsCallback    deleteButtonText    LOC    $$$/LRLib/Scroller/Delete=-    upArrowActive    LrPathUtils    child    _PLUGIN    path    LRLib_Scroller_UpActive.png    upArrowGrey    LRLib_Scroller_UpGrey.png    downArrowActive    LRLib_Scroller_DownActive.png    downArrowGrey    LRLib_Scroller_DownGrey.png    xItemsTextPosition       à?   setPropertyTable    exportPresetFields    saveVisible    loadVisible    startDialog 
   endDialog    setDynamic    setHeaderOnTop    setScrollBarAtSide    setCanAddRows    addRow    setDisplayControls    setDisplayQuickMenu    setHorizontal    refreshQuickMenu    deleteMapping    scroll    sectionForDialog    bindID    bindIDForMappings    bindIDForNumberOfMappings    bindIDForScrollOffset    setMaxRows    getRows    setRows    getNumRows    setNumRows    getScrollOffset    setScrollOffset    startFieldUpdate    endFieldUpdate    isUpdating    setCustomIndexDisplayCallback !   setQuickMenuIndexDisplayCallback !   setQuickMenuWidthInCharsCallback     ³   $   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   3   3   4   4   4   5   5   5   7   7   7   7   8   8   8   8   8   8   8   8   8   8   8   9   9   9   9   9   9   9   9   9   9   9   :   :   :   :   :   :   :   :   :   :   :   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   <   >   >   >   ?   ?   ?   @   @   @   A   A   A   B   B   B   C   C   C   D   D   D   E   E   E   F   F   F   G   G   G   H   H   H   I   I   I   J   J   J   K   K   K   L   L   L   M   M   M   N   N   N   O   O   O   P   P   P   Q   Q   Q   R   R   R   S   S   S   T   T   T   U   U   U   V   V   V   W   W   W   X   X   X   Y   Y   Y   Z   Z   Z   [   [   [   \   \   \   ]   ]   ]   ^   ^   ^   _   _   _   `   `   `   b   d         self     ²      baseid     ²      fields     ²      createRowFn     ²      numVisibleMappings     ²      o    ²           h   j        	@         pt        i   j         self           pt                n   q         @@Å@    @ Á  Ü@ Æ A A @  À ÕÀÞ           MSG ?   Scroller error: empty 'row' value passed to bindID for field '    '    baseid 
   _mapping_    _        o   o   o   o   o   o   o   o   p   p   p   p   p   p   p   q         self           field           row                s   u        F @ @  U ^          baseid    _serialised_mappings        t   t   t   t   u         self                w   y        F @ @  U ^          baseid    _num_mappings        x   x   x   x   y         self                {   }        F @ @  U ^          baseid    _scrollOffset        |   |   |   |   }         self                          D   F À @  Á  Á@ FA A UAÕ   \À  Z@   Å   Ü@ Ê   ÇÀ ÅÀ Þ          pcall    loadstring    scrollerMappings =     pt    baseid    _serialised_mappings    MSG    scrollerMappings                                                                                self           success       	   theError             LrTasks                 @ @ @@ Æ@ Á  Õ @@@ Æ@  Õ A A@   ÀA  @ B @ @B @   
      startFieldUpdate    pt    baseid 
   _mappings    _serialised_mappings    LRLib_Serialise 
   serialise    setNumRows    endFieldUpdate    loadVisible                                                                                      self        	   mappings                           F @ @@ Á  À F ^          pt    baseid    _num_mappings                                   self                            @ Æ@@   Õ @        pt    baseid    _num_mappings                                self           rows                           	@         maxRows                    self           rows                    ¢        	@      
   isDynamic        ¡   ¢         self        
   isDynamic                ¤   ¦        	@         headerRowOnTop        ¥   ¦         self           onTop                ¨   ª        	@         scrollBarAtSide        ©   ª         self           atSide                ¬   ®        	@         canAddRows        ­   ®         self           canAddRows                °   ²        	@         displayControls        ±   ²         self           shouldDisplay                ´   ¶        	@         displayQuickMenu        µ   ¶         self           shouldDisplay                ¸   º        	@@        horizontal        ¹   º         self                ¼   ¾        F @ @@ Á  À F ^          pt    baseid    _scrollOffset        ½   ½   ½   ½   ½   ½   ¾         self                À   Â         @ Æ@@   Õ @        pt    baseid    _scrollOffset        Á   Á   Á   Á   Á   Â         self           offset                Ä   Ï        A   @@      A   Ê  A AA AÉ É@ 
  FA Á U	A	BJ  A ÁA ÁII@¢@    
              atLeastOne       ð?   key    baseid    _num_mappings    default    _serialised_mappings    {}    _scrollOffset        Æ   Ç   Ç   Ç   Ç   É   É   Ê   Ê   Ê   Ê   Ê   Ê   Ë   Ë   Ë   Ë   Ë   Ë   Ì   Ì   Ì   Ì   Ì   Í   Í   Ï         self           defaultNumMappings               Ó   Õ        F @ @@ Á  À IÀ@        pt    baseid    _internalUpdate        Ô   Ô   Ô   Ô   Ô   Õ         self                ×   Ù        F @ @@ Á  À IÀ@        pt    baseid    _internalUpdate         Ø   Ø   Ø   Ø   Ø   Ù         self                Û   Ý        F @ @@ Á  À F Z@   F @ @@ ÁÀ  À F ^          pt    baseid    _internalUpdate 	   _loading        Ü   Ü   Ü   Ü   Ü   Ü   Ü   Ü   Ü   Ü   Ü   Ü   Ü   Ý         self                á   ã        	@         customIndexDisplayCallback        â   ã         self        	   callback                å   ç        	@      $   customQuickMenuIndexDisplayCallback        æ   ç         self        	   callback                é   ë        	@      $   customQuickMenuWidthInCharsCallback        ê   ë         self        	   callback                ï   ñ        A      U ^                  ð   ð   ð   ð   ñ         index                ó   õ        A      U ^                  ô   ô   ô   ô   õ         index                ÷   ù                         @       ø   ø   ù               û          J      Ë@@ Ü À  Ê  Á@ @  É É IÀ  @üÆ@A A AÁ AÉ@            ð?   getNumRows    title $   customQuickMenuIndexDisplayCallback    value    pt    baseid    _quickMenu        ý   þ   ÿ   ÿ   ÿ   ÿ                                              self           items          row                     =   F @ @@ Á  À F À  Ë A Ü ÌÀ AA   ÀÆA À  Ë A Ü ÌÀ 
  I ÅÀ B Ü ÀA   FBÂ@ ËB FCÂ Ü Â	á  @üÀ@ ÷Æ @ A@ AÁ AÉ CÆ @ A@ AA AE FÁÃ \ É@Æ @ A@ AÁ AÉ D        pt    baseid 
   _mappings       ð?   getScrollOffset    getNumRows    numVisibleMappings    pairs    fields    key    bindID    _saving    _serialised_mappings    LRLib_Serialise 
   serialise      =   	  	  	  	  	  
                                                                                                                      self     <   	   mappings    <      n    <      (for generator)    '      (for state)    '      (for control)    '      k    %      v    %           "  G    ]   F @ @@ Á  À F ÀÀ     F @ @@ Á  À IÀ@F @ @@ Á@ À F  ËÀA Ü ÌÀ B   
Æ@B À À	ËÀA Ü ÌÀ ÆÀ Ú   Å ÁB Ü À@ KC ÆBÃ  \ ÂA   ÆBÃÂ	á  @ü Å ÁB Ü @ KC ÆBÃ  \ Ã	á  ýA@óÆ@B À Å ÁB Ü @ KC ÆBÃ  \ Ã	á  ýA@ûÆ @ A@ A AÉÀC        pt    baseid    _internalUpdate 	   _loading 
   _mappings       ð?   getScrollOffset    getNumRows    numVisibleMappings    pairs    fields    bindID    key    default      ]   $  $  $  $  $  $  $  $  (  (  (  (  (  *  *  *  *  *  +  -  -  -  -  -  -  -  -  -  -  /  /  /  /  /  /  0  0  0  0  1  1  1  1  1  1  1  1  1  1  1  1  0  1  2  4  4  4  4  5  5  5  5  5  5  5  4  5  9  9  >  >  >  ?  ?  ?  ?  @  @  @  @  @  @  @  ?  @  B  B  E  E  E  E  E  G        self     \   	   mappings    \      n    \      (for generator) &   5      (for state) &   5      (for control) &   5      k '   3      v '   3      (for generator) 9   C      (for state) 9   C      (for control) 9   C      k :   A      v :   A      (for generator) K   U      (for state) K   U      (for control) K   U      k L   S      v L   S           I     C   	@  @ Æ@@   Õ ÀÀ @ Æ@@  Õ ÀÀ @ Æ@@ A Õ ÀÀ @ Æ@@  Õ ÀÁ @ Æ@@  Õ 
   ¤          À  Ü@ Æ @ Ë@ÂFA@  U Ü@ Æ @ Ë@ÂFA@ Á U Ü@ Á  AC A àÅ ÂC Ü @ CBD DÄ@  äC      C á   ýßÀû        pt    baseid    _internalUpdate     _saving 	   _loading    _scrollOffset         
   _mappings    addObserver    _serialised_mappings    _num_mappings       ð?   numVisibleMappings    pairs    fields    bindID    key        ]  t    Y       @ D   F@À   U @  WÀ@      @ D   F@À   U @  À@         @ D   F@À @ U @          @ D   F@À @ U @  A      @ D   F@À À U    	 À   B E@  Ä   Æ À  A@AA AÆ À \  À  @  ÀÀ À  @     @Ä   Æ@ÀÁ Õ 
   À    @Ä   Æ@ÀÁ Õ      @C @    C @         pt    baseid    _internalUpdate    _saving    _serialised_mappings     
   _mappings    pcall    loadstring    mappings =     MSG 	   mappings    loadVisible    refreshQuickMenu     Y   _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  d  e  e  e  e  e  e  e  e  e  g  g  g  g  g  g  g  g  g  g  g  g  g  g  i  i  j  j  j  k  k  k  k  k  k  k  k  k  m  m  m  m  m  m  m  m  q  q  q  r  r  r  t        success <   R   	   theError <   R         self    LrTasks                  @ D   F@À   U @  WÀ@      @ D   F@À   U @  À@        @A @         pt    baseid    _internalUpdate 	   _loading    saveVisible                                                                self C   K  M  M  M  M  M  N  N  N  N  N  O  O  O  O  O  S  S  S  S  S  T  T  T  T  T  T  t  t  t  x  x  |  |  |  |  |  |  |  }  }  }  }  }  }  }                                                  self     B      pt     B      reloadSettings    B      (for index) 1   B      (for limit) 1   B      (for step) 1   B      n 2   A      (for generator) 5   A      (for state) 5   A      (for control) 5   A      k 6   ?      v 6   ?         LrTasks                                   self            pt                   À    R    @     @@  @    À@ Æ A A Õ ÁÀ@ Æ A Á Õ À Ë B Ü ÌÀ A@    À ÌÀý@ÂÁ@ FA  UÁ CÀ  	B   KA@ \ @ AC A@  @AA@  KB \ AFC @@A@  FC AÀC  Á KD À \AÁ@ FA A U	AÄD A ÁD A E A         atLeastOne    getNumRows       ð?   pt    baseid    _internalUpdate 
   _mappings    getScrollOffset     _serialised_mappings    LRLib_Serialise 
   serialise    setNumRows    numVisibleMappings            setScrollOffset     loadVisible    saveVisible    refreshQuickMenu     R                                                                 ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¤  ¤  ¤  ¤  ¤  ¤  ¤  ¥  ¥  ¥  ¥  ¥  ª  ª  ª  ª  ª  ª  ª  ª  «  «  «  «  ¬  ¬  ¬  ­  ­  ­  ²  ²  ²  ²  ²  ¶  ¶  º  º  ¾  ¾  À        self     Q      idx     Q   	   mappings    Q      i    Q      offset @   F           Ä  Ò    &   F @ @@K@ \  @ @     KÀ@ \@ K A Ë@ Ü Ì@Á\@FA ÀA Á  À F @B M @À   A@  B   @ÀB @  C @ @C @ C @         maxRows            getNumRows    startFieldUpdate    setNumRows       ð?   pt    baseid    _num_mappings    numVisibleMappings    setScrollOffset    endFieldUpdate    loadVisible    saveVisible    refreshQuickMenu     &   Æ  Æ  Æ  Æ  Æ  Æ  Æ  Æ  Æ  Ç  Ç  È  È  È  È  È  É  É  É  É  É  É  É  Ê  Ê  Ê  Ë  Ë  Ë  Ì  Ì  Î  Î  Ï  Ï  Ð  Ð  Ò        self     %      offset    %           Ö  ä        @  @ @@  @  Ë @ Ü WÀ  Ë@ @ Ü@ËÀ@ Ü@         getScrollOffset            setScrollOffset    loadVisible        Ø  Ø  Ø  Ù  Ù  Ú  ß  ß  ß  ß  à  à  à  á  á  ä        self           offset        
   newOffset               æ  ¾    #L    A@E  FÀÁ  ä                    
B  KBÁ \ 	BÚ   ÀA  @ÀA  E FBÂ ËÂ J IÃIÃIICDÜ\B  E FBÂ À\BA  @ÀA  E FBÂ ËÄ J    ÃDÆE DÅ  ÃÆE ÄÆÀ Ü Ä  bC  Ü\B  KÂÆ ÊÂ  ÉBGÉÂGÈ  ÉÃÆ  âB  \ AB Â  BGÂGËÈ Ü ÂÆBH À Å ÆBÂ  @\ ÜB  LBÇÀüÃH    ÃÆ  À À Ä  À 
  FÃH Z  @JÃ   Ê  I AÄ	 DÉ$D      É I
 ÃJÆI  ÕD I ÆI Ä Õ I FL \ @Ì@ 	CG  	Cd            ¤Ã            Ê ÉCGDÁ  É  ÄD[  FL  E  FÄÄÄL ËÄ JÅ IEMIEGIÅGÅÆ 
 E  FÆÄÆH ËÍ @ Ü\    ÆDÆÆM W Ã  ÂF  Â     Å  ÆÆÄÇM W C  G   @ \ Ü  "F  ËÅÆ J    ÆDÆE Â Ç  ÆGN ÇNÀ 
  FI  U	Hd 	HÜ Ç  bF  Ü  ÆDFE Z    FÆN FÅ 
G E G \ 	G@ \ 	G	GG@   ÆI  ÕÇäG     Ç\ 	Gd     	G  bE  Ü\    ÄD	Û@ ÆL Ó	  âC  H   @ DB@ÄÆ 
 	EGKEÁ \ 	E@"E D  @ DB@ÄÆ 
 	EGKEÁ \ 	E@  ÅDÆÅM ÆÏ F FG ÀÜ GÐ G  GG @ \ ¢F    "E  D  Ä     B      LrView    bind    share        @   spacing    control_spacing    ornamentationOnTop    noOrnamentation    table    insert    static_text    visible     title    1    width_in_chars    font    <system/bold>    view    conditionalItem 
   isDynamic    push_button    deleteButtonText    place_vertical       à?   width    addDeleteWidth    row    fill_horizontal       ð?   margin       @   label_spacing    numVisibleMappings    horizontal    displayQuickMenu    value    key    baseid    _scrollOffset 
   transform    enabled 
   LrBinding 	   keyIsNot    _num_mappings            items    _quickMenu $   customQuickMenuWidthInCharsCallback       ð¿   headerRowOnTop    displayControls    place    overlapping    popup_menu    scrollBarAtSide    place_horizontal    xItemsTextPosition    <system/small/bold>    canAddRows    LOC    $$$/LRLib/Scroller/Add=+    action    column    fill_vertical    spacer        ï  u   _   d              ¤@             ä              $Á                  d               ¤A          Ê   B@ ÉÉÁ@ÉAA J   ÊB   CBA CÉ
C  D FCÂÃ U	C¢B I¤       I É@C ÂC@ B  À D ÂC@  B  @ ÂC@  B    BD          spacing    label_spacing    fill_horizontal       ð?   margin_bottom       @   visible    keys    key    baseid    _scrollOffset    _num_mappings 
   operation    ornamentationOnTop    table    insert    noOrnamentation    view        ó        D   K À Ê   J   Á@Á ÁI¤     I É ÉÀAÉ  ÉÂ] ^           static_text    title    key    baseid    _scrollOffset 
   transform    place_vertical       à?   width_in_chars    font    <system/bold>        ÷  ý      Z       @Ä  ÌÀ        @  @          customIndexDisplayCallback 
   LrBinding    kUnsupportedDirection        ø  ø  ù  ù  ù  ù  ù  ù  ù  û  û  û  ý        value        
   fromTable              self    r    ô  ô  ô  õ  õ  ö  ö  ö  ö  ö  ý  ý  ý  ý  õ  þ  ÿ       ô            width              f    bind    self    r                  @ À  Ä  
  D FÁÀ U	Ad     	AÜ ÀÀA@B      
      static_text    title    key    baseid    _scrollOffset 
   transform    place_vertical       à?   font    <system/bold>        	        Z       @Ä  ÌÀ        @  @          customIndexDisplayCallback 
   LrBinding    kUnsupportedDirection        
  
                              value        
   fromTable              self    r                                                        f    bind    self    r       *    	#      @@ D   FÀ   À@
A D  FAÁ	AD   Ä  ÆÂB ÕÁä     Á\ 	A	ÃD \ 	AdA       	A               LrView    conditionalItem 
   isDynamic    push_button    title    deleteButtonText    enabled    key    baseid    _num_mappings 
   transform    place_vertical       à?   width    addDeleteWidth    action          "      Z    @ @   @@   @             À@             ð?   atLeastOne 
   LrBinding    kUnsupportedDirection                                           "        value        
   fromTable              self     &  (           @   @        deleteMapping        '  '  '  '  (            self    r #                                     "  "  "    #  $  %  %  %  %  (  (  (  (      )  *            self    f    bind    share    r     .  7           @  Ä   ËÀÜ À ÁÄ   Ü AAD  Ä  D\ ¢@              row    spacing    control_spacing    fill_horizontal       ð?   createRowFn        /  /  /  0  0  0  0  1  3  3  3  4  4  4  4  4  4  5  5  6  /  6  7            f    indexWithWidth    INDEX_WIDTH    self    r    deleteButton     9  I    
&       @  Ä   ËÀÜ À ÁÄ   Ë@ÁJÁ   @ IIÁAIÁ  Ä  ËÂJB  IÁÜ  bA  ÜABD  Ä  ¢@        
      column    spacing    control_spacing    fill_horizontal       ð?   row    margin       @   spacer    createRowFn     &   :  :  :  ;  ;  ;  ;  <  >  >  >  ?  ?  ?  ?  @  A  B  B  C  C  C  C  C  D  D  E  >  G  G  G  G  G  G  H  :  H  I            f    index    deleteButton    self    r     K  R           @   Ä   ËÀÜ À ÁÄ  Æ@Á  D  Ü  ¢@              row    spacing    control_spacing    fill_horizontal       ð?   createRowFn        L  L  L  M  M  M  M  N  P  P  P  P  P  P  Q  L  Q  R            f    self    r     _  e      Ä    @AA  A Ì  @A  A À  Â   Þ  @ Â  Þ          baseid    _scrollOffset    _num_mappings        `  `  `  `  `  `  `  `  `  `  `  `  `  `  a  a  a  c  c  e        binding           values        
   fromTable              r    self _                       *  *  *  *  *  *  7  7  7  7  7  7  7  I  I  I  I  I  I  R  R  R  R  T  V  V  V  V  W  X  Z  Z  [  [  \  \  \  \  \  \  ]  ]  ]  ]  ]  ^  ^  e  e  e  e  Z  f  k  k  k  l  l  l  l  l  l  l  m  m  m  n  n  n  n  n  n  n  p  p  p  p  p  p  s  s  s  s  s  u        r     ^      indexWithWidth    ^      index 
   ^      deleteButton    ^   
   singleRow    ^      ornamentationOnTop    ^      noOrnamentation !   ^      view ?   ^         f    bind    self    share    INDEX_WIDTH    style     É  Ö       Z     @   @ @ Ä   Ë@ÀÜ Í   @  Ä   Ë@ÀÜ   @ À@  À  Ä   Ë Á@ Ü@Ä   Ë@ÁÜ@              ð?   getNumRows    numVisibleMappings            setScrollOffset    loadVisible         Ê  Ê  Ë  Ë  Ë  Í  Î  Î  Î  Î  Î  Î  Î  Î  Ï  Ï  Ï  Ï  Ï  Ï  Ð  Ð  Ð  Ò  Ò  Ò  Ò  Ó  Ó  Ó  Ô  Ö        value        
   fromTable           offset             self     ä      ?       @ À À ÁÄ  ÆÁWÀÁÄ  Æ Â AX   Â@  Â  ÀÄ   Ë@ÂJ  ÁBIIÁA Ê   CAÂ BÉ$  É I¤A    IÜ  ABÁ  Ä ÆÄÁÁAÄ 
  D FÃÂ U	Bd  	BÜ Á¢@              view    place    overlapping    place_vertical       à?   visible    maxRows            numVisibleMappings    picture    value    upArrowActive    frame_width    key    baseid    _scrollOffset 
   transform 
   mouseDown    upArrowGrey        ò  ø       Z   @X    @       @  @               
   LrBinding    kUnsupportedDirection        ó  ó  ô  ô  ô  ô  ô  ô  ö  ö  ö  ø        value        
   fromTable                û  ÿ       À @@À    @Á  @     
   eventType    leftMouseDown    scroll       ð¿       ü  ü  ü  ý  ý  ý  ý  ÿ        dummy           event              self              Z   @Y @   @       @  @               
   LrBinding    kUnsupportedDirection        	  	  
  
  
  
  
  
                value        
   fromTable            ?   æ  æ  æ  è  é  ê  ê  ê  ê  ê  ê  ê  ê  ê  ê  ê  ê  ê  ì  ì  ì  í  í  í  î  ð  ð  ñ  ñ  ñ  ñ  ñ  ø  ø  ð  ù  ÿ  ÿ  ÿ  ì                                          æ                f    self    bind       I    U       @ À À ÁÄ  ÆÁWÀÁÄ  Æ Â AX   Â@  Â  ÀÄ   Ë@ÂJ  ÁBIIÁA Ê  
 JB   ÂCÁ ÂIB  Ä ÆÂÃC ÕÂ"B É$    É I¤A    IÜ  ABÁ  Ä ÆÅÁÁAÄ 
  J B  Ä ÆÂÃ ÕÂÊB   ÃCAC CÉbB 	Bd    	BÜ Á¢@              view    place    overlapping    place_vertical       à?   visible    maxRows            numVisibleMappings    picture    value    downArrowActive    frame_width    keys    key    baseid    _scrollOffset    _num_mappings 
   operation 
   mouseDown    downArrowGrey        %  +      Ä   Æ ÀA  Õ ÆÀ   @A  A Í   Á@  Â   Þ  @ Â  Þ          baseid    _num_mappings    _scrollOffset    numVisibleMappings        &  &  &  &  &  &  &  &  &  &  &  &  &  &  &  '  '  '  )  )  +        binding           values        
   fromTable              self     .  2       À @@À    @Á  @     
   eventType    leftMouseDown    scroll       ð?       /  /  /  0  0  0  0  2        dummy           event              self     >  D      Ä   Æ ÀA  Õ ÆÀ   @A  A Í   Á@  Â  Þ  @ Â   Þ          baseid    _num_mappings    _scrollOffset    numVisibleMappings        ?  ?  ?  ?  ?  ?  ?  ?  ?  ?  ?  ?  ?  ?  ?  @  @  @  B  B  D        binding           values        
   fromTable              self U                                                           !  !  "  "  "  "  "  "  #  #  #  #  #  $  $  +  +  +     ,  2  2  2    5  5  5  6  6  6  7  9  9  :  :  ;  ;  ;  ;  ;  ;  <  <  <  <  <  =  =  D  D  D  9  E  5  G    G  I            f    self    bind     r  x       Z   @   Á@            À@          LOC *   $$$/LRLib/Scroller/Total/Defined=^1 items 
   LrBinding    kUnsupportedDirection        s  s  t  t  t  t  t  t  v  v  v  x        value        
   fromTable                        Z        @@@@        @ Ä   Æ ÀXÀ   @       À   A          maxRows            getNumRows 
   LrBinding    kUnsupportedDirection                                                            value        
   fromTable              self                  @ @         addRow                          self L  è  è  é  é  ë  u  u  u  u  u  u  u  y  z  z  z  }  }                                                                                                               ¡  ¢  ¢  ¢  £  £  £  ¤    ¤  ª  «  ­  ®  ¯  ¯  ¯  µ  µ  µ  ¶  ¶  ¶  ¶  ¶  ¶  ¶  ·  ·  º  »  »  »  ¼  ¼  ¼  ¼  ¼  ¾  ¾  ¾  ¾  Ã  Ä  Ä  Ä  Æ  Ç  Ç  È  È  È  È  Ö  Ö  Ö  Ç  ×  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ù  Ù  Ù  Ù  Ù  Ù  Ú  Ü  Ü  Ý  Ý  Þ  Þ  à          I  I  I  I  K  M  N  N  N  P  P  P  P  P  P  P  T  T  T  T  T  V  W  X  Z  Z  ^  ^  ^  ^  ^  ^  ^  b  b  b  b  b  b  b  b  b  b  f  f  f  f  f  f  f  f  f  f  g  Z  k  k  m  m  m  m  m  n  n  o  p  p  q  q  q  q  x  x  p  y  m  m  |  k                                                                      T  T                                            ¢  ¢      ¢  ¦  ¦  ¦  ¦  ¦  ¨  ©  ©  ©  «  ¯  ¯  ¯  ¯  ¯  ±  ³  ³  ´  ´  ´  ´  µ  µ  ·  ¯  ¯  ¸  ¦  ¦  ¼  ¼  ¼  ¼  ¾        self     K     f     K     style     K  
   headerRow     K     bind    K     share    K     INDEX_WIDTH    K     mappingRow    K     header    K     n S   K  	   mappings Y   K     mappingsView f   K  
   quickMenu s   K     width          upArrow    K  
   downArrow     K     view   K                                 "   d   "   h   j   h   n   q   n   s   u   s   w   y   w   {   }   {                                                       ¢       ¤   ¦   ¤   ¨   ª   ¨   ¬   ®   ¬   °   ²   °   ´   ¶   ´   ¸   º   ¸   ¼   ¾   ¼   À   Â   À   Ä   Ï   Ä   Ó   Õ   Ó   ×   Ù   ×   Û   Ý   Û   á   ã   á   å   ç   å   é   ë   é   ï   ñ   ï   ó   õ   ó   ÷   ù   ÷   û     û         "  G  "  I      I          À    Ä  Ò  Ä  Ö  ä  Ö  æ  ¾  æ  ¾        LrTasks           