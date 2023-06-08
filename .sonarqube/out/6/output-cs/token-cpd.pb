¿
J/Users/pavel/project/NetMentoring/CartWebApi/AuthHelper/HasScopeHandler.cs
	namespace 	
CatalogWebApi
 
. 

AuthHelper "
;" #
public 
class 
HasScopeHandler 
:  
AuthorizationHandler 3
<3 4
HasScopeRequirement4 G
>G H
{		 
	protected 
override 
Task "
HandleRequirementAsync 2
(2 3'
AuthorizationHandlerContext3 N
contextO V
,V W
HasScopeRequirementX k
requirementl w
)w x
{ 
if 

( 
! 
context 
. 
User 
. 
HasClaim "
(" #
c# $
=>% '
c( )
.) *
Type* .
==/ 1
$str2 9
&&: <
c= >
.> ?
Issuer? E
==F H
requirementI T
.T U
IssuerU [
)[ \
)\ ]
return 
Task 
. 
CompletedTask %
;% &
var 
scopes 
= 
context 
. 
User !
.! "
	FindFirst" +
(+ ,
c, -
=>. 0
c1 2
.2 3
Type3 7
==8 :
$str; B
&&C E
cF G
.G H
IssuerH N
==O Q
requirementR ]
.] ^
Issuer^ d
)d e
.e f
Valuef k
.k l
Splitl q
(q r
$charr u
)u v
;v w
if 

( 
scopes 
. 
Any 
( 
s 
=> 
s 
==  
requirement! ,
., -
Scope- 2
)2 3
)3 4
context 
. 
Succeed 
( 
requirement '
)' (
;( )
return 
Task 
. 
CompletedTask !
;! "
} 
} ç

N/Users/pavel/project/NetMentoring/CartWebApi/AuthHelper/HasScopeRequirement.cs
	namespace 	
CatalogWebApi
 
. 

AuthHelper "
;" #
public 
class 
HasScopeRequirement  
:! "%
IAuthorizationRequirement# <
{		 
public 

string 
Issuer 
{ 
get 
; 
}  !
public 

string 
Scope 
{ 
get 
; 
}  
public 

HasScopeRequirement 
( 
string %
scope& +
,+ ,
string- 3
issuer4 :
): ;
{ 
Scope 
= 
scope 
?? 
throw 
new "!
ArgumentNullException# 8
(8 9
nameof9 ?
(? @
scope@ E
)E F
)F G
;G H
Issuer 
= 
issuer 
?? 
throw  
new! $!
ArgumentNullException% :
(: ;
nameof; A
(A B
issuerB H
)H I
)I J
;J K
} 
} ç
H/Users/pavel/project/NetMentoring/CartWebApi/Configurators/AuthConfig.cs
	namespace 	

CartWebApi
 
. 
Configurators "
;" #
public 
static 
class 

AuthConfig 
{ 
public 

static 
Action 
< 
JwtBearerOptions )
>) *
ConfigureJwtBearer+ =
(= >!
WebApplicationBuilder> S
builderT [
)[ \
{ 
return 
options 
=> 
{ 	
options 
. 
	Authority 
= 
$"  "
$str" *
{* +
builder+ 2
.2 3
Configuration3 @
[@ A
$strA O
]O P
}P Q
$strQ R
"R S
;S T
options 
. 
Audience 
= 
builder &
.& '
Configuration' 4
[4 5
$str5 E
]E F
;F G
options 
. %
TokenValidationParameters -
=. /
new0 3%
TokenValidationParameters4 M
{ 
NameClaimType 
= 

ClaimTypes  *
.* +
NameIdentifier+ 9
} 
; 
} 	
;	 

} 
public%% 

static%% 
Action%% 
<%%  
AuthorizationOptions%% -
>%%- ."
ConfigureAuthorization%%/ E
(%%E F!
WebApplicationBuilder%%F [
builder%%\ c
)%%c d
{&& 
return'' 
options'' 
=>'' 
{(( 	
var)) 
scopes)) 
=)) 
new)) 
[)) 
])) 
{))  
$str))! 0
,))0 1
$str))2 C
,))C D
$str))E V
,))V W
$str))X i
}))j k
;))k l
foreach++ 
(++ 
var++ 
scope++ 
in++ !
scopes++" (
)++( )
{,, 
var-- 
requirement-- 
=--  !
new--" %
HasScopeRequirement--& 9
(--9 :
scope--: ?
,--? @
$"--A C
$str--C K
{--K L
builder--L S
.--S T
Configuration--T a
[--a b
$str--b p
]--p q
}--q r
$str--r s
"--s t
)--t u
;--u v
options.. 
... 
	AddPolicy.. !
(..! "
scope.." '
,..' (
policy..) /
=>..0 2
policy..3 9
...9 :
Requirements..: F
...F G
Add..G J
(..J K
requirement..K V
)..V W
)..W X
;..X Y
}// 
}11 	
;11	 

}33 
}44 ı/
U/Users/pavel/project/NetMentoring/CartWebApi/Configurators/ConfigureSwaggerOptions.cs
	namespace 	

CartWebApi
 
. 
Configurators "
;" #
public 
class #
ConfigureSwaggerOptions $
:% &
IConfigureOptions' 8
<8 9
SwaggerGenOptions9 J
>J K
{ 
private 
readonly *
IApiVersionDescriptionProvider 3
	_provider4 =
;= >
public 
#
ConfigureSwaggerOptions "
(" #*
IApiVersionDescriptionProvider# A
providerB J
)J K
=>L N
	_providerO X
=Y Z
provider[ c
;c d
public 

void 
	Configure 
( 
SwaggerGenOptions +
options, 3
)3 4
{ 
foreach 
( 
var 
description  
in! #
	_provider$ -
.- ."
ApiVersionDescriptions. D
)D E
{ 	
options   
.   

SwaggerDoc   
(   
description   *
.  * +
	GroupName  + 4
,  4 5#
CreateInfoForApiVersion  6 M
(  M N
description  N Y
)  Y Z
)  Z [
;  [ \
}!! 	
}"" 
private$$ 
static$$ 
OpenApiInfo$$ #
CreateInfoForApiVersion$$ 6
($$6 7!
ApiVersionDescription$$7 L
description$$M X
)$$X Y
{%% 
var&& 
text&& 
=&& 
new&& 
StringBuilder&& $
(&&$ %
$str&&% l
)&&l m
;&&m n
var'' 
info'' 
='' 
new'' 
OpenApiInfo'' "
(''" #
)''# $
{(( 	
Title)) 
=)) 
$str)) &
,))& '
Version** 
=** 
description** !
.**! "

ApiVersion**" ,
.**, -
ToString**- 5
(**5 6
)**6 7
,**7 8
Contact++ 
=++ 
new++ 
OpenApiContact++ (
(++( )
)++) *
{+++ ,
Name++- 1
=++2 3
$str++4 E
,++E F
Email++G L
=++M N
$str++O ^
}++_ `
,++` a
License,, 
=,, 
new,, 
OpenApiLicense,, (
(,,( )
),,) *
{,,+ ,
Name,,- 1
=,,2 3
$str,,4 9
,,,9 :
Url,,; >
=,,? @
new,,A D
Uri,,E H
(,,H I
$str,,I n
),,n o
},,p q
}-- 	
;--	 

if// 

