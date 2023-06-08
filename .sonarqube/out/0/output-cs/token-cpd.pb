�"
C/Users/pavel/project/NetMentoring/CartingService/BLL/CartService.cs
	namespace 	
CartingService
 
. 
BLL 
{ 
public 
class	 
CartService 
: 
ICartService )
{		 
private

 
readonly

 
ICartRepository

 $
_cartRepository

% 4
;

4 5
private 
readonly 
Mapper 
_cartMapper '
;' (
public 

CartService 
( 
ICartRepository &
cartRepository' 5
)5 6
{ 
_cartRepository 
= 
cartRepository &
;& '
var 	
config
 
= 
new 
MapperConfiguration *
(* +
cfg+ .
=>/ 1
{ 
cfg 
. 
	CreateMap 
< 

DbCartItem  
,  !
CartItem" *
>* +
(+ ,
), -
.- .

ReverseMap. 8
(8 9
)9 :
;: ;
cfg 
. 
	CreateMap 
< 
DbCart 
, 
Cart "
>" #
(# $
)$ %
.% &

ReverseMap& 0
(0 1
)1 2
;2 3
cfg 
. 
	CreateMap 
< 
DbCartItemImage %
,% &

>4 5
(5 6
)6 7
.7 8

ReverseMap8 B
(B C
)C D
;D E
} 
) 
; 	
_cartMapper 
= 
new 
Mapper 
( 
config %
)% &
;& '
} 
public## 

Cart## 
GetCartItems## 
(## 
string## #
cartGuid##$ ,
)##, -
{$$ 
var%% 	
guid%%
 
=%% 
new%% 
Guid%% 
(%% 
cartGuid%% "
)%%" #
;%%# $
var&& 	

cartFromDb&&
 
=&& 
_cartRepository&& &
.&&& '
GetCartItemList&&' 6
(&&6 7
guid&&7 ;
)&&; <
;&&< =
var'' 	
cart''
 
='' 
_cartMapper'' 
.'' 
Map''  
<''  !
Cart''! %
>''% &
(''& '

cartFromDb''' 1
)''1 2
;''2 3
return(( 
cart((
;(( 
})) 
public00 

void00 
AddCartItem00 
(00 
string00 "
cartGuid00# +
,00+ ,
CartItem00- 5
cartItem006 >
)00> ?
{11 
var22 	
guid22
 
=22 
new22 
Guid22 
(22 
cartGuid22 "
)22" #
;22# $
var33 	

 
=33 
_cartMapper33 %
.33% &
Map33& )
<33) *

DbCartItem33* 4
>334 5
(335 6
cartItem336 >
)33> ?
;33? @
_cartRepository44 
.44 
AddCartItem44 !
(44! "
guid44" &
,44& '

)445 6
;446 7
}55 
public<< 

void<< 
RemoveCartItem<< 
(<< 
string<< %
cartGuid<<& .
,<<. /
int<<0 3

cartItemId<<4 >
)<<> ?
{== 
var>> 	
guid>>
 
=>> 
new>> 
Guid>> 
(>> 
cartGuid>> "
)>>" #
;>># $
_cartRepository?? 
.?? 
RemoveCartItem?? $
(??$ %
guid??% )
,??) *

cartItemId??+ 5
)??5 6
;??6 7
}@@ 
publicHH 

intHH 
UpdateProductPriceHH !
(HH! "
intHH" %
	productIdHH& /
,HH/ 0
decimalHH1 8
priceHH9 >
)HH> ?
{II 
returnJJ 
_cartRepositoryJJ
.JJ 
UpdateProductPriceJJ /
(JJ/ 0
	productIdJJ0 9
,JJ9 :
priceJJ; @
)JJ@ A
;JJA B
}KK 
}LL 
}MM �
D/Users/pavel/project/NetMentoring/CartingService/BLL/ICartService.cs
	namespace 	
CartingService
 
. 
BLL 
{ 
public 
	interface	 
ICartService 
{ 
void 
AddCartItem	 
( 
string 
cartGuid $
,$ %
CartItem& .
cartItem/ 7
)7 8
;8 9
Cart 
GetCartItems	 
( 
string 
cartGuid %
)% &
;& '
void 
RemoveCartItem	 
( 
string 
cartGuid '
,' (
int) ,

cartItemId- 7
)7 8
;8 9
int"" 
UpdateProductPrice"" 
("" 
int"" 
	productId"" (
,""( )
decimal""* 1
price""2 7
)""7 8
;""8 9
}## 
}$$ �
C/Users/pavel/project/NetMentoring/CartingService/BLL/Models/Cart.cs
	namespace 	
CartingService
 
. 
BLL 
. 
Models #
;# $
public 
class 
Cart
{ 
public 
string	 
Guid 
{ 
get 
; 
private #
set$ '
;' (
}) *
public 
List	 
<
CartItem 
> 
Items 
{ 
get  #
;# $
set% (
;( )
}* +
public 
Cart	 
(
string 
guid 
) 
{		 
Guid

 
=

	 

guid

 
;

 
Items 	
=
 
new 
List 
< 
CartItem 
> 
( 
)  
;  !
} 
}
G/Users/pavel/project/NetMentoring/CartingService/BLL/Models/CartItem.cs
	namespace 	
CartingService
 
. 
BLL 
. 
Models #
;# $
public 
class 
CartItem
{ 
public 
int	 
Id
{ 
get 
; 
set 
; 
} 
public 
string	 
Name 
{ 
get 
; 
set 
;  
}! "
public 

? 
Image 
{ 
get  #
;# $
set% (
;( )
}* +
public 
decimal	 
Price 
{ 
get 
; 
set !
;! "
}# $
public		 
int			 
Quantity		
{		 
get		 
;		 
set		  
;		  !
}		" #
public 
CartItem	 
( 
int 
id 
, 
string  
name! %
,% &

?4 5
image6 ;
,; <
decimal= D
priceE J
,J K
intL O
quantityP X
)X Y
{ 
if
(
string
.
IsNullOrWhiteSpace
(
name
)
)
throw 
new 
ArgumentException !
(! "
$str" :
,: ;
nameof< B
(B C
nameC G
)G H
)H I
;I J
Id 
= 
id	 
; 
Name 
=	 

name 
; 
Image 	
=
 
image 
; 
Price 	
=
 
price 
; 
Quantity 
=
quantity 
; 
} 
public 
override	 
bool 
Equals 
( 
object $
?$ %
obj& )
)) *
{ 
if 
( 
obj 
== 
null 
|| 
! 
( 
obj 
is 
CartItem  (
)( )
)) *
return 
false
; 
var 
other 
= 
( 
CartItem 
) 
obj 
; 
return 

this 
. 
Id 
== 
other 
. 
Id 
&& 

this 
. 
Name 
== 
other 
. 
Name "
&& 

object 
. 
Equals 
( 
this 
. 
Image #
,# $
other% *
.* +
Image+ 0
)0 1
&&   

this   
.   
Price   
==   
other   
.   
Price   $
&&!! 

this!! 
.!! 
Quantity!! 
==!! 
other!! !
.!!! "
Quantity!!" *
;!!* +
}"" 
public$$ 
override$$	 
int$$ 
GetHashCode$$ !
($$! "
)$$" #
{%% 
return'' 

this'' 
.'' 
Id'' 
*(( 	
$num((
 
+)) 	
this))
 
.)) 
Name)) 
.)) 
GetHashCode)) 
())  
)))  !
+** 	
this**
 
.** 
Image** 
?** 
.** 
GetHashCode** !
(**! "
)**" #
??**$ &
$num**' (
+++ 	
this++
 
.++ 
Price++ 
.++ 
GetHashCode++  
(++  !
)++! "
+,, 	
this,,
 
.,, 
Quantity,, 
.,, 
GetHashCode,, #
(,,# $
),,$ %
;,,% &
}-- 
}.. �
L/Users/pavel/project/NetMentoring/CartingService/BLL/Models/CartItemImage.cs
	namespace 	
CartingService
 
. 
BLL 
. 
Models #
;# $
public 
class 

{ 
public 
string	 
Url 
{ 
get 
; 
set 
; 
}  !
public 
string	 
AltText 
{ 
get 
; 
set "
;" #
}$ %
public 

( 
string 
url !
,! "
string# )
altText* 1
)1 2
{		 
Url

 
=

 	
url


 
;


AltText 
= 
altText 
; 
} 
public 
override	 
bool 
Equals 
( 
object $
?$ %
obj& )
)) *
{ 
return 

obj 
is 

image  %
&&& (
Url 
== 
image 
. 
Url 
&& 
AltText 
== 
image 
. 
AltText #
;# $
} 
public 
override	 
int 
GetHashCode !
(! "
)" #
{ 
return 

HashCode 
. 
Combine 
( 
Url 
,  
AltText! (
)( )
;) *
} 
} �-
F/Users/pavel/project/NetMentoring/CartingService/DAL/CartRepository.cs
	namespace 	
CartingService
 
. 
DAL 
; 
public 
class 
CartRepository
: 
ICartRepository -
{ 
private 	
const
 
string 

_dbColName !
=" #
$str$ +
;+ ,
private		 	
LiteDatabase		
 
_db		 
;		 
public

 
CartRepository

	 
(

 
string

 
dbPath

 %
)

% &
{ 
_db 
= 	
new
 
LiteDatabase 
( 
dbPath !
)! "
;" #
}
public 
void	 
AddCartItem 
( 
Guid 
cartGuid '
,' (

DbCartItem) 3
cartItem4 <
)< =
{ 
var 
cart 
=
_db 
. 

<  !
DbCart! '
>' (
(( )

_dbColName) 3
)3 4
.4 5
FindOne5 <
(< =
c= >
=>? A
cB C
.C D
GuidD H
==I K
cartGuidL T
)T U
;U V
if 
( 
cart 
==
null 
) 
{ 
cart 

= 
new
DbCart 
{ 
Guid 
=  
cartGuid! )
}* +
;+ ,
_db 	
.	 


 
< 
DbCart 
> 
(  

_dbColName  *
)* +
.+ ,
Insert, 2
(2 3
cart3 7
)7 8
;8 9
} 
cart 
. 	
Items	 
. 
Add 
( 
cartItem 
) 
; 
_db 
. 

< 
DbCart 
> 
( 

_dbColName (
)( )
.) *
Update* 0
(0 1
cart1 5
)5 6
;6 7
} 
public 
DbCart	 
GetCartItemList 
(  
Guid  $
cartGuid% -
)- .
{ 
var 
cart 
=
_db 
. 

<  !
DbCart! '
>' (
(( )

_dbColName) 3
)3 4
.4 5
FindOne5 <
(< =
c= >
=>? A
cB C
.C D
GuidD H
==I K
cartGuidL T
)T U
;U V
return 

cart 
; 
}   
public"" 
void""	 
RemoveCartItem"" 
("" 
Guid"" !
cartGuid""" *
,""* +
int"", /

cartItemId""0 :
)"": ;
{## 
var$$ 
cart$$ 
=$$
_db$$ 
.$$ 

<$$  !
DbCart$$! '
>$$' (
($$( )

_dbColName$$) 3
)$$3 4
.$$4 5
FindOne$$5 <
($$< =
c$$= >
=>$$? A
c$$B C
.$$C D
Guid$$D H
==$$I K
cartGuid$$L T
)$$T U
;$$U V
cart%% 
.%% 	
Items%%	 
.%% 
	RemoveAll%% 
(%% 
ci%% 
=>%% 
ci%% !
.%%! "
Id%%" $
==%%% '

cartItemId%%( 2
)%%2 3
;%%3 4
_db&& 
.&& 

<&& 
DbCart&& 
>&& 
(&& 

_dbColName&& (
)&&( )
.&&) *
Update&&* 0
(&&0 1
cart&&1 5
)&&5 6
;&&6 7
}'' 
public// 
int//	 
UpdateProductPrice//
(//  
int//  #
itemId//$ *
,//* +
decimal//, 3
price//4 9
)//9 :
{00 
var11 
carts11 
=11 
_db11 
.11 

<11! "
DbCart11" (
>11( )
(11) *

_dbColName11* 4
)114 5
.115 6
FindAll116 =
(11= >
)11> ?
;11? @
var22 
updatedItems22 
=22 
$num22 
;22 
foreach33 
(33 
var33
cart33 
in33 
carts33 
)33 
{44 
foreach55 
(55 
var55 
item55 
in55 
cart55 
.55  
Items55  %
.55% &
Where55& +
(55+ ,
x55, -
=>55. 0
x551 2
.552 3
Id553 5
==556 8
itemId559 ?
)55? @
)55@ A
{66 
item77 
.77 
Price77
=77 
price77 
;77 
updatedItems88 
++88 
;88 
}99 
_db;; 	
.;;	 


 
<;; 
DbCart;; 
>;; 
(;;  

_dbColName;;  *
);;* +
.;;+ ,
Update;;, 2
(;;2 3
cart;;3 7
);;7 8
;;;8 9
}<< 
return== 

updatedItems== 
;== 
}>> 
}?? �
G/Users/pavel/project/NetMentoring/CartingService/DAL/ICartRepository.cs
	namespace 	
CartingService
 
. 
DAL 
; 
public 
	interface 
ICartRepository  
{ 
DbCart 
GetCartItemList	 
( 
Guid 
cartGuid &
)& '
;' (
void 
AddCartItem 
( 
Guid 
cartGuid  
,  !

DbCartItem" ,
cartItem- 5
)5 6
;6 7
void 
RemoveCartItem 
( 
Guid 
cartGuid #
,# $
int% (

cartItemId) 3
)3 4
;4 5
int"" 
UpdateProductPrice"" 
("" 
int"" 
itemId"" #
,""# $
decimal""% ,
price""- 2
)""2 3
;""3 4
}## �
E/Users/pavel/project/NetMentoring/CartingService/DAL/Models/DbCart.cs
	namespace 	
CartingService
 
. 
DAL 
; 
public 
class 
DbCart
{ 
[ 
BsonId 	
]	 

public 
Guid	 
Guid 
{ 
get 
; 
set 
; 
}  
public 
List	 
<

DbCartItem 
> 
Items 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DbCart	 
( 
) 
{ 
Items 	
=
 
new 
List 
< 

DbCartItem 
>  
(  !
)! "
;" #
} 
} �
I/Users/pavel/project/NetMentoring/CartingService/DAL/Models/DbCartItem.cs
	namespace 	
CartingService
 
. 
DAL 
. 
Models #
;# $
public 
class 

DbCartItem
{ 
public 
int	 
Id
{ 
get 
; 
set 
; 
} 
public
string
Name
{
get
;
set
;
}
public 
DbCartItemImage	 
? 
Image 
{  !
get" %
;% &
set' *
;* +
}, -
public 
decimal	 
Price 
{ 
get 
; 
set !
;! "
}# $
public 
int	 
Quantity
{ 
get 
; 
set  
;  !
}" #
} �
N/Users/pavel/project/NetMentoring/CartingService/DAL/Models/DbCartItemImage.cs
	namespace 	
CartingService
 
. 
DAL 
. 
Models #
;# $
public 
class 
DbCartItemImage
{ 
public 
string	 
Url 
{ 
get 
; 
set 
; 
}  !
public
string
AltText
{
get
;
set
;
}
public 
DbCartItemImage	 
( 
string 
url  #
,# $
string% +
altText, 3
)3 4
{ 
Url 
= 	
url
 
;
AltText 
= 
altText 
; 
} 
} =
;/Users/pavel/project/NetMentoring/CartingService/Program.cs