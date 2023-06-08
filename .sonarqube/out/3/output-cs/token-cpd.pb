�#
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
}BB �
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
~ �
(


� �
userManager


� �
,


� �
claimsFactory


� �
)


� �
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
} �"
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
}SS �
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
 ʃ
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
$str	&& �
)
&&� �
;
&&� �
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
�� 
this
�� #
.
��# $
LoadingPage
��$ /
(
��/ 0
Input
��0 5
.
��5 6
	ReturnUrl
��6 ?
)
��? @
;
��@ A
}
�� 
return
�� 
Redirect
�� #
(
��# $
Input
��$ )
.
��) *
	ReturnUrl
��* 3
)
��3 4
;
��4 5
}
�� 
if
�� 
(
�� 
Url
�� 
.
�� 

IsLocalUrl
�� "
(
��" #
Input
��# (
.
��( )
	ReturnUrl
��) 2
)
��2 3
)
��3 4
{
�� 
return
�� 
Redirect
�� #
(
��# $
Input
��$ )
.
��) *
	ReturnUrl
��* 3
)
��3 4
;
��4 5
}
�� 
else
�� 
if
�� 
(
�� 
string
�� 
.
��  
IsNullOrEmpty
��  -
(
��- .
Input
��. 3
.
��3 4
	ReturnUrl
��4 =
)
��= >
)
��> ?
{
�� 
return
�� 
Redirect
�� #
(
��# $
$str
��$ (
)
��( )
;
��) *
}
�� 
else
�� 
{
�� 
throw
�� 
new
�� 
	Exception
�� '
(
��' (
$str
��( <
)
��< =
;
��= >
}
�� 
}
�� 
await
�� 
_events
�� 
.
�� 

RaiseAsync
�� $
(
��$ %
new
��% (#
UserLoginFailureEvent
��) >
(
��> ?
Input
��? D
.
��D E
Username
��E M
,
��M N
$str
��O d
,
��d e
clientId
�� 
:
�� 
context
�� !
?
��! "
.
��" #
Client
��# )
.
��) *
ClientId
��* 2
)
��2 3
)
��3 4
;
��4 5

