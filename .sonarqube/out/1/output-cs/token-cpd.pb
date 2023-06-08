ê$
F/Users/pavel/project/NetMentoring/EventBusRabbitMQ/EventBusRabbitMQ.cs
	namespace 	
EventBusRabbitMQ
 
; 
public 
class 
EventBusRabbitMq 
: 
IEventBusRabbitMq  1
{ 
private		 
readonly		 
string		 

_queueName		 &
;		& '
private

 
readonly

 
IConnection

  
_connection

! ,
;

, -
private 
readonly 
IModel 
_channel $
;$ %
private !
EventingBasicConsumer !
?! "
	_consumer# ,
;, -
public 

event 
EventHandler 
< !
BasicDeliverEventArgs 3
>3 4
?4 5
OnMessageReceived6 G
;G H
public 

EventBusRabbitMq 
( 
string "
	queueName# ,
,, -
string. 4
hostName5 =
,= >
int? B
portC G
,G H
stringI O
userNameP X
,X Y
stringZ `
passworda i
)i j
{ 

_queueName 
= 
	queueName 
; 
var 
factory 
= 
new 
ConnectionFactory +
{ 
HostName 
= 
hostName !
,! "
Port# '
=( )
port* .
,. /
UserName0 8
=9 :
userName; C
,C D
PasswordE M
=N O
passwordP X
}Y Z
;Z [
_connection 
= 
factory 
. 
CreateConnection .
(. /
)/ 0
;0 1
_channel 
= 
_connection 
. 
CreateModel *
(* +
)+ ,
;, -
_channel 
. 
QueueDeclare 
( 

_queueName (
,( )
durable* 1
:1 2
true3 7
,7 8
	exclusive9 B
:B C
falseD I
,I J

autoDeleteK U
:U V
falseW \
,\ ]
	arguments^ g
:g h
nulli m
)m n
;n o
} 
public 

void 
StartListening 
( 
)  
{ 
	_consumer   
=   
new   !
EventingBasicConsumer   -
(  - .
_channel  . 6
)  6 7
;  7 8
	_consumer!! 
.!! 
Received!! 
+=!!  
OnConsumerOnReceived!! 2
;!!2 3
_channel"" 
."" 
BasicConsume"" 
("" 

_queueName"" (
,""( )
autoAck""* 1
:""1 2
true""3 7
,""7 8
	_consumer""9 B
)""B C
;""C D
}## 
public)) 

void)) 
Publish)) 
()) 
string)) 
message)) &
)))& '
{** 
var++ 
body++ 
=++ 
Encoding++ 
.++ 
UTF8++  
.++  !
GetBytes++! )
(++) *
message++* 1
)++1 2
;++2 3
_channel,, 
.,, 
BasicPublish,, 
(,, 
exchange,, &
:,,& '
$str,,( *
,,,* +

routingKey,,, 6
:,,6 7

_queueName,,8 B
,,,B C
basicProperties,,D S
:,,S T
null,,U Y
,,,Y Z
body,,[ _
:,,_ `
body,,a e
),,e f
;,,f g
}-- 
private44 
void44  
OnConsumerOnReceived44 %
(44% &
object44& ,
?44, -
sender44. 4
,444 5!
BasicDeliverEventArgs446 K
ea44L N
)44N O
{55 
OnMessageReceived66 
?66 
.66 
Invoke66 !
(66! "
this66" &
,66& '
ea66( *
)66* +
;66+ ,
}77 
public<< 

void<< 
Dispose<< 
(<< 
)<< 
{== 
_channel>> 
.>> 
Close>> 
(>> 
)>> 
;>> 
_connection?? 
.?? 
Close?? 
(?? 
)?? 
;?? 
}@@ 
}AA ƒ
G/Users/pavel/project/NetMentoring/EventBusRabbitMQ/IEventBusRabbitMq.cs
	namespace 	
EventBusRabbitMQ
 
; 
public 
	interface 
IEventBusRabbitMq "
{ 
event 	
EventHandler
 
< !
BasicDeliverEventArgs ,
>, -
?- .
OnMessageReceived/ @
;@ A
void 
StartListening	 
( 
) 
; 
void		 
Publish			 
(		 
string		 
message		 
)		  
;		  !
void

 
Dispose

	 
(

 
)

 
;

 
} 