(// 
description// 
.// 
IsDeprecated// $
)//$ %
{00 	
text11 
.11 
Append11 
(11 
$str11 @
)11@ A
;11A B
}22 	
AppendSunsetPolicy44 
(44 
text44 
,44  
description44! ,
.44, -
SunsetPolicy44- 9
)449 :
;44: ;
info66 
.66 
Description66 
=66 
text66 
.66  
ToString66  (
(66( )
)66) *
;66* +
return88 
info88 
;88 
}99 
private;; 
static;; 
void;; 
AppendSunsetPolicy;; *
(;;* +
StringBuilder;;+ 8
text;;9 =
,;;= >
SunsetPolicy;;? K
sunsetPolicy;;L X
);;X Y
{<< 
if== 

(== 
sunsetPolicy== 
is== 
null==  
)==  !
{>> 	
return?? 
;?? 
}@@ 	
ifBB 

(BB 
sunsetPolicyBB 
.BB 
DateBB 
isBB  
{BB! "
}BB# $
whenBB% )
)BB) *
{CC 	
textDD 
.DD 
AppendDD 
(DD 
$strDD 5
)DD5 6
.EE 
AppendEE 
(EE 
whenEE 
.EE 
DateEE !
.EE! "
ToShortDateStringEE" 3
(EE3 4
)EE4 5
)EE5 6
.FF 
AppendFF 
(FF 
$charFF 
)FF 
;FF 
}GG 	
ifII 

(II 
sunsetPolicyII 
.II 
HasLinksII !
)II! "
{JJ 	
textKK 
.KK 

AppendLineKK 
(KK 
)KK 
;KK 
forMM 
(MM 
varMM 
iMM 
=MM 
$numMM 
;MM 
iMM 
<MM 
sunsetPolicyMM  ,
.MM, -
LinksMM- 2
.MM2 3
CountMM3 8
;MM8 9
iMM: ;
++MM; =
)MM= >
{NN 
varOO 
linkOO 
=OO 
sunsetPolicyOO '
.OO' (
LinksOO( -
[OO- .
iOO. /
]OO/ 0
;OO0 1
ifQQ 
(QQ 
linkQQ 
.QQ 
TypeQQ 
==QQ  
$strQQ! ,
)QQ, -
{RR 
textSS 
.SS 

AppendLineSS #
(SS# $
)SS$ %
;SS% &
ifUU 
(UU 
linkUU 
.UU 
TitleUU "
.UU" #
HasValueUU# +
)UU+ ,
{VV 
textWW 
.WW 
AppendWW #
(WW# $
linkWW$ (
.WW( )
TitleWW) .
.WW. /
ValueWW/ 4
)WW4 5
.WW5 6
AppendWW6 <
(WW< =
$strWW= A
)WWA B
;WWB C
}XX 
textZZ 
.ZZ 
AppendZZ 
(ZZ  
linkZZ  $
.ZZ$ %

LinkTargetZZ% /
.ZZ/ 0
OriginalStringZZ0 >
)ZZ> ?
;ZZ? @
}[[ 
}\\ 
}]] 	
}^^ 
}__ ô
L/Users/pavel/project/NetMentoring/CartWebApi/Configurators/EventBusConfig.cs
	namespace 	

CartWebApi
 
