á#
:/Users/pavel/project/NetMentoring/IdentityServer/Config.cs
	namespace 	
IdentityServer
 
; 
public 
static 
class 
Config 
{ 
public 

static 
IEnumerable 
< 
IdentityResource .
>. /
IdentityResources0 A
=>B D
new		 
IdentityResource		 
[		 
]		 
{

 	
new 
IdentityResources !
.! "
OpenId" (
(( )
)) *
,* +
new 
IdentityResources !
.! "
Profile" )
() *
)* +
,+ ,
new 
IdentityResource  
{ 
Name 
= 
$str 
, 

UserClaims 
= 
new  
List! %
<% &
string& ,
>, -
{. /
$str0 6
}7 8
} 
} 	
;	 

public 

static 
IEnumerable 
< 
ApiScope &
>& '
	ApiScopes( 1
=>2 4
new 
ApiScope 
[ 
] 
{ 	
new 
( 
name 
: 
$str %
,% &
displayName) 4
:4 5
$str6 H
)H I
,I J
new 
( 
name 
: 
$str '
,' (
displayName) 4
:4 5
$str6 H
)H I
,I J
new 
( 
name 
: 
$str '
,' (
displayName) 4
:4 5
$str6 H
)H I
,I J
new 
( 
name 
: 
$str '
,' (
displayName) 4
:4 5
$str6 H
)H I
} 	
;	 

public 

static 
IEnumerable 
< 
Client $
>$ %
Clients& -
=>. 0
new 
List 
< 
Client 
> 
{ 	
new!! 
(!! 
)!! 
{"" 
ClientId## 
=## 
$str## &
,##& '
ClientSecrets$$ 
=$$ 
{$$  !
new$$" %
Secret$$& ,
($$, -
$str$$- 5
.$$5 6
Sha256$$6 <
($$< =
)$$= >
)$$> ?
}$$@ A
,$$A B
AllowedGrantTypes&& !
=&&" #

GrantTypes&&$ .
.&&. /
ClientCredentials&&/ @
,&&@ A
AllowedScopes(( 
=(( 
{((  !
$str((" (
,((( )
$str((* 1
}((2 3
,((3 4
RefreshTokenUsage)) !
=))" #

TokenUsage))$ .
.)). /
OneTimeOnly))/ :
}** 
,** 
new,, 
(,, 
),, 
{-- 
ClientId.. 
=.. 
$str..  
,..  !
ClientSecrets// 
=// 
{//  !
new//" %
Secret//& ,
(//, -
$str//- 5
.//5 6
Sha256//6 <
(//< =
)//= >
)//> ?
}//@ A
,//A B
AllowedGrantTypes11 !
=11" #

GrantTypes11$ .
.11. /
Code11/ 3
,113 4
RedirectUris44 
=44 
{44  
$str44! E
}44F G
,44G H"
PostLogoutRedirectUris77 &
=77' (
{77) *
$str77+ Y
}77Z [
,77[ \
AllowOfflineAccess99 "
=99# $
true99% )
,99) *
AllowedScopes:: 
=:: 
new::  #
List::$ (
<::( )
string::) /
>::/ 0
{;; #
IdentityServerConstants<< +
.<<+ ,
StandardScopes<<, :
.<<: ;
OpenId<<; A
,<<A B#
IdentityServerConstants== +
.==+ ,
StandardScopes==, :
.==: ;
Profile==; B
,==B C
$str>> #
,>># $
$str>>% 6
,>>6 7
$str>>8 I
,>>I J
$str>>K \
}?? 
}@@ 
}AA 	
;AA	 

}BB Ω
H/Users/pavel/project/NetMentoring/IdentityServer/CustomProfileService.cs
	namespace 	
IdentityServer
 
{ 
public 

class  
CustomProfileService %
:& '
ProfileService( 6
<6 7
TestUser7 ?
>? @
{		 
public

  
CustomProfileService

 #
(

# $
UserManager

$ /
<

/ 0
TestUser

0 8
>

8 9
userManager

: E
,

E F'
IUserClaimsPrincipalFactory

G b
<

b c
TestUser

c k
>

k l
claimsFactory

m z
)

z {
:

| }
base	

~ Ç
(


Ç É
userManager


É é
,


é è
claimsFactory


ê ù
)


ù û
{ 	
} 	
	protected 
override 
async  
Task! %
GetProfileDataAsync& 9
(9 :%
ProfileDataRequestContext: S
contextT [
,[ \
TestUser] e
userf j
)j k
{ 	
var 
	principal 
= 
await !
GetUserClaimsAsync" 4
(4 5
user5 9
)9 :
;: ;
context 
. 
AddRequestedClaims &
(& '
	principal' 0
.0 1
Claims1 7
)7 8
;8 9
} 	
} 
} ¬"
E/Users/pavel/project/NetMentoring/IdentityServer/HostingExtensions.cs
	namespace 	
IdentityServer
 
; 
internal		 
static			 
class		 
HostingExtensions		 '
{

 
public 

static 
WebApplication  
ConfigureServices! 2
(2 3
this3 7!
WebApplicationBuilder8 M
builderN U
)U V
{ 
builder 
. 
Services 
. 
AddRazorPages &
(& '
)' (
;( )
var 
	isBuilder 
= 
builder 
.  
Services  (
.( )
AddIdentityServer) :
(: ;
options; B
=>C E
{ 
options 
. 
Events 
. 
RaiseErrorEvents /
=0 1
true2 6
;6 7
options 
. 
Events 
. "
RaiseInformationEvents 5
=6 7
true8 <
;< =
options 
. 
Events 
. 
RaiseFailureEvents 1
=2 3
true4 8
;8 9
options 
. 
Events 
. 
RaiseSuccessEvents 1
=2 3
true4 8
;8 9
options 
. #
EmitStaticAudienceClaim /
=0 1
true2 6
;6 7
} 
) 
. 
AddTestUsers 
( 
	TestUsers #
.# $
Users$ )
)) *
;* +
	isBuilder 
. (
AddInMemoryIdentityResources .
(. /
Config/ 5
.5 6
IdentityResources6 G
)G H
;H I
	isBuilder 
.  
AddInMemoryApiScopes &
(& '
Config' -
.- .
	ApiScopes. 7
)7 8
;8 9
	isBuilder 
. 
AddInMemoryClients $
($ %
Config% +
.+ ,
Clients, 3
)3 4
;4 5
builder11 
.11 
Services11 
.11 
AddAuthentication11 *
(11* +
)11+ ,
.22 
	AddGoogle22 
(22 
options22 
=>22 !
{33 
options44 
.44 
SignInScheme44 $
=44% &#
IdentityServerConstants44' >
.44> ?.
"ExternalCookieAuthenticationScheme44? a
;44a b
options99 
.99 
ClientId99  
=99! "
$str99# D
;99D E
options:: 
.:: 
ClientSecret:: $
=::% &
$str::' L
;::L M
};; 
);; 
;;; 
return== 
builder== 
.== 
Build== 
(== 
)== 
;== 
}>> 
public@@ 

static@@ 
WebApplication@@  
ConfigurePipeline@@! 2
(@@2 3
this@@3 7
WebApplication@@8 F
app@@G J
)@@J K
{AA 
appBB 
.BB $
UseSerilogRequestLoggingBB $
(BB$ %
)BB% &
;BB& '
ifDD 

(DD 
appDD 
.DD 
EnvironmentDD 
.DD 
IsDevelopmentDD )
(DD) *
)DD* +
)DD+ ,
{EE 	
appFF 
.FF %
UseDeveloperExceptionPageFF )
(FF) *
)FF* +
;FF+ ,
}GG 	
appII 
.II 
UseStaticFilesII 
(II 
)II 
;II 
appJJ 
.JJ 

UseRoutingJJ 
(JJ 
)JJ 
;JJ 
appKK 
.KK 
UseIdentityServerKK 
(KK 
)KK 
;KK  
appLL 
.LL 
UseAuthorizationLL 
(LL 
)LL 
;LL 
appNN 
.NN 
MapRazorPagesNN 
(NN 
)NN 
.OO  
RequireAuthorizationOO !
(OO! "
)OO" #
;OO# $
returnQQ 
appQQ 
;QQ 
}RR 
}SS ÷
U/Users/pavel/project/NetMentoring/IdentityServer/Pages/Account/AccessDenied.cshtml.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Account &
;& '
public 
class 
AccessDeniedModel 
:  
	PageModel! *
{ 
public 

void 
OnGet 
( 
) 
{ 
}		 
}

  É
T/Users/pavel/project/NetMentoring/IdentityServer/Pages/Account/Login/Index.cshtml.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Login $
;$ %
[ 
SecurityHeaders 
] 
[ 
AllowAnonymous 
] 
public 
class 
Index 
: 
	PageModel 
{ 
private 
readonly 
TestUserStore "
_users# )
;) *
private 
readonly -
!IIdentityServerInteractionService 6
_interaction7 C
;C D
private 
readonly 
IEventService "
_events# *
;* +
private 
readonly )
IAuthenticationSchemeProvider 2
_schemeProvider3 B
;B C
private 
readonly "
IIdentityProviderStore +"
_identityProviderStore, B
;B C
public 

	ViewModel 
View 
{ 
get 
;  
set! $
;$ %
}& '
[ 
BindProperty 
] 
public 

InputModel $
Input% *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 