ModelState
�� 
.
�� 
AddModelError
�� $
(
��$ %
string
��% +
.
��+ ,
Empty
��, 1
,
��1 2
LoginOptions
��3 ?
.
��? @,
InvalidCredentialsErrorMessage
��@ ^
)
��^ _
;
��_ `
}
�� 	
await
�� 
BuildModelAsync
�� 
(
�� 
Input
�� #
.
��# $
	ReturnUrl
��$ -
)
��- .
;
��. /
return
�� 
Page
�� 
(
�� 
)
�� 
;
�� 
}
�� 
private
�� 
async
�� 
Task
�� 
BuildModelAsync
�� &
(
��& '
string
��' -
	returnUrl
��. 7
)
��7 8
{
�� 
Input
�� 
=
�� 
new
�� 

InputModel
�� 
{
�� 	
	ReturnUrl
�� 
=
�� 
	returnUrl
�� !
}
�� 	
;
��	 

var
�� 
context
�� 
=
�� 
await
�� 
_interaction
�� (
.
��( )*
GetAuthorizationContextAsync
��) E
(
��E F
	returnUrl
��F O
)
��O P
;
��P Q
if
�� 

(
�� 
context
�� 
?
�� 
.
�� 
IdP
�� 
!=
�� 
null
��  
&&
��! #
await
��$ )
_schemeProvider
��* 9
.
��9 :
GetSchemeAsync
��: H
(
��H I
context
��I P
.
��P Q
IdP
��Q T
)
��T U
!=
��V X
null
��Y ]
)
��] ^
{
�� 	
var
�� 
local
�� 
=
�� 
context
�� 
.
��  
IdP
��  #
==
��$ &
Duende
��' -
.
��- .
IdentityServer
��. <
.
��< =%
IdentityServerConstants
��= T
.
��T U#
LocalIdentityProvider
��U j
;
��j k
View
�� 
=
�� 
new
�� 
	ViewModel
��  
{
�� 
EnableLocalLogin
��  
=
��! "
local
��# (
,
��( )
}
�� 
;
�� 
Input
�� 
.
�� 
Username
�� 
=
�� 
context
�� $
?
��$ %
.
��% &
	LoginHint
��& /
;
��/ 0
if
�� 
(
�� 
!
�� 
local
�� 
)
�� 
{
�� 
View
�� 
.
�� 
ExternalProviders
�� &
=
��' (
new
��) ,
[
��, -
]
��- .
{
�� 
new
�� 
	ViewModel
�� #
.
��# $
ExternalProvider
��$ 4
{
��5 6"
AuthenticationScheme
��7 K
=
��L M
context
��N U
.
��U V
IdP
��V Y
}
��Z [
}
��\ ]
;
��] ^
}
�� 
return
�� 
;
�� 
}
�� 	
var
�� 
schemes
�� 
=
�� 
await
�� 
_schemeProvider
�� +
.
��+ , 
GetAllSchemesAsync
��, >
(
��> ?
)
��? @
;
��@ A
var
�� 
	providers
�� 
=
�� 
schemes
�� 
.
�� 
Where
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
�� 
DisplayName
�� %
!=
��& (
null
��) -
)
��- .
.
�� 
Select
�� 
(
�� 
x
�� 
=>
�� 
new
�� 
	ViewModel
�� &
.
��& '
ExternalProvider
��' 7
{
�� 
DisplayName
�� 
=
�� 
x
�� 
.
��  
DisplayName
��  +
??
��, .
x
��/ 0
.
��0 1
Name
��1 5
,
��5 6"
AuthenticationScheme
�� $
=
��% &
x
��' (
.
��( )
Name
��) -
}
�� 
)
�� 
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
var
�� 
dyanmicSchemes
�� 
=
�� 
(
�� 
await
�� #$
_identityProviderStore
��$ :
.
��: ;$
GetAllSchemeNamesAsync
��; Q
(
��Q R
)
��R S
)
��S T
.
�� 
Where
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
�� 
Enabled
�� !
)
��! "
.
�� 
Select
�� 
(
�� 
x
�� 
=>
�� 
new
�� 
	ViewModel
�� &
.
��& '
ExternalProvider
��' 7
{
�� "
AuthenticationScheme
�� $
=
��% &
x
��' (
.
��( )
Scheme
��) /
,
��/ 0
DisplayName
�� 
=
�� 
x
�� 
.
��  
DisplayName
��  +
}
�� 
)
�� 
;
�� 
	providers
�� 
.
�� 
AddRange
�� 
(
�� 
dyanmicSchemes
�� )
)
��) *
;
��* +
var
�� 

allowLocal
�� 
=
�� 
true
�� 
;
�� 
var
�� 
client
�� 
=
�� 
context
�� 
?
�� 
.
�� 
Client
�� $
;
��$ %
if
�� 

(
�� 
client
�� 
!=
�� 
null
�� 
)
�� 
{
�� 	

allowLocal
�� 
=
�� 
client
�� 
.
��  
EnableLocalLogin
��  0
;
��0 1
if
�� 
(
�� 
client
�� 
.
�� *
IdentityProviderRestrictions
�� 3
!=
��4 6
null
��7 ;
&&
��< >
client
��? E
.
��E F*
IdentityProviderRestrictions
��F b
.
��b c
Any
��c f
(
��f g
)
��g h
)
��h i
{
�� 
	providers
�� 
=
�� 
	providers
�� %
.
��% &
Where
��& +
(
��+ ,
provider
��, 4
=>
��5 7
client
�� 
.
�� *
IdentityProviderRestrictions
�� 7
.
��7 8
Contains
��8 @
(
��@ A
provider
��A I
.
��I J"
AuthenticationScheme
��J ^
)
��^ _
)
��_ `
.
��` a
ToList
��a g
(
��g h
)
��h i
;
��i j
}
�� 
}
�� 	
View
�� 
=
�� 
new
�� 
	ViewModel
�� 
{
�� 	 
AllowRememberLogin
�� 
=
��  
LoginOptions
��! -
.
��- . 
AllowRememberLogin
��. @
,
��@ A
EnableLocalLogin
�� 
=
�� 

allowLocal
�� )
&&
��* ,
LoginOptions
��- 9
.
��9 :
AllowLocalLogin
��: I
,
��I J
ExternalProviders
�� 
=
�� 
	providers
��  )
.
��) *
ToArray
��* 1
(
��1 2
)
��2 3
}
�� 	
;
��	 

}
�� 
}�� �	
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
} �
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
}		 �
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
} �,
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
}__ �
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
}!! �
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
} �
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
} �
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
}!! �
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
�� 
null
�� 
;
�� 
}
�� 
private
�� 
	ViewModel
�� $
CreateConsentViewModel
�� ,
(
��, -

InputModel
�� 
model
�� 
,
�� 
string
��  
id
��! #
,
��# $)
BackchannelUserLoginRequest
�� #
request
��$ +
)
��+ ,
{
�� 
var
�� 
vm
�� 
=
�� 
new
�� 
	ViewModel
�� 
{
�� 	

ClientName
�� 
=
�� 
request
��  
.
��  !
Client
��! '
.
��' (

ClientName
��( 2
??
��3 5
request
��6 =
.
��= >
Client
��> D
.
��D E
ClientId
��E M
,
��M N
	ClientUrl
�� 
=
�� 
request
�� 
.
��  
Client
��  &
.
��& '
	ClientUri
��' 0
,
��0 1
ClientLogoUrl
�� 
=
�� 
request
�� #
.
��# $
Client
��$ *
.
��* +
LogoUri
��+ 2
,
��2 3
BindingMessage
�� 
=
�� 
request
�� $
.
��$ %
BindingMessage
��% 3
}
�� 	
;
��	 

vm
�� 

.
��
 
IdentityScopes
�� 
=
�� 
request
�� #
.
��# $ 
ValidatedResources
��$ 6
.
��6 7
	Resources
��7 @
.
��@ A
IdentityResources
��A R
.
�� 
Select
�� 
(
�� 
x
�� 
=>
�� "
CreateScopeViewModel
�� -
(
��- .
x
��. /
,
��/ 0
model
�� 
?
�� 
.
�� 
ScopesConsented
�� &
==
��' )
null
��* .
||
��/ 1
model
��2 7
.
��7 8
ScopesConsented
��8 G
?
��G H
.
��H I
Contains
��I Q
(
��Q R
x
��R S
.
��S T
Name
��T X
)
��X Y
==
��Z \
true
��] a
)
��a b
)
��b c
.
�� 
ToArray
�� 
(
�� 
)
�� 
;
�� 
var
��  
resourceIndicators
�� 
=
��  
request
��! (
.
��( ))
RequestedResourceIndicators
��) D
??
��E G

Enumerable
��H R
.
��R S
Empty
��S X
<
��X Y
string
��Y _
>
��_ `
(
��` a
)
��a b
;
��b c
var
�� 
apiResources
�� 
=
�� 
request
�� 
.
��  
ValidatedResources
�� &
.
��& '
	Resources
��' 0
.
��0 1
ApiResources
��1 =
.
��= >
Where
��> C
(
��C D
x
��D E
=>
��F H 
resourceIndicators
��I [
.
��[ \
Contains
��\ d
(
��d e
x
��e f
.
��f g
Name
��g k
)
��k l
)
��l m
;
��m n
var
�� 
	apiScopes
�� 
=
�� 
new
�� 
List
��  
<
��  !
ScopeViewModel
��! /
>
��/ 0
(
��0 1
)
��1 2
;
��2 3
foreach
�� 
(
�� 
var
�� 
parsedScope
��  
in
��! #
request
��$ +
.
��+ , 
ValidatedResources
��, >
.
��> ?
ParsedScopes
��? K
)
��K L
{
�� 	
var
�� 
apiScope
�� 
=
�� 
request
�� "
.
��" # 
ValidatedResources
��# 5
.
��5 6
	Resources
��6 ?
.
��? @
FindApiScope
��@ L
(
��L M
parsedScope
��M X
.
��X Y

ParsedName
��Y c
)
��c d
;
��d e
if
�� 
(
�� 
apiScope
�� 
!=
�� 
null
��  
)
��  !
{
�� 
var
�� 
scopeVm
�� 
=
�� "
CreateScopeViewModel
�� 2
(
��2 3
parsedScope
��3 >
,
��> ?
apiScope
��@ H
,
��H I
model
�� 
==
�� 
null
�� !
||
��" $
model
��% *
.
��* +
ScopesConsented
��+ :
?
��: ;
.
��; <
Contains
��< D
(
��D E
parsedScope
��E P
.
��P Q
RawValue
��Q Y
)
��Y Z
==
��[ ]
true
��^ b
)
��b c
;
��c d
scopeVm
�� 
.
�� 
	Resources
�� !
=
��" #
apiResources
��$ 0
.
��0 1
Where
��1 6
(
��6 7
x
��7 8
=>
��9 ;
x
��< =
.
��= >
Scopes
��> D
.
��D E
Contains
��E M
(
��M N
parsedScope
��N Y
.
��Y Z

ParsedName
��Z d
)
��d e
)
��e f
.
�� 
Select
�� 
(
�� 
x
�� 
=>
��  
new
��! $
ResourceViewModel
��% 6
{
�� 
Name
�� 
=
�� 
x
��  
.
��  !
Name
��! %
,
��% &
DisplayName
�� #
=
��$ %
x
��& '
.
��' (
DisplayName
��( 3
??
��4 6
x
��7 8
.
��8 9
Name
��9 =
,
��= >
}
�� 
)
�� 
.
�� 
ToArray
�� 
(
�� 
)
��  
;
��  !
	apiScopes
�� 
.
�� 
Add
�� 
(
�� 
scopeVm
�� %
)
��% &
;
��& '
}
�� 
}
�� 	
if
�� 

(
�� 
ConsentOptions
�� 
.
�� !
EnableOfflineAccess
�� .
&&
��/ 1
request
��2 9
.
��9 : 
ValidatedResources
��: L
.
��L M
	Resources
��M V
.
��V W
OfflineAccess
��W d
)
��d e
{
�� 	
	apiScopes
�� 
.
�� 
Add
�� 
(
�� #
GetOfflineAccessScope
�� /
(
��/ 0
model
��0 5
==
��6 8
null
��9 =
||
��> @
model
��0 5
.
��5 6
ScopesConsented
��6 E
?
��E F
.
��F G
Contains
��G O
(
��O P
Duende
��P V
.
��V W
IdentityServer
��W e
.
��4 5%
IdentityServerConstants
��5 L
.
��L M
StandardScopes
��M [
.
��[ \
OfflineAccess
��\ i
)
��i j
==
��k m
true
��n r
)
��r s
)
��s t
;
��t u
}
�� 	
vm
�� 

.
��
 
	ApiScopes
�� 
=
�� 
	apiScopes
��  
;
��  !
return
�� 
vm
�� 
;
�� 
}
�� 
private
�� 
ScopeViewModel
�� "
CreateScopeViewModel
�� /
(
��/ 0
IdentityResource
��0 @
identity
��A I
,
��I J
bool
��K O
check
��P U
)
��U V
{
�� 
return
�� 
new
�� 
ScopeViewModel
�� !
{
�� 	
Name
�� 
=
�� 
identity
�� 
.
�� 
Name
��  
,
��  !
Value
�� 
=
�� 
identity
�� 
.
�� 
Name
�� !
,
��! "
DisplayName
�� 
=
�� 
identity
�� "
.
��" #
DisplayName
��# .
??
��/ 1
identity
��2 :
.
��: ;
Name
��; ?
,
��? @
Description
�� 
=
�� 
identity
�� "
.
��" #
Description
��# .
,
��. /
	Emphasize
�� 
=
�� 
identity
��  
.
��  !
	Emphasize
��! *
,
��* +
Required
�� 
=
�� 
identity
�� 
.
��  
Required
��  (
,
��( )
Checked
�� 
=
�� 
check
�� 
||
�� 
identity
�� '
.
��' (
Required
��( 0
}
�� 	
;
��	 

}
�� 
public
�� 

ScopeViewModel
�� "
CreateScopeViewModel
�� .
(
��. /
ParsedScopeValue
��/ ?
parsedScopeValue
��@ P
,
��P Q
ApiScope
��R Z
apiScope
��[ c
,
��c d
bool
��e i
check
��j o
)
��o p
{
�� 
var
�� 
displayName
�� 
=
�� 
apiScope
�� "
.
��" #
DisplayName
��# .
??
��/ 1
apiScope
��2 :
.
��: ;
Name
��; ?
;
��? @
if
�� 

(
�� 
!
�� 
String
�� 
.
��  
IsNullOrWhiteSpace
�� &
(
��& '
parsedScopeValue
��' 7
.
��7 8
ParsedParameter
��8 G
)
��G H
)
��H I
{
�� 	
displayName
�� 
+=
�� 
$str
�� 
+
��  
parsedScopeValue
��! 1
.
��1 2
ParsedParameter
��2 A
;
��A B
}
�� 	
return
�� 
new
�� 
ScopeViewModel
�� !
{
�� 	
Name
�� 
=
�� 
parsedScopeValue
�� #
.
��# $

ParsedName
��$ .
,
��. /
Value
�� 
=
�� 
parsedScopeValue
�� $
.
��$ %
RawValue
��% -
,
��- .
DisplayName
�� 
=
�� 
displayName
�� %
,
��% &
Description
�� 
=
�� 
apiScope
�� "
.
��" #
Description
��# .
,
��. /
	Emphasize
�� 
=
�� 
apiScope
��  
.
��  !
	Emphasize
��! *
,
��* +
Required
�� 
=
�� 
apiScope
�� 
.
��  
Required
��  (
,
��( )
Checked
�� 
=
�� 
check
�� 
||
�� 
apiScope
�� '
.
��' (
Required
��( 0
}
�� 	
;
��	 

}
�� 
private
�� 
ScopeViewModel
�� #
GetOfflineAccessScope
�� 0
(
��0 1
bool
��1 5
check
��6 ;
)
��; <
{
�� 
return
�� 
new
�� 
ScopeViewModel
�� !
{
�� 	
Value
�� 
=
�� 
Duende
�� 
.
�� 
IdentityServer
�� )
.
��) *%
IdentityServerConstants
��* A
.
��A B
StandardScopes
��B P
.
��P Q
OfflineAccess
��Q ^
,
��^ _
DisplayName
�� 
=
�� 
ConsentOptions
�� (
.
��( )&
OfflineAccessDisplayName
��) A
,
��A B
Description
�� 
=
�� 
ConsentOptions
�� (
.
��( )&
OfflineAccessDescription
��) A
,
��A B
	Emphasize
�� 
=
�� 
true
�� 
,
�� 
Checked
�� 
=
�� 
check
�� 
}
�� 	
;
��	 

}
�� 
}�� �
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
} �
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
}'' �
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
} �
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
}"" �
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
} ��
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
�� 	
return
�� $
CreateConsentViewModel
�� )
(
��) *
model
��* /
,
��/ 0
	returnUrl
��1 :
,
��: ;
request
��< C
)
��C D
;
��D E
}
�� 	
else
�� 
{
�� 	
_logger
�� 
.
�� 
LogError
�� 
(
�� 
$str
�� G
,
��G H
	returnUrl
��I R
)
��R S
;
��S T
}
�� 	
return
�� 
null
�� 
;
�� 
}
�� 
private
�� 
	ViewModel
�� $
CreateConsentViewModel
�� ,
(
��, -

InputModel
�� 
model
�� 
,
�� 
string
��  
	returnUrl
��! *
,
��* +"
AuthorizationRequest
�� 
request
�� $
)
��$ %
{
�� 
var
�� 
vm
�� 
=
�� 
new
�� 
	ViewModel
�� 
{
�� 	

ClientName
�� 
=
�� 
request
��  
.
��  !
Client
��! '
.
��' (

ClientName
��( 2
??
��3 5
request
��6 =
.
��= >
Client
��> D
.
��D E
ClientId
��E M
,
��M N
	ClientUrl
�� 
=
�� 
request
�� 
.
��  
Client
��  &
.
��& '
	ClientUri
��' 0
,
��0 1
ClientLogoUrl
�� 
=
�� 
request
�� #
.
��# $
Client
��$ *
.
��* +
LogoUri
��+ 2
,
��2 3"
AllowRememberConsent
��  
=
��! "
request
��# *
.
��* +
Client
��+ 1
.
��1 2"
AllowRememberConsent
��2 F
}
�� 	
;
��	 

vm
�� 

.
��
 
IdentityScopes
�� 
=
�� 
request
�� #
.
��# $ 
ValidatedResources
��$ 6
.
��6 7
	Resources
��7 @
.
��@ A
IdentityResources
��A R
.
�� 
Select
�� 
(
�� 
x
�� 
=>
�� "
CreateScopeViewModel
�� -
(
��- .
x
��. /
,
��/ 0
model
�� 
?
�� 
.
�� 
ScopesConsented
�� &
==
��' )
null
��* .
||
��/ 1
model
��2 7
.
��7 8
ScopesConsented
��8 G
?
��G H
.
��H I
Contains
��I Q
(
��Q R
x
��R S
.
��S T
Name
��T X
)
��X Y
==
��Z \
true
��] a
)
��a b
)
��b c
.
�� 
ToArray
�� 
(
�� 
)
�� 
;
�� 
var
��  
resourceIndicators
�� 
=
��  
request
��! (
.
��( )

Parameters
��) 3
.
��3 4
	GetValues
��4 =
(
��= >
OidcConstants
��> K
.
��K L
AuthorizeRequest
��L \
.
��\ ]
Resource
��] e
)
��e f
??
��g i

Enumerable
��! +
.
��+ ,
Empty
��, 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
)
��: ;
;
��; <
var
�� 
apiResources
�� 
=
�� 
request
�� 
.
��  
ValidatedResources
�� &
.
��& '
	Resources
��' 0
.
��0 1
ApiResources
��1 =
.
��= >
Where
��> C
(
��C D
x
��D E
=>
��F H 
resourceIndicators
��I [
.
��[ \
Contains
��\ d
(
��d e
x
��e f
.
��f g
Name
��g k
)
��k l
)
��l m
;
��m n
var
�� 
	apiScopes
�� 
=
�� 
new
�� 
List
��  
<
��  !
ScopeViewModel
��! /
>
��/ 0
(
��0 1
)
��1 2
;
��2 3
foreach
�� 
(
�� 
var
�� 
parsedScope
��  
in
��! #
request
��$ +
.
��+ , 
ValidatedResources
��, >
.
��> ?
ParsedScopes
��? K
)
��K L
{
�� 	
var
�� 
apiScope
�� 
=
�� 
request
�� "
.
��" # 
ValidatedResources
��# 5
.
��5 6
	Resources
��6 ?
.
��? @
FindApiScope
��@ L
(
��L M
parsedScope
��M X
.
��X Y

ParsedName
��Y c
)
��c d
;
��d e
if
�� 
(
�� 
apiScope
�� 
!=
�� 
null
��  
)
��  !
{
�� 
var
�� 
scopeVm
�� 
=
�� "
CreateScopeViewModel
�� 2
(
��2 3
parsedScope
��3 >
,
��> ?
apiScope
��@ H
,
��H I
model
�� 
==
�� 
null
�� !
||
��" $
model
��% *
.
��* +
ScopesConsented
��+ :
?
��: ;
.
��; <
Contains
��< D
(
��D E
parsedScope
��E P
.
��P Q
RawValue
��Q Y
)
��Y Z
==
��[ ]
true
��^ b
)
��b c
;
��c d
scopeVm
�� 
.
�� 
	Resources
�� !
=
��" #
apiResources
��$ 0
.
��0 1
Where
��1 6
(
��6 7
x
��7 8
=>
��9 ;
x
��< =
.
��= >
Scopes
��> D
.
��D E
Contains
��E M
(
��M N
parsedScope
��N Y
.
��Y Z

ParsedName
��Z d
)
��d e
)
��e f
.
�� 
Select
�� 
(
�� 
x
�� 
=>
��  
new
��! $
ResourceViewModel
��% 6
{
�� 
Name
�� 
=
�� 
x
��  
.
��  !
Name
��! %
,
��% &
DisplayName
�� #
=
��$ %
x
��& '
.
��' (
DisplayName
��( 3
??
��4 6
x
��7 8
.
��8 9
Name
��9 =
,
��= >
}
�� 
)
�� 
.
�� 
ToArray
�� 
(
�� 
)
��  
;
��  !
	apiScopes
�� 
.
�� 
Add
�� 
(
�� 
scopeVm
�� %
)
��% &
;
��& '
}
�� 
}
�� 	
if
�� 

(
�� 
ConsentOptions
�� 
.
�� !
EnableOfflineAccess
�� .
&&
��/ 1
request
��2 9
.
��9 : 
ValidatedResources
��: L
.
��L M
	Resources
��M V
.
��V W
OfflineAccess
��W d
)
��d e
{
�� 	
	apiScopes
�� 
.
�� 
Add
�� 
(
�� #
GetOfflineAccessScope
�� /
(
��/ 0
model
��0 5
==
��6 8
null
��9 =
||
��> @
model
��0 5
.
��5 6
ScopesConsented
��6 E
?
��E F
.
��F G
Contains
��G O
(
��O P
Duende
��P V
.
��V W
IdentityServer
��W e
.
��4 5%
IdentityServerConstants
��5 L
.
��L M
StandardScopes
��M [
.
��[ \
OfflineAccess
��\ i
)
��i j
==
��k m
true
��n r
)
��r s
)
��s t
;
��t u
}
�� 	
vm
�� 

.
��
 
	ApiScopes
�� 
=
�� 
	apiScopes
��  
;
��  !
return
�� 
vm
�� 
;
�� 
}
�� 
private
�� 
ScopeViewModel
�� "
CreateScopeViewModel
�� /
(
��/ 0
IdentityResource
��0 @
identity
��A I
,
��I J
bool
��K O
check
��P U
)
��U V
{
�� 
return
�� 
new
�� 
ScopeViewModel
�� !
{
�� 	
Name
�� 
=
�� 
identity
�� 
.
�� 
Name
��  
,
��  !
Value
�� 
=
�� 
identity
�� 
.
�� 
Name
�� !
,
��! "
DisplayName
�� 
=
�� 
identity
�� "
.
��" #
DisplayName
��# .
??
��/ 1
identity
��2 :
.
��: ;
Name
��; ?
,
��? @
Description
�� 
=
�� 
identity
�� "
.
��" #
Description
��# .
,
��. /
	Emphasize
�� 
=
�� 
identity
��  
.
��  !
	Emphasize
��! *
,
��* +
Required
�� 
=
�� 
identity
�� 
.
��  
Required
��  (
,
��( )
Checked
�� 
=
�� 
check
�� 
||
�� 
identity
�� '
.
��' (
Required
��( 0
}
�� 	
;
��	 

}
�� 
public
�� 

ScopeViewModel
�� "
CreateScopeViewModel
�� .
(
��. /
ParsedScopeValue
��/ ?
parsedScopeValue
��@ P
,
��P Q
ApiScope
��R Z
apiScope
��[ c
,
��c d
bool
��e i
check
��j o
)
��o p
{
�� 
var
�� 
displayName
�� 
=
�� 
apiScope
�� "
.
��" #
DisplayName
��# .
??
��/ 1
apiScope
��2 :
.
��: ;
Name
��; ?
;
��? @
if
�� 

(
�� 
!
�� 
String
�� 
.
��  
IsNullOrWhiteSpace
�� &
(
��& '
parsedScopeValue
��' 7
.
��7 8
ParsedParameter
��8 G
)
��G H
)
��H I
{
�� 	
displayName
�� 
+=
�� 
$str
�� 
+
��  
parsedScopeValue
��! 1
.
��1 2
ParsedParameter
��2 A
;
��A B
}
�� 	
return
�� 
new
�� 
ScopeViewModel
�� !
{
�� 	
Name
�� 
=
�� 
parsedScopeValue
�� #
.
��# $

ParsedName
��$ .
,
��. /
Value
�� 
=
�� 
parsedScopeValue
�� $
.
��$ %
RawValue
��% -
,
��- .
DisplayName
�� 
=
�� 
displayName
�� %
,
��% &
Description
�� 
=
�� 
apiScope
�� "
.
��" #
Description
��# .
,
��. /
	Emphasize
�� 
=
�� 
apiScope
��  
.
��  !
	Emphasize
��! *
,
��* +
Required
�� 
=
�� 
apiScope
�� 
.
��  
Required
��  (
,
��( )
Checked
�� 
=
�� 
check
�� 
||
�� 
apiScope
�� '
.
��' (
Required
��( 0
}
�� 	
;
��	 

}
�� 
private
�� 
ScopeViewModel
�� #
GetOfflineAccessScope
�� 0
(
��0 1
bool
��1 5
check
��6 ;
)
��; <
{
�� 
return
�� 
new
�� 
ScopeViewModel
�� !
{
�� 	
Value
�� 
=
�� 
Duende
�� 
.
�� 
IdentityServer
�� )
.
��) *%
IdentityServerConstants
��* A
.
��A B
StandardScopes
��B P
.
��P Q
OfflineAccess
��Q ^
,
��^ _
DisplayName
�� 
=
�� 
ConsentOptions
�� (
.
��( )&
OfflineAccessDisplayName
��) A
,
��A B
Description
�� 
=
�� 
ConsentOptions
�� (
.
��( )&
OfflineAccessDescription
��) A
,
��A B
	Emphasize
�� 
=
�� 
true
�� 
,
�� 
Checked
�� 
=
�� 
check
�� 
}
�� 	
;
��	 

}
�� 
}�� �	
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
} �
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
}!! �	
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
} ڔ
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
�� 
=
�� 
await
�� !
BuildViewModelAsync
�� (
(
��( )
Input
��) .
.
��. /
UserCode
��/ 7
,
��7 8
Input
��9 >
)
��> ?
;
��? @
return
�� 
Page
�� 
(
�� 
)
�� 
;
�� 
}
�� 
private
�� 
async
�� 
Task
�� 
<
�� 
	ViewModel
��  
>
��  !!
BuildViewModelAsync
��" 5
(
��5 6
string
��6 <
userCode
��= E
,
��E F

InputModel
��G Q
model
��R W
=
��X Y
null
��Z ^
)
��^ _
{
�� 
var
�� 
request
�� 
=
�� 
await
�� 
_interaction
�� (
.
��( )*
GetAuthorizationContextAsync
��) E
(
��E F
userCode
��F N
)
��N O
;
��O P
if
�� 

(
�� 
request
�� 
!=
�� 
null
�� 
)
�� 
{
�� 	
return
�� $
CreateConsentViewModel
�� )
(
��) *
model
��* /
,
��/ 0
request
��1 8
)
��8 9
;
��9 :
}
�� 	
return
�� 
null
�� 
;
�� 
}
�� 
private
�� 
	ViewModel
�� $
CreateConsentViewModel
�� ,
(
��, -

InputModel
��- 7
model
��8 =
,
��= >,
DeviceFlowAuthorizationRequest
��? ]
request
��^ e
)
��e f
{
�� 
var
�� 
vm
�� 
=
�� 
new
�� 
	ViewModel
�� 
{
�� 	

ClientName
�� 
=
�� 
request
��  
.
��  !
Client
��! '
.
��' (

ClientName
��( 2
??
��3 5
request
��6 =
.
��= >
Client
��> D
.
��D E
ClientId
��E M
,
��M N
	ClientUrl
�� 
=
�� 
request
�� 
.
��  
Client
��  &
.
��& '
	ClientUri
��' 0
,
��0 1
ClientLogoUrl
�� 
=
�� 
request
�� #
.
��# $
Client
��$ *
.
��* +
LogoUri
��+ 2
,
��2 3"
AllowRememberConsent
��  
=
��! "
request
��# *
.
��* +
Client
��+ 1
.
��1 2"
AllowRememberConsent
��2 F
}
�� 	
;
��	 

vm
�� 

.
��
 
IdentityScopes
�� 
=
�� 
request
�� #
.
��# $ 
ValidatedResources
��$ 6
.
��6 7
	Resources
��7 @
.
��@ A
IdentityResources
��A R
.
��R S
Select
��S Y
(
��Y Z
x
��Z [
=>
��\ ^"
CreateScopeViewModel
��  
(
��  !
x
��! "
,
��" #
model
��$ )
==
��* ,
null
��- 1
||
��2 4
model
��5 :
.
��: ;
ScopesConsented
��; J
?
��J K
.
��K L
Contains
��L T
(
��T U
x
��U V
.
��V W
Name
��W [
)
��[ \
==
��] _
true
��` d
)
��d e
)
��e f
.
��f g
ToArray
��g n
(
��n o
)
��o p
;
��p q
var
�� 
	apiScopes