. 
Configurators "
;" #
public 
static 
class 
EventBusConfig "
{		 
public 

static 
IEventBusRabbitMq #%
ConfigureEventBusRabbitMq$ =
(= >!
WebApplicationBuilder> S
builderT [
)[ \
{ 
var 
rabbitMqHost 
= 
builder "
." #
Configuration# 0
.0 1

GetSection1 ;
(; <
$str< J
)J K
.K L
ValueL Q
;Q R
var 
rabbitMqPort 
= 
int 
. 
Parse $
($ %
builder% ,
., -
Configuration- :
.: ;

GetSection; E
(E F
$strF T
)T U
.U V
ValueV [
??\ ^
$str_ e
)e f
;f g
var 
rabbitMqUser 
= 
builder "
." #
Configuration# 0
.0 1

GetSection1 ;
(; <
$str< J
)J K
.K L
ValueL Q
;Q R
var 
rabbitMqPassword 
= 
builder &
.& '
Configuration' 4
.4 5

GetSection5 ?
(? @
$str@ R
)R S
.S T
ValueT Y
;Y Z
var 
rabbitMqQueue 
= 
builder #
.# $
Configuration$ 1
.1 2

GetSection2 <
(< =
$str= L
)L M
.M N
ValueN S
;S T
return 
new 
EventBusRabbitMq #
(# $
rabbitMqQueue 
?? 
throw "
new# &%
InvalidOperationException' @
(@ A
)A B
,B C
rabbitMqHost 
?? 
throw !
new" %%
InvalidOperationException& ?
(? @
)@ A
,A B
rabbitMqPort 
, 
rabbitMqUser 
?? 
throw !
new" %%
InvalidOperationException& ?
(? @
)@ A
,A B
rabbitMqPassword 
?? 
throw  %
new& )%
InvalidOperationException* C
(C D
)D E
)E F
;F G
} 
}   ≈+
J/Users/pavel/project/NetMentoring/CartWebApi/Configurators/LoggerConfig.cs
	namespace 	

CartWebApi
 
. 
Configurators "
;" #
public 
abstract 
class 
LoggerConfig "
{ 
public 

static 
void 
ConfigureLogging '
(' (
)( )
{ 
var 
environment 
= 
Environment %
.% &"
GetEnvironmentVariable& <
(< =
$str= U
)U V
;V W
var 
configuration 
= 
new  
ConfigurationBuilder  4
(4 5
)5 6
. 
AddJsonFile 
( 
$str +
,+ ,
optional- 5
:5 6
false7 <
,< =
reloadOnChange> L
:L M
trueN R
)R S
. 
AddJsonFile 
( 
$" 
$str '
{' (
Environment( 3
.3 4"
GetEnvironmentVariable4 J
(J K
$strK c
)c d
}d e
$stre j
"j k
,k l
optional 
: 
true 
) 
. 
Build 
( 
) 
; 
Log 
. 
Logger 
= 
new 
LoggerConfiguration ,
(, -
)- .
. 
Enrich 
. 
FromLogContext "
(" #
)# $
. 
Enrich 
.  
WithExceptionDetails (
(( )
)) *
. 
WriteTo 
. 
Debug 
( 
) 
. 
WriteTo 
. 
Console 
( 
) 
. 
WriteTo 
. 
Elasticsearch "
(" # 
ConfigureElasticSink# 7
(7 8
configuration8 E
,E F
environmentG R
??S U
$strV c
)c d
)d e
. 
Enrich 
. 
WithProperty  
(  !
$str! .
,. /
environment0 ;
??< >
$str? L
)L M
.   
ReadFrom   
.   
Configuration   #
(  # $
configuration  $ 1
)  1 2
.!! 
CreateLogger!! 
(!! 
)!! 
;!! 
}"" 
private** 
static** $
ElasticsearchSinkOptions** + 
ConfigureElasticSink**, @
(**@ A
IConfiguration**A O
configuration**P ]
,**] ^
string**_ e
environment**f q
)**q r
{++ 
var,, 
nodes,, 
=,, 
new,, 
[,, 
],, 
{-- 	
new.. 
Uri.. 
(.. 
configuration.. !
[..! "
$str.." <
]..< =
??..= ?
string..? E
...E F
Empty..F K
)..K L
}// 	
;//	 

return00 
new00 $
ElasticsearchSinkOptions00 +
(00+ ,
nodes00, 1
)001 2
{11 	 
AutoRegisterTemplate22  
=22! "
true22# '
,22' ('
AutoRegisterTemplateVersion33 '
=33( )'
AutoRegisterTemplateVersion33* E
.33E F
ESv733F J
,33J K
FailureCallback44 
=44 
e44 
=>44  "
Console44# *
.44* +
	WriteLine44+ 4
(444 5
$"445 7
$str447 N
{44N O
e44O P
.44P Q
MessageTemplate44Q `
}44` a
$str44a i
{44i j
e44j k
.44k l
	Exception44l u
?44u v
.44v w
Message44w ~
}44~ 
"	44 Ä
)
44Ä Å
,
44Å Ç
EmitEventFailure55 
=55 $
EmitEventFailureHandling55 7
.557 8
WriteToSelfLog558 F
|55G H$
EmitEventFailureHandling55I a
.55a b
RaiseCallback55b o
,55o p
TypeName66 
=66 
null66 
,66 
BatchAction77 
=77 
ElasticOpType77 '
.77' (
Create77( .
,77. /
IndexFormat88 
=88 
$"88 
{88 
Assembly88 %
.88% & 
GetExecutingAssembly88& :
(88: ;
)88; <
.88< =
GetName88= D
(88D E
)88E F
.88F G
Name88G K
?88K L
.88L M
ToLower88M T
(88T U
)88U V
.88V W
Replace88W ^
(88^ _
$str88_ b
,88b c
$str88d g
)88g h
}88h i
$str88i j
{88j k
environment88k v
.88v w
ToLower88w ~
(88~ 
)	88 Ä
.
88Ä Å
Replace
88Å à
(
88à â
$str
88â å
,
88å ç
$str
88é ë
)
88ë í
}
88í ì
$str
88ì î
{
88î ï
DateTime
88ï ù
.
88ù û
UtcNow
88û §
:
88§ •
$str
88• ¨
}
88¨ ≠
"
88≠ Æ
}99 	
;99	 

}:: 
};; ‚
N/Users/pavel/project/NetMentoring/CartWebApi/Configurators/RepositoryConfig.cs
	namespace 	

CartWebApi
 
. 
Configurators "
;" #
public 
class 
RepositoryConfig 
{		 
public 

static 
CartRepository  
ConfigureRepository! 4
(4 5!
WebApplicationBuilder5 J
builderK R
)R S
{ 
var 
dbPath 
= 
builder 
. 
Configuration *
.* +

GetSection+ 5
(5 6
$str6 D
)D E
.E F
ValueF K
;K L
return 
new 
CartRepository !
(! "
dbPath" (
??) +
throw, 1
new2 5%
InvalidOperationException6 O
(O P
)P Q
)Q R
;R S
} 
} ≈"
K/Users/pavel/project/NetMentoring/CartWebApi/Configurators/SwaggerConfig.cs
	namespace 	

CartWebApi
 
. 
Configurators "
;" #
public 
static 
class 
SwaggerConfig !
{ 
public 

static 
void "
SetupSwaggerGenOptions -
(- .
SwaggerGenOptions. ?
options@ G
)G H
{ 
options 
. 
OperationFilter 
<   
SwaggerDefaultValues  4
>4 5
(5 6
)6 7
;7 8
options 
. !
AddSecurityDefinition %
(% &
$str& .
,. /
new0 3!
OpenApiSecurityScheme4 I
{ 	
Description 
= 
$str <
,< =
Name 
= 
$str "
," #
In 
= 
ParameterLocation "
." #
Header# )
,) *
Type 
= 
SecuritySchemeType %
.% &
ApiKey& ,
,, -
Scheme 
= 
$str 
} 	
)	 

;
 
options!! 
.!! "
AddSecurityRequirement!! &
(!!& '
new!!' *&
OpenApiSecurityRequirement!!+ E
(!!E F
)!!F G
{"" 	
{## 
new$$ !
OpenApiSecurityScheme$$ )
{%% 
	Reference&& 
=&& 
new&&  #
OpenApiReference&&$ 4
{'' 
Type(( 
=(( 
ReferenceType(( ,
.((, -
SecurityScheme((- ;
,((; <
Id)) 
=)) 
$str)) %
}** 
,** 
Scheme++ 
=++ 
$str++ %
,++% &
Name,, 
=,, 
$str,, #
,,,# $
In-- 
=-- 
ParameterLocation-- *
.--* +
Header--+ 1
,--1 2
}// 
,// 
new00 
List00 
<00 
string00 
>00  
(00  !
)00! "
}11 
}22 	
)22	 

;22
 
var44 
fileName44 
=44 
typeof44 
(44 
Program44 %
)44% &
.44& '
Assembly44' /
.44/ 0
GetName440 7
(447 8
)448 9
.449 :
Name44: >
+44? @
$str44A G
;44G H
var55 
filePath55 
=55 
Path55 
.55 
Combine55 #
(55# $

AppContext55$ .
.55. /
BaseDirectory55/ <
,55< =
fileName55> F
)55F G
;55G H
options88 
.88 
IncludeXmlComments88 "
(88" #
filePath88# +
)88+ ,
;88, -
}99 
public?? 

static?? 
void?? #
SetupApiExplorerOptions?? .
(??. /
ApiExplorerOptions??/ A
options??B I
)??I J
{@@ 
optionsCC 
.CC 
GroupNameFormatCC 
=CC  !
$strCC" *
;CC* +
optionsGG 
.GG %
SubstituteApiVersionInUrlGG )
=GG* +
trueGG, 0
;GG0 1
}HH 
publicNN 

staticNN 
voidNN %
SetupApiVersioningOptionsNN 0
(NN0 1 
ApiVersioningOptionsNN1 E
optionsNNF M
)NNM N
{OO 
optionsRR 
.RR 
ReportApiVersionsRR !
=RR" #
trueRR$ (
;RR( )
optionsTT 
.TT 
PoliciesTT 
.TT 
SunsetTT 
(TT  
$numTT  #
)TT# $
.UU 
	EffectiveUU 
(UU 
DateTimeOffsetUU %
.UU% &
NowUU& )
.UU) *
AddDaysUU* 1
(UU1 2
$numUU2 4
)UU4 5
)UU5 6
.VV 
LinkVV 
(VV 
$strVV 
)VV  
.WW 
TitleWW 
(WW 
$strWW &
)WW& '
.XX 
TypeXX 
(XX 
$strXX 
)XX 
;XX 
}YY 
}ZZ ›$
R/Users/pavel/project/NetMentoring/CartWebApi/Configurators/SwaggerDefaultValues.cs
	namespace 	

CartWebApi
 
. 
Configurators "
;" #
public 
class  
SwaggerDefaultValues !
:" #
IOperationFilter$ 4
{ 
public 
void	 
Apply 
( 
OpenApiOperation $
	operation% .
,. /"
OperationFilterContext0 F
contextG N
)N O
{ 
var 
apiDescription 
= 
context  
.  !
ApiDescription! /
;/ 0
	operation 
. 

Deprecated 
|= 
apiDescription *
.* +
IsDeprecated+ 7
(7 8
)8 9
;9 :
foreach 
( 
var 
responseType 
in  
context! (
.( )
ApiDescription) 7
.7 8"
SupportedResponseTypes8 N
)N O
{ 
var 	
responseKey
 
= 
responseType $
.$ %
IsDefaultResponse% 6
?7 8
$str9 B
:C D
responseTypeE Q
.Q R

StatusCodeR \
.\ ]
ToString] e
(e f
)f g
;g h
var 	
response
 
= 
	operation 
. 
	Responses (
[( )
responseKey) 4
]4 5
;5 6
foreach 
( 
var 
contentType 
in !
response" *
.* +
Content+ 2
.2 3
Keys3 7
)7 8
{ 
if 

( 
responseType 
. 
ApiResponseFormats +
.+ ,
All, /
(/ 0
x0 1
=>2 4
x5 6
.6 7
	MediaType7 @
!=A C
contentTypeD O
)O P
)P Q
{   	
response!!
 
.!! 
Content!! 
.!! 
Remove!! !
(!!! "
contentType!!" -
)!!- .
;!!. /
}"" 	
}## 
}$$ 
if&& 
(&& 
	operation&& 
.&& 

Parameters&& 
==&& 
null&&  $
)&&$ %
{'' 
return(( 
;(( 
})) 
foreach-- 
(-- 
var-- 
	parameter-- 
in-- 
	operation-- '
.--' (

Parameters--( 2
)--2 3
{.. 
var// 	
description//
 
=// 
apiDescription// &
.//& '!
ParameterDescriptions//' <
.//< =
First//= B
(//B C
p//C D
=>//E G
p//H I
.//I J
Name//J N
==//O Q
	parameter//R [
.//[ \
Name//\ `
)//` a
;//a b
	parameter11 
.11 
Description11 
??=11 
description11  +
.11+ ,
ModelMetadata11, 9
?119 :
.11: ;
Description11; F
;11F G
if33 
(33	 

	parameter33
 
.33 
Schema33 
.33 
Default33 "
==33# %
null33& *
&&33+ -
description44 
.44 
DefaultValue44 #
!=44$ &
null44' +
&&44, .
description55 
.55 
DefaultValue55 #
is55$ &
not55' *
DBNull55+ 1
&&552 4
description66 
.66 
ModelMetadata66 $
is66% '
{66( )
}66* +
modelMetadata66, 9
)669 :
{77 
var99 
json99 
=99 
JsonSerializer99 !
.99! "
	Serialize99" +
(99+ ,
description99, 7
.997 8
DefaultValue998 D
,99D E
modelMetadata99F S
.99S T
	ModelType99T ]
)99] ^
;99^ _
	parameter:: 
.:: 
Schema:: 
.:: 
Default::  
=::! "
OpenApiAnyFactory::# 4
.::4 5
CreateFromJson::5 C
(::C D
json::D H
)::H I
;::I J
};; 
	parameter== 
.== 
Required== 
|=== 
description== '
.==' (

IsRequired==( 2
;==2 3
}>> 
}?? 
}@@ û/
M/Users/pavel/project/NetMentoring/CartWebApi/Controllers/V1/CartController.cs
	namespace		 	

CartWebApi		
 
.		 
Controllers		  
.		  !
V1		! #
;		# $
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
ApiController 
] 
[ 
Route 
( 
$str /
)/ 0
]0 1
[ 
	Authorize 

]
 
public 
class 
CartController 
: 
ControllerBase ,
{ 
private 
readonly 
ICartService !
_cartService" .
;. /
private 
readonly 
ILogger 
_logger $
;$ %
public 

CartController 
( 
ICartRepository )
cartRepository* 8
,8 9
ILogger: A
<A B
CartControllerB P
>P Q
loggerR X
)X Y
{ 
_cartService 
= 
new 
CartService &
(& '
cartRepository' 5
)5 6
;6 7
_logger 
= 
logger 
; 
} 
[(( 
HttpGet(( 
((( 
$str(( 
)(( 
](( 
[)) 
MapToApiVersion)) 
()) 
$str)) 
))) 
])) 
[** 
Produces** 
(** 
$str**  
)**  !
]**! "
[++  
ProducesResponseType++ 
(++ 
typeof++  
(++  !
Cart++! %
)++% &
,++& '
(++( )
int++) ,
)++, -
HttpStatusCode++- ;
.++; <
OK++< >
)++> ?
]++? @
[,,  
ProducesResponseType,, 
(,, 
(,, 
int,, 
),, 
HttpStatusCode,, -
.,,- .
NotFound,,. 6
),,6 7
],,7 8
public-- 

IActionResult-- 
GetCart--  
(--  !
string--! '
cartKey--( /
)--/ 0
{.. 
try// 
{00 	
var11 
cart11 
=11 
_cartService11 #
.11# $
GetCartItems11$ 0
(110 1
cartKey111 8
)118 9
;119 :
if22 
(22 
cart22 
==22 
null22 
)22 
{33 
return44 
NotFound44 
(44  
)44  !
;44! "
}55 
return77 
Ok77 
(77 
cart77 
)77 
;77 
}88 	
catch99 
(99 
	Exception99 
e99 
)99 
{:: 	
_logger;; 
.;; 
LogError;; 
(;; 
e;; 
.;; 
Message;; &
);;& '
;;;' (
return<< 
NotFound<< 
(<< 
e<< 
.<< 
Message<< %
)<<% &
;<<& '
}== 	
}>> 
[XX 
HttpPostXX 
(XX 
$strXX 
)XX 
]XX 
[YY 
MapToApiVersionYY 
(YY 
$strYY 
)YY 
]YY 
[ZZ 
ConsumesZZ 
(ZZ 
$strZZ  
)ZZ  !
]ZZ! "
[[[ 
Produces[[ 
([[ 
$str[[  
)[[  !
][[! "
[\\  
ProducesResponseType\\ 
(\\ 
(\\ 
int\\ 
)\\ 
HttpStatusCode\\ -
.\\- .
OK\\. 0
)\\0 1
]\\1 2
public]] 

IActionResult]] 
AddCartItem]] $
(]]$ %
string]]% +
cartKey]], 3
,]]3 4
[]]5 6
FromBody]]6 >
]]]> ?
CartItem]]@ H
cartItem]]I Q
)]]Q R
{^^ 
try__ 
{`` 	
_cartServiceaa 
.aa 
AddCartItemaa $
(aa$ %
cartKeyaa% ,
,aa, -
cartItemaa. 6
)aa6 7
;aa7 8
returncc 
Okcc 
(cc 
cartItemcc 
)cc 
;cc  
}dd 	
catchee 
(ee 
	Exceptionee 
eee 
)ee 
{ff 	
returngg 
NotFoundgg 
(gg 
egg 
.gg 
Messagegg %
)gg% &
;gg& '
}hh 	
}ii 
[rr 

HttpDeleterr 
(rr 
$strrr (
)rr( )
]rr) *
[ss  
ProducesResponseTypess 
(ss 
(ss 
intss 
)ss 
HttpStatusCodess -
.ss- .
OKss. 0
)ss0 1
]ss1 2
[tt  
ProducesResponseTypett 
(tt 
(tt 
inttt 
)tt 
HttpStatusCodett -
.tt- .
NotFoundtt. 6
)tt6 7
]tt7 8
publicuu 

