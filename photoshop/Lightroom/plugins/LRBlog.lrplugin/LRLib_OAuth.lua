LuaQ     @./LRLib_OAuth.lua           >      A@   E     \    ÁÀ   Å    Ü   AA  E   \   ÁÁ  Å B ÜA Ê  Ç Å $  ÉÅ $B         Éä  B dÂ         ä     Â¤B   ä  dÃ                  	C d   	C        import    LrMD5    LrXml    LrDate 
   LrDialogs    LrHttp    LrStringUtils    LrFunctionContext    require    sha1    LRLib_OAuth    new    generateNonce    @ä'ÍA   sign    authenticateNewCredentials    getAuthenticatedRequestHeaders 	       J   \           Æ À À Æ@À ÀÆÀ À ÆÀÀ ÀÆ Á À Æ@Á ÀÅÀ ÆÁÀ ÅÀ Æ ÂÀ ÅÀ Æ@ÂÀÅÀ ÆÂÀ           requestTokenURL    authorizeURL    accessTokenURL    uniqueStringForPlugin    consumerSecret    consumerKey    authenticateNewCredentials    LRLib_OAuth    generateNonce    sign    getAuthenticatedRequestHeaders        L   N   N   O   O   P   P   Q   Q   R   R   S   S   U   U   U   V   V   V   W   W   W   X   X   X   Z   \         self        	   settings           o               ^   `       D   F À @@ Å  Á  A Ü   E   AA \  @]  ^           digest    uniqueStringForPlugin 	   tostring    math    random    currentTime        _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   `         self              LrMD5    LrDate     f   n        E   @@   d    ]   ^        	   tostring    gsub    [^-._~a-zA-Z0-9]        g   i     
   E   F@À   ËÀ@ Ü  \  K Á ]  ^           string    format    %%%02x    byte    upper     
   h   h   h   h   h   h   h   h   h   i         letter     	          g   g   g   i   g   g   i   n         val                v   x           D   @  @Ä  ÆÀÀÜ Ì Á L           	   tostring    math    floor    currentTime       à?       w   w   w   w   w   w   w   w   w   w   w   w   x             CocoTimeShift    LrDate        Ý    b   @ FAÀZA    A  ÉÀÀÉ@A  Å  Ü Ã B@   Ä    Ü ÃÄ   Ü ÃCá   üÅÁ ÆÁÂ  d  ÜAÊ   @ ÀEÃ FÂÆCB FBÕC\C!  @ýÂ BC@ @  Ä    Ü  D   \ UB  À  Á   @ ÅÂ   @Ü D@ D   \  ÁC  DÀ Ä @ ÕC Þ À  Þ        consumerSecret    oauth_token_secret         oauth_signature_method 
   HMAC-SHA1    pairs    table    insert    key    val    sort    =    concat    &    hmac_sha1_binary    encodeBase64    &oauth_signature=    GET    ?            ¨         @ Æ À À      @ @ Æ À       @@ Æ@À XÀ   @              key    val        ¡   ¡   ¡   ¡   ¢   ¢   ¢   £   £   £   £   ¤   ¤   ¤   ¦   ¦   ¦   ¦   ¦   ¦   ¦   ¨         a           b            b                                                                                                ¨       ®   ¯   ¯   ¯   ¯   °   °   °   °   °   °   °   °   ¯   °   ¸   ¸   ¸   ¸   ¸   Á   Á   Á   Á   Á   Á   Á   Á   Á   Á   Ã   Ã   Ã   Ã   Ã   Ã   Ã   Ã   È   È   È   È   Í   Í   Í   Í   Ó   Ó   Ó   Ô   Ô   Ô   Ô   Ö   Ö   Ø   Ø   Ø   Ø   Ø   Ø   Ø   Û   Û   Û   Ý         self     a      url     a      method     a      args     a      consumer_secret    a      token_secret    a      keys_and_values    a      (for generator)          (for state)          (for control)          key          val          key_value_pairs !   a      (for generator) $   /      (for state) $   /      (for control) $   /      _ %   -      rec %   -      query_string_except_signature 4   a      SignatureBaseString >   a      key F   a      hmac_binary J   a   	   hmac_b64 N   a   
   signature Q   a      query_string U   a         oauth_encode    LrStringUtils     æ      K   E   F@À    \ IÀ@  @A Ä   ÆÁ
  E A \ 	AKÁBÊA ÉA BCB  Å  Ü ÂKÂBÊÉÄÉÄÉÂDÉBECC  Å  Ü ÃÊ  ÉCFÉÃFÃKGÊC  ÉÄ\G
