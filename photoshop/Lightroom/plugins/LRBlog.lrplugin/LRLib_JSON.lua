LuaQ     @./LRLib_JSON.lua              @  A       
       d   	@$@  d      G  E  €ΐ      IE  €  I      	   LrErrors    import    LRLib_JSON    encodeString    isArray 
   serialise    parse                3   E   F@ΐ    Α  Α  \    E   F@ΐ    Α  A \    E   F@ΐ    Α Α \    E   F@ΐ    Α  A \    E   F@ΐ    Α A \    E   F@ΐ    Αΐ A \    E   F@ΐ    Α  A \              string    gsub    \    \\    "    \"    '    \'    
    \n        
    	    \t     3                                                                  	   	   	   	   	   	   	   
   
   
   
   
   
   
                                                         s     2                      E      \ W@ΐ @Wΐ ΐWΐΐ @W Α ΐW@Α @Α  ΐ W    @              type    string    boolean    number    nil    table 	   function    null                                                                                o           t                  *    
(   A   @  ΐ     Ε   ά ΐΐ@Ε ΖAΑ ά @ΐ@@Δ    ά ΪA  @ Β  ή Ε ΖΑΑ  @ά@ @ Β  ή ‘   ψ  ΐ                   pairs    type    number    math    floor       π?   max     (                                                                      !   !   !   !   !   !   !   "   "   "   "   "   "   "   $   $      %   (   (   (   *         t     '   	   maxIndex    '      (for generator)    $      (for state)    $      (for control)    $      k    "      v    "         isEncodable     ,   g    y    @ @ A@  ^  E     \ ΐΐ    Ε@ ΖΑ   ά     WΐΑ @  Β  @ ΐ        @Β ΐ   Εΐ    άΐ Ϊ   @A  Α `ΑE FBΓ ΕB ΖΓ ά \B  _ύEΑ   \   ΐ    ΐ  ΐ    BCΐ  EC FΑ \  ΕC ΖΓ ά ΓBa   ωΪ   @AA  Dΐ Β Α UΑ^  AA  Dΐ Β Α UΑ^ ΐΕ  @    @ @      @FΕ Α ά   A A ΐ   @         null    type    string    "    LRLib_JSON    encodeString    number    boolean 	   tostring    table    isArray       π?   insert 
   serialise    pairs    " :     [    concat    ,     ]    {    } 	   function 	   LrErrors    throwUserError    LOC J   $$$/LRLib/JSON/EncodeError=Error attempting to encode unsupported type ^1    :     y   0   0   1   1   4   4   4   8   8   9   9   9   9   9   9   9   9   9   ;   ;   ;   ;   <   <   <   <   <   >   >   @   D   D   D   F   F   H   H   H   H   I   I   I   I   I   I   I   I   H   J   P   P   P   P   Q   Q   Q   Q   Q   Q   Q   Q   Q   Q   R   R   R   R   R   R   R   R   R   R   R   R   R   R   R   P   S   X   X   Y   Y   Y   Y   Y   Y   Y   Y   Y   Y   [   [   [   [   [   [   [   [   [   b   b   b   b   b   c   c   f   f   f   f   f   f   f   f   f   f   f   f   g         v     x      vtype    x      rval    e      bArray !   e   	   maxCount !   e      (for index) &   0      (for limit) &   0      (for step) &   0      i '   /      (for generator) 4   P      (for state) 4   P      (for control) 4   P      i 5   N      j 5   N         isEncodable     i        -   K @ Α@    \    K @ Αΐ   \    K @ Α@  \    Eΐ F Β @ Α    Υ   \ΐ  Z@   Εΐ  ά@ Εΐ A C@   ά@  Εΐ Ζ ΔA A  U ά@  Εΐ ή          gsub    "([^%c]-)" : (.-%c)    %1 = %2     = %[     = {    %],    },    LrTasks    pcall    loadstring    jsonresult =     DBGRAW    Unable to parse data:    LRLib_TableEx    dump 	   LrErrors    throwUserError    LOC :   $$$/LRLib/JSON/ParseError=Unable to parse returned data:     jsonresult     -   o   o   o   o   o   p   p   p   p   p   q   q   q   q   q   u   u   u   u   u   u   u   u   w   w   x   x   x   y   y   y   y   y   y   z   z   z   z   z   z   z   z   }   }            serialised     ,      success    ,   	   theError    ,                                        *   *      ,   g   g   ,   i      i            isEncodable 
          