IActionResultuu 
RemoveCartItemuu '
(uu' (
stringuu( .
cartKeyuu/ 6
,uu6 7
intuu8 ;

cartItemIduu< F
)uuF G
{vv 
tryww 
{xx 	
_cartServiceyy 
.yy 
RemoveCartItemyy '
(yy' (
cartKeyyy( /
,yy/ 0

cartItemIdyy1 ;
)yy; <
;yy< =
return{{ 
Ok{{ 
({{ 
){{ 
;{{ 
}|| 	
catch}} 
(}} 
	Exception}} 
e}} 
)}} 
{~~ 	
return 
NotFound 
( 
e 
. 
Message %
)% &
;& '
}
ÄÄ 	
}
ÅÅ 
}ÇÇ ò
M/Users/pavel/project/NetMentoring/CartWebApi/Controllers/V2/CartController.cs
	namespace		 	

CartWebApi		
 
.		 
Controllers		  
.		  !
V2		! #
;		# $
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
ApiController 
] 
[ 
Route 
( 
$str /
)/ 0
]0 1
[ 
	Authorize 

]
 
public 
class 
CartController 
: 
ControllerBase ,
{ 
private 
readonly 
ICartService !
_cartService" .
;. /
private 
readonly 
ILogger 
_logger $
;$ %
public 

CartController 
( 
ICartRepository )
cartRepository* 8
,8 9
ILogger: A
<A B
CartControllerB P
>P Q
loggerR X
)X Y
{ 
_cartService 
= 
new 
CartService &
(& '
cartRepository' 5
)5 6
;6 7
_logger 
= 
logger 
; 
} 
[(( 
HttpGet(( 
((( 
$str(( 
)(( 
,(( 
MapToApiVersion(( *
(((* +
$str((+ 0
)((0 1
]((1 2
[))  
ProducesResponseType)) 
()) 
typeof))  
())  !
Cart))! %
)))% &
,))& '
())( )
int))) ,
))), -
HttpStatusCode))- ;
.)); <
OK))< >
)))> ?
]))? @
[**  
ProducesResponseType** 
(** 
(** 
int** 
)** 
HttpStatusCode** -
.**- .
NotFound**. 6
)**6 7
]**7 8
public++ 