D 	È	È	ÉE FÉ  \ 	DJ  IDFIÄF	DâB  \âA  \	AÜ ÀÉ À  @     (   
   LrBinding    makePropertyTable    PIN        LrView 
   osFactory    presentModalDialog    title    LOC    $$$/xxx=Authentication PIN 	   contents    view    bind_to_object    static_text U   $$$/xxx=After you have granted this application access, enter the PIN they provided:    margin_top       >@   margin_bottom    place_horizontal       à?   place    horizontal    $$$/xxx=PIN    font    name    <system/default>    size       D@   spacer    width    edit_field    width_in_digits       "@   wraps  
   alignment    center    value    bind    ok     K   è   è   è   è   é   ë   ë   ë   ì   ì   ì   í   í   í   í   î   î   ï   ð   ð   ñ   ñ   ñ   ñ   ð   ó   ó   ô   õ   ö   ÷   ø   ø   ù   ù   ù   ù   ú   û   ü   ý   ø   ÿ   ÿ   ÿ   ÿ                                    
  ó     î     ì                         context     J      PropertyTable    J      v    J      result C   J      
   LrDialogs       *        À @  À @  Á       @  ÁÀ  À     Ë A AA ÜÚ   À   A           status    LOC @   $$$/xxx=Couldn't connect to server -- Internet connection down? 4   $$$/xxx=Unexpected HTTP error reply #^1 from server    match    <error>(.-)</error>    :                                   "  "  #  #  #  $  $  %  %  %  %  )  *        reply           headers           note          error               A  ¿   ¹   K @ Æ@@   JA A I   IIÁAIABÁB  I\   CÀ  À     AÃWCÀÁ A A     Á @ A Á EA FÄ\ A   D  À\  ÁD KÁDÁA \A    Å Â Ü   F ÁA @  Ä ÆÆ AÂ  E  \  ÁB  Ü  WÇ  AÂ  H@ B B HAÂ B  DFÉB	 ä         \BB   CÂ ^K@ ÆI   JÃ A I   IIÃAÃB  IIICI\ CÀÂ    CÃWCÀÃ A
 C    Ã @ C Ã EC FÄ\ C   D  À\  Ã
 A C DÀ  UC ÃD KÃDÁC \ÃDD ËÃDA Ü  ÀZ  @
 		D		Ä  E D À \    2      sign    requestTokenURL    GET    oauth_consumer_key    consumerKey    oauth_timestamp    oauth_version    1.0    oauth_callback    oob    oauth_nonce    generateNonce    get    status       i@   DBGRAW    request token failure    LRLib_TableEx    dump    match    oauth_token=([^&]+)    oauth_token_secret=([^&]+)    LOC /   $$$/xxx=Couldn't get request token from server    authorizeURL    ?oauth_token=    confirm c   $$$/xxx=For this plugin to function you must grant it permission. Jump to the authentication page? b   $$$/xxx=If you are currently logged in with your browser, you will authenticate under that login. !   $$$/xxx=View authentication page    ok 	   canceled    openUrlInBrowser    LrTasks    sleep       ð?   callWithContext    Authentication PIN    accessTokenURL    oauth_token    oauth_token_secret    oauth_verifier    access token failure    DBG    OAuth result =     user_id=([^&]+)    screen_name=([^&]+)    user_id    screen_name )   $$$/xxx=Unexpected reply from server: ^1        |     	   K @ ä      \@D     \ H          addFailureHandler             	       @Å@    Ü   AÁ  @         message    LOC    $$$/xxx=INTERNAL ERROR 	   critical     	                           status           error           
   LrDialogs 	                           context           
   LrDialogs    PIN    GetUserPIN ¹   E  E  F  F  H  H  I  I  I  J  K  L  L  L  E  O  O  O  O  Q  Q  Q  Q  Q  R  R  R  S  S  S  S  S  T  T  T  T  T  T  U  U  U  U  U  U  X  X  X  Y  Y  Y  [  [  \  \  \  \  \  c  c  c  c  c  c  e  e  e  e  e  f  f  f  g  g  g  e  i  i  j  j  j  r  r  r  r  t  t  t  t  y  {  {  {          {                                                          ¢  ¢  ¢  ¢  ¢  £  £  £  ¤  ¤  ¤  ¤  ¤  ¥  ¥  ¥  ¥  ¥  ¥  ¦  ¦  ¦  ¦  ¦  ¦  ©  ©  ©  ©  ©  ©  ©  ©  «  «  «  ¬  ¬  ¬  ­  ­  ­  ®  ®  ®  °  °  °  °  ´  µ  ¶  ·  ¸  ¹  ½  ½  ½  ½  ½  ½  ¿        self     ¸      url    ¸      result    ¸      headers    ¸      token /   ¸      token_secret 2   ¸      url ?   ¸      result K   ¸      PIN Y   ¸      url w   ¸      result {   ¸      headers {   ¸      oauth_token    ¸      oauth_token_secret ¢   ¸      user_id ¥   ¸      screen_name ¨   ¸         unix_timestamp    LrHttp    error_from_header    oauth_encode 
   LrDialogs    LrFunctionContext    GetUserPIN     Á  è    U   E  A  À W@  A   \A E  A  ÆÁÀ W A  A   \A E  A  ÆAÁ W A  A   \A J ÁA I   IIÂC  IÁÀIAÁI  A À   I¡   ÿC   @ Á
 J  IÄ À Ã A ÁÁÃ D FÄÀÄ Á ÅÂAÅ Å ÆÂÆ A F ÆFÂÇ A ÁÇ ÂI"B          assert    type    table    oauth_token    string    oauth_token_secret    oauth_consumer_key    consumerKey    oauth_timestamp    oauth_version    1.0    oauth_nonce    generateNonce    pairs    sign    field    Authorization    value    OAuth realm="    ",     oauth_consumer_key="    oauth_token="    oauth_nonce="    oauth_timestamp=" %   oauth_signature_method="HMAC-SHA1",     oauth_version="    oauth_signature="    "      U   Ã  Ã  Ã  Ã  Ã  Ã  Ã  Ã  Ã  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Å  Å  Å  Å  Å  Å  Å  Å  Å  Ç  È  È  É  É  É  Ê  Ë  Ë  Ë  Ì  Ì  Í  Í  Ð  Ð  Ñ  Ñ  Ñ  Ñ  Ò  Ñ  Ò  Ø  Ø  Ø  Ø  Ø  Ú  Ú  Ú  Ú  Ú  Ú  Û  Û  Û  Ü  Ü  Ü  Ý  Ý  Ý  Þ  Þ  Þ  ß  à  à  à  á  á  á  á  á  â  æ  è        self     T      url     T      method     T      credential_bundle     T      args     T      QUERY )   T      (for generator) .   2      (for state) .   2      (for control) .   2      key /   0      value /   0   	   full_url 7   T   
   signature 7   T      headers S   T         unix_timestamp >   >   >   >   ?   ?   ?   @   @   @   A   A   A   B   B   B   C   C   C   D   D   D   F   F   F   H   H   J   \   J   ^   `   `   `   ^   n   q   x   x   x      Ý   Ý   Ý          *  A  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  A  Á  è  è  Á  è        LrMD5    =      LrXml    =      LrDate 	   =   
   LrDialogs    =      LrHttp    =      LrStringUtils    =      LrFunctionContext    =      oauth_encode #   =      CocoTimeShift $   =      unix_timestamp '   =      GetUserPIN .   =      error_from_header /   =       