Index 
( -
!IIdentityServerInteractionService )
interaction* 5
,5 6)
IAuthenticationSchemeProvider %
schemeProvider& 4
,4 5"
IIdentityProviderStore !
identityProviderStore 4
,4 5
IEventService   
events   
,   
TestUserStore!! 
users!! 
=!! 
null!! "
)!!" #
{"" 
_users$$ 
=$$ 
users$$ 
??$$ 
throw%% 
new%% 
	Exception%% $
(%%$ %
$str	&& £
)
&&£ §
;
&&§ •
_interaction(( 
=(( 
interaction(( "
;((" #
_schemeProvider)) 
=)) 
schemeProvider)) (
;))( )"
_identityProviderStore** 
=**  !
identityProviderStore**! 6
;**6 7
_events++ 
=++ 
events++ 
;++ 
},, 
public.. 

async.. 
Task.. 
<.. 
IActionResult.. #
>..# $
OnGet..% *
(..* +
string..+ 1
	returnUrl..2 ;
)..; <
{// 
await00 
BuildModelAsync00 
(00 
	returnUrl00 '
)00' (
;00( )
if22 

(22 
View22 
.22 
IsExternalLoginOnly22 $
)22$ %
{33 	
return55 
RedirectToPage55 !
(55! "
$str55" <
,55< =
new55> A
{55B C
scheme55D J
=55K L
View55M Q
.55Q R
ExternalLoginScheme55R e
,55e f
	returnUrl55g p
}55q r
)55r s
;55s t
}66 	
return88 
Page88 
(88 
)88 
;88 
}99 
public;; 

async;; 
Task;; 
<;; 
IActionResult;; #
>;;# $
OnPost;;% +
(;;+ ,
);;, -
{<< 
var>> 
context>> 
=>> 
await>> 
_interaction>> (
.>>( )(
GetAuthorizationContextAsync>>) E
(>>E F
Input>>F K
.>>K L
	ReturnUrl>>L U
)>>U V
;>>V W
ifAA 

(AA 
InputAA 
.AA 
ButtonAA 
!=AA 
$strAA #
)AA# $
{BB 	
ifCC 
(CC 
contextCC 
!=CC 
nullCC 
)CC  
{DD 
awaitHH 
_interactionHH "
.HH" #"
DenyAuthorizationAsyncHH# 9
(HH9 :
contextHH: A
,HHA B
AuthorizationErrorHHC U
.HHU V
AccessDeniedHHV b
)HHb c
;HHc d
ifKK 
(KK 
contextKK 
.KK 
IsNativeClientKK *
(KK* +
)KK+ ,
)KK, -
{LL 
returnOO 
thisOO 
.OO  
LoadingPageOO  +
(OO+ ,
InputOO, 1
.OO1 2
	ReturnUrlOO2 ;
)OO; <
;OO< =
}PP 
returnRR 
RedirectRR 
(RR  
InputRR  %
.RR% &
	ReturnUrlRR& /
)RR/ 0
;RR0 1
}SS 
elseTT 
{UU 
returnWW 
RedirectWW 
(WW  
$strWW  $
)WW$ %
;WW% &
}XX 
}YY 	
if[[ 

([[ 

ModelState[[ 
.[[ 
IsValid[[ 
)[[ 
{\\ 	
if^^ 
(^^ 
_users^^ 
.^^ 
ValidateCredentials^^ *
(^^* +
Input^^+ 0
.^^0 1
Username^^1 9
,^^9 :
Input^^; @
.^^@ A
Password^^A I
)^^I J
)^^J K
{__ 
var`` 
user`` 
=`` 
_users`` !
.``! "
FindByUsername``" 0
(``0 1
Input``1 6
.``6 7
Username``7 ?
)``? @
;``@ A
awaitaa 
_eventsaa 
.aa 

RaiseAsyncaa (
(aa( )
newaa) ,!
UserLoginSuccessEventaa- B
(aaB C
useraaC G
.aaG H
UsernameaaH P
,aaP Q
useraaR V
.aaV W
	SubjectIdaaW `
,aa` a
useraab f
.aaf g
Usernameaag o
,aao p
clientIdbb 
:bb 
contextbb %
?bb% &
.bb& '
Clientbb' -
.bb- .
ClientIdbb. 6
)bb6 7
)bb7 8
;bb8 9$
AuthenticationPropertiesff (
propsff) .
=ff/ 0
nullff1 5
;ff5 6
ifgg 
(gg 
LoginOptionsgg  
.gg  !
AllowRememberLogingg! 3
&&gg4 6
Inputgg7 <
.gg< =
RememberLogingg= J
)ggJ K
{hh 
propsii 
=ii 
newii $
AuthenticationPropertiesii  8
{jj 
IsPersistentkk $
=kk% &
truekk' +
,kk+ ,

ExpiresUtcll "
=ll# $
DateTimeOffsetll% 3
.ll3 4
UtcNowll4 :
.ll: ;
Addll; >
(ll> ?
LoginOptionsll? K
.llK L#
RememberMeLoginDurationllL c
)llc d
}mm 
;mm 
}nn 
;pp 
varss 
isuserss 
=ss 
newss  
IdentityServerUserss! 3
(ss3 4
userss4 8
.ss8 9
	SubjectIdss9 B
)ssB C
{tt 
DisplayNameuu 
=uu  !
useruu" &
.uu& '
Usernameuu' /
}vv 
;vv 
awaitxx 
HttpContextxx !
.xx! "
SignInAsyncxx" -
(xx- .
isuserxx. 4
,xx4 5
propsxx6 ;
)xx; <
;xx< =
ifzz 
(zz 
contextzz 
!=zz 
nullzz #
)zz# $
{{{ 
if|| 
(|| 
context|| 
.||  
IsNativeClient||  .
(||. /
)||/ 0
)||0 1
{}} 
return
ÄÄ 
this
ÄÄ #
.
ÄÄ# $
LoadingPage
ÄÄ$ /
(
ÄÄ/ 0
Input
ÄÄ0 5
.
ÄÄ5 6
	ReturnUrl
ÄÄ6 ?
)
ÄÄ? @
;
ÄÄ@ A
}
ÅÅ 
return
ÑÑ 
Redirect
ÑÑ #
(
ÑÑ# $
Input
ÑÑ$ )
.
ÑÑ) *
	ReturnUrl
ÑÑ* 3
)
ÑÑ3 4
;
ÑÑ4 5
}
ÖÖ 
if
àà 
(
àà 
Url
àà 
.
àà 

IsLocalUrl
àà "
(
àà" #
Input
àà# (
.
àà( )
	ReturnUrl
àà) 2
)
àà2 3
)
àà3 4
{
ââ 
return
ää 
Redirect
ää #
(
ää# $
Input
ää$ )
.
ää) *
	ReturnUrl
ää* 3
)
ää3 4
;
ää4 5
}
ãã 
else
åå 
if
åå 
(
åå 
string
åå 
.
åå  
IsNullOrEmpty
åå  -
(
åå- .
Input
åå. 3
.
åå3 4
	ReturnUrl
åå4 =
)
åå= >
)
åå> ?
{
çç 
return
éé 
Redirect
éé #
(
éé# $
$str
éé$ (
)
éé( )
;
éé) *
}
èè 
else
êê 
{
ëë 
throw
ìì 
new
ìì 
	Exception
ìì '
(
ìì' (
$str
ìì( <
)
ìì< =
;
ìì= >
}
îî 
}
ïï 
await
óó 
_events
óó 
.
óó 

RaiseAsync
óó $
(
óó$ %
new
óó% (#
UserLoginFailureEvent
óó) >
(
óó> ?
Input
óó? D
.
óóD E
Username
óóE M
,
óóM N
$str
óóO d
,
óód e
clientId
òò 
:
òò 
context
òò !
?
òò! "
.
òò" #
Client
òò# )
.
òò) *
ClientId
òò* 2
)
òò2 3
)
òò3 4
;
òò4 5

ModelState
ôô 
.
ôô 
AddModelError
ôô $
(
ôô$ %
string
ôô% +
.
ôô+ ,
Empty
ôô, 1
,
ôô1 2
LoginOptions
ôô3 ?
.
ôô? @,
InvalidCredentialsErrorMessage
ôô@ ^
)
ôô^ _
;
ôô_ `
}
öö 	
await
ùù 
BuildModelAsync
ùù 
(
ùù 
Input
ùù #
.
ùù# $
	ReturnUrl
ùù$ -
)
ùù- .
;
ùù. /
return
ûû 
Page
ûû 
(
ûû 
)
ûû 
;
ûû 
}
üü 
private
°° 
async
°° 
Task
°° 
BuildModelAsync
°° &
(
°°& '
string
°°' -
	returnUrl
°°. 7
)
°°7 8
{
¢¢ 
Input
££ 
=
££ 
new
££ 

InputModel
££ 
{
§§ 	
	ReturnUrl
•• 
=
•• 
	returnUrl
•• !
}
¶¶ 	
;
¶¶	 

var
®® 
context
®® 
=
®® 
await
®® 
_interaction
®® (
.
®®( )*
GetAuthorizationContextAsync
®®) E
(
®®E F
	returnUrl
®®F O
)
®®O P
;
®®P Q
if
©© 

(
©© 
context
©© 
?
©© 
.
©© 
IdP
©© 
!=
©© 
null
©©  
&&
©©! #
await
©©$ )
_schemeProvider
©©* 9
.
©©9 :
GetSchemeAsync
©©: H
(
©©H I
context
©©I P
.
©©P Q
IdP
©©Q T
)
©©T U
!=
©©V X
null
©©Y ]
)
©©] ^
{
™™ 	
var
´´ 
local
´´ 
=
´´ 
context
´´ 
.
´´  
IdP
´´  #
==
´´$ &
Duende
´´' -
.
´´- .
IdentityServer
´´. <
.
´´< =%
IdentityServerConstants
´´= T
.
´´T U#
LocalIdentityProvider
´´U j
;
´´j k
View
ÆÆ 
=
ÆÆ 
new
ÆÆ 
	ViewModel
ÆÆ  
{
ØØ 
EnableLocalLogin
∞∞  
=
∞∞! "
local
∞∞# (
,
∞∞( )
}
±± 
;
±± 
Input
≥≥ 
.
≥≥ 
Username
≥≥ 
=
≥≥ 
context
≥≥ $
?
≥≥$ %
.
≥≥% &
	LoginHint
≥≥& /
;
≥≥/ 0
if
µµ 
(
µµ 
!
µµ 
local
µµ 
)
µµ 
{
∂∂ 
View
∑∑ 
.
∑∑ 
ExternalProviders
∑∑ &
=
∑∑' (
new
∑∑) ,
[
∑∑, -
]
∑∑- .
{
∏∏ 
new
∏∏ 
	ViewModel
∏∏ #
.
∏∏# $
ExternalProvider
∏∏$ 4
{
∏∏5 6"
AuthenticationScheme
∏∏7 K
=
∏∏L M
context
∏∏N U
.
∏∏U V
IdP
∏∏V Y
}
∏∏Z [
}
∏∏\ ]
;
∏∏] ^
}
ππ 
return
ªª 
;
ªª 
}
ºº 	
var
ææ 
schemes
ææ 
=
ææ 
await
ææ 
_schemeProvider
ææ +
.
ææ+ , 
GetAllSchemesAsync
ææ, >
(
ææ> ?
)
ææ? @
;
ææ@ A
var
¿¿ 
	providers
¿¿ 
=
¿¿ 
schemes
¿¿ 
.
¡¡ 
Where
¡¡ 
(
¡¡ 
x
¡¡ 
=>
¡¡ 
x
¡¡ 
.
¡¡ 
DisplayName
¡¡ %
!=
¡¡& (
null
¡¡) -
)
¡¡- .
.
¬¬ 
Select
¬¬ 
(
¬¬ 
x
¬¬ 
=>
¬¬ 
new
¬¬ 
	ViewModel
¬¬ &
.
¬¬& '
ExternalProvider
¬¬' 7
{
√√ 
DisplayName
ƒƒ 
=
ƒƒ 
x
ƒƒ 
.
ƒƒ  
DisplayName
ƒƒ  +
??
ƒƒ, .
x
ƒƒ/ 0
.
ƒƒ0 1
Name
ƒƒ1 5
,
ƒƒ5 6"
AuthenticationScheme
≈≈ $
=
≈≈% &
x
≈≈' (
.
≈≈( )
Name
≈≈) -
}
∆∆ 
)
∆∆ 
.
∆∆ 
ToList
∆∆ 
(
∆∆ 
)
∆∆ 
;
∆∆ 
var
»» 
dyanmicSchemes
»» 
=
»» 
(
»» 
await
»» #$
_identityProviderStore
»»$ :
.
»»: ;$
GetAllSchemeNamesAsync
»»; Q
(
»»Q R
)
»»R S
)
»»S T
.
…… 
Where
…… 
(
…… 
x
…… 
=>
…… 
x
…… 
.
…… 
Enabled
…… !
)
……! "
.
   
Select
   
(
   
x
   
=>
   
new
   
	ViewModel
   &
.
  & '
ExternalProvider
  ' 7
{
ÀÀ "
AuthenticationScheme
ÃÃ $
=
ÃÃ% &
x
ÃÃ' (
.
ÃÃ( )
Scheme
ÃÃ) /
,
ÃÃ/ 0
DisplayName
ÕÕ 
=
ÕÕ 
x
ÕÕ 
.
ÕÕ  
DisplayName
ÕÕ  +
}
ŒŒ 
)
ŒŒ 
;
ŒŒ 
	providers
œœ 
.
œœ 
AddRange
œœ 
(
œœ 
dyanmicSchemes
œœ )
)
œœ) *
;
œœ* +
var
““ 

allowLocal
““ 
=
““ 
true
““ 
;
““ 
var
”” 
client
”” 
=
”” 
context
”” 
?
”” 
.
”” 
Client
”” $
;
””$ %
if
‘‘ 

(
‘‘ 
client
‘‘ 
!=
‘‘ 
null
‘‘ 
)
‘‘ 
{
’’ 	

allowLocal
÷÷ 
=
÷÷ 
client
÷÷ 
.
÷÷  
EnableLocalLogin
÷÷  0
;
÷÷0 1
if
◊◊ 
(
◊◊ 
client
◊◊ 
.
◊◊ *
IdentityProviderRestrictions
◊◊ 3
!=
◊◊4 6
null
◊◊7 ;
&&
◊◊< >
client
◊◊? E
.
◊◊E F*
IdentityProviderRestrictions
◊◊F b
.
◊◊b c
Any
◊◊c f
(
◊◊f g
)
◊◊g h
)
◊◊h i
{
ÿÿ 
	providers
ŸŸ 
=
ŸŸ 
	providers
ŸŸ %
.
ŸŸ% &
Where
ŸŸ& +
(
ŸŸ+ ,
provider
ŸŸ, 4
=>
ŸŸ5 7
client
⁄⁄ 
.
⁄⁄ *
IdentityProviderRestrictions
⁄⁄ 7
.
⁄⁄7 8
Contains
⁄⁄8 @
(
⁄⁄@ A
provider
⁄⁄A I
.
⁄⁄I J"
AuthenticationScheme
⁄⁄J ^
)
⁄⁄^ _
)
⁄⁄_ `
.
⁄⁄` a
ToList
⁄⁄a g
(
⁄⁄g h
)
⁄⁄h i
;
⁄⁄i j
}
€€ 
}
‹‹ 	
View
ﬁﬁ 
=
ﬁﬁ 
new
ﬁﬁ 
	ViewModel
ﬁﬁ 
{
ﬂﬂ 	 
AllowRememberLogin
‡‡ 
=
‡‡  
LoginOptions
‡‡! -
.
‡‡- . 
AllowRememberLogin
‡‡. @
,
‡‡@ A
EnableLocalLogin
·· 
=
·· 

allowLocal
·· )
&&
··* ,
LoginOptions
··- 9
.
··9 :
AllowLocalLogin
··: I
,
··I J
ExternalProviders
‚‚ 
=
‚‚ 
	providers
‚‚  )
.
‚‚) *
ToArray
‚‚* 1
(
‚‚1 2
)
‚‚2 3
}
„„ 	
;
„„	 

}
‰‰ 
}ÂÂ •	
R/Users/pavel/project/NetMentoring/IdentityServer/Pages/Account/Login/InputModel.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Login $
;$ %
public		 
class		 

InputModel		 
{

 
[ 
Required 
] 
public 
string 
Username %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
[ 
Required 
] 
public 
string 
Password %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 

bool 
RememberLogin 
{ 
get  #
;# $
set% (
;( )
}* +
public 

string 
	ReturnUrl 
{ 
get !
;! "
set# &
;& '
}( )
public 

string 
Button 
{ 
get 
; 
set  #
;# $
}% &
} »
T/Users/pavel/project/NetMentoring/IdentityServer/Pages/Account/Login/LoginOptions.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Login $
;$ %
public 
class 
LoginOptions 
{ 
public 

static 
bool 
AllowLocalLogin &
=' (
true) -
;- .
public 

static 
bool 
AllowRememberLogin )
=* +
true, 0
;0 1
public 

static 
TimeSpan #
RememberMeLoginDuration 2
=3 4
TimeSpan5 =
.= >
FromDays> F
(F G
$numG I
)I J
;J K
public 

static 
string *
InvalidCredentialsErrorMessage 7
=8 9
$str: X
;X Y
}		 Ï
Q/Users/pavel/project/NetMentoring/IdentityServer/Pages/Account/Login/ViewModel.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Login $
;$ %
public 
class 
	ViewModel 
{ 
public 

bool 
AllowRememberLogin "
{# $
get% (
;( )
set* -
;- .
}/ 0
=1 2
true3 7
;7 8
public		 

bool		 
EnableLocalLogin		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
=		/ 0
true		1 5
;		5 6
public 

IEnumerable 
< 
	ViewModel  
.  !
ExternalProvider! 1
>1 2
ExternalProviders3 D
{E F
getG J
;J K
setL O
;O P
}Q R
=S T

Enumerable 
. 
Empty 
< 
ExternalProvider )
>) *
(* +
)+ ,
;, -
public 

IEnumerable 
< 
	ViewModel  
.  !
ExternalProvider! 1
>1 2$
VisibleExternalProviders3 K
=>L N
ExternalProviders 
. 
Where 
(  
x  !
=>" $
!% &
String& ,
., -
IsNullOrWhiteSpace- ?
(? @
x@ A
.A B
DisplayNameB M
)M N
)N O
;O P
public 

bool 
IsExternalLoginOnly #
=>$ &
EnableLocalLogin' 7
==8 :
false; @
&&A C
ExternalProvidersD U
?U V
.V W
CountW \
(\ ]
)] ^
==_ a
$numb c
;c d
public 

string 
ExternalLoginScheme %
=>& (
IsExternalLoginOnly 
? 
ExternalProviders /
?/ 0
.0 1
SingleOrDefault1 @
(@ A
)A B
?B C
.C D 
AuthenticationSchemeD X
:Y Z
null[ _
;_ `
public 

class 
ExternalProvider !
{ 
public 
string 
DisplayName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string  
AuthenticationScheme *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
} ö,
U/Users/pavel/project/NetMentoring/IdentityServer/Pages/Account/Logout/Index.cshtml.cs
	namespace

 	
IdentityServer


 
.

 
Pages

 
.

 
Logout

 %
;

% &
[ 
SecurityHeaders 
] 
[ 
AllowAnonymous 
] 
public 
class 
Index 
: 
	PageModel 
{ 
private 
readonly -
!IIdentityServerInteractionService 6
_interaction7 C
;C D
private 
readonly 
IEventService "
_events# *
;* +
[ 
BindProperty 
] 
public 
string  
LogoutId! )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 

Index 
( -
!IIdentityServerInteractionService 2
interaction3 >
,> ?
IEventService@ M
eventsN T
)T U
{ 
_interaction 
= 
interaction "
;" #
_events 
= 
events 
; 
} 
public 

async 
Task 
< 
IActionResult #
># $
OnGet% *
(* +
string+ 1
logoutId2 :
): ;
{ 
LogoutId 
= 
logoutId 
; 
var 
showLogoutPrompt 
= 
LogoutOptions ,
., -
ShowLogoutPrompt- =
;= >
if!! 

(!! 
User!! 
?!! 
.!! 
Identity!! 
.!! 
IsAuthenticated!! *
!=!!+ -
true!!. 2
)!!2 3
{"" 	
showLogoutPrompt$$ 
=$$ 
false$$ $
;$$$ %
}%% 	
else&& 
{'' 	
var(( 
context(( 
=(( 
await(( 
_interaction((  ,
.((, -!
GetLogoutContextAsync((- B
(((B C
LogoutId((C K
)((K L
;((L M
if)) 
()) 
context)) 
?)) 
.)) 
ShowSignoutPrompt)) *
==))+ -
false)). 3
)))3 4
{** 
showLogoutPrompt,,  
=,,! "
false,,# (
;,,( )
}-- 
}.. 	
if00 

(00 
showLogoutPrompt00 
==00 
false00  %
)00% &
{11 	
return44 
await44 
OnPost44 
(44  
)44  !
;44! "
}55 	
return77 
Page77 
(77 
)77 
;77 
}88 
public:: 

async:: 
Task:: 
<:: 
IActionResult:: #
>::# $
OnPost::% +
(::+ ,
)::, -
{;; 
if<< 

(<< 
User<< 
?<< 
.<< 
Identity<< 
.<< 
IsAuthenticated<< *
==<<+ -
true<<. 2
)<<2 3
{== 	
LogoutIdAA 
??=AA 
awaitAA 
_interactionAA +
.AA+ ,$
CreateLogoutContextAsyncAA, D
(AAD E
)AAE F
;AAF G
awaitDD 
HttpContextDD 
.DD 
SignOutAsyncDD *
(DD* +
)DD+ ,
;DD, -
awaitGG 
_eventsGG 
.GG 

RaiseAsyncGG $
(GG$ %
newGG% ("
UserLogoutSuccessEventGG) ?
(GG? @
UserGG@ D
.GGD E
GetSubjectIdGGE Q
(GGQ R
)GGR S
,GGS T
UserGGU Y
.GGY Z
GetDisplayNameGGZ h
(GGh i
)GGi j
)GGj k
)GGk l
;GGl m
varJJ 
idpJJ 
=JJ 
UserJJ 
.JJ 
	FindFirstJJ $
(JJ$ %
JwtClaimTypesJJ% 2
.JJ2 3
IdentityProviderJJ3 C
)JJC D
?JJD E
.JJE F
ValueJJF K
;JJK L
ifMM 
(MM 
idpMM 
!=MM 
nullMM 
&&MM 
idpMM "
!=MM# %
DuendeMM& ,
.MM, -
IdentityServerMM- ;
.MM; <#
IdentityServerConstantsMM< S
.MMS T!
LocalIdentityProviderMMT i
)MMi j
{NN 
ifPP 
(PP 
awaitPP 
HttpContextPP %
.PP% &)
GetSchemeSupportsSignOutAsyncPP& C
(PPC D
idpPPD G
)PPG H
)PPH I
{QQ 
stringUU 
urlUU 
=UU  
UrlUU! $
.UU$ %
PageUU% )
(UU) *
$strUU* E
,UUE F
newUUG J
{UUK L
logoutIdUUM U
=UUV W
LogoutIdUUX `
}UUa b
)UUb c
;UUc d
returnXX 
SignOutXX "
(XX" #
newXX# &$
AuthenticationPropertiesXX' ?
{XX@ A
RedirectUriXXB M
=XXN O
urlXXP S
}XXT U
,XXU V
idpXXW Z
)XXZ [
;XX[ \
}YY 
}ZZ 
}[[ 	
return]] 
RedirectToPage]] 
(]] 
$str]] 9
,]]9 :
new]]; >
{]]? @
logoutId]]A I
=]]J K
LogoutId]]L T
}]]U V
)]]V W
;]]W X
}^^ 
}__ €
Y/Users/pavel/project/NetMentoring/IdentityServer/Pages/Account/Logout/LoggedOut.cshtml.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Logout %
;% &
[ 
SecurityHeaders 
] 
[ 
AllowAnonymous 
] 
public		 
class		 
	LoggedOut		 
:		 
	PageModel		 "
{

 
private 
readonly -
!IIdentityServerInteractionService 6
_interactionService7 J
;J K
public 

LoggedOutViewModel 
View "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 

	LoggedOut 
( -
!IIdentityServerInteractionService 6
interactionService7 I
)I J
{ 
_interactionService 
= 
interactionService 0
;0 1
} 
public 

async 
Task 
OnGet 
( 
string "
logoutId# +
)+ ,
{ 
var 
logout 
= 
await 
_interactionService .
.. /!
GetLogoutContextAsync/ D
(D E
logoutIdE M
)M N
;N O
View 
= 
new 
LoggedOutViewModel %
{ 	)
AutomaticRedirectAfterSignOut )
=* +
LogoutOptions, 9
.9 :)
AutomaticRedirectAfterSignOut: W
,W X!
PostLogoutRedirectUri !
=" #
logout$ *
?* +
.+ ,!
PostLogoutRedirectUri, A
,A B

ClientName 
= 
String 
.  
IsNullOrEmpty  -
(- .
logout. 4
?4 5
.5 6

ClientName6 @
)@ A
?B C
logoutD J
?J K
.K L
ClientIdL T
:U V
logoutW ]
?] ^
.^ _

ClientName_ i
,i j
SignOutIframeUrl 
= 
logout %
?% &
.& '
SignOutIFrameUrl' 7
} 	
;	 

}   
}!! €
[/Users/pavel/project/NetMentoring/IdentityServer/Pages/Account/Logout/LoggedOutViewModel.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Logout %
;% &
public 
class 
LoggedOutViewModel 
{ 
public		 

string		 !
PostLogoutRedirectUri		 '
{		( )
get		* -
;		- .
set		/ 2
;		2 3
}		4 5
public

 

string

 

ClientName

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 

string 
SignOutIframeUrl "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 

bool )
AutomaticRedirectAfterSignOut -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
} ’
V/Users/pavel/project/NetMentoring/IdentityServer/Pages/Account/Logout/LogoutOptions.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Logout %
;% &
public 
class 
LogoutOptions 
{ 
public 

static 
bool 
ShowLogoutPrompt '
=( )
true* .
;. /
public 

static 
bool )
AutomaticRedirectAfterSignOut 4
=5 6
false7 <
;< =
} Ù
I/Users/pavel/project/NetMentoring/IdentityServer/Pages/Ciba/All.cshtml.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Ciba #
;# $
[ 
SecurityHeaders 
] 
[ 
	Authorize 

]
 
public 
class 
AllModel 
: 
	PageModel !
{ 
public 

IEnumerable 
< '
BackchannelUserLoginRequest 2
>2 3
Logins4 :
{; <
get= @
;@ A
setB E
;E F
}G H
[ 
BindProperty 
, 
Required 
] 
public #
string$ *
Id+ -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
[ 
BindProperty 
, 
Required 
] 
public #
string$ *
Button+ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
private 
readonly 8
,IBackchannelAuthenticationInteractionService A1
%_backchannelAuthenticationInteractionB g
;g h
public 

AllModel 
( 8
,IBackchannelAuthenticationInteractionService @7
+backchannelAuthenticationInteractionServiceA l
)l m
{ 1
%_backchannelAuthenticationInteraction -
=. /7
+backchannelAuthenticationInteractionService0 [
;[ \
} 
public 

async 
Task 
OnGet 
( 
) 
{ 
Logins 
= 
await 1
%_backchannelAuthenticationInteraction <
.< =6
*GetPendingLoginRequestsForCurrentUserAsync= g
(g h
)h i
;i j
}   
}!! Â§
M/Users/pavel/project/NetMentoring/IdentityServer/Pages/Ciba/Consent.cshtml.cs
	namespace

 	
IdentityServer


 
.

 
Pages

 
.

 
Ciba

 #
;

# $
[ 
	Authorize 

]
 
[ $
SecurityHeadersAttribute 
] 
public 
class 
Consent 
: 
	PageModel  
{ 
private 
readonly 8
,IBackchannelAuthenticationInteractionService A
_interactionB N
;N O
private 
readonly 
IEventService "
_events# *
;* +
private 
readonly 
ILogger 
< 
Consent $
>$ %
_logger& -
;- .
public 

Consent 
( 8
,IBackchannelAuthenticationInteractionService 4
interaction5 @
,@ A
IEventService 
events 
, 
ILogger 
< 
Consent 
> 
logger 
)  
{ 
_interaction 
= 
interaction "
;" #
_events 
= 
events 
; 
_logger 
= 
logger 
; 
} 
public 

	ViewModel 
View 
{ 
get 
;  
set! $
;$ %
}& '
[   
BindProperty   
]   
public   

InputModel   $
Input  % *
{  + ,
get  - 0
;  0 1
set  2 5
;  5 6
}  7 8
public"" 

async"" 
Task"" 
<"" 
IActionResult"" #
>""# $
OnGet""% *
(""* +
string""+ 1
id""2 4
)""4 5
{## 
View$$ 
=$$ 
await$$ 
BuildViewModelAsync$$ (
($$( )
id$$) +
)$$+ ,
;$$, -
if%% 

(%% 
View%% 
==%% 
null%% 
)%% 
{&& 	
return'' 
RedirectToPage'' !
(''! "
$str''" 5
)''5 6
;''6 7
}(( 	
Input** 
=** 
new** 

InputModel** 
{++ 	
Id,, 
=,, 
id,, 
}-- 	
;--	 

return// 
Page// 
(// 
)// 
;// 
}00 
public22 

async22 
Task22 
<22 
IActionResult22 #
>22# $
OnPost22% +
(22+ ,
)22, -
{33 
var55 
request55 
=55 
await55 
_interaction55 (
.55( ),
 GetLoginRequestByInternalIdAsync55) I
(55I J
Input55J O
.55O P
Id55P R
)55R S
;55S T
if66 

(66 
request66 
==66 
null66 
||66 
request66 &
.66& '
Subject66' .
.66. /
GetSubjectId66/ ;
(66; <
)66< =
!=66> @
User66A E
.66E F
GetSubjectId66F R
(66R S
)66S T
)66T U
{77 	
_logger88 
.88 
LogError88 
(88 
$str88 .
,88. /
Input880 5
.885 6
Id886 8
)888 9
;889 :
return99 
RedirectToPage99 !
(99! "
$str99" 5
)995 6
;996 7
}:: 	+
CompleteBackchannelLoginRequest<< '
result<<( .
=<</ 0
null<<1 5
;<<5 6
if?? 

(?? 
Input?? 
??? 
.?? 
Button?? 
==?? 
$str?? !
)??! "
{@@ 	
resultAA 
=AA 
newAA +
CompleteBackchannelLoginRequestAA 8
(AA8 9
InputAA9 >
.AA> ?
IdAA? A
)AAA B
;AAB C
awaitDD 
_eventsDD 
.DD 

RaiseAsyncDD $
(DD$ %
newDD% (
ConsentDeniedEventDD) ;
(DD; <
UserDD< @
.DD@ A
GetSubjectIdDDA M
(DDM N
)DDN O
,DDO P
requestDDQ X
.DDX Y
ClientDDY _
.DD_ `
ClientIdDD` h
,DDh i
requestEE 
.EE 
ValidatedResourcesEE *
.EE* +
RawScopeValuesEE+ 9
)EE9 :
)EE: ;
;EE; <
}FF 	
elseHH 
ifHH 
(HH 
InputHH 
?HH 
.HH 
ButtonHH 
==HH !
$strHH" '
)HH' (
{II 	
ifKK 
(KK 
InputKK 
.KK 
ScopesConsentedKK %
!=KK& (
nullKK) -
&&KK. 0
InputKK1 6
.KK6 7
ScopesConsentedKK7 F
.KKF G
AnyKKG J
(KKJ K
)KKK L
)KKL M
{LL 
varMM 
scopesMM 
=MM 
InputMM "
.MM" #
ScopesConsentedMM# 2
;MM2 3
ifNN 
(NN 
ConsentOptionsNN "
.NN" #
EnableOfflineAccessNN# 6
==NN7 9
falseNN: ?
)NN? @
{OO 
scopesPP 
=PP 
scopesPP #
.PP# $
WherePP$ )
(PP) *
xPP* +
=>PP, .
xQQ 
!=QQ 
DuendeQQ #
.QQ# $
IdentityServerQQ$ 2
.QQ2 3#
IdentityServerConstantsQQ3 J
.QQJ K
StandardScopesQQK Y
.QQY Z
OfflineAccessQQZ g
)QQg h
;QQh i
}RR 
resultTT 
=TT 
newTT +
CompleteBackchannelLoginRequestTT <
(TT< =
InputTT= B
.TTB C
IdTTC E
)TTE F
{UU !
ScopesValuesConsentedVV )
=VV* +
scopesVV, 2
.VV2 3
ToArrayVV3 :
(VV: ;
)VV; <
,VV< =
DescriptionWW 
=WW  !
InputWW" '
.WW' (
DescriptionWW( 3
}XX 
;XX 
await[[ 
_events[[ 
.[[ 

RaiseAsync[[ (
([[( )
new[[) ,
ConsentGrantedEvent[[- @
([[@ A
User[[A E
.[[E F
GetSubjectId[[F R
([[R S
)[[S T
,[[T U
request[[V ]
.[[] ^
Client[[^ d
.[[d e
ClientId[[e m
,[[m n
request\\ 
.\\ 
ValidatedResources\\ .
.\\. /
RawScopeValues\\/ =
,\\= >
result\\? E
.\\E F!
ScopesValuesConsented\\F [
,\\[ \
false\\] b
)\\b c
)\\c d
;\\d e
}]] 
else^^ 
{__ 

ModelState`` 
.`` 
AddModelError`` (
(``( )
$str``) +
,``+ ,
ConsentOptions``- ;
.``; <%
MustChooseOneErrorMessage``< U
)``U V
;``V W
}aa 
}bb 	
elsecc 
{dd 	

ModelStateee 
.ee 
AddModelErroree $
(ee$ %
$stree% '
,ee' (
ConsentOptionsee) 7
.ee7 8(
InvalidSelectionErrorMessageee8 T
)eeT U
;eeU V
}ff 	
ifhh 

(hh 
resulthh 
!=hh 
nullhh 
)hh 
{ii 	
awaitkk 
_interactionkk 
.kk %
CompleteLoginRequestAsynckk 8
(kk8 9
resultkk9 ?
)kk? @
;kk@ A
returnmm 
RedirectToPagemm !
(mm! "
$strmm" -
)mm- .
;mm. /
}nn 	
Viewqq 
=qq 
awaitqq 
BuildViewModelAsyncqq (
(qq( )
Inputqq) .
.qq. /
Idqq/ 1
,qq1 2
Inputqq3 8
)qq8 9
;qq9 :
returnrr 
Pagerr 
(rr 
)rr 
;rr 
}ss 
privateuu 
asyncuu 
Taskuu 
<uu 
	ViewModeluu  
>uu  !
BuildViewModelAsyncuu" 5
(uu5 6
stringuu6 <
iduu= ?
,uu? @

InputModeluuA K
modeluuL Q
=uuR S
nulluuT X
)uuX Y
{vv 
varww 
requestww 
=ww 
awaitww 
_interactionww (
.ww( ),
 GetLoginRequestByInternalIdAsyncww) I
(wwI J
idwwJ L
)wwL M
;wwM N
ifxx 

(xx 
requestxx 
!=xx 
nullxx 
&&xx 
requestxx &
.xx& '
Subjectxx' .
.xx. /
GetSubjectIdxx/ ;
(xx; <
)xx< =
==xx> @
UserxxA E
.xxE F
GetSubjectIdxxF R
(xxR S
)xxS T
)xxT U
{yy 	
returnzz "
CreateConsentViewModelzz )
(zz) *
modelzz* /
,zz/ 0
idzz1 3
,zz3 4
requestzz5 <
)zz< =
;zz= >
}{{ 	
else|| 
{}} 	
_logger~~ 
.~~ 
LogError~~ 
(~~ 
$str~~ M
,~~M N
id~~O Q
)~~Q R
;~~R S
} 	
return
ÅÅ 
null
ÅÅ 
;
ÅÅ 
}
ÇÇ 
private
ÑÑ 
	ViewModel
ÑÑ $
CreateConsentViewModel
ÑÑ ,
(
ÑÑ, -

InputModel
ÖÖ 
model
ÖÖ 
,
ÖÖ 
string
ÖÖ  
id
ÖÖ! #
,
ÖÖ# $)
BackchannelUserLoginRequest
ÜÜ #
request
ÜÜ$ +
)
ÜÜ+ ,
{
áá 
var
àà 
vm
àà 
=
àà 
new
àà 
	ViewModel
àà 
{
ââ 	

ClientName
ää 
=
ää 
request
ää  
.
ää  !
Client
ää! '
.
ää' (

ClientName
ää( 2
??
ää3 5
request
ää6 =
.
ää= >
Client
ää> D
.
ääD E
ClientId
ääE M
,
ääM N
	ClientUrl
ãã 
=
ãã 
request
ãã 
.
ãã  
Client
ãã  &
.
ãã& '
	ClientUri
ãã' 0
,
ãã0 1
ClientLogoUrl
åå 
=
åå 
request
åå #
.
åå# $
Client
åå$ *
.
åå* +
LogoUri
åå+ 2
,
åå2 3
BindingMessage
çç 
=
çç 
request
çç $
.
çç$ %
BindingMessage
çç% 3
}
éé 	
;
éé	 

vm
êê 

.
êê
 
IdentityScopes
êê 
=
êê 
request
êê #
.
êê# $ 
ValidatedResources
êê$ 6
.
êê6 7
	Resources
êê7 @
.
êê@ A
IdentityResources
êêA R
.
ëë 
Select
ëë 
(
ëë 
x
ëë 
=>
ëë "
CreateScopeViewModel
ëë -
(
ëë- .
x
ëë. /
,
ëë/ 0
model
íí 
?
íí 
.
íí 
ScopesConsented
íí &
==
íí' )
null
íí* .
||
íí/ 1
model
íí2 7
.
íí7 8
ScopesConsented
íí8 G
?
ííG H
.
ííH I
Contains
ííI Q
(
ííQ R
x
ííR S
.
ííS T
Name
ííT X
)
ííX Y
==
ííZ \
true
íí] a
)
íía b
)
ííb c
.
ìì 
ToArray
ìì 
(
ìì 
)
ìì 
;
ìì 
var
ïï  
resourceIndicators
ïï 
=
ïï  
request
ïï! (
.
ïï( ))
RequestedResourceIndicators
ïï) D
??
ïïE G

Enumerable
ïïH R
.
ïïR S
Empty
ïïS X
<
ïïX Y
string
ïïY _
>
ïï_ `
(
ïï` a
)
ïïa b
;
ïïb c
var
ññ 
apiResources
ññ 
=
ññ 
request
óó 
.
óó  
ValidatedResources
óó &
.
óó& '
	Resources
óó' 0
.
óó0 1
ApiResources
óó1 =
.
óó= >
Where
óó> C
(
óóC D
x
óóD E
=>
óóF H 
resourceIndicators
óóI [
.
óó[ \
Contains
óó\ d
(
óód e
x
óóe f
.
óóf g
Name
óóg k
)
óók l
)
óól m
;
óóm n
var
ôô 
	apiScopes
ôô 
=
ôô 
new
ôô 
List
ôô  
<
ôô  !
ScopeViewModel
ôô! /
>
ôô/ 0
(
ôô0 1
)
ôô1 2
;
ôô2 3
foreach
öö 
(
öö 
var
öö 
parsedScope
öö  
in
öö! #
request
öö$ +
.
öö+ , 
ValidatedResources
öö, >
.
öö> ?
ParsedScopes
öö? K
)
ööK L
{
õõ 	
var
úú 
apiScope
úú 
=
úú 
request
úú "
.
úú" # 
ValidatedResources
úú# 5
.
úú5 6
	Resources
úú6 ?
.
úú? @
FindApiScope
úú@ L
(
úúL M
parsedScope
úúM X
.
úúX Y

ParsedName
úúY c
)
úúc d
;
úúd e
if
ùù 
(
ùù 
apiScope
ùù 
!=
ùù 
null
ùù  
)
ùù  !
{
ûû 
var
üü 
scopeVm
üü 
=
üü "
CreateScopeViewModel
üü 2
(
üü2 3
parsedScope
üü3 >
,
üü> ?
apiScope
üü@ H
,
üüH I
model
†† 
==
†† 
null
†† !
||
††" $
model
††% *
.
††* +
ScopesConsented
††+ :
?
††: ;
.
††; <
Contains
††< D
(
††D E
parsedScope
††E P
.
††P Q
RawValue
††Q Y
)
††Y Z
==
††[ ]
true
††^ b
)
††b c
;
††c d
scopeVm
°° 
.
°° 
	Resources
°° !
=
°°" #
apiResources
°°$ 0
.
°°0 1
Where
°°1 6
(
°°6 7
x
°°7 8
=>
°°9 ;
x
°°< =
.
°°= >
Scopes
°°> D
.
°°D E
Contains
°°E M
(
°°M N
parsedScope
°°N Y
.
°°Y Z

ParsedName
°°Z d
)
°°d e
)
°°e f
.
¢¢ 
Select
¢¢ 
(
¢¢ 
x
¢¢ 
=>
¢¢  
new
¢¢! $
ResourceViewModel
¢¢% 6
{
££ 
Name
§§ 
=
§§ 
x
§§  
.
§§  !
Name
§§! %
,
§§% &
DisplayName
•• #
=
••$ %
x
••& '
.
••' (
DisplayName
••( 3
??
••4 6
x
••7 8
.
••8 9
Name
••9 =
,
••= >
}
¶¶ 
)
¶¶ 
.
¶¶ 
ToArray
¶¶ 
(
¶¶ 
)
¶¶  
;
¶¶  !
	apiScopes
ßß 
.
ßß 
Add
ßß 
(
ßß 
scopeVm
ßß %
)
ßß% &
;
ßß& '
}
®® 
}
©© 	
if
´´ 

(
´´ 
ConsentOptions
´´ 
.
´´ !
EnableOfflineAccess
´´ .
&&
´´/ 1
request
´´2 9
.
´´9 : 
ValidatedResources
´´: L
.
´´L M
	Resources
´´M V
.
´´V W
OfflineAccess
´´W d
)
´´d e
{
¨¨ 	
	apiScopes
≠≠ 
.
≠≠ 
Add
≠≠ 
(
≠≠ #
GetOfflineAccessScope
≠≠ /
(
≠≠/ 0
model
≠≠0 5
==
≠≠6 8
null
≠≠9 =
||
≠≠> @
model
ÆÆ0 5
.
ÆÆ5 6
ScopesConsented
ÆÆ6 E
?
ÆÆE F
.
ÆÆF G
Contains
ÆÆG O
(
ÆÆO P
Duende
ÆÆP V
.
ÆÆV W
IdentityServer
ÆÆW e
.
ØØ4 5%
IdentityServerConstants
ØØ5 L
.
ØØL M
StandardScopes
ØØM [
.
ØØ[ \
OfflineAccess
ØØ\ i
)
ØØi j
==
ØØk m
true
ØØn r
)
ØØr s
)
ØØs t
;
ØØt u
}
∞∞ 	
vm
≤≤ 

.
≤≤
 
	ApiScopes
≤≤ 
=
≤≤ 
	apiScopes
≤≤  
;
≤≤  !
return
¥¥ 
vm
¥¥ 
;
¥¥ 
}
µµ 
private
∑∑ 
ScopeViewModel
∑∑ "
CreateScopeViewModel
∑∑ /
(
∑∑/ 0
IdentityResource
∑∑0 @
identity
∑∑A I
,
∑∑I J
bool
∑∑K O
check
∑∑P U
)
∑∑U V
{
∏∏ 
return
ππ 
new
ππ 
ScopeViewModel
ππ !
{
∫∫ 	
Name
ªª 
=
ªª 
identity
ªª 
.
ªª 
Name
ªª  
,
ªª  !
Value
ºº 
=
ºº 
identity
ºº 
.
ºº 
Name
ºº !
,
ºº! "
DisplayName
ΩΩ 
=
ΩΩ 
identity
ΩΩ "
.
ΩΩ" #
DisplayName
ΩΩ# .
??
ΩΩ/ 1
identity
ΩΩ2 :
.
ΩΩ: ;
Name
ΩΩ; ?
,
ΩΩ? @
Description
ææ 
=
ææ 
identity
ææ "
.
ææ" #
Description
ææ# .
,
ææ. /
	Emphasize
øø 
=
øø 
identity
øø  
.
øø  !
	Emphasize
øø! *
,
øø* +
Required
¿¿ 
=
¿¿ 
identity
¿¿ 
.
¿¿  
Required
¿¿  (
,
¿¿( )
Checked
¡¡ 
=
¡¡ 
check
¡¡ 
||
¡¡ 
identity
¡¡ '
.
¡¡' (
Required
¡¡( 0
}
¬¬ 	
;
¬¬	 

}
√√ 
public
≈≈ 

ScopeViewModel
≈≈ "
CreateScopeViewModel
≈≈ .
(
≈≈. /
ParsedScopeValue
≈≈/ ?
parsedScopeValue
≈≈@ P
,
≈≈P Q
ApiScope
≈≈R Z
apiScope
≈≈[ c
,
≈≈c d
bool
≈≈e i
check
≈≈j o
)
≈≈o p
{
∆∆ 
var
«« 
displayName
«« 
=
«« 
apiScope
«« "
.
««" #
DisplayName
««# .
??
««/ 1
apiScope
««2 :
.
««: ;
Name
««; ?
;
««? @
if
»» 

(
»» 
!
»» 
String
»» 
.
»»  
IsNullOrWhiteSpace
»» &
(
»»& '
parsedScopeValue
»»' 7
.
»»7 8
ParsedParameter
»»8 G
)
»»G H
)
»»H I
{
…… 	
displayName
   
+=
   
$str
   
+
    
parsedScopeValue
  ! 1
.
  1 2
ParsedParameter
  2 A
;
  A B
}
ÀÀ 	
return
ÕÕ 
new
ÕÕ 
ScopeViewModel
ÕÕ !
{
ŒŒ 	
Name
œœ 
=
œœ 
parsedScopeValue
œœ #
.
œœ# $

ParsedName
œœ$ .
,
œœ. /
Value
–– 
=
–– 
parsedScopeValue
–– $
.
––$ %
RawValue
––% -
,
––- .
DisplayName
—— 
=
—— 
displayName
—— %
,
——% &
Description
““ 
=
““ 
apiScope
““ "
.
““" #
Description
““# .
,
““. /
	Emphasize
”” 
=
”” 
apiScope
””  
.
””  !
	Emphasize
””! *
,
””* +
Required
‘‘ 
=
‘‘ 
apiScope
‘‘ 
.
‘‘  
Required
‘‘  (
,
‘‘( )
Checked
’’ 
=
’’ 
check
’’ 
||
’’ 
apiScope
’’ '
.
’’' (
Required
’’( 0
}
÷÷ 	
;
÷÷	 

}
◊◊ 
private
ŸŸ 
ScopeViewModel
ŸŸ #
GetOfflineAccessScope
ŸŸ 0
(
ŸŸ0 1
bool
ŸŸ1 5
check
ŸŸ6 ;
)
ŸŸ; <
{
⁄⁄ 
return
€€ 
new
€€ 
ScopeViewModel
€€ !
{
‹‹ 	
Value
›› 
=
›› 
Duende
›› 
.
›› 
IdentityServer
›› )
.
››) *%
IdentityServerConstants
››* A
.
››A B
StandardScopes
››B P
.
››P Q
OfflineAccess
››Q ^
,
››^ _
DisplayName
ﬁﬁ 
=
ﬁﬁ 
ConsentOptions
ﬁﬁ (
.
ﬁﬁ( )&
OfflineAccessDisplayName
ﬁﬁ) A
,
ﬁﬁA B
Description
ﬂﬂ 
=
ﬂﬂ 
ConsentOptions
ﬂﬂ (
.
ﬂﬂ( )&
OfflineAccessDescription
ﬂﬂ) A
,
ﬂﬂA B
	Emphasize
‡‡ 
=
‡‡ 
true
‡‡ 
,
‡‡ 
Checked
·· 
=
·· 
check
·· 
}
‚‚ 	
;
‚‚	 

}
„„ 
}‰‰ ±
M/Users/pavel/project/NetMentoring/IdentityServer/Pages/Ciba/ConsentOptions.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Ciba #
;# $
public 
class 
ConsentOptions 
{ 
public		 

static		 
bool		 
EnableOfflineAccess		 *
=		+ ,
true		- 1
;		1 2
public

 

static

 
string

 $
OfflineAccessDisplayName

 1
=

2 3
$str

4 D
;

D E
public 

static 
string $
OfflineAccessDescription 1
=2 3
$str N
;N O
public 

static 
readonly 
string !%
MustChooseOneErrorMessage" ;
=< =
$str> e
;e f
public 

static 
readonly 
string !(
InvalidSelectionErrorMessage" >
=? @
$strA T
;T U
} Ä
K/Users/pavel/project/NetMentoring/IdentityServer/Pages/Ciba/Index.cshtml.cs
	namespace

 	
IdentityServer


 
.

 
Pages

 
.

 
Ciba

 #
;

# $
[ 
AllowAnonymous 
] 
[ 
SecurityHeaders 
] 
public 
class 

IndexModel 
: 
	PageModel #
{ 
public 
'
BackchannelUserLoginRequest &
LoginRequest' 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
private 
readonly 8
,IBackchannelAuthenticationInteractionService A1
%_backchannelAuthenticationInteractionB g
;g h
private 
readonly 
ILogger 
< 

IndexModel '
>' (
_logger) 0
;0 1
public 


IndexModel 
( 8
,IBackchannelAuthenticationInteractionService B7
+backchannelAuthenticationInteractionServiceC n
,n o
ILogger 
< 

IndexModel 
> 
logger "
)" #
{ 1
%_backchannelAuthenticationInteraction -
=. /7
+backchannelAuthenticationInteractionService0 [
;[ \
_logger 
= 
logger 
; 
} 
public 

async 
Task 
< 
IActionResult #
># $
OnGet% *
(* +
string+ 1
id2 4
)4 5
{ 
LoginRequest 
= 
await 1
%_backchannelAuthenticationInteraction B
.B C,
 GetLoginRequestByInternalIdAsyncC c
(c d
idd f
)f g
;g h
if 

( 
LoginRequest 
== 
null  
)  !
{   	
_logger!! 
.!! 

LogWarning!! 
(!! 
$str!! B
,!!B C
id!!D F
)!!F G
;!!G H
return"" 
RedirectToPage"" !
(""! "
$str""" 5
)""5 6
;""6 7
}## 	
return%% 
Page%% 
(%% 
)%% 
;%% 
}&& 
}'' Œ
I/Users/pavel/project/NetMentoring/IdentityServer/Pages/Ciba/InputModel.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Ciba #
;# $
public 
class 

InputModel 
{ 
public 

string 
Button 
{ 
get 
; 
set  #
;# $
}% &
public		 

IEnumerable		 
<		 
string		 
>		 
ScopesConsented		 .
{		/ 0
get		1 4
;		4 5
set		6 9
;		9 :
}		; <
public

 

string

 
Id

 
{

 
get

 
;

 
set

 
;

  
}

! "
public 

string 
Description 
{ 
get  #
;# $
set% (
;( )
}* +
} Í
H/Users/pavel/project/NetMentoring/IdentityServer/Pages/Ciba/ViewModel.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Ciba #
;# $
public 
class 
	ViewModel 
{ 
public 

string 

ClientName 
{ 
get "
;" #
set$ '
;' (
}) *
public		 

string		 
	ClientUrl		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 

string

 
ClientLogoUrl

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 

string 
BindingMessage  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 

IEnumerable 
< 
ScopeViewModel %
>% &
IdentityScopes' 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 

IEnumerable 
< 
ScopeViewModel %
>% &
	ApiScopes' 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
} 
public 
class 
ScopeViewModel 
{ 
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
public 

string 
Value 
{ 
get 
; 
set "
;" #
}$ %
public 

string 
DisplayName 
{ 
get  #
;# $
set% (
;( )
}* +
public 

string 
Description 
{ 
get  #
;# $
set% (
;( )
}* +
public 

bool 
	Emphasize 
{ 
get 
;  
set! $
;$ %
}& '
public 

bool 
Required 
{ 
get 
; 
set  #
;# $
}% &
public 

bool 
Checked 
{ 
get 
; 
set "
;" #
}$ %
public 

IEnumerable 
< 
ResourceViewModel (
>( )
	Resources* 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
} 
public 
class 
ResourceViewModel 
{ 
public   

string   
Name   
{   
get   
;   
set   !
;  ! "
}  # $
public!! 

string!! 
DisplayName!! 
{!! 
get!!  #
;!!# $
set!!% (
;!!( )
}!!* +
}"" ∑
P/Users/pavel/project/NetMentoring/IdentityServer/Pages/Consent/ConsentOptions.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Consent &
;& '
public 
class 
ConsentOptions 
{ 
public		 

static		 
bool		 
EnableOfflineAccess		 *
=		+ ,
true		- 1
;		1 2
public

 

static

 
string

 $
OfflineAccessDisplayName

 1
=

2 3
$str

4 D
;

D E
public 

static 
string $
OfflineAccessDescription 1
=2 3
$str N
;N O
public 

static 
readonly 
string !%
MustChooseOneErrorMessage" ;
=< =
$str> e
;e f
public 

static 
readonly 
string !(
InvalidSelectionErrorMessage" >
=? @
$strA T
;T U
} ∏¶
N/Users/pavel/project/NetMentoring/IdentityServer/Pages/Consent/Index.cshtml.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Consent &
;& '
[ 
	Authorize 

]
 
[ $
SecurityHeadersAttribute 
] 
public 
class 
Index 
: 
	PageModel 
{ 
private 
readonly -
!IIdentityServerInteractionService 6
_interaction7 C
;C D
private 
readonly 
IEventService "
_events# *
;* +
private 
readonly 
ILogger 
< 
Index "
>" #
_logger$ +
;+ ,
public 

Index 
( -
!IIdentityServerInteractionService )
interaction* 5
,5 6
IEventService 
events 
, 
ILogger 
< 
Index 
> 
logger 
) 
{ 
_interaction 
= 
interaction "
;" #
_events 
= 
events 
; 
_logger 
= 
logger 
; 
} 
public 

	ViewModel 
View 
{ 
get 
;  
set! $
;$ %
}& '
[!! 
BindProperty!! 
]!! 
public!! 

InputModel!! $
Input!!% *
{!!+ ,
get!!- 0
;!!0 1
set!!2 5
;!!5 6
}!!7 8
public## 

async## 
Task## 
<## 
IActionResult## #
>### $
OnGet##% *
(##* +
string##+ 1
	returnUrl##2 ;
)##; <
{$$ 
View%% 
=%% 
await%% 
BuildViewModelAsync%% (
(%%( )
	returnUrl%%) 2
)%%2 3
;%%3 4
if&& 

(&& 
View&& 
==&& 
null&& 
)&& 
{'' 	
return(( 
RedirectToPage(( !
(((! "
$str((" 5
)((5 6
;((6 7
})) 	
Input++ 
=++ 
new++ 

InputModel++ 
{,, 	
	ReturnUrl-- 
=-- 
	returnUrl-- !
,--! "
}.. 	
;..	 

return00 
Page00 
(00 
)00 
;00 
}11 
public33 

async33 
Task33 
<33 
IActionResult33 #
>33# $
OnPost33% +
(33+ ,
)33, -
{44 
var66 
request66 
=66 
await66 
_interaction66 (
.66( )(
GetAuthorizationContextAsync66) E
(66E F
Input66F K
.66K L
	ReturnUrl66L U
)66U V
;66V W
if77 

(77 
request77 
==77 
null77 
)77 
return77 #
RedirectToPage77$ 2
(772 3
$str773 F
)77F G
;77G H
ConsentResponse99 
grantedConsent99 &
=99' (
null99) -
;99- .
if<< 

(<< 
Input<< 
?<< 
.<< 
Button<< 
==<< 
$str<< !
)<<! "
{== 	
grantedConsent>> 
=>> 
new>>  
ConsentResponse>>! 0
{>>1 2
Error>>3 8
=>>9 :
AuthorizationError>>; M
.>>M N
AccessDenied>>N Z
}>>[ \
;>>\ ]
awaitAA 
_eventsAA 
.AA 

RaiseAsyncAA $
(AA$ %
newAA% (
ConsentDeniedEventAA) ;
(AA; <
UserAA< @
.AA@ A
GetSubjectIdAAA M
(AAM N
)AAN O
,AAO P
requestAAQ X
.AAX Y
ClientAAY _
.AA_ `
ClientIdAA` h
,AAh i
requestBB 
.BB 
ValidatedResourcesBB *
.BB* +
RawScopeValuesBB+ 9
)BB9 :
)BB: ;
;BB; <
}CC 	
elseEE 
ifEE 
(EE 
InputEE 
?EE 
.EE 
ButtonEE 
==EE !
$strEE" '
)EE' (
{FF 	
ifHH 
(HH 
InputHH 
.HH 
ScopesConsentedHH %
!=HH& (
nullHH) -
&&HH. 0
InputHH1 6
.HH6 7
ScopesConsentedHH7 F
.HHF G
AnyHHG J
(HHJ K
)HHK L
)HHL M
{II 
varJJ 
scopesJJ 
=JJ 
InputJJ "
.JJ" #
ScopesConsentedJJ# 2
;JJ2 3
ifKK 
(KK 
ConsentOptionsKK "
.KK" #
EnableOfflineAccessKK# 6
==KK7 9
falseKK: ?
)KK? @
{LL 
scopesMM 
=MM 
scopesMM #
.MM# $
WhereMM$ )
(MM) *
xMM* +
=>MM, .
xNN 
!=NN 
DuendeNN #
.NN# $
IdentityServerNN$ 2
.NN2 3#
IdentityServerConstantsNN3 J
.NNJ K
StandardScopesNNK Y
.NNY Z
OfflineAccessNNZ g
)NNg h
;NNh i
}OO 
grantedConsentQQ 
=QQ  
newQQ! $
ConsentResponseQQ% 4
{RR 
RememberConsentSS #
=SS$ %
InputSS& +
.SS+ ,
RememberConsentSS, ;
,SS; <!
ScopesValuesConsentedTT )
=TT* +
scopesTT, 2
.TT2 3
ToArrayTT3 :
(TT: ;
)TT; <
,TT< =
DescriptionUU 
=UU  !
InputUU" '
.UU' (
DescriptionUU( 3
}VV 
;VV 
awaitYY 
_eventsYY 
.YY 

RaiseAsyncYY (
(YY( )
newYY) ,
ConsentGrantedEventYY- @
(YY@ A
UserYYA E
.YYE F
GetSubjectIdYYF R
(YYR S
)YYS T
,YYT U
requestYYV ]
.YY] ^
ClientYY^ d
.YYd e
ClientIdYYe m
,YYm n
requestZZ 
.ZZ 
ValidatedResourcesZZ .
.ZZ. /
RawScopeValuesZZ/ =
,ZZ= >
grantedConsentZZ? M
.ZZM N!
ScopesValuesConsentedZZN c
,ZZc d
grantedConsent[[ "
.[[" #
RememberConsent[[# 2
)[[2 3
)[[3 4
;[[4 5
}\\ 
else]] 
{^^ 

ModelState__ 
.__ 
AddModelError__ (
(__( )
$str__) +
,__+ ,
ConsentOptions__- ;
.__; <%
MustChooseOneErrorMessage__< U
)__U V
;__V W
}`` 
}aa 	
elsebb 
{cc 	

ModelStatedd 
.dd 
AddModelErrordd $
(dd$ %
$strdd% '
,dd' (
ConsentOptionsdd) 7
.dd7 8(
InvalidSelectionErrorMessagedd8 T
)ddT U
;ddU V
}ee 	
ifgg 

(gg 
grantedConsentgg 
!=gg 
nullgg "
)gg" #
{hh 	
awaitjj 
_interactionjj 
.jj 
GrantConsentAsyncjj 0
(jj0 1
requestjj1 8
,jj8 9
grantedConsentjj: H
)jjH I
;jjI J
ifmm 
(mm 
requestmm 
.mm 
IsNativeClientmm &
(mm& '
)mm' (
==mm) +
truemm, 0
)mm0 1
{nn 
returnqq 
thisqq 
.qq 
LoadingPageqq '
(qq' (
Inputqq( -
.qq- .
	ReturnUrlqq. 7
)qq7 8
;qq8 9
}rr 
returntt 
Redirecttt 
(tt 
Inputtt !
.tt! "
	ReturnUrltt" +
)tt+ ,
;tt, -
}uu 	
Viewxx 
=xx 
awaitxx 
BuildViewModelAsyncxx (
(xx( )
Inputxx) .
.xx. /
	ReturnUrlxx/ 8
,xx8 9
Inputxx: ?
)xx? @
;xx@ A
returnyy 
Pageyy 
(yy 
)yy 
;yy 
}zz 
private|| 
async|| 
Task|| 
<|| 
	ViewModel||  
>||  !
BuildViewModelAsync||" 5
(||5 6
string||6 <
	returnUrl||= F
,||F G

InputModel||H R
model||S X
=||Y Z
null||[ _
)||_ `
{}} 
var~~ 
request~~ 
=~~ 
await~~ 
_interaction~~ (
.~~( )(
GetAuthorizationContextAsync~~) E
(~~E F
	returnUrl~~F O
)~~O P
;~~P Q
if 

( 
request 
!= 
null 
) 
{
ÄÄ 	
return
ÅÅ $
CreateConsentViewModel
ÅÅ )
(
ÅÅ) *
model
ÅÅ* /
,
ÅÅ/ 0
	returnUrl
ÅÅ1 :
,
ÅÅ: ;
request
ÅÅ< C
)
ÅÅC D
;
ÅÅD E
}
ÇÇ 	
else
ÉÉ 
{
ÑÑ 	
_logger
ÖÖ 
.
ÖÖ 
LogError
ÖÖ 
(
ÖÖ 
$str
ÖÖ G
,
ÖÖG H
	returnUrl
ÖÖI R
)
ÖÖR S
;
ÖÖS T
}
ÜÜ 	
return
àà 
null
àà 
;
àà 
}
ââ 
private
ãã 
	ViewModel
ãã $
CreateConsentViewModel
ãã ,
(
ãã, -

InputModel
åå 
model
åå 
,
åå 
string
åå  
	returnUrl
åå! *
,
åå* +"
AuthorizationRequest
çç 
request
çç $
)
çç$ %
{
éé 
var
èè 
vm
èè 
=
èè 
new
èè 
	ViewModel
èè 
{
êê 	

ClientName
ëë 
=
ëë 
request
ëë  
.
ëë  !
Client
ëë! '
.
ëë' (

ClientName
ëë( 2
??
ëë3 5
request
ëë6 =
.
ëë= >
Client
ëë> D
.
ëëD E
ClientId
ëëE M
,
ëëM N
	ClientUrl
íí 
=
íí 
request
íí 
.
íí  
Client
íí  &
.
íí& '
	ClientUri
íí' 0
,
íí0 1
ClientLogoUrl
ìì 
=
ìì 
request
ìì #
.
ìì# $
Client
ìì$ *
.
ìì* +
LogoUri
ìì+ 2
,
ìì2 3"
AllowRememberConsent
îî  
=
îî! "
request
îî# *
.
îî* +
Client
îî+ 1
.
îî1 2"
AllowRememberConsent
îî2 F
}
ïï 	
;
ïï	 

vm
óó 

.
óó
 
IdentityScopes
óó 
=
óó 
request
óó #
.
óó# $ 
ValidatedResources
óó$ 6
.
óó6 7
	Resources
óó7 @
.
óó@ A
IdentityResources
óóA R
.
òò 
Select
òò 
(
òò 
x
òò 
=>
òò "
CreateScopeViewModel
òò -
(
òò- .
x
òò. /
,
òò/ 0
model
ôô 
?
ôô 
.
ôô 
ScopesConsented
ôô &
==
ôô' )
null
ôô* .
||
ôô/ 1
model
ôô2 7
.
ôô7 8
ScopesConsented
ôô8 G
?
ôôG H
.
ôôH I
Contains
ôôI Q
(
ôôQ R
x
ôôR S
.
ôôS T
Name
ôôT X
)
ôôX Y
==
ôôZ \
true
ôô] a
)
ôôa b
)
ôôb c
.
öö 
ToArray
öö 
(
öö 
)
öö 
;
öö 
var
úú  
resourceIndicators
úú 
=
úú  
request
úú! (
.
úú( )

Parameters
úú) 3
.
úú3 4
	GetValues
úú4 =
(
úú= >
OidcConstants
úú> K
.
úúK L
AuthorizeRequest
úúL \
.
úú\ ]
Resource
úú] e
)
úúe f
??
úúg i

Enumerable
ùù! +
.
ùù+ ,
Empty
ùù, 1
<
ùù1 2
string
ùù2 8
>
ùù8 9
(
ùù9 :
)
ùù: ;
;
ùù; <
var
ûû 
apiResources
ûû 
=
ûû 
request
üü 
.
üü  
ValidatedResources
üü &
.
üü& '
	Resources
üü' 0
.
üü0 1
ApiResources
üü1 =
.
üü= >
Where
üü> C
(
üüC D
x
üüD E
=>
üüF H 
resourceIndicators
üüI [
.
üü[ \
Contains
üü\ d
(
üüd e
x
üüe f
.
üüf g
Name
üüg k
)
üük l
)
üül m
;
üüm n
var
°° 
	apiScopes
°° 
=
°° 
new
°° 
List
°°  
<
°°  !
ScopeViewModel
°°! /
>
°°/ 0
(
°°0 1
)
°°1 2
;
°°2 3
foreach
¢¢ 
(
¢¢ 
var
¢¢ 
parsedScope
¢¢  
in
¢¢! #
request
¢¢$ +
.
¢¢+ , 
ValidatedResources
¢¢, >
.
¢¢> ?
ParsedScopes
¢¢? K
)
¢¢K L
{
££ 	
var
§§ 
apiScope
§§ 
=
§§ 
request
§§ "
.
§§" # 
ValidatedResources
§§# 5
.
§§5 6
	Resources
§§6 ?
.
§§? @
FindApiScope
§§@ L
(
§§L M
parsedScope
§§M X
.
§§X Y

ParsedName
§§Y c
)
§§c d
;
§§d e
if
•• 
(
•• 
apiScope
•• 
!=
•• 
null
••  
)
••  !
{
¶¶ 
var
ßß 
scopeVm
ßß 
=
ßß "
CreateScopeViewModel
ßß 2
(
ßß2 3
parsedScope
ßß3 >
,
ßß> ?
apiScope
ßß@ H
,
ßßH I
model
®® 
==
®® 
null
®® !
||
®®" $
model
®®% *
.
®®* +
ScopesConsented
®®+ :
?
®®: ;
.
®®; <
Contains
®®< D
(
®®D E
parsedScope
®®E P
.
®®P Q
RawValue
®®Q Y
)
®®Y Z
==
®®[ ]
true
®®^ b
)
®®b c
;
®®c d
scopeVm
©© 
.
©© 
	Resources
©© !
=
©©" #
apiResources
©©$ 0
.
©©0 1
Where
©©1 6
(
©©6 7
x
©©7 8
=>
©©9 ;
x
©©< =
.
©©= >
Scopes
©©> D
.
©©D E
Contains
©©E M
(
©©M N
parsedScope
©©N Y
.
©©Y Z

ParsedName
©©Z d
)
©©d e
)
©©e f
.
™™ 
Select
™™ 
(
™™ 
x
™™ 
=>
™™  
new
™™! $
ResourceViewModel
™™% 6
{
´´ 
Name
¨¨ 
=
¨¨ 
x
¨¨  
.
¨¨  !
Name
¨¨! %
,
¨¨% &
DisplayName
≠≠ #
=
≠≠$ %
x
≠≠& '
.
≠≠' (
DisplayName
≠≠( 3
??
≠≠4 6
x
≠≠7 8
.
≠≠8 9
Name
≠≠9 =
,
≠≠= >
}
ÆÆ 
)
ÆÆ 
.
ÆÆ 
ToArray
ÆÆ 
(
ÆÆ 
)
ÆÆ  
;
ÆÆ  !
	apiScopes
ØØ 
.
ØØ 
Add
ØØ 
(
ØØ 
scopeVm
ØØ %
)
ØØ% &
;
ØØ& '
}
∞∞ 
}
±± 	
if
≥≥ 

(
≥≥ 
ConsentOptions
≥≥ 
.
≥≥ !
EnableOfflineAccess
≥≥ .
&&
≥≥/ 1
request
≥≥2 9
.
≥≥9 : 
ValidatedResources
≥≥: L
.
≥≥L M
	Resources
≥≥M V
.
≥≥V W
OfflineAccess
≥≥W d
)
≥≥d e
{
¥¥ 	
	apiScopes
µµ 
.
µµ 
Add
µµ 
(
µµ #
GetOfflineAccessScope
µµ /
(
µµ/ 0
model
µµ0 5
==
µµ6 8
null
µµ9 =
||
µµ> @
model
∂∂0 5
.
∂∂5 6
ScopesConsented
∂∂6 E
?
∂∂E F
.
∂∂F G
Contains
∂∂G O
(
∂∂O P
Duende
∂∂P V
.
∂∂V W
IdentityServer
∂∂W e
.
∑∑4 5%
IdentityServerConstants
∑∑5 L
.
∑∑L M
StandardScopes
∑∑M [
.
∑∑[ \
OfflineAccess
∑∑\ i
)
∑∑i j
==
∑∑k m
true
∑∑n r
)
∑∑r s
)
∑∑s t
;
∑∑t u
}
∏∏ 	
vm
∫∫ 

.
∫∫
 
	ApiScopes
∫∫ 
=
∫∫ 
	apiScopes
∫∫  
;
∫∫  !
return
ºº 
vm
ºº 
;
ºº 
}
ΩΩ 
private
øø 
ScopeViewModel
øø "
CreateScopeViewModel
øø /
(
øø/ 0
IdentityResource
øø0 @
identity
øøA I
,
øøI J
bool
øøK O
check
øøP U
)
øøU V
{
¿¿ 
return
¡¡ 
new
¡¡ 
ScopeViewModel
¡¡ !
{
¬¬ 	
Name
√√ 
=
√√ 
identity
√√ 
.
√√ 
Name
√√  
,
√√  !
Value
ƒƒ 
=
ƒƒ 
identity
ƒƒ 
.
ƒƒ 
Name
ƒƒ !
,
ƒƒ! "
DisplayName
≈≈ 
=
≈≈ 
identity
≈≈ "
.
≈≈" #
DisplayName
≈≈# .
??
≈≈/ 1
identity
≈≈2 :
.
≈≈: ;
Name
≈≈; ?
,
≈≈? @
Description
∆∆ 
=
∆∆ 
identity
∆∆ "
.
∆∆" #
Description
∆∆# .
,
∆∆. /
	Emphasize
«« 
=
«« 
identity
««  
.
««  !
	Emphasize
««! *
,
««* +
Required
»» 
=
»» 
identity
»» 
.
»»  
Required
»»  (
,
»»( )
Checked
…… 
=
…… 
check
…… 
||
…… 
identity
…… '
.
……' (
Required
……( 0
}
   	
;
  	 

}
ÀÀ 
public
ÕÕ 

ScopeViewModel
ÕÕ "
CreateScopeViewModel
ÕÕ .
(
ÕÕ. /
ParsedScopeValue
ÕÕ/ ?
parsedScopeValue
ÕÕ@ P
,
ÕÕP Q
ApiScope
ÕÕR Z
apiScope
ÕÕ[ c
,
ÕÕc d
bool
ÕÕe i
check
ÕÕj o
)
ÕÕo p
{
ŒŒ 
var
œœ 
displayName
œœ 
=
œœ 
apiScope
œœ "
.
œœ" #
DisplayName
œœ# .
??
œœ/ 1
apiScope
œœ2 :
.
œœ: ;
Name
œœ; ?
;
œœ? @
if
–– 

(
–– 
!
–– 
String
–– 
.
––  
IsNullOrWhiteSpace
–– &
(
––& '
parsedScopeValue
––' 7
.
––7 8
ParsedParameter
––8 G
)
––G H
)
––H I
{
—— 	
displayName
““ 
+=
““ 
$str
““ 
+
““  
parsedScopeValue
““! 1
.
““1 2
ParsedParameter
““2 A
;
““A B
}
”” 	
return
’’ 
new
’’ 
ScopeViewModel
’’ !
{
÷÷ 	
Name
◊◊ 
=
◊◊ 
parsedScopeValue
◊◊ #
.
◊◊# $

ParsedName
◊◊$ .
,
◊◊. /
Value
ÿÿ 
=
ÿÿ 
parsedScopeValue
ÿÿ $
.
ÿÿ$ %
RawValue
ÿÿ% -
,
ÿÿ- .
DisplayName
ŸŸ 
=
ŸŸ 
displayName
ŸŸ %
,
ŸŸ% &
Description
⁄⁄ 
=
⁄⁄ 
apiScope
⁄⁄ "
.
⁄⁄" #
Description
⁄⁄# .
,
⁄⁄. /
	Emphasize
€€ 
=
€€ 
apiScope
€€  
.
€€  !
	Emphasize
€€! *
,
€€* +
Required
‹‹ 
=
‹‹ 
apiScope
‹‹ 
.
‹‹  
Required
‹‹  (
,
‹‹( )
Checked
›› 
=
›› 
check
›› 
||
›› 
apiScope
›› '
.
››' (
Required
››( 0
}
ﬁﬁ 	
;
ﬁﬁ	 

}
ﬂﬂ 
private
·· 
ScopeViewModel
·· #
GetOfflineAccessScope
·· 0
(
··0 1
bool
··1 5
check
··6 ;
)
··; <
{
‚‚ 
return
„„ 
new
„„ 
ScopeViewModel
„„ !
{
‰‰ 	
Value
ÂÂ 
=
ÂÂ 
Duende
ÂÂ 
.
ÂÂ 
IdentityServer
ÂÂ )
.
ÂÂ) *%
IdentityServerConstants
ÂÂ* A
.
ÂÂA B
StandardScopes
ÂÂB P
.
ÂÂP Q
OfflineAccess
ÂÂQ ^
,
ÂÂ^ _
DisplayName
ÊÊ 
=
ÊÊ 
ConsentOptions
ÊÊ (
.
ÊÊ( )&
OfflineAccessDisplayName
ÊÊ) A
,
ÊÊA B
Description
ÁÁ 
=
ÁÁ 
ConsentOptions
ÁÁ (
.
ÁÁ( )&
OfflineAccessDescription
ÁÁ) A
,
ÁÁA B
	Emphasize
ËË 
=
ËË 
true
ËË 
,
ËË 
Checked
ÈÈ 
=
ÈÈ 
check
ÈÈ 
}
ÍÍ 	
;
ÍÍ	 

}
ÎÎ 
}ÏÏ ¨	
L/Users/pavel/project/NetMentoring/IdentityServer/Pages/Consent/InputModel.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Consent &
;& '
public 
class 

InputModel 
{ 
public 

string 
Button 
{ 
get 
; 
set  #
;# $
}% &
public		 

IEnumerable		 
<		 
string		 
>		 
ScopesConsented		 .
{		/ 0
get		1 4
;		4 5
set		6 9
;		9 :
}		; <
public

 

bool

 
RememberConsent

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
=

. /
true

0 4
;

4 5
public 

string 
	ReturnUrl 
{ 
get !
;! "
set# &
;& '
}( )
public 

string 
Description 
{ 
get  #
;# $
set% (
;( )
}* +
} Ù
K/Users/pavel/project/NetMentoring/IdentityServer/Pages/Consent/ViewModel.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Consent &
;& '
public 
class 
	ViewModel 
{ 
public 

string 

ClientName 
{ 
get "
;" #
set$ '
;' (
}) *
public		 

string		 
	ClientUrl		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 

string

 
ClientLogoUrl

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 

bool  
AllowRememberConsent $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 

IEnumerable 
< 
ScopeViewModel %
>% &
IdentityScopes' 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 

IEnumerable 
< 
ScopeViewModel %
>% &
	ApiScopes' 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
} 
public 
class 
ScopeViewModel 
{ 
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
public 

string 
Value 
{ 
get 
; 
set "
;" #
}$ %
public 

string 
DisplayName 
{ 
get  #
;# $
set% (
;( )
}* +
public 

string 
Description 
{ 
get  #
;# $
set% (
;( )
}* +
public 

bool 
	Emphasize 
{ 
get 
;  
set! $
;$ %
}& '
public 

bool 
Required 
{ 
get 
; 
set  #
;# $
}% &
public 

bool 
Checked 
{ 
get 
; 
set "
;" #
}$ %
public 

IEnumerable 
< 
ResourceViewModel (
>( )
	Resources* 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
} 
public 
class 
ResourceViewModel 
{ 
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
public   

string   
DisplayName   
{   
get    #
;  # $
set  % (
;  ( )
}  * +
}!! “	
N/Users/pavel/project/NetMentoring/IdentityServer/Pages/Device/DeviceOptions.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Device %
;% &
public 
class 
DeviceOptions 
{ 
public		 

static		 
bool		 
EnableOfflineAccess		 *
=		+ ,
true		- 1
;		1 2
public

 

static

 
string

 $
OfflineAccessDisplayName

 1
=

2 3
$str

4 D
;

D E
public 

static 
string $
OfflineAccessDescription 1
=2 3
$str N
;N O
public 

static 
readonly 
string !
InvalidUserCode" 1
=2 3
$str4 G
;G H
public 

static 
readonly 
string !%
MustChooseOneErrorMessage" ;
=< =
$str> e
;e f
public 

static 
readonly 
string !(
InvalidSelectionErrorMessage" >
=? @
$strA T
;T U
} ⁄î
M/Users/pavel/project/NetMentoring/IdentityServer/Pages/Device/Index.cshtml.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Device %
;% &
[ 
SecurityHeaders 
] 
[ 
	Authorize 

]
 
public 
class 
Index 
: 
	PageModel 
{ 
private 
readonly )
IDeviceFlowInteractionService 2
_interaction3 ?
;? @
private 
readonly 
IEventService "
_events# *
;* +
private 
readonly 
IOptions 
< !
IdentityServerOptions 3
>3 4
_options5 =
;= >
private 
readonly 
ILogger 
< 
Index "
>" #
_logger$ +
;+ ,
public 

Index 
( )
IDeviceFlowInteractionService %
interaction& 1
,1 2
IEventService 
eventService "
," #
IOptions 
< !
IdentityServerOptions &
>& '
options( /
,/ 0
ILogger 
< 
Index 
> 
logger 
) 
{ 
_interaction 
= 
interaction "
;" #
_events 
= 
eventService 
; 
_options   
=   
options   
;   
_logger!! 
=!! 
logger!! 
;!! 
}"" 
public$$ 

	ViewModel$$ 
View$$ 
{$$ 
get$$ 
;$$  
set$$! $
;$$$ %
}$$& '
[&& 
BindProperty&& 
]&& 
public&& 

InputModel&& $
Input&&% *
{&&+ ,
get&&- 0
;&&0 1
set&&2 5
;&&5 6
}&&7 8
public(( 

async(( 
Task(( 
<(( 
IActionResult(( #
>((# $
OnGet((% *
(((* +
string((+ 1
userCode((2 :
)((: ;
{)) 
if** 

(** 
String** 
.** 
IsNullOrWhiteSpace** %
(**% &
userCode**& .
)**. /
)**/ 0
{++ 	
View,, 
=,, 
new,, 
	ViewModel,,  
(,,  !
),,! "
;,," #
Input-- 
=-- 
new-- 

InputModel-- "
(--" #
)--# $
;--$ %
return.. 
Page.. 
(.. 
).. 
;.. 
}// 	
View11 
=11 
await11 
BuildViewModelAsync11 (
(11( )
userCode11) 1
)111 2
;112 3
if22 

(22 
View22 
==22 
null22 
)22 
{33 	

ModelState44 
.44 
AddModelError44 $
(44$ %
$str44% '
,44' (
DeviceOptions44) 6
.446 7
InvalidUserCode447 F
)44F G
;44G H
View55 
=55 
new55 
	ViewModel55  
(55  !
)55! "
;55" #
Input66 
=66 
new66 

InputModel66 "
(66" #
)66# $
;66$ %
return77 
Page77 
(77 
)77 
;77 
}88 	
Input:: 
=:: 
new:: 

InputModel:: 
{;; 	
UserCode<< 
=<< 
userCode<< 
,<<  
}== 	
;==	 

return?? 
Page?? 
(?? 
)?? 
;?? 
}@@ 
publicBB 

asyncBB 
TaskBB 
<BB 
IActionResultBB #
>BB# $
OnPostBB% +
(BB+ ,
)BB, -
{CC 
varDD 
requestDD 
=DD 
awaitDD 
_interactionDD (
.DD( )(
GetAuthorizationContextAsyncDD) E
(DDE F
InputDDF K
.DDK L
UserCodeDDL T
)DDT U
;DDU V
ifEE 

(EE 
requestEE 
==EE 
nullEE 
)EE 
returnEE #
RedirectToPageEE$ 2
(EE2 3
$strEE3 F
)EEF G
;EEG H
ConsentResponseGG 
grantedConsentGG &
=GG' (
nullGG) -
;GG- .
ifJJ 

(JJ 
InputJJ 
.JJ 
ButtonJJ 
==JJ 
$strJJ  
)JJ  !
{KK 	
grantedConsentLL 
=LL 
newLL  
ConsentResponseLL! 0
{MM 
ErrorNN 
=NN 
AuthorizationErrorNN *
.NN* +
AccessDeniedNN+ 7
}OO 
;OO 
awaitRR 
_eventsRR 
.RR 

RaiseAsyncRR $
(RR$ %
newRR% (
ConsentDeniedEventRR) ;
(RR; <
UserRR< @
.RR@ A
GetSubjectIdRRA M
(RRM N
)RRN O
,RRO P
requestRRQ X
.RRX Y
ClientRRY _
.RR_ `
ClientIdRR` h
,RRh i
requestSS 
.SS 
ValidatedResourcesSS *
.SS* +
RawScopeValuesSS+ 9
)SS9 :
)SS: ;
;SS; <
}TT 	
elseVV 
ifVV 
(VV 
InputVV 
.VV 
ButtonVV 
==VV  
$strVV! &
)VV& '
{WW 	
ifYY 
(YY 
InputYY 
.YY 
ScopesConsentedYY %
!=YY& (
nullYY) -
&&YY. 0
InputYY1 6
.YY6 7
ScopesConsentedYY7 F
.YYF G
AnyYYG J
(YYJ K
)YYK L
)YYL M
{ZZ 
var[[ 
scopes[[ 
=[[ 
Input[[ "
.[[" #
ScopesConsented[[# 2
;[[2 3
if\\ 
(\\ 
ConsentOptions\\ "
.\\" #
EnableOfflineAccess\\# 6
==\\7 9
false\\: ?
)\\? @
{]] 
scopes^^ 
=^^ 
scopes^^ #
.^^# $
Where^^$ )
(^^) *
x^^* +
=>^^, .
x__ 
!=__ 
Duende__ #
.__# $
IdentityServer__$ 2
.__2 3#
IdentityServerConstants__3 J
.__J K
StandardScopes__K Y
.__Y Z
OfflineAccess__Z g
)__g h
;__h i
}`` 
grantedConsentbb 
=bb  
newbb! $
ConsentResponsebb% 4
{cc 
RememberConsentdd #
=dd$ %
Inputdd& +
.dd+ ,
RememberConsentdd, ;
,dd; <!
ScopesValuesConsentedee )
=ee* +
scopesee, 2
.ee2 3
ToArrayee3 :
(ee: ;
)ee; <
,ee< =
Descriptionff 
=ff  !
Inputff" '
.ff' (
Descriptionff( 3
}gg 
;gg 
awaitjj 
_eventsjj 
.jj 

RaiseAsyncjj (
(jj( )
newjj) ,
ConsentGrantedEventjj- @
(jj@ A
UserjjA E
.jjE F
GetSubjectIdjjF R
(jjR S
)jjS T
,jjT U
requestjjV ]
.jj] ^
Clientjj^ d
.jjd e
ClientIdjje m
,jjm n
requestkk 
.kk 
ValidatedResourceskk .
.kk. /
RawScopeValueskk/ =
,kk= >
grantedConsentkk? M
.kkM N!
ScopesValuesConsentedkkN c
,kkc d
grantedConsentll "
.ll" #
RememberConsentll# 2
)ll2 3
)ll3 4
;ll4 5
}mm 
elsenn 
{oo 

ModelStatepp 
.pp 
AddModelErrorpp (
(pp( )
$strpp) +
,pp+ ,
ConsentOptionspp- ;
.pp; <%
MustChooseOneErrorMessagepp< U
)ppU V
;ppV W
}qq 
}rr 	
elsess 
{tt 	

ModelStateuu 
.uu 
AddModelErroruu $
(uu$ %
$struu% '
,uu' (
ConsentOptionsuu) 7
.uu7 8(
InvalidSelectionErrorMessageuu8 T
)uuT U
;uuU V
}vv 	
ifxx 

(xx 
grantedConsentxx 
!=xx 
nullxx "
)xx" #
{yy 	
await{{ 
_interaction{{ 
.{{ 
HandleRequestAsync{{ 1
({{1 2
Input{{2 7
.{{7 8
UserCode{{8 @
,{{@ A
grantedConsent{{B P
){{P Q
;{{Q R
return~~ 
RedirectToPage~~ !
(~~! "
$str~~" 3
)~~3 4
;~~4 5
} 	
View
ÇÇ 
=
ÇÇ 
await
ÇÇ !
BuildViewModelAsync
ÇÇ (
(
ÇÇ( )
Input
ÇÇ) .
.
ÇÇ. /
UserCode
ÇÇ/ 7
,
ÇÇ7 8
Input
ÇÇ9 >
)
ÇÇ> ?
;
ÇÇ? @
return
ÉÉ 
Page
ÉÉ 
(
ÉÉ 
)
ÉÉ 
;
ÉÉ 
}
ÑÑ 
private
áá 
async
áá 
Task
áá 
<
áá 
	ViewModel
áá  
>
áá  !!
BuildViewModelAsync
áá" 5
(
áá5 6
string
áá6 <
userCode
áá= E
,
ááE F

InputModel
ááG Q
model
ááR W
=
ááX Y
null
ááZ ^
)
áá^ _
{
àà 
var
ââ 
request
ââ 
=
ââ 
await
ââ 
_interaction
ââ (
.
ââ( )*
GetAuthorizationContextAsync
ââ) E
(
ââE F
userCode
ââF N
)
ââN O
;
ââO P
if
ää 

(
ää 
request
ää 
!=
ää 
null
ää 
)
ää 
{
ãã 	
return
åå $
CreateConsentViewModel
åå )
(
åå) *
model
åå* /
,
åå/ 0
request
åå1 8
)
åå8 9
;
åå9 :
}
çç 	
return
èè 
null
èè 
;
èè 
}
êê 
private
íí 
	ViewModel
íí $
CreateConsentViewModel
íí ,
(
íí, -

InputModel
íí- 7
model
íí8 =
,
íí= >,
DeviceFlowAuthorizationRequest
íí? ]
request
íí^ e
)
ííe f
{
ìì 
var
îî 
vm
îî 
=
îî 
new
îî 
	ViewModel
îî 
{
ïï 	

ClientName
ññ 
=
ññ 
request
ññ  
.
ññ  !
Client
ññ! '
.
ññ' (

ClientName
ññ( 2
??
ññ3 5
request
ññ6 =
.
ññ= >
Client
ññ> D
.
ññD E
ClientId
ññE M
,
ññM N
	ClientUrl
óó 
=
óó 
request
óó 
.
óó  
Client
óó  &
.
óó& '
	ClientUri
óó' 0
,
óó0 1
ClientLogoUrl
òò 
=
òò 
request
òò #
.
òò# $
Client
òò$ *
.
òò* +
LogoUri
òò+ 2
,
òò2 3"
AllowRememberConsent
ôô  
=
ôô! "
request
ôô# *
.
ôô* +
Client
ôô+ 1
.
ôô1 2"
AllowRememberConsent
ôô2 F
}
öö 	
;
öö	 

vm
úú 

.
úú
 
IdentityScopes
úú 
=
úú 
request
úú #
.
úú# $ 
ValidatedResources
úú$ 6
.
úú6 7
	Resources
úú7 @
.
úú@ A
IdentityResources
úúA R
.
úúR S
Select
úúS Y
(
úúY Z
x
úúZ [
=>
úú\ ^"
CreateScopeViewModel
ùù  
(
ùù  !
x
ùù! "
,
ùù" #
model
ùù$ )
==
ùù* ,
null
ùù- 1
||
ùù2 4
model
ùù5 :
.
ùù: ;
ScopesConsented
ùù; J
?
ùùJ K
.
ùùK L
Contains
ùùL T
(
ùùT U
x
ùùU V
.
ùùV W
Name
ùùW [
)
ùù[ \
==
ùù] _
true
ùù` d
)
ùùd e
)
ùùe f
.
ùùf g
ToArray
ùùg n
(
ùùn o
)
ùùo p
;
ùùp q
var
üü 
	apiScopes
üü 
=
üü 
new
üü 
List
üü  
<
üü  !
ScopeViewModel
üü! /
>
üü/ 0
(
üü0 1
)
üü1 2
;
üü2 3
foreach
†† 
(
†† 
var
†† 
parsedScope
††  
in
††! #
request
††$ +
.
††+ , 
ValidatedResources
††, >
.
††> ?
ParsedScopes
††? K
)
††K L
{
°° 	
var
¢¢ 
apiScope
¢¢ 
=
¢¢ 
request
¢¢ "
.
¢¢" # 
ValidatedResources
¢¢# 5
.
¢¢5 6
	Resources
¢¢6 ?
.
¢¢? @
FindApiScope
¢¢@ L
(
¢¢L M
parsedScope
¢¢M X
.
¢¢X Y

ParsedName
¢¢Y c
)
¢¢c d
;
¢¢d e
if
££ 
(
££ 
apiScope
££ 
!=
££ 
null
££  
)
££  !
{
§§ 
var
•• 
scopeVm
•• 
=
•• "
CreateScopeViewModel
•• 2
(
••2 3
parsedScope
••3 >
,
••> ?
apiScope
••@ H
,
••H I
model
¶¶ 
==
¶¶ 
null
¶¶ !
||
¶¶" $
model
¶¶% *
.
¶¶* +
ScopesConsented
¶¶+ :
?
¶¶: ;
.
¶¶; <
Contains
¶¶< D
(
¶¶D E
parsedScope
¶¶E P
.
¶¶P Q
RawValue
¶¶Q Y
)
¶¶Y Z
==
¶¶[ ]
true
¶¶^ b
)
¶¶b c
;
¶¶c d
	apiScopes
ßß 
.
ßß 
Add
ßß 
(
ßß 
scopeVm
ßß %
)
ßß% &
;
ßß& '
}
®® 
}
©© 	
if
´´ 

(
´´ 
DeviceOptions
´´ 
.
´´ !
EnableOfflineAccess
´´ -
&&
´´. 0
request
´´1 8
.
´´8 9 
ValidatedResources
´´9 K
.
´´K L
	Resources
´´L U
.
´´U V
OfflineAccess
´´V c
)
´´c d
{
¨¨ 	
	apiScopes
≠≠ 
.
≠≠ 
Add
≠≠ 
(
≠≠ #
GetOfflineAccessScope
≠≠ /
(
≠≠/ 0
model
≠≠0 5
==
≠≠6 8
null
≠≠9 =
||
≠≠> @
model
ÆÆ0 5
.
ÆÆ5 6
ScopesConsented
ÆÆ6 E
?
ÆÆE F
.
ÆÆF G
Contains
ÆÆG O
(
ÆÆO P
Duende
ÆÆP V
.
ÆÆV W
IdentityServer
ÆÆW e
.
ØØ4 5%
IdentityServerConstants
ØØ5 L
.
ØØL M
StandardScopes
ØØM [
.
ØØ[ \
OfflineAccess
ØØ\ i
)
ØØi j
==
ØØk m
true
ØØn r
)
ØØr s
)
ØØs t
;
ØØt u
}
∞∞ 	
vm
≤≤ 

.
≤≤
 
	ApiScopes
≤≤ 
=
≤≤ 
	apiScopes
≤≤  
;
≤≤  !
return
¥¥ 
vm
¥¥ 
;
¥¥ 
}
µµ 
private
∑∑ 
ScopeViewModel
∑∑ "
CreateScopeViewModel
∑∑ /
(
∑∑/ 0
IdentityResource
∑∑0 @
identity
∑∑A I
,
∑∑I J
bool
∑∑K O
check
∑∑P U
)
∑∑U V
{
∏∏ 
return
ππ 
new
ππ 
ScopeViewModel
ππ !
{
∫∫ 	
Value
ªª 
=
ªª 
identity
ªª 
.
ªª 
Name
ªª !
,
ªª! "
DisplayName
ºº 
=
ºº 
identity
ºº "
.
ºº" #
DisplayName
ºº# .
??
ºº/ 1
identity
ºº2 :
.
ºº: ;
Name
ºº; ?
,
ºº? @
Description
ΩΩ 
=
ΩΩ 
identity
ΩΩ "
.
ΩΩ" #
Description
ΩΩ# .
,
ΩΩ. /
	Emphasize
ææ 
=
ææ 
identity
ææ  
.
ææ  !
	Emphasize
ææ! *
,
ææ* +
Required
øø 
=
øø 
identity
øø 
.
øø  
Required
øø  (
,
øø( )
Checked
¿¿ 
=
¿¿ 
check
¿¿ 
||
¿¿ 
identity
¿¿ '
.
¿¿' (
Required
¿¿( 0
}
¡¡ 	
;
¡¡	 

}
¬¬ 
public
ƒƒ 

ScopeViewModel
ƒƒ "
CreateScopeViewModel
ƒƒ .
(
ƒƒ. /
ParsedScopeValue
ƒƒ/ ?
parsedScopeValue
ƒƒ@ P
,
ƒƒP Q
ApiScope
ƒƒR Z
apiScope
ƒƒ[ c
,
ƒƒc d
bool
ƒƒe i
check
ƒƒj o
)
ƒƒo p
{
≈≈ 
return
∆∆ 
new
∆∆ 
ScopeViewModel
∆∆ !
{
«« 	
Value
»» 
=
»» 
parsedScopeValue
»» $
.
»»$ %
RawValue
»»% -
,
»»- .
DisplayName
   
=
   
apiScope
   "
.
  " #
DisplayName
  # .
??
  / 1
apiScope
  2 :
.
  : ;
Name
  ; ?
,
  ? @
Description
ÀÀ 
=
ÀÀ 
apiScope
ÀÀ "
.
ÀÀ" #
Description
ÀÀ# .
,
ÀÀ. /
	Emphasize
ÃÃ 
=
ÃÃ 
apiScope
ÃÃ  
.
ÃÃ  !
	Emphasize
ÃÃ! *
,
ÃÃ* +
Required
ÕÕ 
=
ÕÕ 
apiScope
ÕÕ 
.
ÕÕ  
Required
ÕÕ  (
,
ÕÕ( )
Checked
ŒŒ 
=
ŒŒ 
check
ŒŒ 
||
ŒŒ 
apiScope
ŒŒ '
.
ŒŒ' (
Required
ŒŒ( 0
}
œœ 	
;
œœ	 

}
–– 
private
““ 
ScopeViewModel
““ #
GetOfflineAccessScope
““ 0
(
““0 1
bool
““1 5
check
““6 ;
)
““; <
{
”” 
return
‘‘ 
new
‘‘ 
ScopeViewModel
‘‘ !
{
’’ 	
Value
÷÷ 
=
÷÷ 
Duende
÷÷ 
.
÷÷ 
IdentityServer
÷÷ )
.
÷÷) *%
IdentityServerConstants
÷÷* A
.
÷÷A B
StandardScopes
÷÷B P
.
÷÷P Q
OfflineAccess
÷÷Q ^
,
÷÷^ _
DisplayName
◊◊ 
=
◊◊ 
DeviceOptions
◊◊ '
.
◊◊' (&
OfflineAccessDisplayName
◊◊( @
,
◊◊@ A
Description
ÿÿ 
=
ÿÿ 
DeviceOptions
ÿÿ '
.
ÿÿ' (&
OfflineAccessDescription
ÿÿ( @
,
ÿÿ@ A
	Emphasize
ŸŸ 
=
ŸŸ 
true
ŸŸ 
,
ŸŸ 
Checked
⁄⁄ 
=
⁄⁄ 
check
⁄⁄ 
}
€€ 	
;
€€	 

}
‹‹ 
}›› ∆

K/Users/pavel/project/NetMentoring/IdentityServer/Pages/Device/InputModel.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Device %
;% &
public 
class 

InputModel 
{ 
public 

string 
Button 
{ 
get 
; 
set  #
;# $
}% &
public 

IEnumerable 
< 
string 
> 
ScopesConsented .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 

bool 
RememberConsent 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
true0 4
;4 5
public 

string 
	ReturnUrl 
{ 
get !
;! "
set# &
;& '
}( )
public		 

string		 
Description		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 

string

 
UserCode

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
} ∂
O/Users/pavel/project/NetMentoring/IdentityServer/Pages/Device/Success.cshtml.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Device %
;% &
[ 
SecurityHeaders 
] 
[ 
	Authorize 

]
 
public 
class 
SuccessModel 
: 
	PageModel %
{		 
public

 

void

 
OnGet

 
(

 
)

 
{ 
} 
} Ê
J/Users/pavel/project/NetMentoring/IdentityServer/Pages/Device/ViewModel.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Device %
;% &
public 
class 
	ViewModel 
{ 
public 

string 

ClientName 
{ 
get "
;" #
set$ '
;' (
}) *
public 

string 
	ClientUrl 
{ 
get !
;! "
set# &
;& '
}( )
public 

string 
ClientLogoUrl 
{  !
get" %
;% &
set' *
;* +
}, -
public 

bool  
AllowRememberConsent $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public

 

IEnumerable

 
<

 
ScopeViewModel

 %
>

% &
IdentityScopes

' 5
{

6 7
get

8 ;
;

; <
set

= @
;

@ A
}

B C
public 

IEnumerable 
< 
ScopeViewModel %
>% &
	ApiScopes' 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
} 
public 
class 
ScopeViewModel 
{ 
public 

string 
Value 
{ 
get 
; 
set "
;" #
}$ %
public 

string 
DisplayName 
{ 
get  #
;# $
set% (
;( )
}* +
public 

string 
Description 
{ 
get  #
;# $
set% (
;( )
}* +
public 

bool 
	Emphasize 
{ 
get 
;  
set! $
;$ %
}& '
public 

bool 
Required 
{ 
get 
; 
set  #
;# $
}% &
public 

bool 
Checked 
{ 
get 
; 
set "
;" #
}$ %
} ª
R/Users/pavel/project/NetMentoring/IdentityServer/Pages/Diagnostics/Index.cshtml.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Diagnostics *
;* +
[ 
SecurityHeaders 
] 
[		 
	Authorize		 

]		
 
public

 
class

 
Index

 
:

 
	PageModel

 
{ 
public 

	ViewModel 
View 
{ 
get 
;  
set! $
;$ %
}& '
public 

async 
Task 
< 
IActionResult #
># $
OnGet% *
(* +
)+ ,
{ 
var 
localAddresses 
= 
new  
string! '
[' (
]( )
{* +
$str, 7
,7 8
$str9 >
,> ?
HttpContext@ K
.K L

ConnectionL V
.V W
LocalIpAddressW e
.e f
ToStringf n
(n o
)o p
}q r
;r s
if 

( 
! 
localAddresses 
. 
Contains $
($ %
HttpContext% 0
.0 1

Connection1 ;
.; <
RemoteIpAddress< K
.K L
ToStringL T
(T U
)U V
)V W
)W X
{ 	
return 
NotFound 
( 
) 
; 
} 	
View 
= 
new 
	ViewModel 
( 
await "
HttpContext# .
.. /
AuthenticateAsync/ @
(@ A
)A B
)B C
;C D
return 
Page 
( 
) 
; 
} 
} º
O/Users/pavel/project/NetMentoring/IdentityServer/Pages/Diagnostics/ViewModel.cs
	namespace

 	
IdentityServer


 
.

 
Pages

 
.

 
Diagnostics

 *
;

* +
public 
class 
	ViewModel 
{ 
public 

	ViewModel 
( 
AuthenticateResult '
result( .
). /
{ 
AuthenticateResult 
= 
result #
;# $
if 

( 
result 
. 

Properties 
. 
Items #
.# $
ContainsKey$ /
(/ 0
$str0 =
)= >
)> ?
{ 	
var 
encoded 
= 
result  
.  !

Properties! +
.+ ,
Items, 1
[1 2
$str2 ?
]? @
;@ A
var 
bytes 
= 
	Base64Url !
.! "
Decode" (
(( )
encoded) 0
)0 1
;1 2
var 
value 
= 
Encoding  
.  !
UTF8! %
.% &
	GetString& /
(/ 0
bytes0 5
)5 6
;6 7
Clients 
= 
JsonSerializer $
.$ %
Deserialize% 0
<0 1
string1 7
[7 8
]8 9
>9 :
(: ;
value; @
)@ A
;A B
} 	
} 
public 

AuthenticateResult 
AuthenticateResult 0
{1 2
get3 6
;6 7
}8 9
public 

IEnumerable 
< 
string 
> 
Clients &
{' (
get) ,
;, -
}. /
=0 1
new2 5
List6 :
<: ;
string; A
>A B
(B C
)C D
;D E
} ∏
D/Users/pavel/project/NetMentoring/IdentityServer/Pages/Extensions.cs
	namespace

 	
IdentityServer


 
.

 
Pages

 
;

 
public 
static 
class 

Extensions 
{ 
public 

static 
async 
Task 
< 
bool !
>! ")
GetSchemeSupportsSignOutAsync# @
(@ A
thisA E
HttpContextF Q
contextR Y
,Y Z
string[ a
schemeb h
)h i
{ 
var 
provider 
= 
context 
. 
RequestServices .
.. /
GetRequiredService/ A
<A B*
IAuthenticationHandlerProviderB `
>` a
(a b
)b c
;c d
var 
handler 
= 
await 
provider $
.$ %
GetHandlerAsync% 4
(4 5
context5 <
,< =
scheme> D
)D E
;E F
return 
( 
handler 
is )
IAuthenticationSignOutHandler 8
)8 9
;9 :
} 
public 

static 
bool 
IsNativeClient %
(% &
this& * 
AuthorizationRequest+ ?
context@ G
)G H
{ 
return 
! 
context 
. 
RedirectUri #
.# $

StartsWith$ .
(. /
$str/ 6
,6 7
StringComparison8 H
.H I
OrdinalI P
)P Q
&& 
! 
context 
. 
RedirectUri &
.& '

StartsWith' 1
(1 2
$str2 8
,8 9
StringComparison: J
.J K
OrdinalK R
)R S
;S T
} 
public$$ 

static$$ 
IActionResult$$ 
LoadingPage$$  +
($$+ ,
this$$, 0
	PageModel$$1 :
page$$; ?
,$$? @
string$$A G
redirectUri$$H S
)$$S T
{%% 
page&& 
.&& 
HttpContext&& 
.&& 
Response&& !
.&&! "

StatusCode&&" ,
=&&- .
$num&&/ 2
;&&2 3
page'' 
.'' 
HttpContext'' 
.'' 
Response'' !
.''! "
Headers''" )
['') *
$str''* 4
]''4 5
=''6 7
$str''8 :
;'': ;
return)) 
page)) 
.)) 
RedirectToPage)) "
())" #
$str))# 4
,))4 5
new))6 9
{)): ;
RedirectUri))< G
=))H I
redirectUri))J U
}))V W
)))W X
;))X Y
}** 
}++ êS
W/Users/pavel/project/NetMentoring/IdentityServer/Pages/ExternalLogin/Callback.cshtml.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
ExternalLogin ,
;, -
[ 
AllowAnonymous 
] 
[ 
SecurityHeaders 
] 
public 
class 
Callback 
: 
	PageModel !
{ 
private 
readonly 
TestUserStore "
_users# )
;) *
private 
readonly -
!IIdentityServerInteractionService 6
_interaction7 C
;C D
private 
readonly 
ILogger 
< 
Callback %
>% &
_logger' .
;. /
private 
readonly 
IEventService "
_events# *
;* +
public 

Callback 
( -
!IIdentityServerInteractionService )
interaction* 5
,5 6
IEventService 
events 
, 
ILogger 
< 
Callback 
> 
logger  
,  !
TestUserStore 
users 
= 
null "
)" #
{ 
_users 
= 
users 
?? 
throw 
new 
	Exception $
($ %
$str	   £
)
  £ §
;
  § •
_interaction"" 
="" 
interaction"" "
;""" #
_logger## 
=## 
logger## 
;## 
_events$$ 
=$$ 
events$$ 
;$$ 
}%% 
public'' 

async'' 
Task'' 
<'' 
IActionResult'' #
>''# $
OnGet''% *
(''* +
)''+ ,
{(( 
var** 
result** 
=** 
await** 
HttpContext** &
.**& '
AuthenticateAsync**' 8
(**8 9#
IdentityServerConstants**9 P
.**P Q.
"ExternalCookieAuthenticationScheme**Q s
)**s t
;**t u
if++ 

(++ 
result++ 
?++ 
.++ 
	Succeeded++ 
!=++  
true++! %
)++% &
{,, 	
throw-- 
new-- 
	Exception-- 
(--  
$str--  ?
)--? @
;--@ A
}.. 	
var00 
externalUser00 
=00 
result00 !
.00! "
	Principal00" +
;00+ ,
if22 

(22 
_logger22 
.22 
	IsEnabled22 
(22 
LogLevel22 &
.22& '
Debug22' ,
)22, -
)22- .
{33 	
var44 
externalClaims44 
=44  
externalUser44! -
.44- .
Claims44. 4
.444 5
Select445 ;
(44; <
c44< =
=>44> @
$"44A C
{44C D
c44D E
.44E F
Type44F J
}44J K
$str44K M
{44M N
c44N O
.44O P
Value44P U
}44U V
"44V W
)44W X
;44X Y
_logger55 
.55 
LogDebug55 
(55 
$str55 9
,559 :
externalClaims55; I
)55I J
;55J K
}66 	
var<< 
userIdClaim<< 
=<< 
externalUser<< &
.<<& '
	FindFirst<<' 0
(<<0 1
JwtClaimTypes<<1 >
.<<> ?
Subject<<? F
)<<F G
??<<H J
externalUser== &
.==& '
	FindFirst==' 0
(==0 1

ClaimTypes==1 ;
.==; <
NameIdentifier==< J
)==J K
??==L N
throw>> 
new>>  #
	Exception>>$ -
(>>- .
$str>>. >
)>>> ?
;>>? @
var@@ 
provider@@ 
=@@ 
result@@ 
.@@ 

Properties@@ (
.@@( )
Items@@) .
[@@. /
$str@@/ 7
]@@7 8
;@@8 9
varAA 
providerUserIdAA 
=AA 
userIdClaimAA (
.AA( )
ValueAA) .
;AA. /
varDD 
userDD 
=DD 
_usersDD 
.DD "
FindByExternalProviderDD 0
(DD0 1
providerDD1 9
,DD9 :
providerUserIdDD; I
)DDI J
;DDJ K
ifEE 

(EE 
userEE 
==EE 
nullEE 
)EE 
{FF 	
varLL 
claimsLL 
=LL 
externalUserLL %
.LL% &
ClaimsLL& ,
.LL, -
ToListLL- 3
(LL3 4
)LL4 5
;LL5 6
claimsMM 
.MM 
RemoveMM 
(MM 
userIdClaimMM %
)MM% &
;MM& '
userNN 
=NN 
_usersNN 
.NN 
AutoProvisionUserNN +
(NN+ ,
providerNN, 4
,NN4 5
providerUserIdNN6 D
,NND E
claimsNNF L
.NNL M
ToListNNM S
(NNS T
)NNT U
)NNU V
;NNV W
}OO 	
varTT !
additionalLocalClaimsTT !
=TT" #
newTT$ '
ListTT( ,
<TT, -
ClaimTT- 2
>TT2 3
(TT3 4
)TT4 5
;TT5 6
varUU 
localSignInPropsUU 
=UU 
newUU "$
AuthenticationPropertiesUU# ;
(UU; <
)UU< =
;UU= >'
CaptureExternalLoginContextVV #
(VV# $
resultVV$ *
,VV* +!
additionalLocalClaimsVV, A
,VVA B
localSignInPropsVVC S
)VVS T
;VVT U
varYY 
isuserYY 
=YY 
newYY 
IdentityServerUserYY +
(YY+ ,
userYY, 0
.YY0 1
	SubjectIdYY1 :
)YY: ;
{ZZ 	
DisplayName[[ 
=[[ 
user[[ 
.[[ 
Username[[ '
,[[' (
IdentityProvider\\ 
=\\ 
provider\\ '
,\\' (
AdditionalClaims]] 
=]] !
additionalLocalClaims]] 4
}^^ 	
;^^	 

await`` 
HttpContext`` 
.`` 
SignInAsync`` %
(``% &
isuser``& ,
,``, -
localSignInProps``. >
)``> ?
;``? @
awaitcc 
HttpContextcc 
.cc 
SignOutAsynccc &
(cc& '#
IdentityServerConstantscc' >
.cc> ?.
"ExternalCookieAuthenticationSchemecc? a
)cca b
;ccb c
varff 
	returnUrlff 
=ff 
resultff 
.ff 

Propertiesff )
.ff) *
Itemsff* /
[ff/ 0
$strff0 ;
]ff; <
??ff= ?
$strff@ D
;ffD E
varii 
contextii 
=ii 
awaitii 
_interactionii (
.ii( )(
GetAuthorizationContextAsyncii) E
(iiE F
	returnUrliiF O
)iiO P
;iiP Q
awaitjj 
_eventsjj 
.jj 

RaiseAsyncjj  
(jj  !
newjj! $!
UserLoginSuccessEventjj% :
(jj: ;
providerjj; C
,jjC D
providerUserIdjjE S
,jjS T
userjjU Y
.jjY Z
	SubjectIdjjZ c
,jjc d
userjje i
.jji j
Usernamejjj r
,jjr s
truekk 
,kk 
contextkk 
?kk 
.kk 
Clientkk !
.kk! "
ClientIdkk" *
)kk* +
)kk+ ,
;kk, -
ifmm 

(mm 
contextmm 
!=mm 
nullmm 
)mm 
{nn 	
ifoo 
(oo 
contextoo 
.oo 
IsNativeClientoo &
(oo& '
)oo' (
)oo( )
{pp 
returnss 
thisss 
.ss 
LoadingPagess '
(ss' (
	returnUrlss( 1
)ss1 2
;ss2 3
}tt 
}uu 	
returnww 
Redirectww 
(ww 
	returnUrlww !
)ww! "
;ww" #
}xx 
private|| 
void|| '
CaptureExternalLoginContext|| ,
(||, -
AuthenticateResult||- ?
externalResult||@ N
,||N O
List||P T
<||T U
Claim||U Z
>||Z [
localClaims||\ g
,||g h$
AuthenticationProperties}}  
localSignInProps}}! 1
)}}1 2
{~~ 
var
ÅÅ 
sid
ÅÅ 
=
ÅÅ 
externalResult
ÅÅ  
.
ÅÅ  !
	Principal
ÅÅ! *
.
ÅÅ* +
Claims
ÅÅ+ 1
.
ÅÅ1 2
FirstOrDefault
ÅÅ2 @
(
ÅÅ@ A
x
ÅÅA B
=>
ÅÅC E
x
ÅÅF G
.
ÅÅG H
Type
ÅÅH L
==
ÅÅM O
JwtClaimTypes
ÅÅP ]
.
ÅÅ] ^
	SessionId
ÅÅ^ g
)
ÅÅg h
;
ÅÅh i
if
ÇÇ 

(
ÇÇ 
sid
ÇÇ 
!=
ÇÇ 
null
ÇÇ 
)
ÇÇ 
{
ÉÉ 	
localClaims
ÑÑ 
.
ÑÑ 
Add
ÑÑ 
(
ÑÑ 
new
ÑÑ 
Claim
ÑÑ  %
(
ÑÑ% &
JwtClaimTypes
ÑÑ& 3
.
ÑÑ3 4
	SessionId
ÑÑ4 =
,
ÑÑ= >
sid
ÑÑ? B
.
ÑÑB C
Value
ÑÑC H
)
ÑÑH I
)
ÑÑI J
;
ÑÑJ K
}
ÖÖ 	
var
àà 
idToken
àà 
=
àà 
externalResult
àà $
.
àà$ %

Properties
àà% /
.
àà/ 0
GetTokenValue
àà0 =
(
àà= >
$str
àà> H
)
ààH I
;
ààI J
if
ââ 

(
ââ 
idToken
ââ 
!=
ââ 
null
ââ 
)
ââ 
{
ää 	
localSignInProps
ãã 
.
ãã 
StoreTokens
ãã (
(
ãã( )
new
ãã) ,
[
ãã, -
]
ãã- .
{
ãã/ 0
new
ãã1 4!
AuthenticationToken
ãã5 H
{
ããI J
Name
ããK O
=
ããP Q
$str
ããR \
,
ãã\ ]
Value
ãã^ c
=
ããd e
idToken
ããf m
}
ããn o
}
ããp q
)
ããq r
;
ããr s
}
åå 	
}
çç 
}éé ã
X/Users/pavel/project/NetMentoring/IdentityServer/Pages/ExternalLogin/Challenge.cshtml.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
ExternalLogin ,
;, -
[		 
AllowAnonymous		 
]		 
[

 
SecurityHeaders

 
]

 
public 
class 
	Challenge 
: 
	PageModel "
{ 
private 
readonly -
!IIdentityServerInteractionService 6
_interactionService7 J
;J K
public 

	Challenge 
( -
!IIdentityServerInteractionService 6
interactionService7 I
)I J
{ 
_interactionService 
= 
interactionService 0
;0 1
} 
public 

IActionResult 
OnGet 
( 
string %
scheme& ,
,, -
string. 4
	returnUrl5 >
)> ?
{ 
if 

( 
string 
. 
IsNullOrEmpty  
(  !
	returnUrl! *
)* +
)+ ,
	returnUrl- 6
=7 8
$str9 =
;= >
if 

( 
Url 
. 

IsLocalUrl 
( 
	returnUrl $
)$ %
==& (
false) .
&&/ 1
_interactionService2 E
.E F
IsValidReturnUrlF V
(V W
	returnUrlW `
)` a
==b d
falsee j
)j k
{ 	
throw 
new 
	Exception 
(  
$str  4
)4 5
;5 6
} 	
var   
props   
=   
new   $
AuthenticationProperties   0
{!! 	
RedirectUri"" 
="" 
Url"" 
."" 
Page"" "
(""" #
$str""# <
)""< =
,""= >
Items$$ 
=$$ 
{%% 
{&& 
$str&& 
,&& 
	returnUrl&& (
}&&) *
,&&* +
{'' 
$str'' 
,'' 
scheme'' "
}''# $
,''$ %
}(( 
})) 	
;))	 

return++ 
	Challenge++ 
(++ 
props++ 
,++ 
scheme++  &
)++& '
;++' (
},, 
}-- ó0
M/Users/pavel/project/NetMentoring/IdentityServer/Pages/Grants/Index.cshtml.cs
	namespace

 	
IdentityServer


 
.

 
Pages

 
.

 
Grants

 %
;

% &
[ 
SecurityHeaders 
] 
[ 
	Authorize 

]
 
public 
class 
Index 
: 
	PageModel 
{ 
private 
readonly -
!IIdentityServerInteractionService 6
_interaction7 C
;C D
private 
readonly 
IClientStore !
_clients" *
;* +
private 
readonly 
IResourceStore #

_resources$ .
;. /
private 
readonly 
IEventService "
_events# *
;* +
public 

Index 
( -
!IIdentityServerInteractionService 2
interaction3 >
,> ?
IClientStore 
clients 
, 
IResourceStore 
	resources  
,  !
IEventService 
events 
) 
{ 
_interaction 
= 
interaction "
;" #
_clients 
= 
clients 
; 

_resources 
= 
	resources 
; 
_events 
= 
events 
; 
} 
public   

	ViewModel   
View   
{   
get   
;    
set  ! $
;  $ %
}  & '
public"" 

async"" 
Task"" 
OnGet"" 
("" 
)"" 
{## 
var$$ 
grants$$ 
=$$ 
await$$ 
_interaction$$ '
.$$' (!
GetAllUserGrantsAsync$$( =
($$= >
)$$> ?
;$$? @
var&& 
list&& 
=&& 
new&& 
List&& 
<&& 
GrantViewModel&& *
>&&* +
(&&+ ,
)&&, -
;&&- .
foreach'' 
('' 
var'' 
grant'' 
in'' 
grants'' $
)''$ %
{(( 	
var)) 
client)) 
=)) 
await)) 
_clients)) '
.))' (
FindClientByIdAsync))( ;
()); <
grant))< A
.))A B
ClientId))B J
)))J K
;))K L
if** 
(** 
client** 
!=** 
null** 
)** 
{++ 
var,, 
	resources,, 
=,, 
await,,  %

_resources,,& 0
.,,0 1%
FindResourcesByScopeAsync,,1 J
(,,J K
grant,,K P
.,,P Q
Scopes,,Q W
),,W X
;,,X Y
var.. 
item.. 
=.. 
new.. 
GrantViewModel.. -
(..- .
)... /
{// 
ClientId00 
=00 
client00 %
.00% &
ClientId00& .
,00. /

ClientName11 
=11  
client11! '
.11' (

ClientName11( 2
??113 5
client116 <
.11< =
ClientId11= E
,11E F
ClientLogoUrl22 !
=22" #
client22$ *
.22* +
LogoUri22+ 2
,222 3
	ClientUrl33 
=33 
client33  &
.33& '
	ClientUri33' 0
,330 1
Description44 
=44  !
grant44" '
.44' (
Description44( 3
,443 4
Created55 
=55 
grant55 #
.55# $
CreationTime55$ 0
,550 1
Expires66 
=66 
grant66 #
.66# $

Expiration66$ .
,66. /
IdentityGrantNames77 &
=77' (
	resources77) 2
.772 3
IdentityResources773 D
.77D E
Select77E K
(77K L
x77L M
=>77N P
x77Q R
.77R S
DisplayName77S ^
??77_ a
x77b c
.77c d
Name77d h
)77h i
.77i j
ToArray77j q
(77q r
)77r s
,77s t
ApiGrantNames88 !
=88" #
	resources88$ -
.88- .
	ApiScopes88. 7
.887 8
Select888 >
(88> ?
x88? @
=>88A C
x88D E
.88E F
DisplayName88F Q
??88R T
x88U V
.88V W
Name88W [
)88[ \
.88\ ]
ToArray88] d
(88d e
)88e f
}99 
;99 
list;; 
.;; 
Add;; 
(;; 
item;; 
);; 
;;; 
}<< 
}== 	
View?? 
=?? 
new?? 
	ViewModel?? 
{@@ 	
GrantsAA 
=AA 
listAA 
}BB 	
;BB	 

}CC 
[EE 
BindPropertyEE 
]EE 
[EE 
RequiredEE 
]EE 
publicEE $
stringEE% +
ClientIdEE, 4
{EE5 6
getEE7 :
;EE: ;
setEE< ?
;EE? @
}EEA B
publicGG 

asyncGG 
TaskGG 
<GG 
IActionResultGG #
>GG# $
OnPostGG% +
(GG+ ,
)GG, -
{HH 
awaitII 
_interactionII 
.II "
RevokeUserConsentAsyncII 1
(II1 2
ClientIdII2 :
)II: ;
;II; <
awaitJJ 
_eventsJJ 
.JJ 

RaiseAsyncJJ  
(JJ  !
newJJ! $
GrantsRevokedEventJJ% 7
(JJ7 8
UserJJ8 <
.JJ< =
GetSubjectIdJJ= I
(JJI J
)JJJ K
,JJK L
ClientIdJJM U
)JJU V
)JJV W
;JJW X
returnLL 
RedirectToPageLL 
(LL 
$strLL -
)LL- .
;LL. /
}MM 
}NN 
J/Users/pavel/project/NetMentoring/IdentityServer/Pages/Grants/ViewModel.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Grants %
;% &
public 
class 
	ViewModel 
{ 
public 

IEnumerable 
< 
GrantViewModel %
>% &
Grants' -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
} 
public 
class 
GrantViewModel 
{		 
public

 

string

 
ClientId

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 

string 

ClientName 
{ 
get "
;" #
set$ '
;' (
}) *
public 

string 
	ClientUrl 
{ 
get !
;! "
set# &
;& '
}( )
public 

string 
ClientLogoUrl 
{  !
get" %
;% &
set' *
;* +
}, -
public 

string 
Description 
{ 
get  #
;# $
set% (
;( )
}* +
public 

DateTime 
Created 
{ 
get !
;! "
set# &
;& '
}( )
public 

DateTime 
? 
Expires 
{ 
get "
;" #
set$ '
;' (
}) *
public 

IEnumerable 
< 
string 
> 
IdentityGrantNames 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 

IEnumerable 
< 
string 
> 
ApiGrantNames ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} ˛
Q/Users/pavel/project/NetMentoring/IdentityServer/Pages/Home/Error/Index.cshtml.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Error $
;$ %
[ 
AllowAnonymous 
] 
[ 
SecurityHeaders 
] 
public		 
class		 
Index		 
:		 
	PageModel		 
{

 
private 
readonly -
!IIdentityServerInteractionService 6
_interaction7 C
;C D
private 
readonly 
IWebHostEnvironment (
_environment) 5
;5 6
public 

	ViewModel 
View 
{ 
get 
;  
set! $
;$ %
}& '
public 

Index 
( -
!IIdentityServerInteractionService 2
interaction3 >
,> ?
IWebHostEnvironment@ S
environmentT _
)_ `
{ 
_interaction 
= 
interaction "
;" #
_environment 
= 
environment "
;" #
} 
public 

async 
Task 
OnGet 
( 
string "
errorId# *
)* +
{ 
View 
= 
new 
	ViewModel 
( 
) 
; 
var 
message 
= 
await 
_interaction (
.( ) 
GetErrorContextAsync) =
(= >
errorId> E
)E F
;F G
if 

( 
message 
!= 
null 
) 
{ 	
View 
. 
Error 
= 
message  
;  !
if   
(   
!   
_environment   
.   
IsDevelopment   +
(  + ,
)  , -
)  - .
{!! 
message## 
.## 
ErrorDescription## (
=##) *
null##+ /
;##/ 0
}$$ 
}%% 	
}&& 
}'' Ì
N/Users/pavel/project/NetMentoring/IdentityServer/Pages/Home/Error/ViewModel.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Error $
;$ %
public 
class 
	ViewModel 
{		 
public

 

	ViewModel

 
(

 
)

 
{ 
} 
public 

	ViewModel 
( 
string 
error !
)! "
{ 
Error 
= 
new 
ErrorMessage  
{! "
Error# (
=) *
error+ 0
}1 2
;2 3
} 
public 

ErrorMessage 
Error 
{ 
get  #
;# $
set% (
;( )
}* +
} œ	
F/Users/pavel/project/NetMentoring/IdentityServer/Pages/Index.cshtml.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Home #
;# $
[ 
AllowAnonymous 
] 
public 
class 
Index 
: 
	PageModel 
{		 
public

 

string

 
Version

 
;

 
public 

void 
OnGet 
( 
) 
{ 
Version 
= 
typeof 
( 
Duende 
.  
IdentityServer  .
.. /
Hosting/ 6
.6 7$
IdentityServerMiddleware7 O
)O P
.P Q
AssemblyQ Y
. 
GetCustomAttribute 
<  1
%AssemblyInformationalVersionAttribute  E
>E F
(F G
)G H
?H I
.I J 
InformationalVersionJ ^
.^ _
Split_ d
(d e
$chare h
)h i
.i j
Firstj o
(o p
)p q
;q r
} 
} ≥	
O/Users/pavel/project/NetMentoring/IdentityServer/Pages/Redirect/Index.cshtml.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
Redirect '
;' (
[ 
AllowAnonymous 
] 
public 
class 

IndexModel 
: 
	PageModel #
{		 
public

 

string

 
RedirectUri

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 

IActionResult 
OnGet 
( 
string %
redirectUri& 1
)1 2
{ 
if 

( 
! 
Url 
. 

IsLocalUrl 
( 
redirectUri '
)' (
)( )
{ 	
return 
RedirectToPage !
(! "
$str" 5
)5 6
;6 7
} 	
RedirectUri 
= 
redirectUri !
;! "
return 
Page 
( 
) 
; 
} 
} ó
R/Users/pavel/project/NetMentoring/IdentityServer/Pages/SecurityHeadersAttribute.cs
	namespace 	
IdentityServer
 
. 
Pages 
; 
public

 
class

 $
SecurityHeadersAttribute

 %
:

& '!
ActionFilterAttribute

( =
{ 
public 

override 
void 
OnResultExecuting *
(* +"
ResultExecutingContext+ A
contextB I
)I J
{ 
var 
result 
= 
context 
. 
Result #
;# $
if 

( 
result 
is 

PageResult  
)  !
{ 	
if 
( 
! 
context 
. 
HttpContext $
.$ %
Response% -
.- .
Headers. 5
.5 6
ContainsKey6 A
(A B
$strB Z
)Z [
)[ \
{ 
context 
. 
HttpContext #
.# $
Response$ ,
., -
Headers- 4
.4 5
Add5 8
(8 9
$str9 Q
,Q R
$strS \
)\ ]
;] ^
} 
if 
( 
! 
context 
. 
HttpContext $
.$ %
Response% -
.- .
Headers. 5
.5 6
ContainsKey6 A
(A B
$strB S
)S T
)T U
{ 
context 
. 
HttpContext #
.# $
Response$ ,
., -
Headers- 4
.4 5
Add5 8
(8 9
$str9 J
,J K
$strL X
)X Y
;Y Z
} 
var 
csp 
= 
$str	 ñ
;
ñ ó
if&& 
(&& 
!&& 
context&& 
.&& 
HttpContext&& $
.&&$ %
Response&&% -
.&&- .
Headers&&. 5
.&&5 6
ContainsKey&&6 A
(&&A B
$str&&B [
)&&[ \
)&&\ ]
{'' 
context(( 
.(( 
HttpContext(( #
.((# $
Response(($ ,
.((, -
Headers((- 4
.((4 5
Add((5 8
(((8 9
$str((9 R
,((R S
csp((T W
)((W X
;((X Y
})) 
if,, 
(,, 
!,, 
context,, 
.,, 
HttpContext,, $
.,,$ %
Response,,% -
.,,- .
Headers,,. 5
.,,5 6
ContainsKey,,6 A
(,,A B
$str,,B ]
),,] ^
),,^ _
{-- 
context.. 
... 
HttpContext.. #
...# $
Response..$ ,
..., -
Headers..- 4
...4 5
Add..5 8
(..8 9
$str..9 T
,..T U
csp..V Y
)..Y Z
;..Z [
}// 
var22 
referrer_policy22 
=22  !
$str22" /
;22/ 0
if33 
(33 
!33 
context33 
.33 
HttpContext33 $
.33$ %
Response33% -
.33- .
Headers33. 5
.335 6
ContainsKey336 A
(33A B
$str33B S
)33S T
)33T U
{44 
context55 
.55 
HttpContext55 #
.55# $
Response55$ ,
.55, -
Headers55- 4
.554 5
Add555 8
(558 9
$str559 J
,55J K
referrer_policy55L [
)55[ \
;55\ ]
}66 
}77 	
}88 
}99 ™
Y/Users/pavel/project/NetMentoring/IdentityServer/Pages/ServerSideSessions/Index.cshtml.cs
	namespace 	
IdentityServer
 
. 
Pages 
. 
ServerSideSessions 1
{ 
public		 

class		 

IndexModel		 
:		 
	PageModel		 '
{

 
private 
readonly %
ISessionManagementService 2%
_sessionManagementService3 L
;L M
public 

IndexModel 
( %
ISessionManagementService 3$
sessionManagementService4 L
=M N
nullO S
)S T
{ 	%
_sessionManagementService %
=& '$
sessionManagementService( @
;@ A
} 	
public 
QueryResult 
< 
UserSession &
>& '
UserSessions( 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
[ 	
BindProperty	 
( 
SupportsGet !
=" #
true$ (
)( )
]) *
public+ 1
string2 8
Filter9 ?
{@ A
getB E
;E F
setG J
;J K
}L M
[ 	
BindProperty	 
( 
SupportsGet !
=" #
true$ (
)( )
]) *
public+ 1
string2 8
Token9 >
{? @
getA D
;D E
setF I
;I J
}K L
[ 	
BindProperty	 
( 
SupportsGet !
=" #
true$ (
)( )
]) *
public+ 1
string2 8
Prev9 =
{> ?
get@ C
;C D
setE H
;H I
}J K
public 
async 
Task 
OnGet 
(  
)  !
{ 	
if 
( %
_sessionManagementService )
!=* ,
null- 1
)1 2
{ 
UserSessions 
= 
await $%
_sessionManagementService% >
.> ?
QuerySessionsAsync? Q
(Q R
newR U
SessionQueryV b
{ 
ResultsToken    
=  ! "
Token  # (
,  ( )
RequestPriorResults!! '
=!!( )
Prev!!* .
==!!/ 1
$str!!2 8
,!!8 9
DisplayName"" 
=""  !
Filter""" (
,""( )
	SessionId## 
=## 
Filter##  &
,##& '
	SubjectId$$ 
=$$ 
Filter$$  &
,$$& '
}%% 
)%% 
;%% 
}&& 
}'' 	
[)) 	
BindProperty))	 
])) 
public)) 
string)) $
	SessionId))% .
{))/ 0
get))1 4
;))4 5
set))6 9
;))9 :
})); <
public++ 
async++ 
Task++ 
<++ 
IActionResult++ '
>++' (
OnPost++) /
(++/ 0
)++0 1
{,, 	
await-- %
_sessionManagementService-- +
.--+ ,
RemoveSessionsAsync--, ?
(--? @
new--@ C!
RemoveSessionsContext--D Y
{.. 
	SessionId// 
=// 
	SessionId// %
,//% &
}00 
)00 
;00 
return11 
RedirectToPage11 !
(11! "
$str11" =
,11= >
new11? B
{11C D
Token11E J
,11J K
Filter11L R
,11R S
Prev11T X
}11Y Z
)11Z [
;11[ \
}22 	
}33 
}44 À%
C/Users/pavel/project/NetMentoring/IdentityServer/Pages/TestUsers.cs
	namespace 	
IdentityServer
 
. 
Pages 
; 
public		 
class		 
	TestUsers		 
{

 
public 

static 
List 
< 
TestUser 
>  
Users! &
{ 
get 
{ 	
var 
address 
= 
new 
{ 
street_address 
=  
$str! 1
,1 2
locality 
= 
$str '
,' (
postal_code 
= 
$num #
,# $
country 
= 
$str #
} 
; 
return 
new 
List 
< 
TestUser $
>$ %
{ 
new 
( 
) 
{ 
	SubjectId 
= 
$str  #
,# $
Username 
= 
$str (
,( )
Password 
= 
$str (
,( )
Claims 
= 
{ 
new   
Claim   !
(  ! "
JwtClaimTypes  " /
.  / 0
Name  0 4
,  4 5
$str  6 E
)  E F
,  F G
new!! 
Claim!! !
(!!! "
JwtClaimTypes!!" /
.!!/ 0
	GivenName!!0 9
,!!9 :
$str!!; D
)!!D E
,!!E F
new"" 
Claim"" !
(""! "
JwtClaimTypes""" /
.""/ 0

FamilyName""0 :
,"": ;
$str""< C
)""C D
,""D E
new## 
Claim## !
(##! "
JwtClaimTypes##" /
.##/ 0
Email##0 5
,##5 6
$str##7 J
)##J K
,##K L
new$$ 
Claim$$ !
($$! "
JwtClaimTypes$$" /
.$$/ 0
EmailVerified$$0 =
,$$= >
$str$$? E
,$$E F
ClaimValueTypes$$G V
.$$V W
Boolean$$W ^
)$$^ _
,$$_ `
new%% 
Claim%% !
(%%! "
JwtClaimTypes%%" /
.%%/ 0
WebSite%%0 7
,%%7 8
$str%%9 K
)%%K L
,%%L M
new&& 
Claim&& !
(&&! "
JwtClaimTypes&&" /
.&&/ 0
Address&&0 7
,&&7 8
JsonSerializer&&9 G
.&&G H
	Serialize&&H Q
(&&Q R
address&&R Y
)&&Y Z
,&&Z [#
IdentityServerConstants'' 3
.''3 4
ClaimValueTypes''4 C
.''C D
Json''D H
)''H I
}(( 
})) 
,)) 
new** 
(** 
)** 
{++ 
	SubjectId,, 
=,, 
$str,,  #
,,,# $
Username-- 
=-- 
$str-- &
,--& '
Password.. 
=.. 
$str.. &
,..& '
Claims// 
=// 
{00 
new11 
Claim11 !
(11! "
JwtClaimTypes11" /
.11/ 0
Name110 4
,114 5
$str116 C
)11C D
,11D E
new22 
Claim22 !
(22! "
JwtClaimTypes22" /
.22/ 0
	GivenName220 9
,229 :
$str22; B
)22B C
,22C D
new33 
Claim33 !
(33! "
JwtClaimTypes33" /
.33/ 0

FamilyName330 :
,33: ;
$str33< C
)33C D
,33D E
new44 
Claim44 !
(44! "
JwtClaimTypes44" /
.44/ 0
Email440 5
,445 6
$str447 H
)44H I
,44I J
new55 
Claim55 !
(55! "
JwtClaimTypes55" /
.55/ 0
EmailVerified550 =
,55= >
$str55? E
,55E F
ClaimValueTypes55G V
.55V W
Boolean55W ^
)55^ _
,55_ `
new66 
Claim66 !
(66! "
JwtClaimTypes66" /
.66/ 0
WebSite660 7
,667 8
$str669 I
)66I J
,66J K
new77 
Claim77 !
(77! "
JwtClaimTypes77" /
.77/ 0
Address770 7
,777 8
JsonSerializer779 G
.77G H
	Serialize77H Q
(77Q R
address77R Y
)77Y Z
,77Z [#
IdentityServerConstants88 3
.883 4
ClaimValueTypes884 C
.88C D
Json88D H
)88H I
}99 
,99 
};; 
}<< 
;<< 
}== 	
}>> 
}?? Ù
;/Users/pavel/project/NetMentoring/IdentityServer/Program.cs
Log 
. 
Logger 

= 
new 
LoggerConfiguration $
($ %
)% &
. 
WriteTo 
. 
Console 
( 
) 
. !
CreateBootstrapLogger 
( 
) 
; 
Log 
. 
Information 
( 
$str 
) 
; 
try

 
{ 
var 
builder 
= 
WebApplication  
.  !
CreateBuilder! .
(. /
args/ 3
)3 4
;4 5
builder 
. 
Host 
. 

UseSerilog 
( 
( 
ctx  
,  !
lc" $
)$ %
=>& (
lc) +
. 	
WriteTo	 
. 
Console 
( 
outputTemplate 
: 
$str n
)n o
. 	
Enrich	 
. 
FromLogContext 
( 
)  
. 	
ReadFrom	 
. 
Configuration 
(  
ctx  #
.# $
Configuration$ 1
)1 2
)2 3
;3 4
var 
app 
= 
builder 
. 	
ConfigureServices	 
( 
) 
. 	
ConfigurePipeline	 
( 
) 
; 
app 
. 
Run 
( 
) 
; 
} 
catch 
( 
	Exception 
ex 
) 
{ 
Log 
. 
Fatal 
( 
ex 
, 
$str '
)' (
;( )
} 
finally 
{   
Log!! 
.!! 
Information!! 
(!! 
$str!! (
)!!( )
;!!) *
Log"" 
."" 
CloseAndFlush"" 
("" 
)"" 
;"" 
}## 