IActionResult++ 
GetCart++  
(++  !
string++! '
cartKey++( /
)++/ 0
{,, 
var-- 
cart-- 
=-- 
_cartService-- 
.--  
GetCartItems--  ,
(--, -
cartKey--- 4
)--4 5
;--5 6
if.. 

(.. 
cart.. 
==.. 
null.. 
).. 
{// 	
_logger00 
.00 
LogInformation00 "
(00" #
$"00# %
$str00% 3
{003 4
cartKey004 ;
}00; <
$str00< F
"00F G
)00G H
;00H I
return11 
NotFound11 
(11 
)11 
;11 
}22 	
return33 
Ok33 
(33 
cart33 
.33 
Items33 
)33 
;33 
}44 
}55 “

d/Users/pavel/project/NetMentoring/CartWebApi/IntegrationEvent/ProductPriceChangedIntegrationEvent.cs
	namespace 	

CartWebApi
 
. 
IntegrationEvent %
;% &
public 
class /
#ProductPriceChangedIntegrationEvent 0
{ 
public 

int 
	ProductId 
{ 
get 
; 
private  '
init( ,
;, -
}. /
public 

decimal 
NewPrice 
{ 
get !
;! "
private# *
init+ /
;/ 0
}1 2
public 

decimal 
OldPrice 
{ 
get !
;! "
private# *
init+ /
;/ 0
}1 2
public 
/
#ProductPriceChangedIntegrationEvent .
(. /
int/ 2
	productId3 <
,< =
decimal> E
newPriceF N
,N O
decimalP W
oldPriceX `
)` a
{ 
	ProductId 
= 
	productId 
; 
NewPrice   
=   
newPrice   
;   
OldPrice!! 
=!! 
oldPrice!! 
;!! 
}"" 
}## –
O/Users/pavel/project/NetMentoring/CartWebApi/Middleware/Auth0TokenMiddleware.cs
	namespace 	

CartWebApi
 
. 

Middleware 
;  
public		 
class		  
Auth0TokenMiddleware		 !
{

 
private 
readonly 
RequestDelegate $
_next% *
;* +
public 
 
Auth0TokenMiddleware 
(  
RequestDelegate  /
next0 4
)4 5
{ 
_next 
= 
next 
; 
} 
public 

async 
Task 
Invoke 
( 
HttpContext (
context) 0
)0 1
{ 
var 
accessToken 
= 
await 
context  '
.' (
GetTokenAsync( 5
(5 6
$str6 D
)D E
;E F
var 
tokenHandler 
= 
new #
JwtSecurityTokenHandler 6
(6 7
)7 8
;8 9
var 
securityToken 
= 
( 
JwtSecurityToken -
)- .
tokenHandler. :
.: ;
	ReadToken; D
(D E
accessTokenE P
)P Q
;Q R
var   
claims   
=   
securityToken   "
.  " #
Claims  # )
;  ) *
foreach"" 
("" 
var"" 
claim"" 
in"" 
claims"" $
)""$ %
{## 	
Console$$ 
.$$ 
	WriteLine$$ 
($$ 
$"$$  
$str$$  ,
{$$, -
claim$$- 2
.$$2 3
Type$$3 7
}$$7 8
$str$$8 H
{$$H I
claim$$I N
.$$N O
Value$$O T
}$$T U
"$$U V
)$$V W
;$$W X
}%% 	
await'' 
_next'' 
('' 
context'' 
)'' 
;'' 
}(( 
})) ﬁ+
7/Users/pavel/project/NetMentoring/CartWebApi/Program.cs
LoggerConfig

 
.

 
ConfigureLogging

 
(

 
)

 
;

  
Serilog 
. 
	Debugging 
. 
SelfLog 
. 
Enable  
(  !
Console! (
.( )
Error) .
). /
;/ 0
Environment 
. "
SetEnvironmentVariable "
(" #
$str# /
,/ 0
$str1 >
)> ?
;? @
Environment 
. "
SetEnvironmentVariable "
(" #
$str# 3
,3 4
$str5 <
)< =
;= >
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddSingleton 
< 
IEventBusRabbitMq /
>/ 0
(0 1
_1 2
=>3 5
EventBusConfig6 D
.D E%
ConfigureEventBusRabbitMqE ^
(^ _
builder_ f
)f g
)g h
;h i
builder 
. 
Services 
. 
AddAuthentication "
(" #
JwtBearerDefaults# 4
.4 5 
AuthenticationScheme5 I
)I J
. 
AddJwtBearer 
( 

AuthConfig 
. 
ConfigureJwtBearer /
(/ 0
builder0 7
)7 8
)8 9
;9 :
builder 
. 
Services 
. 
AddAuthorization !
(! "

AuthConfig" ,
., -"
ConfigureAuthorization- C
(C D
builderD K
)K L
)L M
;M N
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. 
AddApiVersioning !
(! "
SwaggerConfig" /
./ 0%
SetupApiVersioningOptions0 I
)I J
. 
AddApiExplorer 
( 
SwaggerConfig !
.! "#
SetupApiExplorerOptions" 9
)9 :
;: ;
builder 
. 
Services 
. 
AddTransient 
< 
IConfigureOptions /
</ 0
SwaggerGenOptions0 A
>A B
,B C#
ConfigureSwaggerOptionsD [
>[ \
(\ ]
)] ^
;^ _
builder 
. 
Services 
. 
AddSwaggerGen 
( 
SwaggerConfig ,
., -"
SetupSwaggerGenOptions- C
)C D
;D E
builder 
. 
Services 
. 
	AddScoped 
< 
ICartRepository *
>* +
(+ ,
_, -
=>. 0
RepositoryConfig1 A
.A B
ConfigureRepositoryB U
(U V
builderV ]
)] ^
)^ _
;_ `
builder 
. 
Services 
. 
AddHostedService !
<! "
InitRabbitMqService" 5
>5 6
(6 7
)7 8
;8 9
builder 
. 
Services 
. 
	AddScoped 
< 
CartGrpcService *
>* +
(+ ,
), -
;- .
builder 
. 
Services 
. 
AddGrpc 
( 
) 
; 
builder 
. 
Services 
. 
AddGrpcReflection "
(" #
)# $
;$ %
var## 
app## 
=## 	
builder##
 
.## 
Build## 
(## 
)## 
;## 
if%% 
(%% 
app%% 
.%% 
Environment%% 
.%% 
IsDevelopment%% !
(%%! "
)%%" #
)%%# $
{&& 
app'' 
.'' 

UseSwagger'' 
('' 
)'' 
;'' 
app(( 
.(( 
UseSwaggerUI(( 
((( 
)(( 
;(( 
app)) 
.)) $
MapGrpcReflectionService))  
())  !
)))! "
;))" #
}** 
app,, 
.,, 
MapGrpcService,, 
<,, 
CartGrpcService,, "
>,," #
(,,# $
),,$ %
;,,% &
app.. 
... 
UseHttpsRedirection.. 
(.. 
).. 
;.. 
app// 
.// 
UseAuthentication// 
(// 
)// 
;// 
app00 
.00 
UseAuthorization00 
(00 
)00 
;00 
app11 
.11 
UseMiddleware11 
<11  
Auth0TokenMiddleware11 &
>11& '
(11' (
)11( )
;11) *
app22 
.22 
MapControllers22 
(22 
)22 
;22 
app55 
.55 
Run55 
(55 
)55 	
;55	 
ﬂw
H/Users/pavel/project/NetMentoring/CartWebApi/Services/CartGrpcService.cs
	namespace 	

CartWebApi
 
. 
Services 
{ 
public 

class 
CartGrpcService  
:! "
CartGrpc# +
.+ ,
CartGrpcBase, 8
{ 
private 
readonly 
ICartService %
_cartService& 2
;2 3
private 
readonly 
ILogger  
<  !
CartGrpcService! 0
>0 1
_logger2 9
;9 :
public 
CartGrpcService 
( 
ICartRepository .
cartRepository/ =
,= >
ILogger? F
<F G
CartGrpcServiceG V
>V W
loggerX ^
)^ _
{ 	
_cartService 
= 
new 
CartService *
(* +
cartRepository+ 9
)9 :
;: ;
_logger 
= 
logger 
; 
} 	
public!! 
override!! 
Task!! 
<!! 
GrpcCart!! %
>!!% &
GetCartItems!!' 3
(!!3 4
CartRequest!!4 ?
request!!@ G
,!!G H
ServerCallContext!!I Z
context!![ b
)!!b c
{"" 	
try## 
{$$ 
var%% 
dbCart%% 
=%% 
_cartService%% )
.%%) *
GetCartItems%%* 6
(%%6 7
request%%7 >
.%%> ?
CartGuid%%? G
)%%G H
;%%H I
if&& 
(&& 
dbCart&& 
==&& 
null&& "
)&&" #
{'' 
throw(( 
new(( 
RpcException(( *
(((* +
new((+ .
Status((/ 5
(((5 6

StatusCode((6 @
.((@ A
NotFound((A I
,((I J
$str((K [
)(([ \
)((\ ]
;((] ^
})) 
var++ 
respCart++ 
=++ 
new++ "
GrpcCart++# +
{,, 
CartGuid-- 
=-- 
dbCart-- %
.--% &
Guid--& *
}.. 
;.. 
foreach00 
(00 
var00 
item00 !
in00" $
dbCart00% +
.00+ ,
Items00, 1
)001 2
{11 
respCart22 
.22 
Items22 "
.22" #
Add22# &
(22& '
new22' *
GrpcCartItem22+ 7
{33 
Id44 
=44 
item44 !
.44! "
Id44" $
,44$ %
Name55 
=55 
item55 #
.55# $
Name55$ (
,55( )
Quantity66  
=66! "
item66# '
.66' (
Quantity66( 0
,660 1
Price77 
=77 
(77  !
float77! &
)77& '
item77' +
.77+ ,
Price77, 1
,771 2
}88 
)88 
;88 
}99 
return;; 
Task;; 
.;; 

FromResult;; &
(;;& '
respCart;;' /
);;/ 0
;;;0 1
}<< 
catch== 
(== 
	Exception== 
e== 
)== 
{>> 
_logger?? 
.?? 
LogError??  
(??  !
e??! "
.??" #
Message??# *
)??* +
;??+ ,
throw@@ 
new@@ 
RpcException@@ &
(@@& '
new@@' *
Status@@+ 1
(@@1 2

StatusCode@@2 <
.@@< =
Internal@@= E
,@@E F
$str@@G ^
)@@^ _
,@@_ `
e@@a b
.@@b c
Message@@c j
)@@j k
;@@k l
}AA 
}BB 	
publicKK 
overrideKK 
asyncKK 
TaskKK "
GetCartItemsStreamKK# 5
(KK5 6
CartRequestKK6 A
requestKKB I
,KKI J
IServerStreamWriterKKK ^
<KK^ _
GrpcCartItemKK_ k
>KKk l
responseStreamKKm {
,KK{ |
ServerCallContext	KK} é
context
KKè ñ
)
KKñ ó
{LL 	
tryMM 
{NN 
varOO 
cartOO 
=OO 
_cartServiceOO '
.OO' (
GetCartItemsOO( 4
(OO4 5
requestOO5 <
.OO< =
CartGuidOO= E
)OOE F
;OOF G
ifPP 
(PP 
cartPP 
==PP 
nullPP  
)PP  !
{QQ 
throwRR 
newRR 
RpcExceptionRR *
(RR* +
newRR+ .
StatusRR/ 5
(RR5 6

StatusCodeRR6 @
.RR@ A
NotFoundRRA I
,RRI J
$strRRK [
)RR[ \
)RR\ ]
;RR] ^
}SS 
foreachUU 
(UU 
varUU 
itemUU !
inUU" $
cartUU% )
.UU) *
ItemsUU* /
)UU/ 0
{VV 
awaitWW 
responseStreamWW (
.WW( )

WriteAsyncWW) 3
(WW3 4
newWW4 7
GrpcCartItemWW8 D
{XX 
IdYY 
=YY 
itemYY !
.YY! "
IdYY" $
,YY$ %
NameZZ 
=ZZ 
itemZZ #
.ZZ# $
NameZZ$ (
,ZZ( )
Quantity[[  
=[[! "
item[[# '
.[[' (
Quantity[[( 0
,[[0 1
Price\\ 
=\\ 
(\\  !
float\\! &
)\\& '
item\\' +
.\\+ ,
Price\\, 1
,\\1 2
}]] 
)]] 
;]] 
}^^ 
}__ 
catch`` 
(`` 
	Exception`` 
e`` 
)`` 
{aa 
_loggerbb 
.bb 
LogErrorbb  
(bb  !
ebb! "
.bb" #
Messagebb# *
)bb* +
;bb+ ,
throwcc 
newcc 
RpcExceptioncc &
(cc& '
newcc' *
Statuscc+ 1
(cc1 2

StatusCodecc2 <
.cc< =
Internalcc= E
,ccE F
$strccG ^
)cc^ _
,cc_ `
ecca b
.ccb c
Messageccc j
)ccj k
;cck l
}dd 
}ee 	
publicmm 
overridemm 
asyncmm 
Taskmm "
<mm" #
GrpcCartmm# +
>mm+ ,
AddCartItemmm- 8
(mm8 9
IAsyncStreamReadermm9 K
<mmK L
GrpcCartItemmmL X
>mmX Y
requestStreammmZ g
,mmg h
ServerCallContextmmi z
context	mm{ Ç
)
mmÇ É
{nn 	
tryoo 
{pp 
varqq 
cartGuidqq 
=qq 
$strqq !
;qq! "
whilerr 
(rr 
awaitrr 
requestStreamrr *
.rr* +
MoveNextrr+ 3
(rr3 4
)rr4 5
)rr5 6
{ss 
vartt 
cartItemtt  
=tt! "
requestStreamtt# 0
.tt0 1
Currenttt1 8
;tt8 9
ifuu 
(uu 
cartGuiduu  
==uu! #
$struu$ &
)uu& '
{vv 
cartGuidww  
=ww! "
cartItemww# +
.ww+ ,
CartGuidww, 4
;ww4 5
}xx 
_cartServiceyy  
.yy  !
AddCartItemyy! ,
(yy, -
cartGuidyy- 5
,yy5 6
newyy7 :
CartItemyy; C
(yyC D
cartItemyyD L
.yyL M
IdyyM O
,yyO P
cartItemyyQ Y
.yyY Z
NameyyZ ^
,yy^ _
nullyy` d
,yyd e
(yyf g
decimalyyg n
)yyn o
cartItemyyo w
.yyw x
Priceyyx }
,yy} ~
cartItem	yy á
.
yyá à
Quantity
yyà ê
)
yyê ë
)
yyë í
;
yyí ì
}zz 
var|| 
dbCart|| 
=|| 
_cartService|| )
.||) *
GetCartItems||* 6
(||6 7
cartGuid||7 ?
)||? @
;||@ A
if}} 
(}} 
dbCart}} 
==}} 
null}} "
)}}" #
{~~ 
throw 
new 
RpcException *
(* +
new+ .
Status/ 5
(5 6

StatusCode6 @
.@ A
NotFoundA I
,I J
$strK [
)[ \
)\ ]
;] ^
}
ÄÄ 
var
ÇÇ 
respCart
ÇÇ 
=
ÇÇ 
new
ÇÇ "
GrpcCart
ÇÇ# +
{
ÉÉ 
CartGuid
ÑÑ 
=
ÑÑ 
dbCart
ÑÑ %
.
ÑÑ% &
Guid
ÑÑ& *
}
ÖÖ 
;
ÖÖ 
foreach
áá 
(
áá 
var
áá 
item
áá !
in
áá" $
dbCart
áá% +
.
áá+ ,
Items
áá, 1
)
áá1 2
{
àà 
respCart
ââ 
.
ââ 
Items
ââ "
.
ââ" #
Add
ââ# &
(
ââ& '
new
ââ' *
GrpcCartItem
ââ+ 7
{
ää 
Id
ãã 
=
ãã 
item
ãã !
.
ãã! "
Id
ãã" $
,
ãã$ %
Name
åå 
=
åå 
item
åå #
.
åå# $
Name
åå$ (
,
åå( )
Quantity
çç  
=
çç! "
item
çç# '
.
çç' (
Quantity
çç( 0
,
çç0 1
Price
éé 
=
éé 
(
éé  !
float
éé! &
)
éé& '
item
éé' +
.
éé+ ,
Price
éé, 1
,
éé1 2
}
èè 
)
èè 
;
èè 
}
êê 
return
íí 
respCart
íí 
;
íí  
}
ìì 
catch
îî 
(
îî 
	Exception
îî 
e
îî 
)
îî 
{
ïï 
_logger
ññ 
.
ññ 
LogError
ññ  
(
ññ  !
e
ññ! "
.
ññ" #
Message
ññ# *
)
ññ* +
;
ññ+ ,
throw
óó 
new
óó 
RpcException
óó &
(
óó& '
new
óó' *
Status
óó+ 1
(
óó1 2

StatusCode
óó2 <
.
óó< =
Internal
óó= E
,
óóE F
$str
óóG _
)
óó_ `
,
óó` a
e
óób c
.
óóc d
Message
óód k
)
óók l
;
óól m
}
òò 
}
ôô 	
public
¢¢ 
override
¢¢ 
async
¢¢ 
Task
¢¢ "
AddCartItemStream
¢¢# 4
(
¢¢4 5 
IAsyncStreamReader
¢¢5 G
<
¢¢G H
GrpcCartItem
¢¢H T
>
¢¢T U
requestStream
¢¢V c
,
¢¢c d!
IServerStreamWriter
¢¢e x
<
¢¢x y
GrpcCart¢¢y Å
>¢¢Å Ç
responseStream¢¢É ë
,¢¢ë í!
ServerCallContext¢¢ì §
context¢¢• ¨
)¢¢¨ ≠
{
££ 	
try
§§ 
{
•• 
var
¶¶ 
cartGuid
¶¶ 
=
¶¶ 
$str
¶¶ !
;
¶¶! "
while
ßß 
(
ßß 
await
ßß 
requestStream
ßß *
.
ßß* +
MoveNext
ßß+ 3
(
ßß3 4
)
ßß4 5
)
ßß5 6
{
®® 
var
©© 
cartItem
©©  
=
©©! "
requestStream
©©# 0
.
©©0 1
Current
©©1 8
;
©©8 9
if
™™ 
(
™™ 
cartGuid
™™  
==
™™! #
$str
™™$ &
)
™™& '
{
´´ 
cartGuid
¨¨  
=
¨¨! "
cartItem
¨¨# +
.
¨¨+ ,
CartGuid
¨¨, 4
;
¨¨4 5
}
≠≠ 
_cartService
ØØ  
.
ØØ  !
AddCartItem
ØØ! ,
(
ØØ, -
cartGuid
ØØ- 5
,
ØØ5 6
new
ØØ7 :
CartItem
ØØ; C
(
ØØC D
cartItem
ØØD L
.
ØØL M
Id
ØØM O
,
ØØO P
cartItem
ØØQ Y
.
ØØY Z
Name
ØØZ ^
,
ØØ^ _
null
ØØ` d
,
ØØd e
(
ØØf g
decimal
ØØg n
)
ØØn o
cartItem
ØØo w
.
ØØw x
Price
ØØx }
,
ØØ} ~
cartItemØØ á
.ØØá à
QuantityØØà ê
)ØØê ë
)ØØë í
;ØØí ì
var
±± 
dbCart
±± 
=
±±  
_cartService
±±! -
.
±±- .
GetCartItems
±±. :
(
±±: ;
cartGuid
±±; C
)
±±C D
;
±±D E
if
≤≤ 
(
≤≤ 
dbCart
≤≤ 
==
≤≤ !
null
≤≤" &
)
≤≤& '
{
≥≥ 
throw
¥¥ 
new
¥¥ !
RpcException
¥¥" .
(
¥¥. /
new
¥¥/ 2
Status
¥¥3 9
(
¥¥9 :

StatusCode
¥¥: D
.
¥¥D E
NotFound
¥¥E M
,
¥¥M N
$str
¥¥O _
)
¥¥_ `
)
¥¥` a
;
¥¥a b
}
µµ 
var
∑∑ 
respCart
∑∑  
=
∑∑! "
new
∑∑# &
GrpcCart
∑∑' /
{
∏∏ 
CartGuid
ππ  
=
ππ! "
dbCart
ππ# )
.
ππ) *
Guid
ππ* .
}
∫∫ 
;
∫∫ 
foreach
ºº 
(
ºº 
var
ºº  
item
ºº! %
in
ºº& (
dbCart
ºº) /
.
ºº/ 0
Items
ºº0 5
)
ºº5 6
{
ΩΩ 
respCart
ææ  
.
ææ  !
Items
ææ! &
.
ææ& '
Add
ææ' *
(
ææ* +
new
ææ+ .
GrpcCartItem
ææ/ ;
{
øø 
Id
¿¿ 
=
¿¿  
item
¿¿! %
.
¿¿% &
Id
¿¿& (
,
¿¿( )
Name
¡¡  
=
¡¡! "
item
¡¡# '
.
¡¡' (
Name
¡¡( ,
,
¡¡, -
Quantity
¬¬ $
=
¬¬% &
item
¬¬' +
.
¬¬+ ,
Quantity
¬¬, 4
,
¬¬4 5
Price
√√ !
=
√√" #
(
√√$ %
float
√√% *
)
√√* +
item
√√+ /
.
√√/ 0
Price
√√0 5
,
√√5 6
}
ƒƒ 
)
ƒƒ 
;
ƒƒ 
}
≈≈ 
await
«« 
responseStream
«« (
.
««( )

WriteAsync
««) 3
(
««3 4
respCart
««4 <
)
««< =
;
««= >
}
»» 
}
…… 
catch
   
(
   
	Exception
   
e
   
)
   
{
ÀÀ 
_logger
ÃÃ 
.
ÃÃ 
LogError
ÃÃ  
(
ÃÃ  !
e
ÃÃ! "
.
ÃÃ" #
Message
ÃÃ# *
)
ÃÃ* +
;
ÃÃ+ ,
throw
ÕÕ 
new
ÕÕ 
RpcException
ÕÕ &
(
ÕÕ& '
new
ÕÕ' *
Status
ÕÕ+ 1
(
ÕÕ1 2

StatusCode
ÕÕ2 <
.
ÕÕ< =
Internal
ÕÕ= E
,
ÕÕE F
$str
ÕÕG _
)
ÕÕ_ `
,
ÕÕ` a
e
ÕÕb c
.
ÕÕc d
Message
ÕÕd k
)
ÕÕk l
;
ÕÕl m
}
ŒŒ 
}
œœ 	
}
–– 
}—— È
G/Users/pavel/project/NetMentoring/CartWebApi/Services/GreeterService.cs
	namespace 	

CartWebApi
 
. 
Services 
; 
public 
class 
GreeterService 
: 
Greeter %
.% &
GreeterBase& 1
{		 
private

 
readonly

 
ILogger

 
<

 
GreeterService

 +
>

+ ,
_logger

- 4
;

4 5
public 

GreeterService 
( 
ILogger !
<! "
GreeterService" 0
>0 1
logger2 8
)8 9
{ 
_logger 
= 
logger 
; 
} 
public 

override 
Task 
< 

HelloReply #
># $
SayHello% -
(- .
HelloRequest. :
request; B
,B C
ServerCallContextD U
contextV ]
)] ^
{ 
_logger 
. 
LogInformation 
( 
$" !
$str! 1
{1 2
request2 9
.9 :
Name: >
}> ?
"? @
)@ A
;A B
return 
Task 
. 

FromResult 
( 
new "

HelloReply# -
{ 	
Message 
= 
$str 
+  
request! (
.( )
Name) -
} 	
)	 

;
 
} 
} å
L/Users/pavel/project/NetMentoring/CartWebApi/Services/InitRabbitMqService.cs
	namespace		 	

CartWebApi		
 
.		 
Services		 
;		 
public 
class 
InitRabbitMqService  
:! "
IHostedService# 1
{ 
private 
readonly 
IEventBusRabbitMq &
_rabbitMqListener' 8
;8 9
private 
readonly 
ICartService !
_cartService" .
;. /
public 

InitRabbitMqService 
( 
IEventBusRabbitMq 0
rabbitMqListener1 A
,A B 
IServiceScopeFactoryC W
scopeFactoryX d
)d e
{ 
_rabbitMqListener 
= 
rabbitMqListener ,
;, -
var 
cartRepository 
= 
scopeFactory )
.) *
CreateScope* 5
(5 6
)6 7
.7 8
ServiceProvider8 G
.G H

GetServiceH R
<R S
ICartRepositoryS b
>b c
(c d
)d e
;e f
_cartService 
= 
new 
CartService &
(& '
cartRepository' 5
??6 8
throw9 >
new? B%
InvalidOperationExceptionC \
(\ ]
)] ^
)^ _
;_ `
} 
public   

Task   

StartAsync   
(   
CancellationToken   ,
cancellationToken  - >
)  > ?
{!! 
_rabbitMqListener"" 
."" 
OnMessageReceived"" +
+="", .
OnMessageReceived""/ @
;""@ A
_rabbitMqListener## 
.## 
StartListening## (
(##( )
)##) *
;##* +
return$$ 
Task$$ 
.$$ 
CompletedTask$$ !
;$$! "
}%% 
private,, 
void,, 
OnMessageReceived,, "
(,," #
object,,# )
?,,) *
sender,,+ 1
,,,1 2!
BasicDeliverEventArgs,,3 H
e,,I J
),,J K
{-- 
var.. 
body.. 
=.. 
e.. 
... 
Body.. 
... 
ToArray.. !
(..! "
).." #
;..# $
var// 
message// 
=// 
Encoding// 
.// 
UTF8// #
.//# $
	GetString//$ -
(//- .
body//. 2
)//2 3
;//3 4
var00 
	eventItem00 
=00 
JsonSerializer00 &
.00& '
Deserialize00' 2
<002 3/
#ProductPriceChangedIntegrationEvent003 V
>00V W
(00W X
message00X _
)00_ `
;00` a
if11 

(11 
	eventItem11 
!=11 
null11 
)11 
{22 	
_cartService33 
.33 
UpdateProductPrice33 +
(33+ ,
	eventItem33, 5
.335 6
	ProductId336 ?
,33? @
	eventItem33A J
.33J K
NewPrice33K S
)33S T
;33T U
}44 	
}55 
public:: 

Task:: 
	StopAsync:: 
(:: 
CancellationToken:: +
cancellationToken::, =
)::= >
{;; 
_rabbitMqListener<< 
.<< 
Dispose<< !
(<<! "
)<<" #
;<<# $
return== 
Task== 
.== 
CompletedTask== !
;==! "
}>> 
}?? 