�� 
=
�� 
new
�� 
List
��  
<
��  !
ScopeViewModel
��! /
>
��/ 0
(
��0 1
)
��1 2
;
��2 3
foreach
�� 
(
�� 
var
�� 
parsedScope
��  
in
��! #
request
��$ +
.
��+ , 
ValidatedResources
��, >
.
��> ?
ParsedScopes
��? K
)
��K L
{
�� 	
var
�� 
apiScope
�� 
=
�� 
request
�� "
.
��" # 
ValidatedResources
��# 5
.
��5 6
	Resources
��6 ?
.
��? @
FindApiScope
��@ L
(
��L M
parsedScope
��M X
.
��X Y

ParsedName
��Y c
)
��c d
;
��d e
if
�� 
(
�� 
apiScope
�� 
!=
�� 
null
��  
)
��  !
{
�� 
var
�� 
scopeVm
�� 
=
�� "
CreateScopeViewModel
�� 2
(
��2 3
parsedScope
��3 >
,
��> ?
apiScope
��@ H
,
��H I
model
�� 
==
�� 
null
�� !
||
��" $
model
��% *
.
��* +
ScopesConsented
��+ :
?
��: ;
.
��; <
Contains
��< D
(
��D E
parsedScope
��E P
.
��P Q
RawValue
��Q Y
)
��Y Z
==
��[ ]
true
��^ b
)
��b c
;
��c d
	apiScopes
�� 
.
�� 
Add
�� 
(
�� 
scopeVm
�� %
)
��% &
;
��& '
}
�� 
}
�� 	
if
�� 

