f
d/Users/pavel/project/NetMentoring/ApiGatewayOcelot/Aggregators/CatalogDetailsAggregatorMiddleware.csç3
=/Users/pavel/project/NetMentoring/ApiGatewayOcelot/Program.cs
	namespace 	
ApiGatewayOcelot
 
{ 
public 

static 
class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
new 
WebHostBuilder 
( 
)  
. 

UseKestrel 
( 
) 
. 
UseContentRoot 
(  
	Directory  )
.) *
GetCurrentDirectory* =
(= >
)> ?
)? @
. %
ConfigureAppConfiguration *
(* +
(+ ,
hostingContext, :
,: ;
config< B
)B C
=>D F
{ "
AppConfigurationConfig *
(* +
config+ 1
,1 2
hostingContext3 A
)A B
;B C
} 
) 
. 
ConfigureServices "
(" #
ServicesConfig# 1
)1 2
.   
ConfigureLogging   !
(  ! "
(  " #
hostingContext  # 1
,  1 2
logging  3 :
)  : ;
=>  < >
{  ? @
	LogConfig  A J
(  J K
logging  K R
)  R S
;  S T
}  U V
)  V W
.!! 
UseIISIntegration!! "
(!!" #
)!!# $
."" 
	Configure"" 
("" 
	AppConfig"" $
)""$ %
.## 
Build## 
(## 
)## 
.$$ 
Run$$ 
($$ 
)$$ 
;$$ 
}%% 	
private++ 
static++ 
void++ 
	LogConfig++ %
(++% &
ILoggingBuilder++& 5
logging++6 =
)++= >
{,, 	
logging-- 
.-- 
ClearProviders-- "
(--" #
)--# $
;--$ %
logging.. 
... 

AddSerilog.. 
(.. 
new.. "
LoggerConfiguration..# 6
(..6 7
)..7 8
.// 
MinimumLevel// 
.// 
Debug// #
(//# $
)//$ %
.00 
MinimumLevel00 
.00 
Override00 &
(00& '
$str00' 2
,002 3
LogEventLevel004 A
.00A B
Warning00B I
)00I J
.11 
Enrich11 
.11 
FromLogContext11 &
(11& '
)11' (
.22 
WriteTo22 
.22 
Console22  
(22  !
)22! "
.33 
CreateLogger33 
(33 
)33 
)33  
;33  !
}44 	
private;; 
static;; 
void;; "
AppConfigurationConfig;; 2
(;;2 3!
IConfigurationBuilder;;3 H
config;;I O
,;;O P!
WebHostBuilderContext;;Q f
hostingContext;;g u
);;u v
{<< 	
config== 
.>> 
SetBasePath>> 
(>> 
hostingContext>> +
.>>+ ,
HostingEnvironment>>, >
.>>> ?
ContentRootPath>>? N
)>>N O
.?? 
AddJsonFile?? 
(?? 
$str?? *
)??* +
.@@ #
AddEnvironmentVariables@@ (
(@@( )
)@@) *
;@@* +
}AA 	
privateGG 
staticGG 
voidGG 
ServicesConfigGG *
(GG* +
IServiceCollectionGG+ =
sGG> ?
)GG? @
{HH 	
sII 
.II 
AddAuthenticationII 
(II  
$strII  (
)II( )
.JJ 
AddJwtBearerJJ 
(JJ 
$strJJ &
,JJ& '
optionsJJ( /
=>JJ0 2
{KK 
optionsLL 
.LL 
	AuthorityLL %
=LL& '
$strLL( S
;LLS T
optionsMM 
.MM 
AudienceMM $
=MM% &
$strMM' ;
;MM; <
}NN 
)NN 
;NN 
sPP 
.PP 
AddSwaggerGenPP 
(PP 
cPP 
=>PP  
{PP! "
cPP# $
.PP$ %

SwaggerDocPP% /
(PP/ 0
$strPP0 4
,PP4 5
newPP6 9
OpenApiInfoPP: E
{PPF G
TitlePPH M
=PPN O
$strPPP ]
,PP] ^
VersionPP_ f
=PPg h
$strPPi m
}PPn o
)PPo p
;PPp q
}PPr s
)PPs t
;PPt u
sQQ 
.QQ 
	AddOcelotQQ 
(QQ 
)QQ 
.QQ 
AddCacheManagerQQ )
(QQ) *
xQQ* +
=>QQ, .
{QQ/ 0
xQQ1 2
.QQ2 3 
WithDictionaryHandleQQ3 G
(QQG H
)QQH I
;QQI J
}QQK L
)QQL M
;QQM N
}RR 	
privateXX 
staticXX 
voidXX 
	AppConfigXX %
(XX% &
IApplicationBuilderXX& 9
appXX: =
)XX= >
{YY 	
appZZ 
.ZZ 
MapZZ 
(ZZ 
$strZZ .
,ZZ. /
bZZ0 1
=>ZZ2 4
{[[ 
b\\ 
.\\ 
Run\\ 
(\\ 
async\\ 
x\\ 
=>\\  
{]] 
var^^ 
json^^ 
=^^ 
File^^ #
.^^# $
ReadAllText^^$ /
(^^/ 0
$str^^0 >
)^^> ?
;^^? @
await__ 
x__ 
.__ 
Response__ $
.__$ %

WriteAsync__% /
(__/ 0
json__0 4
)__4 5
;__5 6
}`` 
)`` 
;`` 
}aa 
)aa 
;aa 
appbb 
.bb 
UseSwaggerUIbb 
(bb 
cbb 
=>bb !
{bb" #
cbb$ %
.bb% &
SwaggerEndpointbb& 5
(bb5 6
$strbb6 P
,bbP Q
$strbbR Z
)bbZ [
;bb[ \
}bb] ^
)bb^ _
;bb_ `
appdd 
.dd 
UseAuthenticationdd !
(dd! "
)dd" #
;dd# $
appff 
.ff 
	UseOcelotff 
(ff 
)ff 
.ff 
Waitff  
(ff  !
)ff! "
;ff" #
}gg 	
}hh 
}ii 