(
�� 
DeviceOptions
�� 
.
�� !
EnableOfflineAccess
�� -
&&
��. 0
request
��1 8
.
��8 9 
ValidatedResources
��9 K
.
��K L
	Resources
��L U
.
��U V
OfflineAccess
��V c
)
��c d
{
�� 	
	apiScopes
�� 
.
�� 
Add
�� 
(
�� #
GetOfflineAccessScope
�� /
(
��/ 0
model
��0 5
==
��6 8
null
��9 =
||
��> @
model
��0 5
.
��5 6
ScopesConsented
��6 E
?
��E F
.
��F G
Contains
��G O
(
��O P
Duende
��P V
.
��V W
IdentityServer
��W e
.
��4 5%
IdentityServerConstants
��5 L
.
��L M
StandardScopes
��M [
.
��[ \
OfflineAccess
��\ i
)
��i j
==
��k m
true
��n r
)
��r s
)
��s t
;
��t u
}
�� 	
vm
�� 

.
��
 
	ApiScopes
�� 
=
�� 
	apiScopes
��  
;
��  !
return
�� 
vm
�� 
;
�� 
}
�� 
private
�� 
ScopeViewModel
�� "
CreateScopeViewModel
�� /
(
��/ 0
IdentityResource
��0 @
identity
��A I
,
��I J
bool
��K O
check
��P U
)
��U V
{
�� 
return
�� 
new
�� 
ScopeViewModel
�� !
{
�� 	
Value
�� 
=
�� 
identity
�� 
.
�� 
Name
�� !
,
��! "
DisplayName
�� 
=
�� 
identity
�� "
.
��" #
DisplayName
��# .
??
��/ 1
identity
��2 :
.
��: ;
Name
��; ?
,
��? @
Description
�� 
=
�� 
identity
�� "
.
��" #
Description
��# .
,
��. /
	Emphasize
�� 
=
�� 
identity
��  
.
��  !
	Emphasize
��! *
,
��* +
Required
�� 
=
�� 
identity
�� 
.
��  
Required
��  (
,
��( )
Checked
�� 
=
�� 
check
�� 
||
�� 
identity
�� '
.
��' (
Required
��( 0
}
�� 	
;
��	 

}
�� 
public
�� 

ScopeViewModel
�� "
CreateScopeViewModel
�� .
(
��. /
ParsedScopeValue
��/ ?
parsedScopeValue
��@ P
,
��P Q
ApiScope
��R Z
apiScope
��[ c
,
��c d
bool
��e i
check
��j o
)
��o p
{
�� 
return
�� 
new
�� 
ScopeViewModel
�� !
{
�� 	
Value
�� 
=
�� 
parsedScopeValue
�� $
.
��$ %
RawValue
��% -
,
��- .
DisplayName
�� 
=
�� 
apiScope
�� "
.
��" #
DisplayName
��# .
??
��/ 1
apiScope
��2 :
.
��: ;
Name
��; ?
,
��? @
Description
�� 
=
�� 
apiScope
�� "
.
��" #
Description
��# .
,
��. /
	Emphasize
�� 
=
�� 
apiScope
��  
.
��  !
	Emphasize
��! *
,
��* +
Required
�� 
=
�� 
apiScope
�� 
.
��  
Required
��  (
,
��( )
Checked
�� 
=
�� 
check
�� 
||
�� 
apiScope
�� '
.
��' (
Required
��( 0
}
�� 	
;
��	 

}
�� 
private
�� 
ScopeViewModel
�� #
GetOfflineAccessScope
�� 0
(
��0 1
bool
��1 5
check
��6 ;
)
��; <
{
�� 
return
�� 
new
�� 
ScopeViewModel
�� !
{
�� 	
Value
�� 
=
�� 
Duende
�� 
.
�� 
IdentityServer
�� )
.
��) *%
IdentityServerConstants
��* A
.
��A B
StandardScopes
��B P
.
��P Q
OfflineAccess
��Q ^
,
��^ _
DisplayName
�� 
=
�� 
DeviceOptions
�� '
.
��' (&
OfflineAccessDisplayName
��( @
,
��@ A
Description
�� 
=
�� 
DeviceOptions
�� '
.
��' (&
OfflineAccessDescription
��( @
,
��@ A
	Emphasize
�� 
=
�� 
true
�� 
,
�� 
Checked
�� 
=
�� 
check
�� 
}
�� 	
;
��	 

}
�� 
}�� �

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
} �
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
} �
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
} �
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
} �
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
} �
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
}++ �S
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
$str	   �
)
  � �
;
  � �
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
�� 
sid
�� 
=
�� 
externalResult
��  
.
��  !
	Principal
��! *
.
��* +
Claims
��+ 1
.
��1 2
FirstOrDefault
��2 @
(
��@ A
x
��A B
=>
��C E
x
��F G
.
��G H
Type
��H L
==
��M O
JwtClaimTypes
��P ]
.
��] ^
	SessionId
��^ g
)
��g h
;
��h i
if
�� 

(
�� 
sid
�� 
!=
�� 
null
�� 
)
�� 
{
�� 	
localClaims
�� 
.
�� 
Add
�� 
(
�� 
new
�� 
Claim
��  %
(
��% &
JwtClaimTypes
��& 3
.
��3 4
	SessionId
��4 =
,
��= >
sid
��? B
.
��B C
Value
��C H
)
��H I
)
��I J
;
��J K
}
�� 	
var
�� 
idToken
�� 
=
�� 
externalResult
�� $
.
��$ %

Properties
��% /
.
��/ 0
GetTokenValue
��0 =
(
��= >
$str
��> H
)
��H I
;
��I J
if
�� 

(
�� 
idToken
�� 
!=
�� 
null
�� 
)
�� 
{
�� 	
localSignInProps
�� 
.
�� 
StoreTokens
�� (
(
��( )
new
��) ,
[
��, -
]
��- .
{
��/ 0
new
��1 4!
AuthenticationToken
��5 H
{
��I J
Name
��K O
=
��P Q
$str
��R \
,
��\ ]
Value
��^ c
=
��d e
idToken
��f m
}
��n o
}
��p q
)
��q r
;
��r s
}
�� 	
}
�� 
}�� �
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
}-- �0
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
}NN �
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
} �
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
}'' �
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
} �	
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
} �	
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
} �
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
$str	 �
;
� �
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
}99 �
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
}44 �%
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
}?? �
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