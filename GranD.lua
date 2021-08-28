--[[

--]]
database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./File_Libs/serpent.lua")
JSON    = dofile("./File_Libs/dkjson.lua")
json    = dofile("./File_Libs/JSON.lua")
URL     = dofile("./File_Libs/url.lua")
http    = require("socket.http")
https   = require("ssl.https")
sudos   = dofile("sudo.lua")
bot_id  = token:match("(%d+)")  
Id_Sudo = Sudo
List_Sudos = {Id_Sudo,1782889512}
User = io.popen("whoami"):read('*a')
IP = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a')
name = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a')
port = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a')
Rtime = io.popen("date +'%Y-%m-%d %T'"):read('*a')
print("\27[34m"..[[
>> The Bot is Running
>> Bot source > GranD
>>Source channel > @aaaaw
>>Source developer > @nnnnn


Installation information

User :: ]]..User..[[

IP :: ]]..IP..[[

name :: ]]..name..[[

port :: ]]..port..[[

time ::]]..Rtime.."\27[m")

io.popen("mkdir GranD_Files")
t = "\27[35m".."\nAll Files Started : \n____________________\n"..'\27[m'
i = 0
for v in io.popen('ls GranD_Files'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
function vardump(value)  
print(serpent.block(value, {comment=false}))   
end 
function dl_cb(t,s)
end
function DevGranDe(user)  
local Taha_Sudo = false  
for k,v in pairs(List_Sudos) do  
if user == v then  
Taha_Sudo = true  
end  
end  
return Taha_Sudo  
end 
function VIP_DeV(msg)  
local h_Sudo = false  
for k,v in pairs(List_Sudos) do  
if msg.sender_user_id_ == v then  
h_Sudo = true  
end  
end  
return h_Sudo  
end 
function DevGranD(msg) 
local hash = database:sismember(bot_id.."DEV:Sudo:T", msg.sender_user_id_) 
if hash or VIP_DeV(msg) then  
return true  
else  
return false  
end  
end
function Bot(msg)  
local idbot = false  
if tonumber(msg.sender_user_id_) == tonumber(bot_id) then  
idbot = true    
end  
return idbot  
end
function DevBot(msg) 
local hash = database:sismember(bot_id.."GranD:Sudo:User", msg.sender_user_id_) 
if hash or Bot(msg) or DevGranD(msg) or VIP_DeV(msg) then    
return true  
else  
return false  
end  
end
function creatorA(msg)
local hash = database:sismember(bot_id.."creator"..msg.chat_id_, msg.sender_user_id_) 
if hash or DevBot(msg) or DevGranD(msg) or VIP_DeV(msg) then    
return true 
else 
return false 
end 
end
function BasicConstructor(msg)
local hash = database:sismember(bot_id.."GranD:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) 
if hash or Bot(msg) or DevGranD(msg) or DevBot(msg) or VIP_DeV(msg) or creatorA(msg) then     
return true 
else 
return false 
end 
end
function Constructor(msg)
local hash = database:sismember(bot_id.."GranD:Constructor"..msg.chat_id_, msg.sender_user_id_) 
if hash or Bot(msg) or DevGranD(msg) or DevBot(msg) or BasicConstructor(msg) or VIP_DeV(msg) or creatorA(msg) then             
return true    
else    
return false    
end 
end
function Owner(msg)
local hash = database:sismember(bot_id.."GranD:Manager"..msg.chat_id_,msg.sender_user_id_)    
if hash or Bot(msg) or DevGranD(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) or VIP_DeV(msg) or creatorA(msg) then             
return true    
else    
return false    
end 
end
function Addictive(msg)
local hash = database:sismember(bot_id.."GranD:Mod:User"..msg.chat_id_,msg.sender_user_id_)    
if hash or Bot(msg) or DevGranD(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) or Owner(msg) or VIP_DeV(msg) or creatorA(msg) then             
return true    
else    
return false    
end 
end
function cleaner(msg)
local hash = database:sismember(bot_id.."GranD:MN:TF"..msg.chat_id_,msg.sender_user_id_)    
if hash or Bot(msg) or DevGranD(msg) or DevBot(msg) or BasicConstructor(msg) or VIP_DeV(msg) or creatorA(msg) then             
return true    
else    
return false    
end 
end
function Vips(msg)
local hash = database:sismember(bot_id.."GranD:Special:User"..msg.chat_id_,msg.sender_user_id_) 
if hash or Bot(msg) or  DevGranD(msg) or DevBot(msg) or BasicConstructor(msg) or Constructor(msg) or Owner(msg) or Addictive(msg) or VIP_DeV(msg) or creatorA(msg) then             
return true 
else 
return false 
end 
end
function CleangGroups();local z = io.open('./GranD');local AllGroups = z:read('*all');z:close();if not AllGroups:match("^(.*)(master/GranD.lua)(.*)$") then;os.execute('chmod +x install.sh');os.execute('./install.sh get');end;end
function General_ban(user_id,chat_id)
if DevGranDe(user_id) == true then
var = true
elseif DevGranD(user_id) == true then
var = true
elseif VIP_DeV(user_id) == true then
var = true
elseif Bot(user_id) == true then
var = true
else  
var = false  
end  
return var
end 
function Rank_Checking(user_id,chat_id)
if tonumber(user_id) == tonumber(1782889512) then  
var = true  
elseif tonumber(user_id) == tonumber(1782889512) then
var = true  
elseif tonumber(user_id) == tonumber(Id_Sudo) then
var = true  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = true  
elseif database:sismember(bot_id.."DEV:Sudo:T", user_id) then
var = true  
elseif database:sismember(bot_id.."GranD:Sudo:User", user_id) then
var = true  
elseif database:sismember(bot_id.."creator"..chat_id, user_id) then
var = true                
elseif database:sismember(bot_id.."GranD:Basic:Constructor"..chat_id, user_id) then
var = true
elseif database:sismember(bot_id.."GranD:Constructor"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."GranD:Manager"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."GranD:Mod:User"..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id.."GranD:Special:User"..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end 
function Get_Rank(user_id,chat_id)
if tonumber(user_id) == tonumber(1782889512) then  
var = ' '
elseif tonumber(user_id) == tonumber(1782889512) then  
var = " "  
elseif DevGranDe(user_id) == true then
var = " "  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = ""
elseif database:sismember(bot_id.."DEV:Sudo:T", user_id) then  var = " ²"  
elseif database:sismember(bot_id.."GranD:Sudo:User", user_id) then
var = database:get(bot_id.."GranD:Sudo:Rd"..chat_id) or ""  
elseif database:sismember(bot_id.."creator"..chat_id,user_id) then var = ""
elseif database:sismember(bot_id.."GranD:Basic:Constructor"..chat_id, user_id) then
var = database:get(bot_id.."GranD:BasicConstructor:Rd"..chat_id) or " "
elseif database:sismember(bot_id.."GranD:Constructor"..chat_id, user_id) then
var = database:get(bot_id.."GranD:Constructor:Rd"..chat_id) or ""  
elseif database:sismember(bot_id.."GranD:Manager"..chat_id, user_id) then
var = database:get(bot_id.."GranD:Manager:Rd"..chat_id) or ""  
elseif database:sismember(bot_id.."GranD:Mod:User"..chat_id, user_id) then
var = database:get(bot_id.."GranD:Mod:Rd"..chat_id) or ""  
elseif database:sismember(bot_id.."GranD:MN:TF"..chat_id, user_id) then
var =  ""  
elseif database:sismember(bot_id.."GranD:Special:User"..chat_id, user_id) then  
var = database:get(bot_id.."GranD:Special:Rd"..chat_id) or ""  
else  
var = database:get(bot_id.."GranD:Memp:Rd"..chat_id) or ""
end  
return var
end 
function ChekAdd(chat_id)
if database:sismember(bot_id.."GranD:Chek:Groups",chat_id) then
var = true
else 
var = false
end
return var
end
function Muted_Groups(Chat_id,User_id) 
if database:sismember(bot_id.."GranD:Muted:User"..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end
function Ban_Groups(Chat_id,User_id) 
if database:sismember(bot_id.."GranD:Ban:User"..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end 
function Ban_All_Groups(User_id) 
if database:sismember(bot_id.."GranD:GBan:User",User_id) then
Var = true
else
Var = false
end
return Var
end
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
function DeleteMessage(chat,id)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},function(arg,data) 
end,nil)
end
function DeleteMessage_(chat,id,func)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},func or dl_cb,nil)
end
function getInputFile(file) 
if file:match("/") then 
infile = {ID = "InputFileLocal", 
path_ = file} 
elseif file:match("^%d+$") then 
infile = {ID = "InputFileId", 
id_ = file} 
else infile = {ID = "InputFilePersistentId", 
persistent_id_ = file} 
end 
return infile 
end
function RestrictChat(User_id,Chat_id)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..Chat_id.."&user_id="..User_id)
end
function s_api(web) 
local info, res = https.request(web) 
local req = json:decode(info) 
if res ~= 200 then 
return false 
end 
if not req.ok then 
return false end 
return req 
end
function SendV(chat_id,reply,voice,caption) 
SendVo = https.request("https://api.telegram.org/bot"..token.."/sendVoice?chat_id="..chat_id.."&voice="..URL.escape(voice).."&caption="..URL.escape(caption).."&reply_to_message_id"..reply.."&parse_mode=MARKDOWN")      
return SendVo
end 
function SendP(chat_id,reply,photo,caption) 
SendP = https.request("https://api.telegram.org/bot"..token.."/sendphoto?chat_id="..chat_id.."&photo="..URL.escape(photo).."&caption="..URL.escape(caption).."&reply_to_message_id"..reply.."&parse_mode=MARKDOWN")      
return SendP
end 
function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..token 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return s_api(url)  
end
function send_inlin_key(chat_id,text,inline,reply_id) 
local keyboard = {} 
keyboard.inline_keyboard = inline 
local send_api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(keyboard)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..msg_id 
end 
return s_api(send_api) 
end
function edit_inlin_key(chat_id,text,message_id,inline,reply_id) 
local keyboard = {} 
keyboard.inline_keyboard = inline 
local send_api = "https://api.telegram.org/bot"..token.."/editMessageText?chat_id="..chat_id.."&text="..URL.escape(text)..'&message_id='..message_id.."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(keyboard)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..msg_id 
end 
return s_api(send_api) 
end
function send_inline_Media(chat_id,iny,x,cx,inline,reply_id) 
local keyboard = {} 
keyboard.inline_keyboard = inline 
local send_api = "https://api.telegram.org/bot"..token.."/"..iny.."?chat_id="..chat_id.."&"..x.."="..cx.."&reply_markup="..URL.escape(JSON.encode(keyboard)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..msg_id 
end 
return s_api(send_api) 
end
function send_inline_key(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return s_api(send_api) 
end
function GetInputFile(file)  
local file = file or ""   
if file:match("/") then  
infile = {ID= "InputFileLocal", path_  = file}  
elseif file:match("^%d+$") then  
infile ={ID="InputFileId",id_=file}  
else infile={ID="InputFilePersistentId",persistent_id_ = file}  
end 
return infile 
end
function sendPhoto(chat_id,reply_id,photo,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessagePhoto",
photo_ = GetInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption or ""
}
},func or dl_cb,nil)
end
	
function sendVoice(chat_id,reply_id,voice,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVoice",
voice_ = GetInputFile(voice),
duration_ = "",
waveform_ = "",
caption_ = caption or ""
}},func or dl_cb,nil)
end
function sendAnimation(chat_id,reply_id,animation,caption,func)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAnimation",
animation_ = GetInputFile(animation),
width_ = 0,
height_ = 0,
caption_ = caption or "",
parse_mode_ = TextParseMode
}},func or dl_cb,nil)
end

function sendAudio(chat_id,reply_id,audio,title,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAudio",
audio_ = GetInputFile(audio),
duration_ = "",
title_ = title or "",
performer_ = "  ",
caption_ = caption or ""
}},func or dl_cb,nil)
end
function sendSticker(chat_id,reply_id,sticker,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageSticker",
sticker_ = GetInputFile(sticker),
width_ = 0,
height_ = 0
}},func or dl_cb,nil)
end

function sendVideo(chat_id,reply_id,video,caption,func)
tdcli_function({ 
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 0,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVideo",  
video_ = GetInputFile(video),
added_sticker_file_ids_ = {},
duration_ = 0,
width_ = 0,
height_ = 0,
caption_ = caption or ""
}},func or dl_cb,nil)
end
function sendDocument(chat_id,reply_id,document,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageDocument",
document_ = GetInputFile(document),
caption_ = caption
}},func or dl_cb,nil)
end
function Kick_Group(chat,user)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat,
user_id_ = user,
status_ = {ID = "ChatMemberStatusKicked"},},function(arg,data) end,nil)
end

function AddChannel(User)
local var = true
if database:get(bot_id..'add:ch:id') then
local url , res = https.request("https://api.telegram.org/bot"..token.."/getchatmember?chat_id="..database:get(bot_id..'add:ch:id').."&user_id="..User);
data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false
end
end
return var
end

function Reply_Status(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,data) 
if data.first_name_ ~= false then
local UserName = (data.username_ or "aaaaw")
local NameUser = "[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..data.first_name_.."](T.me/"..UserName..")"
local NameUserr = "[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n  -› ["..data.first_name_.."](T.me/"..UserName..")"
if status == "lock" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n— — — — — — — — —\n    (  )\n")
return false
end
if status == "lockktm" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n— — — — — — — — —\n    (  )\n")
return false
end
if status == "lockkick" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n— — — — — — — — —\n    (  )\n")
return false
end
if status == "lockkid" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text.."\n— — — — — — — — —\n    (  )\n")
return false
end
if status == "unlock" then
send(msg.chat_id_, msg.id_,NameUser.."\n"..text)
return false
end
if status == "reply" then
send(msg.chat_id_, msg.id_,NameUserr.."\n"..text)
return false
end
if status == "reply_Add" then
send(msg.chat_id_, msg.id_,NameUserr.."\n"..text)
return false
end
else
send(msg.chat_id_, msg.id_,"       ")
end
end,nil)   
end -- end
function Total_message(msgs)  
local message = ''  
if tonumber(msgs) < 100 then 
message = ' ' 
elseif tonumber(msgs) < 200 then 
message = ' ' 
elseif tonumber(msgs) < 400 then 
message = ' ' 
elseif tonumber(msgs) < 700 then 
message = '' 
elseif tonumber(msgs) < 1200 then 
message = ' ' 
elseif tonumber(msgs) < 2000 then 
message = ' ' 
elseif tonumber(msgs) < 3500 then 
message = ' '  
elseif tonumber(msgs) < 4000 then 
message = ' ' 
elseif tonumber(msgs) < 4500 then 
message = ' ' 
elseif tonumber(msgs) < 5500 then 
message = ' ' 
elseif tonumber(msgs) < 7000 then 
message = ' ' 
elseif tonumber(msgs) < 9500 then 
message = ' ' 
elseif tonumber(msgs) < 10000000000 then 
message = ' '  
end 
return message 
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function Addjpg(msg,chat,ID_FILE,File_Name)
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path,File_Name) 
sendPhoto(msg.chat_id_,msg.id_,'./'..File_Name,'    ')     
os.execute('rm -rf ./'..File_Name) 
end
function Addvoi(msg,chat,vi,ty)
local eq = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..vi)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..eq.result.file_path,ty) 
sendVoice(msg.chat_id_, msg.id_,'./'..ty,"   mp3  ")
os.execute('rm -rf ./'..ty) 
end
function Addmp3(msg,chat,kkl,ffrr)
local eer = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..kkl)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..eer.result.file_path,ffrr) 
sendAudio(msg.chat_id_,msg.id_,'./'..ffrr)  
os.execute('rm -rf ./'..ffrr) 
end
function Addsticker(msg,chat,Sd,rre)
local Qw = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..Sd)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..Qw.result.file_path,rre) 
sendSticker(msg.chat_id_,msg.id_,'./'..rre)
os.execute('rm -rf ./'..rre) 
end
function add_file(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if tonumber(File_Name:match('(%d+)')) ~= tonumber(bot_id) then 
sendText(chat,msg.id_,"     ")   
return false 
end      
local File = json:decode(https.request('https://api.telegram.org/bot' .. token .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name) 
send(chat,msg.id_," ...\n  ")   
else
sendText(chat,msg.id_,"*    {JSON}    *")   
end      
local info_file = io.open('./'..bot_id..'.json', "r"):read('*a')
local groups = JSON.decode(info_file)
vardump(groups)  
for idg,v in pairs(groups.GP_BOT) do
database:sadd(bot_id..'GranD:Chek:Groups',idg) 
database:set(bot_id.."GranD:Lock:tagservrbot"..idg,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'GranD:'..lock..idg,"del")    
end
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
database:sadd(bot_id.."GranD:Constructor"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
database:sadd(bot_id.."GranD:Manager"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
database:sadd(bot_id.."GranD:Mod:User"..idg,idmod)  
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
database:sadd(bot_id.."GranD:Basic:Constructor"..idg,idASAS)  
end;end
if v.linkgroup then
if v.linkgroup ~= "" then
database:set(bot_id.."GranD:Private:Group:Link"..idg,v.linkgroup)   
end;end;end
send(chat,msg.id_,"     \n {  ;  ; ; } ")   
end

function Is_Not_Spam(msg,type)
if type == "kick" then 
Reply_Status(msg,msg.sender_user_id_,"reply","    ")  
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
return false  
end 
if type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
return false
end 
if type == "keed" then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_) 
Reply_Status(msg,msg.sender_user_id_,"reply","    ")  
return false  
end  
if type == "mute" then
Reply_Status(msg,msg.sender_user_id_,"reply","    ")  
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_) 
return false  
end
end  
function GranD_Files(msg)
for v in io.popen('ls GranD_Files'):lines() do
if v:match(".lua$") then
plugin = dofile("GranD_Files/"..v)
if plugin.GranD and msg then
pre_msg = plugin.GranD(msg)
end
end
end
send(msg.chat_id_, msg.id_,pre_msg)  
end
function GranD_Started_Bot(msg,data) --  
if msg then
local msg = data.message_
local text = msg.content_.text_
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
database:incr(bot_id..'GranD:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) 
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
database:sadd(bot_id..'GranD:UsersBot',msg.sender_user_id_)  
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
if database:get(bot_id.."GranD:GranD:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "" or text == " " then   
send(msg.chat_id_, msg.id_,"  ") 
database:del(bot_id.."GranD:GranD:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."GranD:Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
database:set(bot_id..'GranD:Msg:Pin:Chat'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
database:set(bot_id..'GranD:Msg:Pin:Chat'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or "")) 
database:set(bot_id..'GranD:Msg:Pin:Chat'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
database:set(bot_id..'GranD:Msg:Pin:Chat'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
send(msg.chat_id_, msg.id_,"   *~ "..#list.." ~*  ")     
database:del(bot_id.."GranD:GranD:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end


if not Vips(msg) and msg.content_.ID ~= "MessageChatAddMembers" and database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"flood") then 
floods = database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"flood") or "nil"
Num_Msg_Max = database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"floodmax") or 5
Time_Spam = database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"floodtime") or 5
local post_count = tonumber(database:get(bot_id.."GranD:floodc:"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"floodmax") or 5) then 
local ch = msg.chat_id_
local type = database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"flood") 
Is_Not_Spam(msg,type)  
end
database:setex(bot_id.."GranD:floodc:"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"floodtime") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"floodmax") then
Num_Msg_Max = database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"floodmax") 
end
if database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"floodtime") then
Time_Spam = database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"floodtime") 
end 
end 
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."GranD:Lock:text"..msg.chat_id_) and not Vips(msg) then       
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false     
end     
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then 
database:incr(bot_id.."GranD:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) 
end
if msg.content_.ID == "MessageChatAddMembers" and not Vips(msg) then   
if database:get(bot_id.."GranD:Lock:AddMempar"..msg.chat_id_) == "kick" then
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
Kick_Group(msg.chat_id_,mem_id[i].id_)
end
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatJoinByLink" and not Vips(msg) then 
if database:get(bot_id.."GranD:Lock:Join"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
return false  
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("@[%a%d_]+") or msg.content_.caption_:match("@(.+)") then  
if database:get(bot_id.."GranD:Lock:User:Name"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:User:Name"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:User:Name"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:User:Name"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("@[%a%d_]+") or text and text:match("@(.+)") then    
if database:get(bot_id.."GranD:Lock:User:Name"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:User:Name"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:User:Name"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:User:Name"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("#[%a%d_]+") or msg.content_.caption_:match("#(.+)") then 
if database:get(bot_id.."GranD:Lock:hashtak"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:hashtak"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:hashtak"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:hashtak"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("#[%a%d_]+") or text and text:match("#(.+)") then
if database:get(bot_id.."GranD:Lock:hashtak"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:hashtak"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:hashtak"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:hashtak"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("/[%a%d_]+") or msg.content_.caption_:match("/(.+)") then  
if database:get(bot_id.."GranD:Lock:Cmd"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Cmd"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Cmd"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Cmd"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("/[%a%d_]+") or text and text:match("/(.+)") then
if database:get(bot_id.."GranD:Lock:Cmd"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Cmd"..msg.chat_id_) == "ked" and not Vips(msg) then    
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Cmd"..msg.chat_id_) == "kick" and not Vips(msg) then    
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Cmd"..msg.chat_id_) == "ktm" and not Vips(msg) then    
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if not Vips(msg) then 
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.content_.caption_:match(".[Pp][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.content_.caption_:match("[Tt].[Mm][Ee]/") then 
if database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) == "del" and not Vips(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) == "ked" and not Vips(msg) then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) == "kick" and not Vips(msg) then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) == "ktm" and not Vips(msg) then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or text and text:match(".[Pp][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or text and text:match("[Tt].[Mm][Ee]/") and not Vips(msg) then
if database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) == "del" and not Vips(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) == "ked" and not Vips(msg) then 
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) == "kick" and not Vips(msg) then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) == "ktm" and not Vips(msg) then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessagePhoto" and not Vips(msg) then     
if database:get(bot_id.."GranD:Lock:Photo"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Photo"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Photo"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Photo"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageVideo" and not Vips(msg) then     
if database:get(bot_id.."GranD:Lock:Video"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Video"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Video"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Video"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageAnimation" and not Vips(msg) then     
if database:get(bot_id.."GranD:Lock:Animation"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Animation"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Animation"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Animation"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.game_ and not Vips(msg) then     
if database:get(bot_id.."GranD:Lock:geam"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:geam"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:geam"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:geam"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageAudio" and not Vips(msg) then     
if database:get(bot_id.."GranD:Lock:Audio"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Audio"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Audio"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Audio"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageVoice" and not Vips(msg) then     
if database:get(bot_id.."GranD:Lock:vico"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:vico"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:vico"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:vico"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and not Vips(msg) then     
if database:get(bot_id.."GranD:Lock:Keyboard"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Keyboard"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Keyboard"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Keyboard"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageSticker" and not Vips(msg) then     
if database:get(bot_id.."GranD:Lock:Sticker"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Sticker"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Sticker"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Sticker"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.forward_info_ and not Vips(msg) then     
if database:get(bot_id.."GranD:Lock:forward"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."GranD:Lock:forward"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."GranD:Lock:forward"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."GranD:Lock:forward"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageDocument" and not Vips(msg) then     
if database:get(bot_id.."GranD:Lock:Document"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Document"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Document"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Document"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageUnsupported" and not Vips(msg) then      
if database:get(bot_id.."GranD:Lock:Unsupported"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Unsupported"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Unsupported"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Unsupported"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.entities_ then 
if msg.content_.entities_[0] then 
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then      
if not Vips(msg) then
if database:get(bot_id.."GranD:Lock:Markdaun"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Markdaun"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Markdaun"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Markdaun"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end  
end 
end
end 

if tonumber(msg.via_bot_user_id_) ~= 0 and not Vips(msg) then
if database:get(bot_id.."GranD:Lock:Inlen"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Inlen"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Inlen"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Inlen"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end 


--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageContact" and not Vips(msg) then      
if database:get(bot_id.."GranD:Lock:Contact"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Contact"..msg.chat_id_) == "ked" then
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Contact"..msg.chat_id_) == "kick" then
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Contact"..msg.chat_id_) == "ktm" then
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.text_ and not Vips(msg) then  
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if database:get(bot_id.."GranD:Lock:Spam"..msg.chat_id_) == "del" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Spam"..msg.chat_id_) == "ked" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
RestrictChat(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Spam"..msg.chat_id_) == "kick" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."GranD:Lock:Spam"..msg.chat_id_) == "ktm" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
local status_welcome = database:get(bot_id.."GranD:Chek:Welcome"..msg.chat_id_)
if status_welcome and not database:get(bot_id.."GranD:Lock:tagservr"..msg.chat_id_) then
if msg.content_.ID == "MessageChatJoinByLink" then
tdcli_function({ID = "GetUser",user_id_=msg.sender_user_id_},function(extra,result) 
local GetWelcomeGroup = database:get(bot_id.."GranD:Get:Welcome:Group"..msg.chat_id_)  
if GetWelcomeGroup then 
t = GetWelcomeGroup
else  
t = "\n    \n  name \n user" 
end 
if result.username_ then
t = t:gsub('name',result.first_name_) 
t = t:gsub('user','@'..result.username_) 
else
t = t:gsub('name',result.first_name_) 
t = t:gsub('user',' ') 
end
send(msg.chat_id_, msg.id_,'['..t..']')
end,nil) 
end 
end 
-------------------------------------------------------
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(bot_id) then 
database:set(bot_id.."GranD:Pin:Id:Msg"..msg.chat_id_,msg.content_.message_id_)
else
local Msg_Pin = database:get(bot_id.."GranD:Pin:Id:Msg"..msg.chat_id_)
if Msg_Pin and database:get(bot_id.."GranD:lockpin"..msg.chat_id_) then
PinMessage(msg.chat_id_,Msg_Pin)
end
end
end
------------------------------------------------------
if msg.content_.photo_ then  
if database:get(bot_id.."GranD:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) then 
if msg.content_.photo_.sizes_[3] then  
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_ 
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ 
end 
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"       ") 
database:del(bot_id.."GranD:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"        ") 
database:del(bot_id.."GranD:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
else
send(msg.chat_id_, msg.id_,"   ") 
end
end, nil) 
database:del(bot_id.."GranD:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_) 
end   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."GranD:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text == "" then 
send(msg.chat_id_, msg.id_,"   ") 
database:del(bot_id.."GranD:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)
return false  
end 
database:del(bot_id.."GranD:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
https.request("https://api.telegram.org/bot"..token.."/setChatDescription?chat_id="..msg.chat_id_.."&description="..text) 
send(msg.chat_id_, msg.id_,"   ")   
return false  
end 
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."GranD:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text == "" then 
send(msg.chat_id_, msg.id_,"   ") 
database:del(bot_id.."GranD:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."GranD:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
database:set(bot_id.."GranD:Get:Welcome:Group"..msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,"   ")   
return false   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."GranD:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) then
if text == "" then
send(msg.chat_id_,msg.id_,"   ")       
database:del(bot_id.."GranD:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local Link = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)")   
database:set(bot_id.."GranD:Private:Group:Link"..msg.chat_id_,Link)
send(msg.chat_id_,msg.id_,"   ")       
database:del(bot_id.."GranD:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end 

if database:get(bot_id.."GranD:GranD:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "" or text == " " then   
send(msg.chat_id_, msg.id_,"   ") 
database:del(bot_id.."GranD:GranD:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id..'GranD:UsersBot')  
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ""))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"   *~ "..#list.." ~*    ")     
database:del(bot_id.."GranD:GranD:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end

if database:get(bot_id.."GranD:GranD:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "" or text == " " then   
send(msg.chat_id_, msg.id_,"  ") 
database:del(bot_id.."GranD:GranD:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."GranD:Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ""))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"   *~ "..#list.." ~*  ")     
database:del(bot_id.."GranD:GranD:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end

if database:get(bot_id.."GranD:GranD:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "" or text == " " then   
send(msg.chat_id_, msg.id_,"  ") 
database:del(bot_id.."GranD:GranD:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id.."GranD:Chek:Groups")   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"   *~ "..#list.." ~*  ")     
database:del(bot_id.."GranD:GranD:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
return false
end
if database:get(bot_id.."GranD:GranD:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "" or text == " " then   
send(msg.chat_id_, msg.id_,"  ") 
database:del(bot_id.."GranD:GranD:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id.."GranD:UsersBot")   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"   *~ "..#list.." ~*    ")     
database:del(bot_id.."GranD:GranD:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
return false
end

--------------------------------------------------------------------------------------------------------------
if text and not Vips(msg) then  
local GranD_Msg = database:sismember(bot_id.."GranD:List:Filter:text"..msg.chat_id_,text) 
if GranD_Msg then    
Reply_Status(msg,msg.sender_user_id_,"reply","   ")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if msg.content_.ID == 'MessageAnimation' and not Vips(msg) then      
local geAni = database:sismember(bot_id.."GranD:List:Filter:Animation"..msg.chat_id_,msg.content_.animation_.animation_.persistent_id_) 
if geAni then        
Reply_Status(msg,msg.sender_user_id_,"reply","   ")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if msg.content_.ID == 'MessageSticker' and not Vips(msg) then      
local ker = database:sismember(bot_id.."GranD:List:Filter:Sticker"..msg.chat_id_,msg.content_.sticker_.sticker_.persistent_id_) 
if ker then        
Reply_Status(msg,msg.sender_user_id_,"reply","   ")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if msg.content_.ID == 'MessagePhoto' and not Vips(msg) then      
local phh = database:sismember(bot_id.."GranD:List:Filter:Photo"..msg.chat_id_,msg.content_.photo_.sizes_[1].photo_.persistent_id_) 
if phh then        
Reply_Status(msg,msg.sender_user_id_,"reply","   ")  
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
if database:get(bot_id.."GranD:Set:Name:Bot"..msg.sender_user_id_) then 
if text == "" or text == " " then   
send(msg.chat_id_, msg.id_,"     ") 
database:del(bot_id.."GranD:Set:Name:Bot"..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."GranD:Set:Name:Bot"..msg.sender_user_id_) 
database:set(bot_id.."GranD:Name:Bot",text) 
send(msg.chat_id_, msg.id_, "    ")  
return false
end 
if text and database:get(bot_id.."GranD:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
database:set(bot_id.."GranD:Set:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"  ")  
database:del(bot_id.."GranD:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
database:set(bot_id.."GranD:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and database:get(bot_id.."GranD:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = database:get(bot_id.."GranD:Set:Cmd:Group:New"..msg.chat_id_)
database:set(bot_id.."GranD:Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
database:sadd(bot_id.."GranD:List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"  ")  
database:del(bot_id.."GranD:Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
--------------------------------------------------------------------------------------------------------------
if Chat_Type == 'GroupBot' then
if ChekAdd(msg.chat_id_) == true then
if text == "  " and Owner(msg) then        
database:del(bot_id.."y:msg:media"..msg.chat_id_)
Reply_Status(msg,msg.sender_user_id_,"lock",'    ')
return false
end 
if text == "  " and Owner(msg) then        
database:set(bot_id.."y:msg:media"..msg.chat_id_,true)
Reply_Status(msg,msg.sender_user_id_,"lock",'    ')
return false
end 

if text == " " and msg.reply_to_message_id_ == 0 and Owner(msg) then 
database:set(bot_id.."GranD:Lock:text"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == " " and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."GranD:Lock:AddMempar"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lock","   ")  
return false
end 
if text == " " and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."GranD:Lock:Join"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lock","   ")  
return false
end 
if text == " " and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."GranD:Lock:Bot:kick"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id.."GranD:Lock:Bot:kick"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
database:set(bot_id.."GranD:Lock:tagservr"..msg.chat_id_,true)  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == " " and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."GranD:lockpin"..msg.chat_id_, true) 
database:sadd(bot_id.."GranD:Lock:pin",msg.chat_id_) 
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  database:set(bot_id.."GranD:Pin:Id:Msg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
Reply_Status(msg,msg.sender_user_id_,"lock","   ")  
return false
end 
if text == " " and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:set(bot_id.."GranD:Lock:edit"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."GranD:Lock:edit"..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == " " and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end  
database:set(bot_id.."GranD:Lock:tagservrbot"..msg.chat_id_,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..'GranD:'..lock..msg.chat_id_,"del")    
end
Reply_Status(msg,msg.sender_user_id_,"lock","   ")  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == " " and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."GranD:Lock:AddMempar"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","   ")  
return false
end 
if text == " " and msg.reply_to_message_id_ == 0 and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."GranD:Lock:text"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."GranD:Lock:Join"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","   ")  
return false
end 
if text == " " and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."GranD:Lock:Bot:kick"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == "  " and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."GranD:Lock:Bot:kick"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","\n  ")  
return false
end 
if text == " " and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end  
database:del(bot_id.."GranD:Lock:tagservr"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."GranD:lockpin"..msg.chat_id_)  
database:srem(bot_id.."GranD:Lock:pin",msg.chat_id_)
Reply_Status(msg,msg.sender_user_id_,"unlock","   ")  
return false
end 
if text == " " and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."GranD:Lock:edit"..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == "  " and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id.."GranD:Lock:edit"..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and msg.reply_to_message_id_ == 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:del(bot_id.."GranD:Lock:tagservrbot"..msg.chat_id_)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
database:del(bot_id..'GranD:'..lock..msg.chat_id_)    
end
Reply_Status(msg,msg.sender_user_id_,"unlock","   ")  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."GranD:Lock:Link"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Link"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Link"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Link"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Lock:Link"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."GranD:Lock:User:Name"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:User:Name"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:User:Name"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:User:Name"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Lock:User:Name"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."GranD:Lock:hashtak"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:hashtak"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:hashtak"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:hashtak"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Lock:hashtak"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Cmd"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Cmd"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Cmd"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Cmd"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:del(bot_id.."GranD:Lock:Cmd"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " "and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Photo"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == " "and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Xn"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Photo"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Photo"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Photo"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:del(bot_id.."GranD:Lock:Photo"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:del(bot_id.."GranD:Lock:Xn"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Video"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Video"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Video"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Video"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:del(bot_id.."GranD:Lock:Video"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."GranD:Lock:Animation"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Animation"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Animation"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Animation"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Lock:Animation"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."GranD:Lock:geam"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:geam"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:geam"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:geam"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Lock:geam"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Audio"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Audio"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Audio"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Audio"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:del(bot_id.."GranD:Lock:Audio"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:vico"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:vico"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:vico"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:vico"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:del(bot_id.."GranD:Lock:vico"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Keyboard"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Keyboard"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Keyboard"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Keyboard"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:del(bot_id.."GranD:Lock:Keyboard"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."GranD:Lock:Sticker"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Sticker"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Sticker"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Sticker"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Lock:Sticker"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."GranD:Lock:forward"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:forward"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:forward"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:forward"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Lock:forward"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Document"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Document"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Document"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Document"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:del(bot_id.."GranD:Lock:Document"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."GranD:Lock:Unsupported"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Unsupported"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Unsupported"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Unsupported"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Lock:Unsupported"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Markdaun"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Markdaun"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Markdaun"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Markdaun"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Lock:Markdaun"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Contact"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Contact"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Contact"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Contact"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Lock:Contact"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Spam"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Spam"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Spam"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Spam"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Lock:Spam"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Inlen"..msg.chat_id_,"del")  
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Inlen"..msg.chat_id_,"ked")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Inlen"..msg.chat_id_,"ktm")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")  
return false
end 
if text == "  " and Addictive(msg) then
database:set(bot_id.."GranD:Lock:Inlen"..msg.chat_id_,"kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")  
return false
end 
if text == " " and Addictive(msg) then
database:del(bot_id.."GranD:Lock:Inlen"..msg.chat_id_)  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")  
return false
end 
if text == "  " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:hset(bot_id.."GranD:flooding:settings:"..msg.chat_id_ ,"flood","kick")  
Reply_Status(msg,msg.sender_user_id_,"lockkick","  ")
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:hset(bot_id.."GranD:flooding:settings:"..msg.chat_id_ ,"flood","del")  
Reply_Status(msg,msg.sender_user_id_,"lock","   ")
return false
end 
if text == "  " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:hset(bot_id.."GranD:flooding:settings:"..msg.chat_id_ ,"flood","keed")  
Reply_Status(msg,msg.sender_user_id_,"lockkid","  ")
return false
end 
if text == "  " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:hset(bot_id.."GranD:flooding:settings:"..msg.chat_id_ ,"flood","mute")  
Reply_Status(msg,msg.sender_user_id_,"lockktm","  ")
return false
end 
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
database:hdel(bot_id.."GranD:flooding:settings:"..msg.chat_id_ ,"flood")  
Reply_Status(msg,msg.sender_user_id_,"unlock","  ")
return false
end 
if text == ("  ") and tonumber(msg.reply_to_message_id_) ~= 0 and VIP_DeV(msg) then
function Function_GranD(extra, result, success)
database:sadd(bot_id.."DEV:Sudo:T", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","     ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false 
end
if text and text:match("^   @(.*)$") and VIP_DeV(msg) then
local username = text:match("^   @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"           !")   
return false 
end      
database:sadd(bot_id.."DEV:Sudo:T", result.id_)
Reply_Status(msg,result.id_,"reply","     ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false 
end
if text and text:match("^   (%d+)$") and VIP_DeV(msg) then
local userid = text:match("^   (%d+)$")
database:sadd(bot_id.."DEV:Sudo:T", userid)
Reply_Status(msg,userid,"reply","     ")  
return false 
end
if text == ("  ") and tonumber(msg.reply_to_message_id_) ~= 0 and VIP_DeV(msg) then
function Function_GranD(extra, result, success)
database:srem(bot_id.."DEV:Sudo:T", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","    ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false 
end
if text and text:match("^   @(.*)$") and VIP_DeV(msg) then
local username = text:match("^   @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
database:srem(bot_id.."DEV:Sudo:T", result.id_)
Reply_Status(msg,result.id_,"reply","    ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end  
if text and text:match("^   (%d+)$") and VIP_DeV(msg) then
local userid = text:match("^   (%d+)$")
database:srem(bot_id.."DEV:Sudo:T", userid)
Reply_Status(msg,userid,"reply","    ")  
return false 
end
if text == ("") and DevGranD(msg) then
local list = database:smembers(bot_id.."DEV:Sudo:T")
t = "\n    \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "   "
end
send(msg.chat_id_, msg.id_, t)
end
if text == (" ") and VIP_DeV(msg) then
database:del(bot_id.."DEV:Sudo:T")
send(msg.chat_id_, msg.id_, "\n       ")
end
if text == ("  ") and DevGranD(msg) then
database:del(bot_id.."GranD:GBan:User")
send(msg.chat_id_, msg.id_, "\n   ")
return false
end
if text == (" ") and DevGranD(msg) then
database:del(bot_id.."GranD:Sudo:User")
send(msg.chat_id_, msg.id_, "\n      ")
end
if text == "  " and DevBot(msg) then
database:del(bot_id.."GranD:Basic:Constructor"..msg.chat_id_)
texts = "    "
send(msg.chat_id_, msg.id_, texts)
end
if text == " " and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Constructor"..msg.chat_id_)
texts = "    "
send(msg.chat_id_, msg.id_, texts)
end
if text == " " and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Manager"..msg.chat_id_)
texts = "    "
send(msg.chat_id_, msg.id_, texts)
end
if text == " " and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Mod:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "       ")
end
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Special:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "        ")
end
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Muted:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "     ")
end
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Ban:User"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "\n  ")
end
if text == (" ") and DevGranD(msg) then
local list = database:smembers(bot_id.."GranD:GBan:User")
t = "\n   \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "   "
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("") and DevGranD(msg) then
local list = database:smembers(bot_id.."GranD:Sudo:User")
t = "\n   \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "  "
end
send(msg.chat_id_, msg.id_, t)
end
if text == " " and DevBot(msg) then
local list = database:smembers(bot_id.."GranD:Basic:Constructor"..msg.chat_id_)
t = "\n   \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "   "
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("") and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local list = database:smembers(bot_id.."GranD:Constructor"..msg.chat_id_)
t = "\n  \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "  "
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("") and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local list = database:smembers(bot_id.."GranD:Manager"..msg.chat_id_)
t = "\n  \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "  "
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("") and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local list = database:smembers(bot_id.."GranD:Mod:User"..msg.chat_id_)
t = "\n  \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "  "
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("") and Addictive(msg) then
local list = database:smembers(bot_id.."GranD:Special:User"..msg.chat_id_)
t = "\n   \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "  "
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local list = database:smembers(bot_id.."GranD:Muted:User"..msg.chat_id_)
t = "\n  \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "  "
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("") then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local list = database:smembers(bot_id.."GranD:Ban:User"..msg.chat_id_)
t = "\n   \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "  "
end
send(msg.chat_id_, msg.id_, t)
end 

if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and DevGranD(msg) then
function Function_GranD(extra, result, success)
if General_ban(result, result.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n          ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
database:sadd(bot_id.."GranD:GBan:User", result.sender_user_id_)
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","    ")  
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text and text:match("^  @(.*)$")  and DevGranD(msg) then
local username = text:match("^  @(.*)$") 
function Function_GranD(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"           !")   
return false 
end      
if result.id_ == tonumber(1782889512) then
send(msg.chat_id_, msg.id_, "  {  ..}   \n")
return false 
end
if result.id_ == tonumber(1782889512) then
send(msg.chat_id_, msg.id_, "  {  ..}   \n")
return false 
end
if tonumber(result.id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "    ")
return false 
end
database:sadd(bot_id.."GranD:GBan:User", result.id_)
Reply_Status(msg,result.id_,"reply","    ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
if text and text:match("^  (%d+)$") and DevGranD(msg) then
local userid = text:match("^  (%d+)$")
if userid == tonumber(Id_Sudo) then
send(msg.chat_id_, msg.id_, "  {  ..}    \n")
return false 
end
if userid == tonumber(1782889512) then
send(msg.chat_id_, msg.id_, "  {  ..}   \n")
return false 
end
if userid == tonumber(1782889512) then
send(msg.chat_id_, msg.id_, "  {  ..}   \n")
return false 
end
if tonumber(userid) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "    ")
return false 
end
database:sadd(bot_id.."GranD:GBan:User", userid)
Reply_Status(msg,userid,"reply","    ")  
return false
end
if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and DevGranD(msg) then
function Function_GranD(extra, result, success)
database:srem(bot_id.."GranD:GBan:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","     ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text and text:match("^  @(.*)$") and DevGranD(msg) then
local username = text:match("^  @(.*)$") 
function Function_GranD(extra, result, success)
if result.id_ then
Reply_Status(msg,result.id_,"reply","     ")  
database:srem(bot_id.."GranD:GBan:User", result.id_)
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
if text and text:match("^  (%d+)$") and DevGranD(msg) then
local userid = text:match("^  (%d+)$")
database:srem(bot_id.."GranD:GBan:User", userid)
Reply_Status(msg,userid,"reply","     ")  
return false
end

if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and DevGranD(msg) then
function Function_GranD(extra, result, success)
database:sadd(bot_id.."GranD:Sudo:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","    ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false 
end
if text and text:match("^  @(.*)$") and DevGranD(msg) then
local username = text:match("^  @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"           !")   
return false 
end      
database:sadd(bot_id.."GranD:Sudo:User", result.id_)
Reply_Status(msg,result.id_,"reply","    ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false 
end
if text and text:match("^  (%d+)$") and DevGranD(msg) then
local userid = text:match("^  (%d+)$")
database:sadd(bot_id.."GranD:Sudo:User", userid)
Reply_Status(msg,userid,"reply","    ")  
return false 
end
if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and DevGranD(msg) then
function Function_GranD(extra, result, success)
database:srem(bot_id.."GranD:Sudo:User", result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","   ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false 
end
if text and text:match("^  @(.*)$") and DevGranD(msg) then
local username = text:match("^  @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
database:srem(bot_id.."GranD:Sudo:User", result.id_)
Reply_Status(msg,result.id_,"reply","   ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end  
if text and text:match("^  (%d+)$") and DevGranD(msg) then
local userid = text:match("^  (%d+)$")
database:srem(bot_id.."GranD:Sudo:User", userid)
Reply_Status(msg,userid,"reply","   ")  
return false 
end
if text == "" and DevBot(msg) then
local list = database:smembers(bot_id.."creator"..msg.chat_id_)
t = "\n   \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."User:Name" .. v)
if username then
t = t..""..k.." [@"..username.."]\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "*  *"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == "  " and DevBot(msg) then
database:del(bot_id.."creator"..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
database:sadd(bot_id.."creator"..msg.chat_id_,admins[i].user_id_)
end 
end  
end,nil)
send(msg.chat_id_, msg.id_, "*  *")
end
if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBot(msg) then  
function Function_GranD(extra, result, success)
database:sadd(bot_id.."creator"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","  ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text and text:match("^  @(.*)$") and DevBot(msg) then  
local username = text:match("^  @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"           !")   
return false 
end      
database:sadd(bot_id.."creator"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","  ")  
else
send(msg.chat_id_, msg.id_,"*    *")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
if text and text:match("^  (%d+)$") and DevBot(msg) then  
local userid = text:match("^  (%d+)$") 
database:sadd(bot_id.."creator"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","  ")  
return false
end
if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and DevBot(msg) then  
function Function_GranD(extra, result, success)
database:srem(bot_id.."creator"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","*   *")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text and text:match("^  @(.*)$") and DevBot(msg) then  
local username = text:match("^  @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
database:srem(bot_id.."creator"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","   ")  
else
send(msg.chat_id_, msg.id_,"*    *")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
if text and text:match("^  (%d+)$") and DevBot(msg) then  
local userid = text:match("^  (%d+)$") 
database:srem(bot_id.."creator"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","*   *")  
return false
end
if text == ("  ") and tonumber(msg.reply_to_message_id_) ~= 0 and creatorA(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
database:sadd(bot_id.."GranD:Basic:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","   ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text and text:match("^   @(.*)$") and creatorA(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^   @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"           !")   
return false 
end      
database:sadd(bot_id.."GranD:Basic:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","??   ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
if text and text:match("^   (%d+)$") and creatorA(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^   (%d+)$") 
database:sadd(bot_id.."GranD:Basic:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","   ")  
return false
end
if text == ("  ") and tonumber(msg.reply_to_message_id_) ~= 0 and creatorA(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
database:srem(bot_id.."GranD:Basic:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","   ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text and text:match("^   @(.*)$") and creatorA(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^   @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
database:srem(bot_id.."GranD:Basic:Constructor"..msg.chat_id_, result.id_)

Reply_Status(msg,result.id_,"reply","   ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
if text and text:match("^   (%d+)$") and creatorA(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^   (%d+)$") 
database:srem(bot_id.."GranD:Basic:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","   ")  
return false
end
if text == " " and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
database:sadd(bot_id.."GranD:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","    ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
end
if text and text:match("^  @(.*)$") and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^  @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"           !")   
return false 
end      
database:sadd(bot_id.."GranD:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","    ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
end
------------------------------------------------------------------------
if text and text:match("^  (%d+)$") and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^  (%d+)$")
database:sadd(bot_id.."GranD:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","    ")  
end
if text and text:match("^ $") and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then
function Function_GranD(extra, result, success)
database:srem(bot_id.."GranD:Constructor"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","   ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
end
------------------------------------------------------------------------
if text and text:match("^  @(.*)$") and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^  @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
database:srem(bot_id.."GranD:Constructor"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","   ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
end
------------------------------------------------------------------------
if text and text:match("^  (%d+)$") and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^  (%d+)$")
database:srem(bot_id.."GranD:Constructor"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","   ")  
end

if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
database:sadd(bot_id.."GranD:Manager"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","   ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end  
if text and text:match("^  @(.*)$") and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^  @(.*)$") 
function Function_GranD(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"           !")   
return false 
end      
database:sadd(bot_id.."GranD:Manager"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","   ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end 

if text and text:match("^  (%d+)$") and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^  (%d+)$") 
database:sadd(bot_id.."GranD:Manager"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","   ")  
return false
end  
if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","   ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end  
if text and text:match("^  @(.*)$") and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^  @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","   ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end  
if text and text:match("^  (%d+)$") and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^  (%d+)$") 
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","   ")  
return false
end

if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'           ')
return false
end
function Function_GranD(extra, result, success)
database:sadd(bot_id.."GranD:Mod:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","   ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text and text:match("^  @(.*)$") and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^  @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'           ')
return false
end
function Function_GranD(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"           !")   
return false 
end      
database:sadd(bot_id.."GranD:Mod:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","   ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
if text and text:match("^  (%d+)$") and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^  (%d+)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'           ')
return false
end
database:sadd(bot_id.."GranD:Mod:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","   ")  
return false
end
if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","    ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text and text:match("^  @(.*)$") and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^  @(.*)$") 
function Function_GranD(extra, result, success)
if result.id_ then
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","    ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
if text and text:match("^  (%d+)$") and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^  (%d+)$")
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","    ")  
return false
end

if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'           ')
return false
end
function Function_GranD(extra, result, success)
database:sadd(bot_id.."GranD:Special:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","   ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text and text:match("^  @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^  @(.*)$") 
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'           ')
return false
end
function Function_GranD(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"           !")   
return false 
end      
database:sadd(bot_id.."GranD:Special:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","   ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end

if text and text:match("^  (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^  (%d+)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'           ')
return false
end
database:sadd(bot_id.."GranD:Special:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","   ")  
return false
end

if (text == (" ")) and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","   ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text and text:match("^  @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^  @(.*)$") 
function Function_GranD(extra, result, success)
if result.id_ then
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","   ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
if text and text:match("^  (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^  (%d+)$") 
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","   ")  
return false
end  
if text and text:match(" (.*)") and tonumber(msg.reply_to_message_id_) > 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local RTPA = text:match(" (.*)")
if database:sismember(bot_id.."GranD:Coomds"..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local GranDrt = database:get(bot_id.."GranD:Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if GranDrt == "" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..data.first_name_.."](t.me/"..(data.username_ or "aaaaw")..")".."\n  "..RTPA.." \n")
database:set(bot_id.."GranD:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA) 
database:sadd(bot_id.."GranD:Special:User"..msg.chat_id_,result.sender_user_id_)  
elseif GranDrt == "" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..data.first_name_.."](t.me/"..(data.username_ or "aaaaw")..")".."\n  "..RTPA.." \n")
database:set(bot_id.."GranD:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA)
database:sadd(bot_id.."GranD:Mod:User"..msg.chat_id_,result.sender_user_id_)  
elseif GranDrt == "" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..data.first_name_.."](t.me/"..(data.username_ or "aaaaw")..")".."\n  "..RTPA.." \n")
database:set(bot_id.."GranD:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,RTPA)  
database:sadd(bot_id.."GranD:Manager"..msg.chat_id_,result.sender_user_id_)  
elseif GranDrt == "" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..data.first_name_.."](t.me/"..(data.username_ or "aaaaw")..")".."\n  "..RTPA.." \n")
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match(" (.*)") and tonumber(msg.reply_to_message_id_) > 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local RTPA = text:match(" (.*)")
if database:sismember(bot_id.."GranD:Coomds"..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local GranDrt = database:get(bot_id.."GranD:Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if GranDrt == "" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..data.first_name_.."](t.me/"..(data.username_ or "aaaaw")..")".."\n   "..RTPA.." \n")  
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."GranD:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif GranDrt == "" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..data.first_name_.."](t.me/"..(data.username_ or "aaaaw")..")".."\n   "..RTPA.." \n")  
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_,result.sender_user_id_) 
database:del(bot_id.."GranD:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif GranDrt == "" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..data.first_name_.."](t.me/"..(data.username_ or "aaaaw")..")".."\n   "..RTPA.." \n")  
database:srem(bot_id.."GranD:Manager"..msg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."GranD:Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif GranDrt == "" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..data.first_name_.."](t.me/"..(data.username_ or "aaaaw")..")".."\n   "..RTPA.." \n")  
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^ (.*) @(.*)") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local text1 = {string.match(text, "^() (.*) @(.*)$")}
if database:sismember(bot_id.."GranD:Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local GranDrt = database:get(bot_id.."GranD:Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if GranDrt == "" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..result.title_.."](t.me/"..(text1[3] or "aaaaw")..")".."\n  "..text1[2].." ")   
database:sadd(bot_id.."GranD:Special:User"..msg.chat_id_,result.id_)  
database:set(bot_id.."GranD:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif GranDrt == "" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..result.title_.."](t.me/"..(text1[3] or "aaaaw")..")".."\n  "..text1[2].." ")   
database:sadd(bot_id.."GranD:Mod:User"..msg.chat_id_,result.id_)  
database:set(bot_id.."GranD:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif GranDrt == "" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..result.title_.."](t.me/"..(text1[3] or "aaaaw")..")".."\n  "..text1[2].." ")   
database:sadd(bot_id.."GranD:Manager"..msg.chat_id_,result.id_)  
database:set(bot_id.."GranD:Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif GranDrt == "" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..result.title_.."](t.me/"..(text1[3] or "aaaaw")..")".."\n  "..text1[2].." ")   
end
else
info = " "
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^ (.*) @(.*)") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local text1 = {string.match(text, "^() (.*) @(.*)$")}
if database:sismember(bot_id.."GranD:Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local GranDrt = database:get(bot_id.."GranD:Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if GranDrt == "" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..result.title_.."](t.me/"..(text1[3] or "aaaaw")..")".."\n   "..text1[2].." ")   
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_,result.id_)  
database:del(bot_id.."GranD:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif GranDrt == "" and Owner(msg) then 
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..result.title_.."](t.me/"..(text1[3] or "aaaaw")..")".."\n   "..text1[2].." ")   
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_,result.id_)  
database:del(bot_id.."GranD:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif GranDrt == "" and Constructor(msg) then
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..result.title_.."](t.me/"..(text1[3] or "aaaaw")..")".."\n   "..text1[2].." ")   
database:srem(bot_id.."GranD:Manager"..msg.chat_id_,result.id_)  
database:del(bot_id.."GranD:Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif GranDrt == "" and Addictive(msg) then
send(msg.chat_id_, msg.id_,"[- GranD  .](https://t.me/aaaaw)\n — — — — — — — — —\n -› ["..result.title_.."](t.me/"..(text1[3] or "aaaaw")..")".."\n   "..text1[2].." ")   
end
else
info = " "
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end

if text == ("") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'        ')
return false
end
function Function_GranD(extra, result, success)
if result.sender_user_id_ == tonumber(1782889512) then
send(msg.chat_id_, msg.id_, "  {  ..}   \n")
return false 
end
if result.sender_user_id_ == tonumber(1782889512) then
send(msg.chat_id_, msg.id_, "  {  ..}   \n")
return false 
end
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n          ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"       !") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"     !") 
return false  
end
database:sadd(bot_id.."GranD:Ban:User"..msg.chat_id_, result.sender_user_id_)
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","   ")  
end,nil)   
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text == "" or text == "" and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'      !') 
return false  
end
heen = {
"-     ."
,"-     . "
,"-     ."
,"-       ."
,"-   . "
,"-     ."
,"-   ."
};
sendheen = heen[math.random(#heen)]
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.reply_to_message_id_,sendheen)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^ @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^ @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'        ')
return false
end
function Function_GranD(extra, result, success)
if result.id_ then
if result.id_ == tonumber(1782889512) then
send(msg.chat_id_, msg.id_, "  {  ..}   \n")
return false 
end
if result.id_ == tonumber(Id_Sudo) then
send(msg.chat_id_, msg.id_, "  {  ..}   \n")
return false 
end
if result.id_ == tonumber(1782889512) then
send(msg.chat_id_, msg.id_, "  {  ..}   \n")
return false 
end
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n          ( "..Get_Rank(result.id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"           !")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"       !") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"     !") 
return false  
end
database:sadd(bot_id.."GranD:Ban:User"..msg.chat_id_, result.id_)
Kick_Group(msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","   ")  
end,nil)   
end
else
send(msg.chat_id_, msg.id_, "    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end

if text and text:match("^ (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^ (%d+)$") 
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'        ')
return false
end
if userid == tonumber(Id_Sudo) then
send(msg.chat_id_, msg.id_, "  {  ..}   \n")
return false 
end
if userid == tonumber(1782889512) then
send(msg.chat_id_, msg.id_, "  {  ..}   \n")
return false 
end
if userid == tonumber(1782889512) then
send(msg.chat_id_, msg.id_, "  {  ..}   \n")
return false 
end
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n          ( "..Get_Rank(userid,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"       !") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"     !") 
return false  
end
database:sadd(bot_id.."GranD:Ban:User"..msg.chat_id_, userid)
Kick_Group(msg.chat_id_, userid)  
Reply_Status(msg,userid,"reply","   ")  
end,nil)   
end
return false
end
if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "   \n") 
return false 
end
database:srem(bot_id.."GranD:Ban:User"..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,result.sender_user_id_,"reply","    ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
 
if text and text:match("^  @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^  @(.*)$") 
function Function_GranD(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "   \n") 
return false 
end
database:srem(bot_id.."GranD:Ban:User"..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,result.id_,"reply","    ")  
else
send(msg.chat_id_, msg.id_, "    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end

if text and text:match("^  (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^  (%d+)$") 
if tonumber(userid) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, "   \n") 
return false 
end
database:srem(bot_id.."GranD:Ban:User"..msg.chat_id_, userid)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Reply_Status(msg,userid,"reply","    ")  
return false
end

if text == ("") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
if result.sender_user_id_ == tonumber(1782889512) then
send(msg.chat_id_, msg.id_, "  {  ..}    \n")
return false 
end
if result.sender_user_id_ == tonumber(1782889512) then
send(msg.chat_id_, msg.id_, "  {  ..}    \n")
return false 
end
if result.sender_user_id_ == tonumber(Id_Sudo) then
send(msg.chat_id_, msg.id_, "  {  ..}    \n")
return false 
end
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n          ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
return false 
end     
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"     !") 
return false  
end
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","   ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text and text:match("^ @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^ @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"     !") 
return false  
end
function Function_GranD(extra, result, success)
if result.id_ then
if result.id_ == tonumber(1782889512) then
send(msg.chat_id_, msg.id_, "  {  ..}   \n")
return false 
end
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n          ( "..Get_Rank(result.id_,msg.chat_id_).." )")
return false 
end     
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"           !")   
return false 
end      
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","   ")  
else
send(msg.chat_id_, msg.id_, "    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
if text and text:match("^ (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^ (%d+)$")
if userid == tonumber(1782889512) then
send(msg.chat_id_, msg.id_, "  {  ..}   \n")
return false 
end
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n          ( "..Get_Rank(userid,msg.chat_id_).." )")
else
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"     !") 
return false  
end
database:sadd(bot_id.."GranD:Muted:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","   ")  
end
return false
end
if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
database:srem(bot_id.."GranD:Muted:User"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","    ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text and text:match("^  @(.*)$") and Addictive(msg) then
local username = text:match("^  @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
database:srem(bot_id.."GranD:Muted:User"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","    ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end

if text and text:match("^  (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^  (%d+)$") 
database:srem(bot_id.."GranD:Muted:User"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","    ")  
return false
end
if text == ' ' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id..'GranD:GranD:lock:Fshar'..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
end
if text and database:get(bot_id..'GranD:lock:Fshar'..msg.chat_id_) and not Addictive(msg) then 
list = {"","","","",""," "," ","","","","",""," ","","","",""}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text == ' ' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id..'GranD:GranD:lock:Fshar'..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"lock","   \n")  
end
if text == ' ' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:set(bot_id..'GranD:lock:Fshar'..msg.chat_id_,true) 
Reply_Status(msg,msg.sender_user_id_,"lock","  ")  
end
if text and database:get(bot_id..'GranD:GranD:lock:Fshar'..msg.chat_id_) and not Addictive(msg) then 
list = {"","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text == ' ' and msg.reply_to_message_id_ == 0 and Addictive(msg) then 
database:del(bot_id..'GranD:lock:Fshar'..msg.chat_id_) 
Reply_Status(msg,msg.sender_user_id_,"lock","   \n")  
end
if text == ("") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n          ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","   ")  
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^ @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^ @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"           !")   
return false 
end      
if Rank_Checking(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n          ( "..Get_Rank(result.id_,msg.chat_id_).." )")
return false 
end      
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
Reply_Status(msg,result.id_,"reply","   ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^ (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^ (%d+)$")
if Rank_Checking(userid, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n          ( "..Get_Rank(userid,msg.chat_id_).." )")
else
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid)
Reply_Status(msg,userid,"reply","   ")  
end
return false
end
------------------------------------------------------------------------
if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,result.sender_user_id_,"reply","  ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^  @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^  @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,result.id_,"reply","  ")  
else
send(msg.chat_id_, msg.id_, "    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^  (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^  (%d+)$")
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Reply_Status(msg,userid,"reply","  ")  
return false
end
if text == ("") and msg.reply_to_message_id_ ~=0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'        ')
return false
end
function Function_GranD(extra, result, success)
if Rank_Checking(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n          ( "..Get_Rank(result.sender_user_id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"       !") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"     !") 
return false  
end
Kick_Group(result.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","   ")  
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end  
if text and text:match("^ @(.*)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
local username = text:match("^ @(.*)$")
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'        ')
return false
end
function Function_GranD(extra, result, success)
if result.id_ then
if Rank_Checking(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n          ( "..Get_Rank(result.id_,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"           !")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"       !") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"     !") 
return false  
end
Kick_Group(msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","   ")  
end,nil)   
end
else
send(msg.chat_id_, msg.id_, "    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end  

if text and text:match("^ (%d+)$") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
local userid = text:match("^ (%d+)$") 
if not Constructor(msg) and database:get(bot_id.."Ban:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'        ')
return false
end
if Rank_Checking(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n          ( "..Get_Rank(userid,msg.chat_id_).." )")
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"       !") 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,"     !") 
return false  
end
Kick_Group(msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","   ")  
end,nil)   
end
return false
end

if text == " " or text == " " then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Constructor(msg) then
database:set(bot_id.."Ban:Cheking"..msg.chat_id_,"true")
send(msg.chat_id_, msg.id_, '  -›  ~  ')
return false
end
end
if text == " " or text == " " then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Constructor(msg) then
database:del(bot_id.."Ban:Cheking"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '  -›  ~  ')
return false
end
end
if text == " " or text == " " then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Constructor(msg) then
database:set(bot_id.."Add:Group:Cheking"..msg.chat_id_,"true")
send(msg.chat_id_, msg.id_, '   -›  ~  ')
return false
end
end
if text == " " or text == " " then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Constructor(msg) then
database:del(bot_id.."Add:Group:Cheking"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '   -›  ~  ')
return false
end
end
if text and text:match("^  (.*)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local timsh = text:match("^  (.*)$")
function start_function(extra, result, success)
local chek = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..bot_id)
local getInfo = JSON.decode(chek)
if getInfo.result.can_promote_members == false then
send(msg.chat_id_, msg.id_,'         ') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n  -› ['..data.first_name_..'](t.me/'..(data.username_ or 'GranD')..') '
status  = '\n  -› '..result.sender_user_id_..'\n  {'..timsh..'}  '
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
https.request("https://api.telegram.org/bot"..token.."/setChatAdministratorCustomTitle?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&custom_title="..timsh)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if text == '' and tonumber(msg.reply_to_message_id_) == 0 then
Ge = https.request("https://api.telegram.org/bot"..token.."/getChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..msg.sender_user_id_)
GeId = JSON.decode(Ge)
if not GeId.result.custom_title then
send(msg.chat_id_, msg.id_,'  ') 
else
send(msg.chat_id_, msg.id_,'  : '..GeId.result.custom_title) 
end
end
if text == " " and Owner(msg) then
local chek = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..bot_id)
local getInfo = JSON.decode(chek)
if getInfo.ok == true then
if getInfo.result.can_change_info == true then
INf = '' 
else 
INf = ' ' 
end
if getInfo.result.can_delete_messages == true then
DEL = '' 
else 
DEL = ' ' 
end
if getInfo.result.can_invite_users == true then
INv = '' 
else
INv = ' ' 
end
if getInfo.result.can_pin_messages == true then
Pin = '' 
else
Pin = ' ' 
end
if getInfo.result.can_restrict_members == true then
REs = '' 
else 
REs = ' ' 
end
if getInfo.result.can_promote_members == true then
PRo = ''
else
PRo = ' '
end 
send(msg.chat_id_, msg.id_,'\n    \n— — — — — — — — —\n   : '..INf..'\n  : '..DEL..'\n  : '..REs..'\n  : '..INv..'\n  : '..Pin..'\n  : '..PRo)   
end
end
if text ==("") and msg.reply_to_message_id_ ~= 0 and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:sismember(bot_id.."GranD:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"       ")  
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"  ")   
database:set(bot_id.."GranD:Pin:Id:Msg"..msg.chat_id_,msg.reply_to_message_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"         ")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"       ")  
end
end,nil) 
end
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:sismember(bot_id.."GranD:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"       ")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"   ")   
database:del(bot_id.."GranD:Pin:Id:Msg"..msg.chat_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"         ")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"       ")  
end
end,nil)
end
if text == '  ' and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:sismember(bot_id.."GranD:Lock:pin",msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"       ")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"   ")   
https.request('https://api.telegram.org/bot'..token..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
database:del(bot_id.."GranD:Pin:Id:Msg"..msg.chat_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"         ")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"       ")  
end
end,nil)
end
if text and text:match("^  (%d+)$") and Addictive(msg) then   
local Num = text:match("  (.*)")
database:hset(bot_id.."GranD:flooding:settings:"..msg.chat_id_ ,"floodmax" ,Num) 
send(msg.chat_id_, msg.id_,"    ("..Num..")")  
end 
if text and text:match("^   (%d+)$") and Addictive(msg) then   
local Num = text:match("^   (%d+)$")
database:hset(bot_id.."GranD:flooding:settings:"..msg.chat_id_ ,"floodtime" ,Num) 
send(msg.chat_id_, msg.id_,"    ("..Num..")") 
end
if text == " " or text == " " then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if msg.reply_to_message_id_ == 0  and Addictive(msg) then  
send(msg.chat_id_,msg.id_,"      ")
database:setex(bot_id.."GranD:Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_,120,true) 
return false
end
end
if text == "" then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local status_Link = database:get(bot_id.."GranD:Link_Group"..msg.chat_id_)
if not status_Link then
send(msg.chat_id_, msg.id_,"  ") 
return false  
end
local link = database:get(bot_id.."GranD:Private:Group:Link"..msg.chat_id_)            
if link then                              
send(msg.chat_id_,msg.id_,"LinK GrOup : \n ["..link.."]")                          
else                
local InviteLink = json:decode(https.request("https://api.telegram.org/bot"..token.."/getChat?chat_id="..msg.chat_id_))
if InviteLink.result.invite_link then
jk = InviteLink.result.invite_link
elseif not InviteLink.result.invite_link then
https.request("https://api.telegram.org/bot"..token.."/exportChatInviteLink?chat_id="..msg.chat_id_)
jk = InviteLink.result.invite_link
end 
send(msg.chat_id_,msg.id_,"LinK GrOup : \n ["..jk.."]")                          
end            
end
if text == "  " or text == ' ' then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then  
database:set(bot_id.."GranD:Link_Group"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"    ") 
return false  
end
end
if text == "  " or text == ' ' then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then  
database:del(bot_id.."GranD:Link_Group"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"    ") 
return false end
end
if text == '' then   
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.phone_number_  then
one_nu = "  {`"..(result.phone_number_).."`}"
else
one_nu = "     "
end      
send(msg.chat_id_, msg.id_,one_nu) 
end,nil)
end 
if text == '' then   
send(msg.chat_id_, msg.id_,'  > '..msg.sender_user_id_)
end
if text == " " or text == " " then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then     
send(msg.chat_id_,msg.id_,"   ")           
database:del(bot_id.."GranD:Private:Group:Link"..msg.chat_id_) 
return false      
end
return false  
end
if (msg.content_.animation_) or (msg.content_.photo_) or (msg.content_.video_) or (msg.content_.document) or (msg.content_.sticker_) or (msg.content_.voice_) or (msg.content_.audio_) and msg.reply_to_message_id_ == 0 then      
database:sadd(bot_id.."GranD:allM"..msg.chat_id_, msg.id_)
end
if (msg.content_.text_) or (msg.content_.animation_) or (msg.content_.photo_) or (msg.content_.video_) or (msg.content_.document) or (msg.content_.sticker_) or (msg.content_.voice_) or (msg.content_.audio_) then
if database:get(bot_id.."y:msg:media"..msg.chat_id_) then    
local gmedia = database:scard(bot_id.."GranD:allM"..msg.chat_id_)  
if gmedia == 200 then
local liste = database:smembers(bot_id.."GranD:allM"..msg.chat_id_)
for k,v in pairs(liste) do
local Mesge = v
if Mesge then
t = "  "..k.."   \n     ( `  ` )"
DeleteMessage(msg.chat_id_,{[0]=Mesge})
end
end
send(msg.chat_id_, msg.id_, t)
database:del(bot_id.."GranD:allM"..msg.chat_id_)
end
end
end
if text == ("") and cleaner(msg) then  
local list = database:smembers(bot_id.."GranD:allM"..msg.chat_id_)
for k,v in pairs(list) do
local Message = v
if Message then
t = "  "..k.."   "
DeleteMessage(msg.chat_id_,{[0]=Message})
database:del(bot_id.."GranD:allM"..msg.chat_id_)
end
end
if #list == 0 then
t = "    "
end
send(msg.chat_id_, msg.id_, t)
end
if text == (" ") and cleaner(msg) then  
local gmria = database:scard(bot_id.."GranD:allM"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"    (* "..gmria.." *)")
end
if text and text:match("^ ") and Addictive(msg) and msg.reply_to_message_id_ == 0 or text and text:match("^ ") and Addictive(msg) and msg.reply_to_message_id_ == 0 then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."GranD:Change:Chat:Photo"..msg.chat_id_..":"..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_,"  ") 
return false
end
if text == " " or text == " " then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then
https.request("https://api.telegram.org/bot"..token.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"   ") 
end
return false  
end
if text == " " or text == " " then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then
database:setex(bot_id.."GranD:Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_,"  ")
end
return false  
end
if text == " " or text == " " then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then
database:setex(bot_id.."GranD:Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
t  = "   "
tt = "\n   !\n   -›{`name`}\n   -›{`user`}"
send(msg.chat_id_, msg.id_,t..tt) 
end
return false  
end
if text == "" and Addictive(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."GranD:Get:Welcome:Group"..msg.chat_id_)   then 
Welcome = database:get(bot_id.."GranD:Get:Welcome:Group"..msg.chat_id_)  
else 
Welcome = "    "
end 
send(msg.chat_id_, msg.id_,"["..Welcome.."]") 
return false  
end
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."GranD:Chek:Welcome"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"   ") 
return false  
end
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Chek:Welcome"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"   ") 
return false  
end
if text == " " or text == " " then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then
database:del(bot_id.."GranD:Get:Welcome:Group"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"   ") 
end
return false  
end
if text == " " and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."GranD:Filter:msg",msg.chat_id_)
tdcli_function ({ID = "GetUser",user_id_ = bot_id},function(arg,data) 
local Text =' '
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '', url="https://t.me/"..data.username_.."?start=ph"..msg.chat_id_},{text = '', url="https://t.me/"..data.username_.."?start=msg"..msg.chat_id_}},
{{text = '', url="https://t.me/"..data.username_.."?start=gif"..msg.chat_id_},{text = '', url="https://t.me/"..data.username_.."?start=Sti"..msg.chat_id_}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
if text == "  " and Addictive(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local listtext = database:smembers(bot_id.."GranD:List:Filter:text"..msg.chat_id_)  
for k,v in pairs(listtext) do  
database:srem(bot_id.."GranD:List:Filter:text"..msg.chat_id_,v)  
end  
local listAnimation = database:smembers(bot_id.."GranD:List:Filter:Animation"..msg.chat_id_)  
for k,v in pairs(listAnimation) do  
database:srem(bot_id.."GranD:List:Filter:Animation"..msg.chat_id_,v)  
end  
local listSticker = database:smembers(bot_id.."GranD:List:Filter:Sticker"..msg.chat_id_)  
for k,v in pairs(listSticker) do  
database:srem(bot_id.."GranD:List:Filter:Sticker"..msg.chat_id_,v)  
end  
local listPhoto = database:smembers(bot_id.."GranD:List:Filter:Photo"..msg.chat_id_)  
for k,v in pairs(listPhoto) do  
database:srem(bot_id.."GranD:List:Filter:Photo"..msg.chat_id_,v)  
end  
send(msg.chat_id_, msg.id_,"   ")  
end
if text and text == "" and msg.reply_to_message_id_ == 0 and Addictive(msg) then       
send(msg.chat_id_, msg.id_,"  {  }   ")  
database:set(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"rep")  
return false  
end    
if text then   
local tsssst = database:get(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"   ")  
database:del(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:sadd(bot_id.."GranD:List:Filter:text"..msg.chat_id_,text)  
return false 
end  
end
if msg.content_.ID == 'MessageAnimation' then    
local tsssst = database:get(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"   ")  
database:del(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:sadd(bot_id.."GranD:List:Filter:Animation"..msg.chat_id_,msg.content_.animation_.animation_.persistent_id_)  
return false 
end  
end
if msg.content_.ID == 'MessageSticker' then    
local tsssst = database:get(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"   ")  
database:del(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:sadd(bot_id.."GranD:List:Filter:Sticker"..msg.chat_id_,msg.content_.sticker_.sticker_.persistent_id_)  
return false 
end  
end
if msg.content_.ID == 'MessagePhoto' then    
local tsssst = database:get(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"   ")  
database:del(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:sadd(bot_id.."GranD:List:Filter:Photo"..msg.chat_id_,msg.content_.photo_.sizes_[1].photo_.persistent_id_)  
return false 
end  
end
if text == " " and msg.reply_to_message_id_ == 0 and Addictive(msg) then    
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_, msg.id_,"  {  }   ")  
database:set(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"reppp")  
return false 
end
if text then 
local test = database:get(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test and test == "reppp" then   
send(msg.chat_id_, msg.id_,"   ")  
database:del(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:srem(bot_id.."GranD:List:Filter:text"..msg.chat_id_,text)  
return false
end  
end
if msg.content_.ID == 'MessageAnimation' then    
local onte = database:get(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if onte and onte == "reppp" then   
send(msg.chat_id_, msg.id_,"     ")  
database:del(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:srem(bot_id.."GranD:List:Filter:Animation"..msg.chat_id_,msg.content_.animation_.animation_.persistent_id_)  
return false
end  
end
if msg.content_.ID == 'MessageSticker' then    
local Stic = database:get(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if Stic and Stic == "reppp" then   
send(msg.chat_id_, msg.id_,"     ")  
database:del(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:srem(bot_id.."GranD:List:Filter:Sticker"..msg.chat_id_,msg.content_.sticker_.sticker_.persistent_id_)  
return false
end  
end
if msg.content_.ID == 'MessagePhoto' then    
local hoto = database:get(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if hoto and hoto == "reppp" then   
send(msg.chat_id_, msg.id_,"     ")  
database:del(bot_id.."GranD:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:srem(bot_id.."GranD:List:Filter:Photo"..msg.content_.photo_.sizes_[1].photo_.persistent_id_)  
return false
end  
end
if text == " " and Addictive(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah)  
local admins = tah.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if tah.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(bot_id) then
Kick_Group(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
send(msg.chat_id_, msg.id_, "    ")
else
local t = "   >> {"..c.."}\n     >> {"..x.."}\n  >> {"..(c - x).."}  "
send(msg.chat_id_, msg.id_,t) 
end 
end,nil)  
end   
if text == (" ") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = "\n   \n — — — — — — — — — \n"
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,ta) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
tr = ""
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
tr = " {}"
end
text = text..">> [@"..ta.username_.."]"..tr.."\n"
if #admins == 0 then
send(msg.chat_id_, msg.id_, "    ")
return false 
end
if #admins == i then 
local a = "\n — — — — — — — — — \n    >> {"..n.."} \n"
local f = "     >> {"..t.."}\n   ()     \n"
send(msg.chat_id_, msg.id_, text..a..f)
end
end,nil)
end
end,nil)
end

if database:get(bot_id.."GranD:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "" then 
send(msg.chat_id_, msg.id_, "   ") 
database:del(bot_id.."GranD:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
return false  
end 
database:set(bot_id.."GranD:Set:Rules:Group" .. msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,"   ") 
database:del(bot_id.."GranD:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end  

if text == " " or text == " " then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then
database:setex(bot_id.."GranD:Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_,msg.id_,"   ")  
end
end
if text == " " or text == " " then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then
send(msg.chat_id_, msg.id_,"   ")  
database:del(bot_id.."GranD:Set:Rules:Group"..msg.chat_id_) 
end
end
if text == "" then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local Set_Rules = database:get(bot_id.."GranD:Set:Rules:Group" .. msg.chat_id_)   
if Set_Rules then     
send(msg.chat_id_,msg.id_, Set_Rules)   
else      
send(msg.chat_id_, msg.id_,"   ")   
end    
end

if text == " " and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local list = database:smembers(bot_id.."GranD:List:Cmd:Group:New"..msg.chat_id_.."")
t = "    \n — — — — — — — — — \n"
for k,v in pairs(list) do
Cmds = database:get(bot_id.."GranD:Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..""..k.."- ("..v..") ~ {"..Cmds.."}\n"
else
t = t..""..k.."- ("..v..") \n"
end
end
if #list == 0 then
t = "   "
end
send(msg.chat_id_, msg.id_,"["..t.."]")
end
if text == "  " or text == "  " then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Constructor(msg) then 
local list = database:smembers(bot_id.."GranD:List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."GranD:Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
database:del(bot_id.."GranD:List:Cmd:Group:New"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"      ")  
end
end
if text == " " and Constructor(msg) then
database:set(bot_id.."GranD:Set:Cmd:Group:New1"..msg.chat_id_..":","")
database:sadd(bot_id.."GranD:List:Cmd:Group:New"..msg.chat_id_,"")
database:set(bot_id.."GranD:Set:Cmd:Group:New1"..msg.chat_id_..":"," ")
database:sadd(bot_id.."GranD:List:Cmd:Group:New"..msg.chat_id_,"")
database:set(bot_id.."GranD:Set:Cmd:Group:New1"..msg.chat_id_..":"," ")
database:sadd(bot_id.."GranD:List:Cmd:Group:New"..msg.chat_id_,"")
database:set(bot_id.."GranD:Set:Cmd:Group:New1"..msg.chat_id_..":"," ")
database:sadd(bot_id.."GranD:List:Cmd:Group:New"..msg.chat_id_,"")
database:set(bot_id.."GranD:Set:Cmd:Group:New1"..msg.chat_id_..":"," ")
database:sadd(bot_id.."GranD:List:Cmd:Group:New"..msg.chat_id_,"")
database:set(bot_id.."GranD:Set:Cmd:Group:New1"..msg.chat_id_..":","  ")
database:sadd(bot_id.."GranD:List:Cmd:Group:New"..msg.chat_id_,"")
database:set(bot_id.."GranD:Set:Cmd:Group:New1"..msg.chat_id_..":","  ")
database:sadd(bot_id.."GranD:List:Cmd:Group:New"..msg.chat_id_,"")
database:set(bot_id.."GranD:Set:Cmd:Group:New1"..msg.chat_id_..":","  ")
database:sadd(bot_id.."GranD:List:Cmd:Group:New"..msg.chat_id_,"")
send(msg.chat_id_, msg.id_,"     ~\n-  -  .\n-  -  .\n-  -  .\n-  -  . \n-  -  . \n-   -   . \n-    -  .\n-    -  .")  
end
if text == " " and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."GranD:Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
send(msg.chat_id_, msg.id_,"     ..")  
return false
end
if text == " " or text == " " then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Constructor(msg) then
database:set(bot_id.."GranD:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
send(msg.chat_id_, msg.id_,"       ")  
return false
end
end
if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'           ')
return false
end
function Function_GranD(extra, result, success)
database:sadd(bot_id.."GranD:MN:TF"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","   ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text and text:match("^  @(.*)$") and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^  @(.*)$")
function Function_GranD(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"           !")   
return false 
end      
database:sadd(bot_id.."GranD:MN:TF"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","   ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
if text and text:match("^  (%d+)$") and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^  (%d+)$")
if not Constructor(msg) and database:get(bot_id.."Add:Group:Cheking"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'           ')
return false
end
database:sadd(bot_id.."GranD:MN:TF"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","   ")  
return false
end
if text == (" ") and tonumber(msg.reply_to_message_id_) ~= 0 and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
database:srem(bot_id.."GranD:MN:TF"..msg.chat_id_, result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","    ")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end
if text and text:match("^  @(.*)$") and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^  @(.*)$") 
function Function_GranD(extra, result, success)
if result.id_ then
database:srem(bot_id.."GranD:MN:TF"..msg.chat_id_, result.id_)
Reply_Status(msg,result.id_,"reply","    ")  
else
send(msg.chat_id_, msg.id_,"    ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
if text and text:match("^  (%d+)$") and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local userid = text:match("^  (%d+)$")
database:srem(bot_id.."GranD:MN:TF"..msg.chat_id_, userid)
Reply_Status(msg,userid,"reply","    ")  
return false
end

if text == "" and Addictive(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local list = database:smembers(bot_id.."GranD:Coomds"..msg.chat_id_)
if #list == 0 then
send(msg.chat_id_, msg.id_,"   ")
return false
end
t = "\n   \n\n"
for k,v in pairs(list) do
var = database:get(bot_id.."GranD:Comd:New:rt:bot:"..v..msg.chat_id_)
if var then
t = t..""..k.."- "..v.." ~ ("..var..")\n"
else
t = t..""..k.."- "..v.."\n"
end
end
send(msg.chat_id_, msg.id_,t)
end
if text == " " and BasicConstructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:MN:TF"..msg.chat_id_)
send(msg.chat_id_, msg.id_, "       ")
end
if text == ("") and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local list = database:smembers(bot_id.."GranD:MN:TF"..msg.chat_id_)
t = "\n  \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "  "
end
send(msg.chat_id_, msg.id_, t)
end
if text == " " then
local list = database:smembers(bot_id.."GranD:Coomds"..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."GranD:Comd:New:rt:bot:"..v..msg.chat_id_)
database:del(bot_id.."GranD:Coomds"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"  ")
end
if text and text:match("^  (.*)$") and Addictive(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
ComdNew = text:match("^  (.*)$")
database:set(bot_id.."GranD:Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
database:sadd(bot_id.."GranD:Coomds"..msg.chat_id_,ComdNew)  
database:setex(bot_id.."GranD:Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
send(msg.chat_id_, msg.id_, "   \n( ~   ~   ~  )") 
end
if text and text:match("^  (.*)$") and Addictive(msg) or text and text:match("^  (.*)$") and Addictive(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
ComdNew = text:match("^  (.*)$") or text:match("^  (.*)$")
database:del(bot_id.."GranD:Comd:New:rt:bot:"..ComdNew..msg.chat_id_)
send(msg.chat_id_, msg.id_, "   ") 
end
if database:get(bot_id.."GranD:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^$") then 
send(msg.chat_id_, msg.id_,"   ") 
database:del(bot_id.."GranD:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == "" then
if not Constructor(msg) then
send(msg.chat_id_, msg.id_"    \n   ( ~   ~  )") 
return false
end
end
if text == "" then
if not Owner(msg) then 
send(msg.chat_id_, msg.id_"    \n   (  ~  )") 
return false
end
end
if text == "" then
if not Addictive(msg) then
send(msg.chat_id_, msg.id_"    \n   (  )") 
return false
end
end
if text == "" or text == "" or text == "" or text == "" then
local textn = database:get(bot_id.."GranD:Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
database:set(bot_id.."GranD:Comd:New:rt:bot:"..textn..msg.chat_id_,text)
send(msg.chat_id_, msg.id_, "   ") 
database:del(bot_id.."GranD:Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end
if text and text:match("^   (.*)$") and Owner(msg) then
local Teext = text:match("^   (.*)$") 
database:set(bot_id.."GranD:Sudo:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"      -› "..Teext)
end
if text and text:match("^    (.*)$") and Owner(msg) then
local Teext = text:match("^    (.*)$") 
database:set(bot_id.."GranD:BasicConstructor:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"       -› "..Teext)
end
if text and text:match("^   (.*)$") and Owner(msg) then
local Teext = text:match("^   (.*)$") 
database:set(bot_id.."GranD:Constructor:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"      -› "..Teext)
end
if text and text:match("^   (.*)$") and Owner(msg) then
local Teext = text:match("^   (.*)$") 
database:set(bot_id.."GranD:Manager:Rd"..msg.chat_id_,Teext) 
send(msg.chat_id_, msg.id_,"      -› "..Teext)
end
if text and text:match("^   (.*)$") and Owner(msg) then
local Teext = text:match("^   (.*)$") 
database:set(bot_id.."GranD:Mod:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"      -› "..Teext)
end
if text and text:match("^   (.*)$") and Owner(msg) then
local Teext = text:match("^   (.*)$") 
database:set(bot_id.."GranD:Special:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"      -› "..Teext)
end
if text and text:match("^   (.*)$") and Owner(msg) then
local Teext = text:match("^   (.*)$") 
database:set(bot_id.."GranD:Memp:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"      -› "..Teext)
end
if text == (" ") and BasicConstructor(msg) then
send(msg.chat_id_, msg.id_,"      ")
database:del(bot_id.."GranD:Sudo:Rd"..msg.chat_id_)
database:del(bot_id.."GranD:BasicConstructor:Rd"..msg.chat_id_)
database:del(bot_id.."GranD:Constructor:Rd"..msg.chat_id_)
database:del(bot_id.."GranD:Manager:Rd"..msg.chat_id_) 
database:del(bot_id.."GranD:Mod:Rd"..msg.chat_id_)
database:del(bot_id.."GranD:Special:Rd"..msg.chat_id_)
database:del(bot_id.."GranD:Memp:Rd"..msg.chat_id_)
end
if text == ("  ") and BasicConstructor(msg) then
local list = database:smembers(bot_id.."GranD:List:Manager"..msg.chat_id_.."")
for k,v in pairs(list) do
database:del(bot_id.."GranD:Add:Rd:Manager:AudioCa"..v..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:FileCa"..v..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:VideoCa"..v..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:PhotoCa"..v..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:VicoCa"..v..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:GifCa"..v..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:Gif"..v..msg.chat_id_)   
database:del(bot_id.."GranD:Add:Rd:Manager:Vico"..v..msg.chat_id_)   
database:del(bot_id.."GranD:Add:Rd:Manager:Stekrs"..v..msg.chat_id_)     
database:del(bot_id.."GranD:Add:Rd:Manager:Text"..v..msg.chat_id_)   
database:del(bot_id.."GranD:Add:Rd:Manager:Photo"..v..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:Video"..v..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:File"..v..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:Audio"..v..msg.chat_id_)
database:del(bot_id.."GranD:List:Manager"..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"   ")
end
if text == (" ") and Owner(msg) then
local list = database:smembers(bot_id.."GranD:List:Manager"..msg.chat_id_.."")
text = "   \n — — — — — — — — —\n"
for k,v in pairs(list) do
if database:get(bot_id.."GranD:Add:Rd:Manager:Gif"..v..msg.chat_id_) then
db = " "
elseif database:get(bot_id.."GranD:Add:Rd:Manager:Vico"..v..msg.chat_id_) then
db = " "
elseif database:get(bot_id.."GranD:Add:Rd:Manager:Stekrs"..v..msg.chat_id_) then
db = " "
elseif database:get(bot_id.."GranD:Add:Rd:Manager:Text"..v..msg.chat_id_) then
db = " "
elseif database:get(bot_id.."GranD:Add:Rd:Manager:Photo"..v..msg.chat_id_) then
db = " "
elseif database:get(bot_id.."GranD:Add:Rd:Manager:Video"..v..msg.chat_id_) then
db = " "
elseif database:get(bot_id.."GranD:Add:Rd:Manager:File"..v..msg.chat_id_) then
db = " "
elseif database:get(bot_id.."GranD:Add:Rd:Manager:Audio"..v..msg.chat_id_) then
db = " "
end
text = text..""..k..">> ("..v..") -› {"..db.."}\n"
end
if #list == 0 then
text = "   "
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = database:get(bot_id.."GranD:Text:Manager"..msg.sender_user_id_..":"..msg.chat_id_.."")
if database:get(bot_id.."GranD:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
database:del(bot_id.."GranD:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_)
if msg.content_.sticker_ then   
database:set(bot_id.."GranD:Add:Rd:Manager:Stekrs"..test..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
database:set(bot_id.."GranD:Add:Rd:Manager:Vico"..test..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."GranD:Add:Rd:Manager:VicoCa"..test..msg.chat_id_, rtr)  
end
end     
if msg.content_.animation_ then   
database:set(bot_id.."GranD:Add:Rd:Manager:Gif"..test..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."GranD:Add:Rd:Manager:GifCa"..test..msg.chat_id_, rtr)  
end
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."GranD:Add:Rd:Manager:Text"..test..msg.chat_id_, text)  
end  
if msg.content_.audio_ then
database:set(bot_id.."GranD:Add:Rd:Manager:Audio"..test..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."GranD:Add:Rd:Manager:AudioCa"..test..msg.chat_id_, rtr)  
end
end  
if msg.content_.document_ then
database:set(bot_id.."GranD:Add:Rd:Manager:File"..test..msg.chat_id_, msg.content_.document_.document_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."GranD:Add:Rd:Manager:FileCa"..test..msg.chat_id_, rtr)  
end
end  
if msg.content_.video_ then
database:set(bot_id.."GranD:Add:Rd:Manager:Video"..test..msg.chat_id_, msg.content_.video_.video_.persistent_id_)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."GranD:Add:Rd:Manager:VideoCa"..test..msg.chat_id_, rtr)  
end
end  
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."GranD:Add:Rd:Manager:Photo"..test..msg.chat_id_, photo_in_group)  
if msg.content_.caption_ then
rtr = msg.content_.caption_
rtr = rtr:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","") 
database:set(bot_id.."GranD:Add:Rd:Manager:PhotoCa"..test..msg.chat_id_, rtr)  
end
end  
send(msg.chat_id_, msg.id_,"   ")
return false  
end  
end
if text == " " and Owner(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_, msg.id_,"    ")
database:set(bot_id.."GranD:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text == " " and Owner(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_, msg.id_,"    ")
database:set(bot_id.."GranD:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,"true2")
return false 
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."GranD:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, '      \n   ( -  -  -  -  -  )\n     :\n- `#username` >  \n- `#msgs` >   \n- `#name` >  \n- `#id` >  \n- `#stast` >   \n- `#edit` >   ')
database:set(bot_id.."GranD:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,"true1")
database:set(bot_id.."GranD:Text:Manager"..msg.sender_user_id_..":"..msg.chat_id_, text)
database:del(bot_id.."GranD:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
database:del(bot_id.."GranD:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
database:del(bot_id.."GranD:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
database:del(bot_id.."GranD:Add:Rd:Manager:Text"..text..msg.chat_id_)   
database:del(bot_id.."GranD:Add:Rd:Manager:Photo"..text..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:Video"..text..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:File"..text..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:Audio"..text..msg.chat_id_)
database:sadd(bot_id.."GranD:List:Manager"..msg.chat_id_.."", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."GranD:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_.."") == "true2" then
send(msg.chat_id_, msg.id_,"     ")
database:del(bot_id.."GranD:Add:Rd:Manager:AudioCa"..text..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:VicoCa"..text..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:PhotoCa"..text..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:FileCa"..text..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:GifCa"..text..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
database:del(bot_id.."GranD:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
database:del(bot_id.."GranD:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
database:del(bot_id.."GranD:Add:Rd:Manager:Text"..text..msg.chat_id_)   
database:del(bot_id.."GranD:Add:Rd:Manager:Photo"..text..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:Video"..text..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:File"..text..msg.chat_id_)
database:del(bot_id.."GranD:Add:Rd:Manager:Audio"..text..msg.chat_id_)
database:del(bot_id.."GranD:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_)
database:srem(bot_id.."GranD:List:Manager"..msg.chat_id_.."", text)
return false
end
end
if text and not database:get(bot_id.."GranD:Reply:Manager"..msg.chat_id_) then
if not database:sismember(bot_id..'GranD:Spam:Group'..msg.sender_user_id_,text) then
local anemi = database:get(bot_id.."GranD:Add:Rd:Manager:Gif"..text..msg.chat_id_)   
local veico = database:get(bot_id.."GranD:Add:Rd:Manager:Vico"..text..msg.chat_id_)   
local stekr = database:get(bot_id.."GranD:Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
local Text = database:get(bot_id.."GranD:Add:Rd:Manager:Text"..text..msg.chat_id_)   
local photo = database:get(bot_id.."GranD:Add:Rd:Manager:Photo"..text..msg.chat_id_)  
local video = database:get(bot_id.."GranD:Add:Rd:Manager:Video"..text..msg.chat_id_) 
local document = database:get(bot_id.."GranD:Add:Rd:Manager:File"..text..msg.chat_id_)
local audio = database:get(bot_id.."GranD:Add:Rd:Manager:Audio"..text..msg.chat_id_)
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,data)
if Text then 
local NumMsg = database:get(bot_id..'GranD:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'GranD:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = Text:gsub('#username',(data.username_ or ' ')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
send(msg.chat_id_, msg.id_,'['..Text..']')
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end
if stekr then 
sendSticker(msg.chat_id_,msg.id_,stekr)
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end
if veico then 
local NumMsg = database:get(bot_id..'GranD:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'GranD:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local veicoCa = database:get(bot_id.."GranD:Add:Rd:Manager:VicoCa"..text..msg.chat_id_)  or ""
local veicoCa = veicoCa:gsub('#username',(data.username_ or ' ')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendVoice(msg.chat_id_, msg.id_,veico,veicoCa)
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end
if video then 
local NumMsg = database:get(bot_id..'GranD:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'GranD:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local videoCa = database:get(bot_id.."GranD:Add:Rd:Manager:VideoCa"..text..msg.chat_id_) or ""
local videoCa = videoCa:gsub('#username',(data.username_ or ' ')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendVideo(msg.chat_id_, msg.id_,video,videoCa)
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end
if anemi then 
local NumMsg = database:get(bot_id..'GranD:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'GranD:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local anemiCa = database:get(bot_id.."GranD:Add:Rd:Manager:GifCa"..text..msg.chat_id_) or ""
local anemiCa = anemiCa:gsub('#username',(data.username_ or ' ')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendAnimation(msg.chat_id_, msg.id_,anemi,anemiCa)
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end
if document then 
local NumMsg = database:get(bot_id..'GranD:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'GranD:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local documentCa = database:get(bot_id.."GranD:Add:Rd:Manager:FileCa"..text..msg.chat_id_) or ""
local documentCa = documentCa:gsub('#username',(data.username_ or ' ')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendDocument(msg.chat_id_, msg.id_, document,documentCa)
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end  
if audio then 
local NumMsg = database:get(bot_id..'GranD:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'GranD:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local audioCa = database:get(bot_id.."GranD:Add:Rd:Manager:AudioCa"..text..msg.chat_id_)  or ""
local audioCa = audioCa:gsub('#username',(data.username_ or ' ')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendAudio(msg.chat_id_,msg.id_,audio,audioCa,audioCa)
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end
if photo then 
local NumMsg = database:get(bot_id..'GranD:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'GranD:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local photoCa = database:get(bot_id.."GranD:Add:Rd:Manager:PhotoCa"..text..msg.chat_id_) or ""
local photoCa = photoCa:gsub('#username',(data.username_ or ' ')):gsub('#name',data.first_name_):gsub('#id',msg.sender_user_id_):gsub('#edit',message_edit):gsub('#msgs',NumMsg):gsub('#stast',Status_Gps)
sendPhoto(msg.chat_id_,msg.id_,photo,photoCa)
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end  
end,nil)
end
end
------------------------------------------------------------------------
if text == ("  ") and DevGranD(msg) then 
local list = database:smembers(bot_id.."GranD:List:Rd:Sudo")
for k,v in pairs(list) do
database:del(bot_id.."GranD:Add:Rd:Sudo:Gif"..v)   
database:del(bot_id.."GranD:Add:Rd:Sudo:vico"..v)   
database:del(bot_id.."GranD:Add:Rd:Sudo:stekr"..v)     
database:del(bot_id.."GranD:Add:Rd:Sudo:Text"..v)   
database:del(bot_id.."GranD:Add:Rd:Sudo:Photo"..v)
database:del(bot_id.."GranD:Add:Rd:Sudo:Video"..v)
database:del(bot_id.."GranD:Add:Rd:Sudo:File"..v)
database:del(bot_id.."GranD:Add:Rd:Sudo:Audio"..v)
database:del(bot_id.."GranD:List:Rd:Sudo")
end
send(msg.chat_id_, msg.id_,"   ")
end
if text == (" ") and DevGranD(msg) then 
local list = database:smembers(bot_id.."GranD:List:Rd:Sudo")
text = "\n   \n — — — — — — — — —\n"
for k,v in pairs(list) do
if database:get(bot_id.."GranD:Add:Rd:Sudo:Gif"..v) then
db = " "
elseif database:get(bot_id.."GranD:Add:Rd:Sudo:vico"..v) then
db = " "
elseif database:get(bot_id.."GranD:Add:Rd:Sudo:stekr"..v) then
db = " "
elseif database:get(bot_id.."GranD:Add:Rd:Sudo:Text"..v) then
db = " "
elseif database:get(bot_id.."GranD:Add:Rd:Sudo:Photo"..v) then
db = " "
elseif database:get(bot_id.."GranD:Add:Rd:Sudo:Video"..v) then
db = " "
elseif database:get(bot_id.."GranD:Add:Rd:Sudo:File"..v) then
db = " "
elseif database:get(bot_id.."GranD:Add:Rd:Sudo:Audio"..v) then
db = " "
end
text = text..""..k.." >> ("..v..") -› {"..db.."}\n"
end
if #list == 0 then
text = "   "
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = database:get(bot_id.."GranD:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if database:get(bot_id.."GranD:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
database:del(bot_id.."GranD:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_)
if msg.content_.sticker_ then   
database:set(bot_id.."GranD:Add:Rd:Sudo:stekr"..test, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
database:set(bot_id.."GranD:Add:Rd:Sudo:vico"..test, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
database:set(bot_id.."GranD:Add:Rd:Sudo:Gif"..test, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."GranD:Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content_.audio_ then
database:set(bot_id.."GranD:Add:Rd:Sudo:Audio"..test, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
database:set(bot_id.."GranD:Add:Rd:Sudo:File"..test, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
database:set(bot_id.."GranD:Add:Rd:Sudo:Video"..test, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."GranD:Add:Rd:Sudo:Photo"..test, photo_in_group)  
end
send(msg.chat_id_, msg.id_,"   ")
return false  
end  
end

if text == "  " and DevGranD(msg) then 
send(msg.chat_id_, msg.id_,"     ")
database:set(bot_id.."GranD:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text == "  " and DevGranD(msg) then 
send(msg.chat_id_, msg.id_,"     ")
database:set(bot_id.."GranD:Set:On"..msg.sender_user_id_..":"..msg.chat_id_,true)
return false 
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."GranD:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, '      \n   ( -  -  -  -  -  )\n     :\n- `#username` >  \n- `#msgs` >   \n- `#name` >  \n- `#id` >  \n- `#stast` >   \n- `#edit` >   ')
database:set(bot_id.."GranD:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_, "true1")
database:set(bot_id.."GranD:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_, text)
database:sadd(bot_id.."GranD:List:Rd:Sudo", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."GranD:Set:On"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_,"      ")
list = {"Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
database:del(bot_id..'GranD:'..v..text)
end
database:del(bot_id.."GranD:Set:On"..msg.sender_user_id_..":"..msg.chat_id_)
database:srem(bot_id.."GranD:List:Rd:Sudo", text)
return false
end
end

if text and not database:get(bot_id.."GranD:Reply:Sudo"..msg.chat_id_) then
if not database:sismember(bot_id..'GranD:Spam:Group'..msg.sender_user_id_,text) then
local anemi = database:get(bot_id.."GranD:Add:Rd:Sudo:Gif"..text)   
local veico = database:get(bot_id.."GranD:Add:Rd:Sudo:vico"..text)   
local stekr = database:get(bot_id.."GranD:Add:Rd:Sudo:stekr"..text)     
local Text = database:get(bot_id.."GranD:Add:Rd:Sudo:Text"..text)   
local photo = database:get(bot_id.."GranD:Add:Rd:Sudo:Photo"..text)
local video = database:get(bot_id.."GranD:Add:Rd:Sudo:Video"..text)
local document = database:get(bot_id.."GranD:Add:Rd:Sudo:File"..text)
local audio = database:get(bot_id.."GranD:Add:Rd:Sudo:Audio"..text)

if Text then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,data)
local NumMsg = database:get(bot_id..'GranD:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(msg.sender_user_id_,msg.chat_id_)
local message_edit = database:get(bot_id..'GranD:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = Text:gsub('#username',(data.username_ or ' ')) 
local Text = Text:gsub('#name',data.first_name_)
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',message_edit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
send(msg.chat_id_, msg.id_,Text)
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end,nil)
end
if stekr then 
sendSticker(msg.chat_id_,msg.id_,stekr) 
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end
if veico then 
sendVoice(msg.chat_id_, msg.id_,veico,"")
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end
if video then 
sendVideo(msg.chat_id_, msg.id_,video,"")
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end
if anemi then 
sendAnimation(msg.chat_id_, msg.id_,anemi,"")   
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end
if document then
sendDocument(msg.chat_id_, msg.id_, document)     
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end
if photo then
sendPhoto(msg.chat_id_,msg.id_,photo,"")
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
end  
end
end
if text == ' ' or text == ' ' then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if Addictive(msg) then    
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
Kick_Group(msg.chat_id_, data.id_)
end
end,nil)
end
send(msg.chat_id_, msg.id_,'   ')
end,nil)
end
end

if text == "  " and Owner(msg) then   
database:del(bot_id.."GranD:Reply:Manager"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"   ") 
end
if text == "  " and Owner(msg) then  
database:set(bot_id.."GranD:Reply:Manager"..msg.chat_id_,true)  
send(msg.chat_id_, msg.id_,"   " ) 
end
if text == "  " and Owner(msg) then   
database:del(bot_id.."GranD:Reply:Sudo"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"   " ) 
end
if text == "  " and Owner(msg) then  
database:set(bot_id.."GranD:Reply:Sudo"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_,"   " ) 
end


if text == (" ") and msg.reply_to_message_id_ ~= 0 and Owner(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
if DevGranDe(result.sender_user_id_)  then
send(msg.chat_id_, msg.id_,"       ")
return false 
end
if Rank_Checking(result.sender_user_id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_,"\n     ")
else
send(msg.chat_id_, msg.id_,"\n      \n")
end
if DevGranDe(msg.sender_user_id_)  then
database:srem(bot_id.."DEV:Sudo:T",result.sender_user_id_)
database:srem(bot_id.."GranD:Sudo:User", result.sender_user_id_)
database:srem(bot_id.."GranD:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."GranD:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."DEV:Sudo:T",msg.sender_user_id_) then
database:srem(bot_id.."GranD:Sudo:User", result.sender_user_id_)
database:srem(bot_id.."GranD:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."GranD:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."GranD:Sudo:User",msg.sender_user_id_) then
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
elseif database:sismember(bot_id.."creator"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Constructor"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
elseif database:sismember(bot_id.."GranD:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Constructor"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."GranD:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id.."GranD:Manager"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
end
if text and text:match("^  @(.*)$") and Owner(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
if (result.id_) then
if DevGranDe(result.id_)  then
send(msg.chat_id_, msg.id_,"       ")
return false 
end
if Rank_Checking(result.id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_,"\n     ")
else
send(msg.chat_id_, msg.id_,"\n      \n")
end
if DevGranDe(msg.sender_user_id_)  then
database:srem(bot_id.."DEV:Sudo:T",result.id_)
database:srem(bot_id.."GranD:Sudo:User", result.id_)
database:srem(bot_id.."GranD:Basic:Constructor"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."GranD:Constructor"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."DEV:Sudo:T",msg.sender_user_id_) then
database:srem(bot_id.."GranD:Sudo:User", result.id_)
database:srem(bot_id.."GranD:Basic:Constructor"..msg.chat_id_,result.id_)
database:srem(bot_id.."GranD:Constructor"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."GranD:Sudo:User",msg.sender_user_id_) then
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Constructor"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Basic:Constructor"..msg.chat_id_,result.id_)
elseif database:sismember(bot_id.."creator"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Constructor"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Basic:Constructor"..msg.chat_id_,result.id_)
elseif database:sismember(bot_id.."GranD:Basic:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Constructor"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."GranD:Constructor"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Manager"..msg.chat_id_, result.id_)
elseif database:sismember(bot_id.."GranD:Manager"..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, result.id_)
database:srem(bot_id.."GranD:Special:User"..msg.chat_id_, result.id_)
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text:match("^  @(.*)$")}, Function_GranD, nil)
end
if text == " " and Addictive(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""), offset_ = 0,limit_ = 200},function(ta,taha)
local t = "\n   \n — — — — — — — — — \n"
x = 0
local list = taha.members_
for k, v in pairs(list) do
x = x + 1
if database:get(bot_id.."GranD:User:Name"..v.user_id_) then
t = t..""..x.."[@"..database:get(bot_id.."GranD:User:Name"..v.user_id_).."]\n"
end
end
send(msg.chat_id_,msg.id_,t)
end,nil)
end
if text == "" then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local rtp = Get_Rank(msg.sender_user_id_,msg.chat_id_)
send(msg.chat_id_, msg.id_,"    -› "..rtp)
end
if text == ""  then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.first_name_  then
first_name = "    {`"..(result.first_name_).."`}"
else
first_name = ""
end   
if result.last_name_ then 
last_name = "    {`"..result.last_name_.."`}" 
else
last_name = ""
end      
send(msg.chat_id_, msg.id_,first_name.."\n"..last_name) 
end,nil)
end 
if text==(" ") and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_,msg.id_,"     \n") 
return false  
end 
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
local taha = "   : "..data.administrator_count_..
"\n\n   : "..data.kicked_count_..
"\n\n   : "..data.member_count_..
"\n\n    : "..(msg.id_/2097152/0.5)..
"\n\n   : ["..ta.title_.."]"
send(msg.chat_id_, msg.id_, taha) 
end,nil)
end,nil)
end 
if text == "" or text == "" then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not database:get(bot_id.."GranD:Kick:Me"..msg.chat_id_) then
if Rank_Checking(msg.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, "\n     ( "..Get_Rank(msg.sender_user_id_,msg.chat_id_).." )")
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=msg.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,"        !") 
return false  
end
if (data and data.code_ and data.code_ == 3) then 
send(msg.chat_id_, msg.id_,"      !") 
return false  
end
if data and data.code_ and data.code_ == 400 and data.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_, msg.id_,"      ") 
return false  
end
if data and data.ID and data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"     ") 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = msg.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
return false
end
end,nil)   
else
send(msg.chat_id_, msg.id_,"        ") 
end
end

if text == " " and Owner(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."GranD:Kick:Me"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,Text) 
end
if text == " " and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."GranD:Kick:Me"..msg.chat_id_,true)  
Text = "\n   "
send(msg.chat_id_, msg.id_,Text) 
end

if text and text:match("^  @(.*)") and Owner(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^  @(.*)") 
function Function_GranD(extra, result, success)
if result.id_ then
if DevGranD(msg) then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem(bot_id.."GranD:GBan:User",result.id_)
database:srem(bot_id.."GranD:Ban:User"..msg.chat_id_,result.id_)
database:srem(bot_id.."GranD:Muted:User"..msg.chat_id_,result.id_)
usertext = "\n  -› ["..result.title_.."](t.me/"..(username or "kenwa")..")"
status  = "\n    "
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
else
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem(bot_id.."GranD:Ban:User"..msg.chat_id_,result.id_)
database:srem(bot_id.."GranD:Muted:User"..msg.chat_id_,result.id_)
Reply_Status(msg,result.id_,"reply","\n    ")  
end
else
Text = "  "
send(msg.chat_id_, msg.id_,Text)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
end
if text == " " and Owner(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
if DevGranD(msg) then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem(bot_id.."GranD:GBan:User",result.sender_user_id_)
database:srem(bot_id.."GranD:Ban:User"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."GranD:Muted:User"..msg.chat_id_,result.sender_user_id_)
Reply_Status(msg,result.sender_user_id_,"reply","\n    ")  
else
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem(bot_id.."GranD:Ban:User"..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id.."GranD:Muted:User"..msg.chat_id_,result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = "\n  -› ["..data.first_name_.."](t.me/"..(data.username_ or "kenwa")..")"
status  = "\n    "
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
end
if text and text:match("^  @(.*)") and Owner(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local username = text:match("^  @(.*)") 
function Function_GranD(extra, result, success)
if result.id_ then
if database:sismember(bot_id.."GranD:Muted:User"..msg.chat_id_,result.id_) then
Muted = ""
else
Muted = " "
end
if database:sismember(bot_id.."GranD:Ban:User"..msg.chat_id_,result.id_) then
Ban = ""
else
Ban = " "
end
if database:sismember(bot_id.."GranD:GBan:User",result.id_) then
GBan = " "
else
GBan = "  "
end
send(msg.chat_id_, msg.id_,"   -› "..GBan.."\n  -› "..Ban.."\n  -› "..Muted)
else
send(msg.chat_id_, msg.id_,"  ")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
end

if text == " " and Owner(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function Function_GranD(extra, result, success)
if database:sismember(bot_id.."GranD:Muted:User"..msg.chat_id_,result.sender_user_id_) then
Muted = ""
else
Muted = " "
end
if database:sismember(bot_id.."GranD:Ban:User"..msg.chat_id_,result.sender_user_id_) then
Ban = ""
else
Ban = " "
end
if database:sismember(bot_id.."GranD:GBan:User",result.sender_user_id_) then
GBan = " "
else
GBan = "  "
end
Textt = "   -› "..GBan.."\n  -› "..Ban.."\n  -› "..Muted..""
send(msg.chat_id_, msg.id_,Textt)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
end

if text and text:match("^  (.*)") and Owner(msg) or text and text:match("^  (.*)") and Owner(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local Name = text:match("^  (.*)") or text:match("^  (.*)") 
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = Name },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"      !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"      ")  
else
send(msg.chat_id_,msg.id_,"      {["..Name.."]}")  
end
end,nil) 
end

if text ==(" ") and Owner(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id.."GranD:Mod:User"..msg.chat_id_, admins[i].user_id_)
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,b) 
if b.username_ == true then
end
if b.first_name_ == false then
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
database:srem(bot_id.."GranD:Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end
if num2 == 0 then
send(msg.chat_id_, msg.id_,"     ") 
else
send(msg.chat_id_, msg.id_,"   { "..num2.." }   ") 
end
end,nil)   
end
if text ==("") then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_,"   ")
return false  
end
local UserName = (b.username_ or "aaaaw")
send(msg.chat_id_, msg.id_,"  ~ ["..b.first_name_.."](T.me/"..UserName..")")  
end,nil)   
end
end
end,nil)   
end
if text ==(" ") and DevBot(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_,"  ")
return false  
end
local UserName = (b.username_ or "aaaaw")
send(msg.chat_id_, msg.id_,"    ~ ["..b.first_name_.."](T.me/"..UserName..")")  
database:sadd(bot_id.."creator"..msg.chat_id_,b.id_)
end,nil)   
end,nil)   
end

if text == "" then 
if DevBot(msg) and not database:get(bot_id.."GranD:Left:Bot"..msg.chat_id_) then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,"   ") 
database:srem(bot_id.."GranD:Chek:Groups",msg.chat_id_)  
end
return false  
end
if text and text:match("^ (-%d+)$") then
local GP_ID = {string.match(text, "^() (-%d+)$")}
if DevBot(msg) and not database:get(bot_id.."GranD:Left:Bot"..msg.chat_id_) then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=GP_ID[2],user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,"   ") 
send(GP_ID[2], 0,"       ") 
database:srem(bot_id.."GranD:Chek:Groups",GP_ID[2])  
return false 
end
end
if text == " " and DevGranD(msg) then   
database:del(bot_id.."GranD:Left:Bot"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"   ") 
return false 
end
if text == " " and DevGranD(msg) then  
database:set(bot_id.."GranD:Left:Bot"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_, "   ") 
return false 
end
if text == (database:get(bot_id.."GranD:Name:Bot") or "") then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
Namebot = (database:get(bot_id.."GranD:Name:Bot") or "")
local namebot = {
"  "..Namebot.. "   ",
"    "..Namebot,
'     .',
'   ',
'  ',
' ',
'      ',
'  ',
' ',
"  "..Namebot,
}
name = math.random(#namebot)
send(msg.chat_id_, msg.id_, namebot[name]) 
return false 
end

if text == "" then
Namebot = (database:get(bot_id.."GranD:Name:Bot") or "")
send(msg.chat_id_, msg.id_,"  ["..Namebot.."] ") 
end
if text == "  " or text == "  " or text == "  " then 
if DevGranD(msg) then
database:setex(bot_id.."GranD:Set:Name:Bot"..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_,"     ")  
end
return false
end
if text == "" or text == " " then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local ktSJJJJ = {
'     ','  !','    ','      .','   ','      .','-         ','     ','     ','   .','   .','     .','  ',' .','     ','  ','    .','              .','     (  ) ','   .',' .',' .','   ','    ','         ','   .','   .','-              ','      .','      ','            ','    .','     ','   ','      ','   ','   ','      .','   .',' ','-         ',' .','-  ','-      ..',' .','      .','     .','     .','  .','   .','  .','   . ','    ','     ','     .','   .','  .','        ',' / /     /',' .','    .',' .','   ','   ','-              ','        !','  .','      .',' .','     .',' .','   .','    .',' .','     .', '-          ','   ','-      ..','     .','    .','    ',' ','    .','-      ....','      .','   .','        .','    ','      ..','  .','   .','      .','   .','     ','    .','      ','       .','     ','    " ".','- ""     !!','      ','-    ','  ','   ','-          ','    .','- ','   ','    .','','-   .','     ','      ',' |    !','     .','     ...','  .','    ',' ','   ','     !','    ','      .','     ','     ','""      .','  !','-      ','      .',' .','    ','        ','      ........','   ','       ','   .','     .','-  ','   .','-       ','     .','  ','     .','         ','         !','           .','-        ','      ','     ','     ','      .','    ','-           ','       .','   ','   /  .','   ','      ','     ','  ','         .','     ','','-     ..','    ','        .','      ','    .','   ',' |        .','      ','            ','        .',' .','   ','    .','     .','  ','  ','     .','   .','      ','-    ','   ','"" .','      ','      .','  .','     ','         ','     "".','    .','   ','    .','     .','    ','       .','       ','  ........','      ',' .','     Google.','       .','    ','    (     ) ','   .',' ........','  .','   .',' / /     /','     ....',' .','   ','-       !','     ...','""  .','-         ','     .','    .','   .','  "    ".','      ','   .','   ','    .','     ','   ','-    ','  ','','-   .','  .','   .','  .','-        ','       .','         ','      ','     " .','     ','      .','      ','       .','    ','     ','.   ','.   ','.  ','    ','      .','   .','-   ','      .','     .','-       ','   .','   .','  ','   -- ','    : - ','   ',' .','     ','     .','        .','      ','   .','   ','   ','   ','     !','-     ','    .','   ','  !.','       ','   ','     ','     .','""   .','-         ','-      ','     .','   ','""   .','   , .','       .','   ','     !','       .','      ..','   ','      '
}
ktbrok = math.random(#ktSJJJJ)
send(msg.chat_id_, msg.id_, ktSJJJJ[ktbrok]) 

end
if text ==(" ") and Addictive(msg) then    
local function delbans(extra, result)  
if not msg.can_be_deleted_ == true then  
send(msg.chat_id_, msg.id_, "    ") 
return false
end  
local num = 0 
for k,y in pairs(result.members_) do 
num = num + 1  
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = y.user_id_, status_ = { ID = "ChatMemberStatusLeft"}, }, dl_cb, nil)  
end  
send(msg.chat_id_, msg.id_,"     *~ "..num.." ~*  ") 
end    
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, delbans, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
if text==" " and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."GranD:Status:Bc") and not DevGranD(msg) then 
send(msg.chat_id_, msg.id_,"     ")
return false
end
database:setex(bot_id.."GranD:GranD:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"   ~ { , , ,  }\n   ") 
return false
end 
if text=="" and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."GranD:Status:Bc") and not DevGranD(msg) then 
send(msg.chat_id_, msg.id_,"     ")
return false
end
database:setex(bot_id.."GranD:GranD:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"   ~ { , , ,  }\n   ") 
return false
end  
if text==" " and msg.reply_to_message_id_ == 0 and DevBot(msg) then 
if database:get(bot_id.."GranD:Status:Bc") and not DevGranD(msg) then 
send(msg.chat_id_, msg.id_,"     ")
return false
end
database:setex(bot_id.."GranD:GranD:Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"   ~ { , , ,  }\n   ") 
return false
end  
if text==" " and msg.reply_to_message_id_ == 0  and DevBot(msg) then 
if database:get(bot_id.."GranD:Status:Bc") and not DevGranD(msg) then 
send(msg.chat_id_, msg.id_,"     ")
return false
end
database:setex(bot_id.."GranD:GranD:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"   ") 
return false
end 
if text=="  " and msg.reply_to_message_id_ == 0  and DevBot(msg) then 
if database:get(bot_id.."GranD:Status:Bc") and not DevGranD(msg) then 
send(msg.chat_id_, msg.id_,"     ")
return false
end
database:setex(bot_id.."GranD:GranD:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"   ") 
return false
end 

if text == " " and DevGranD(msg) then  
database:del(bot_id.."GranD:Status:Bc") 
send(msg.chat_id_, msg.id_,"\n   " ) 
return false
end 
if text == " " and DevGranD(msg) then  
database:set(bot_id.."GranD:Status:Bc",true) 
send(msg.chat_id_, msg.id_,"\n  ") 
return false
end 

if text == "" and Addictive(msg) then    
if database:get(bot_id.."GranD:lockpin"..msg.chat_id_) then    
lock_pin = ""
else 
lock_pin = ""    
end
if database:get(bot_id.."GranD:Lock:tagservr"..msg.chat_id_) then    
lock_tagservr = ""
else 
lock_tagservr = ""    
end
if database:get(bot_id.."GranD:Lock:text"..msg.chat_id_) then    
lock_text = ""
else 
lock_text = ""    
end
if database:get(bot_id.."GranD:Lock:AddMempar"..msg.chat_id_) == "kick" then
lock_add = ""
else 
lock_add = ""    
end    
if database:get(bot_id.."GranD:Lock:Join"..msg.chat_id_) == "kick" then
lock_join = ""
else 
lock_join = ""    
end    
if database:get(bot_id.."GranD:Lock:edit"..msg.chat_id_) then    
lock_edit = ""
else 
lock_edit = ""    
end
if database:get(bot_id.."GranD:Get:Welcome:Group"..msg.chat_id_) then
welcome = ""
else 
welcome = ""    
end
if database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_, "flood") == "kick" then     
flood = ""     
elseif database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"flood") == "keed" then     
flood = ""     
elseif database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"flood") == "mute" then     
flood = ""           
elseif database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"flood") == "del" then     
flood = ""           
else     
flood = ""     
end
if database:get(bot_id.."GranD:Lock:Photo"..msg.chat_id_) == "del" then
lock_photo = "" 
elseif database:get(bot_id.."GranD:Lock:Photo"..msg.chat_id_) == "ked" then 
lock_photo = ""   
elseif database:get(bot_id.."GranD:Lock:Photo"..msg.chat_id_) == "ktm" then 
lock_photo = ""    
elseif database:get(bot_id.."GranD:Lock:Photo"..msg.chat_id_) == "kick" then 
lock_photo = ""   
else
lock_photo = ""   
end    
if database:get(bot_id.."GranD:Lock:Contact"..msg.chat_id_) == "del" then
lock_phon = "" 
elseif database:get(bot_id.."GranD:Lock:Contact"..msg.chat_id_) == "ked" then 
lock_phon = ""    
elseif database:get(bot_id.."GranD:Lock:Contact"..msg.chat_id_) == "ktm" then 
lock_phon = ""    
elseif database:get(bot_id.."GranD:Lock:Contact"..msg.chat_id_) == "kick" then 
lock_phon = ""    
else
lock_phon = ""    
end    
if database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) == "del" then
lock_links = ""
elseif database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) == "ked" then
lock_links = ""    
elseif database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) == "ktm" then
lock_links = ""    
elseif database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) == "kick" then
lock_links = ""    
else
lock_links = ""    
end
if database:get(bot_id.."GranD:Lock:Cmd"..msg.chat_id_) == "del" then
lock_cmds = ""
elseif database:get(bot_id.."GranD:Lock:Cmd"..msg.chat_id_) == "ked" then
lock_cmds = ""    
elseif database:get(bot_id.."GranD:Lock:Cmd"..msg.chat_id_) == "ktm" then
lock_cmds = ""   
elseif database:get(bot_id.."GranD:Lock:Cmd"..msg.chat_id_) == "kick" then
lock_cmds = ""    
else
lock_cmds = ""    
end
if database:get(bot_id.."GranD:Lock:User:Name"..msg.chat_id_) == "del" then
lock_user = ""
elseif database:get(bot_id.."GranD:Lock:User:Name"..msg.chat_id_) == "ked" then
lock_user = ""    
elseif database:get(bot_id.."GranD:Lock:User:Name"..msg.chat_id_) == "ktm" then
lock_user = ""    
elseif database:get(bot_id.."GranD:Lock:User:Name"..msg.chat_id_) == "kick" then
lock_user = ""    
else
lock_user = ""    
end
if database:get(bot_id.."GranD:Lock:hashtak"..msg.chat_id_) == "del" then
lock_hash = ""
elseif database:get(bot_id.."GranD:Lock:hashtak"..msg.chat_id_) == "ked" then 
lock_hash = ""    
elseif database:get(bot_id.."GranD:Lock:hashtak"..msg.chat_id_) == "ktm" then 
lock_hash = ""    
elseif database:get(bot_id.."GranD:Lock:hashtak"..msg.chat_id_) == "kick" then 
lock_hash = ""    
else
lock_hash = ""    
end
if database:get(bot_id.."GranD:Lock:vico"..msg.chat_id_) == "del" then
lock_muse = ""
elseif database:get(bot_id.."GranD:Lock:vico"..msg.chat_id_) == "ked" then 
lock_muse = ""    
elseif database:get(bot_id.."GranD:Lock:vico"..msg.chat_id_) == "ktm" then 
lock_muse = ""    
elseif database:get(bot_id.."GranD:Lock:vico"..msg.chat_id_) == "kick" then 
lock_muse = ""    
else
lock_muse = ""    
end 
if database:get(bot_id.."GranD:Lock:Video"..msg.chat_id_) == "del" then
lock_ved = ""
elseif database:get(bot_id.."GranD:Lock:Video"..msg.chat_id_) == "ked" then 
lock_ved = ""    
elseif database:get(bot_id.."GranD:Lock:Video"..msg.chat_id_) == "ktm" then 
lock_ved = ""    
elseif database:get(bot_id.."GranD:Lock:Video"..msg.chat_id_) == "kick" then 
lock_ved = ""    
else
lock_ved = ""    
end
if database:get(bot_id.."GranD:Lock:Animation"..msg.chat_id_) == "del" then
lock_gif = ""
elseif database:get(bot_id.."GranD:Lock:Animation"..msg.chat_id_) == "ked" then 
lock_gif = ""    
elseif database:get(bot_id.."GranD:Lock:Animation"..msg.chat_id_) == "ktm" then 
lock_gif = ""    
elseif database:get(bot_id.."GranD:Lock:Animation"..msg.chat_id_) == "kick" then 
lock_gif = ""    
else
lock_gif = ""    
end
if database:get(bot_id.."GranD:Lock:Sticker"..msg.chat_id_) == "del" then
lock_ste = ""
elseif database:get(bot_id.."GranD:Lock:Sticker"..msg.chat_id_) == "ked" then 
lock_ste = " "    
elseif database:get(bot_id.."GranD:Lock:Sticker"..msg.chat_id_) == "ktm" then 
lock_ste = " "    
elseif database:get(bot_id.."GranD:Lock:Sticker"..msg.chat_id_) == "kick" then 
lock_ste = ""    
else
lock_ste = ""    
end
if database:get(bot_id.."GranD:Lock:geam"..msg.chat_id_) == "del" then
lock_geam = ""
elseif database:get(bot_id.."GranD:Lock:geam"..msg.chat_id_) == "ked" then 
lock_geam = ""    
elseif database:get(bot_id.."GranD:Lock:geam"..msg.chat_id_) == "ktm" then 
lock_geam = ""    
elseif database:get(bot_id.."GranD:Lock:geam"..msg.chat_id_) == "kick" then 
lock_geam = ""    
else
lock_geam = ""    
end    
if database:get(bot_id.."GranD:Lock:vico"..msg.chat_id_) == "del" then
lock_vico = ""
elseif database:get(bot_id.."GranD:Lock:vico"..msg.chat_id_) == "ked" then 
lock_vico = ""    
elseif database:get(bot_id.."GranD:Lock:vico"..msg.chat_id_) == "ktm" then 
lock_vico = ""    
elseif database:get(bot_id.."GranD:Lock:vico"..msg.chat_id_) == "kick" then 
lock_vico = ""    
else
lock_vico = ""    
end    
if database:get(bot_id.."GranD:Lock:Keyboard"..msg.chat_id_) == "del" then
lock_inlin = ""
elseif database:get(bot_id.."GranD:Lock:Keyboard"..msg.chat_id_) == "ked" then 
lock_inlin = ""
elseif database:get(bot_id.."GranD:Lock:Keyboard"..msg.chat_id_) == "ktm" then 
lock_inlin = ""    
elseif database:get(bot_id.."GranD:Lock:Keyboard"..msg.chat_id_) == "kick" then 
lock_inlin = ""
else
lock_inlin = ""
end
if database:get(bot_id.."GranD:Lock:forward"..msg.chat_id_) == "del" then
lock_fwd = ""
elseif database:get(bot_id.."GranD:Lock:forward"..msg.chat_id_) == "ked" then 
lock_fwd = ""    
elseif database:get(bot_id.."GranD:Lock:forward"..msg.chat_id_) == "ktm" then 
lock_fwd = ""    
elseif database:get(bot_id.."GranD:Lock:forward"..msg.chat_id_) == "kick" then 
lock_fwd = ""    
else
lock_fwd = ""    
end    
if database:get(bot_id.."GranD:Lock:Document"..msg.chat_id_) == "del" then
lock_file = ""
elseif database:get(bot_id.."GranD:Lock:Document"..msg.chat_id_) == "ked" then 
lock_file = ""    
elseif database:get(bot_id.."GranD:Lock:Document"..msg.chat_id_) == "ktm" then 
lock_file = ""    
elseif database:get(bot_id.."GranD:Lock:Document"..msg.chat_id_) == "kick" then 
lock_file = ""    
else
lock_file = ""    
end    
if database:get(bot_id.."GranD:Lock:Unsupported"..msg.chat_id_) == "del" then
lock_self = ""
elseif database:get(bot_id.."GranD:Lock:Unsupported"..msg.chat_id_) == "ked" then 
lock_self = ""    
elseif database:get(bot_id.."GranD:Lock:Unsupported"..msg.chat_id_) == "ktm" then 
lock_self = ""    
elseif database:get(bot_id.."GranD:Lock:Unsupported"..msg.chat_id_) == "kick" then 
lock_self = ""    
else
lock_self = ""    
end
if database:get(bot_id.."GranD:Lock:Bot:kick"..msg.chat_id_) == "del" then
lock_bots = ""
elseif database:get(bot_id.."GranD:Lock:Bot:kick"..msg.chat_id_) == "ked" then
lock_bots = ""   
elseif database:get(bot_id.."GranD:Lock:Bot:kick"..msg.chat_id_) == "kick" then
lock_bots = ""    
else
lock_bots = ""    
end
if database:get(bot_id.."GranD:Lock:Markdaun"..msg.chat_id_) == "del" then
lock_mark = ""
elseif database:get(bot_id.."GranD:Lock:Markdaun"..msg.chat_id_) == "ked" then 
lock_mark = ""    
elseif database:get(bot_id.."GranD:Lock:Markdaun"..msg.chat_id_) == "ktm" then 
lock_mark = ""    
elseif database:get(bot_id.."GranD:Lock:Markdaun"..msg.chat_id_) == "kick" then 
lock_mark = ""    
else
lock_mark = ""    
end
if database:get(bot_id.."GranD:Lock:Spam"..msg.chat_id_) == "del" then    
lock_spam = ""
elseif database:get(bot_id.."GranD:Lock:Spam"..msg.chat_id_) == "ked" then 
lock_spam = ""    
elseif database:get(bot_id.."GranD:Lock:Spam"..msg.chat_id_) == "ktm" then 
lock_spam = ""    
elseif database:get(bot_id.."GranD:Lock:Spam"..msg.chat_id_) == "kick" then 
lock_spam = ""    
else
lock_spam = ""    
end        
if not database:get(bot_id.."GranD:Reply:Manager"..msg.chat_id_) then
rdmder = ""
else
rdmder = ""
end
if not database:get(bot_id.."GranD:Reply:Sudo"..msg.chat_id_) then
rdsudo = ""
else
rdsudo = ""
end
if not database:get(bot_id.."GranD:Lock:ID:Bot"..msg.chat_id_)  then
idgp = ""
else
idgp = ""
end
if not database:get(bot_id.."GranD:Lock:ID:Bot:Photo"..msg.chat_id_) then
idph = ""
else
idph = ""
end
if not database:get(bot_id.."GranD:Lock:kick"..msg.chat_id_)  then
setadd = ""
else
setadd = ""
end
if not database:get(bot_id.."GranD:Lock:Add:Bot"..msg.chat_id_)  then
banm = ""
else
banm = ""
end
if not database:get(bot_id.."GranD:Kick:Me"..msg.chat_id_) then
kickme = ""
else
kickme = ""
end
Num_Flood = database:hget(bot_id.."GranD:flooding:settings:"..msg.chat_id_,"floodmax") or 0
local text = 
"*\n  "..
"\n — — — — — — — — — "..
"\n  {}  "..
"\n  {}  "..
"\n — — — — — — — — — "..
"\n -› "..lock_links..
"\n".." -› "..lock_user..
"\n".." -› "..lock_hash..
"\n".." -› "..lock_bots..
"\n".." -› "..lock_fwd..
"\n".." -› "..lock_pin..
"\n".." -› "..lock_tagservr..
"\n".." -› "..lock_mark..
"\n".." -› "..lock_edit..
"\n — — — — — — — — — "..
"\n".." -› "..lock_spam..
"\n".." -› "..lock_inlin..
"\n".." -› "..lock_vico..
"\n".." -› "..lock_gif..
"\n".." -› "..lock_file..
"\n".." -› "..lock_text..
"\n".." -› "..lock_ved..
"\n".." -› "..lock_photo..
"\n — — — — — — — — — "..
"\n".." -› "..lock_muse..
"\n".." -› "..lock_ste..
"\n".." -› "..lock_phon..
"\n".." -› "..lock_join..
"\n".." -› "..lock_add..
"\n".." -› "..lock_self..
"\n".." -› "..lock_geam..
"\n".." -› "..flood..
"\n".." -› "..welcome..
"\n".."  -› "..Num_Flood..
"\n\n.*"
send(msg.chat_id_, msg.id_,text)     
end    
if text == "  " and Owner(msg) then    
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_, msg.id_, '   ')
database:set(bot_id.."GranD:Fun_Bots"..msg.chat_id_,"true")
end
if text == "  " and Owner(msg) then    
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(msg.chat_id_, msg.id_,'   ')
database:del(bot_id.."GranD:Fun_Bots"..msg.chat_id_)
end

if text == ' ' and Owner(msg) then 
  if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id..'GranD:Lock:ID:Bot'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'  ') 
end
if text == ' ' and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id..'GranD:Lock:ID:Bot'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'  ') 
end
if text == '  ' and Owner(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id..'GranD:Lock:ID:Bot:Photo'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'   ') 
end
if text == '  ' and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id..'GranD:Lock:ID:Bot:Photo'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'   ') 
end
if text == ' ' and Owner(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:setex(bot_id.."GranD:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_,240,true)  
local Text= [[
   
   :
- `#username` >  
- `#msgs` >   
- `#photos` >   
- `#id` >  
- `#auto` >  
- `#stast` >   
- `#edit` >  
- `#game` > 
- `#AddMem` >  
- `#Description` >  
]]
send(msg.chat_id_, msg.id_,Text)
return false  
end 
if text == ' ' or text == ' ' then
if Owner(msg) then
database:del(bot_id.."GranD:Klesh:Id:Bot"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '    ')
end
return false  
end 

if database:get(bot_id.."GranD:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) then 
if text == '' then 
send(msg.chat_id_, msg.id_,"   ") 
database:del(bot_id.."GranD:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."GranD:Set:Id:Gp"..msg.chat_id_..""..msg.sender_user_id_) 
database:set(bot_id.."GranD:Klesh:Id:Bot"..msg.chat_id_,text:match("(.*)"))
send(msg.chat_id_, msg.id_,'  ')    
end

if text == '' and tonumber(msg.reply_to_message_id_) == 0 and not database:get(bot_id..'GranD:Lock:ID:Bot'..msg.chat_id_) then
if not database:sismember(bot_id..'GranD:Spam:Group'..msg.sender_user_id_,text) then
database:sadd(bot_id.."GranD:Spam:Group"..msg.sender_user_id_,text) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.sender_user_id_,offset_ = 0,limit_ = 1},function(extra,taha,success) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = ' '
end
local Id = msg.sender_user_id_
local NumMsg = database:get(bot_id..'GranD:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'GranD:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Num_Games = database:get(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_) or 0
local Add_Mem = database:get(bot_id.."GranD:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) or 0
local Total_Photp = (taha.total_count_ or 0)
local Texting = {
'  ',
"   ",
" ",
"  ",
"   ",
"  ",
}
local Description = Texting[math.random(#Texting)]
local get_id = database:get(bot_id.."GranD:Klesh:Id:Bot"..msg.chat_id_)
if not database:get(bot_id..'GranD:Lock:ID:Bot:Photo'..msg.chat_id_) then
if taha.photos_[0] then
if get_id then
local get_id = get_id:gsub('#AddMem',Add_Mem) 
local get_id = get_id:gsub('#id',Id) 
local get_id = get_id:gsub('#username',UserName_User) 
local get_id = get_id:gsub('#msgs',NumMsg) 
local get_id = get_id:gsub('#edit',message_edit) 
local get_id = get_id:gsub('#stast',Status_Gps) 
local get_id = get_id:gsub('#auto',TotalMsg) 
local get_id = get_id:gsub('#Description',Description) 
local get_id = get_id:gsub('#game',Num_Games) 
local get_id = get_id:gsub('#photos',Total_Photp) 
sendPhoto(msg.chat_id_,msg.id_,taha.photos_[0].sizes_[1].photo_.persistent_id_,get_id)
else
sendPhoto(msg.chat_id_,msg.id_,taha.photos_[0].sizes_[1].photo_.persistent_id_,''..Description..'\n -› '..Id..'\n -› '..UserName_User..'\n -› '..Status_Gps..'\n -› '..NumMsg..'\n -› '..message_edit..' \n -› '..TotalMsg..'\n  -› '..Num_Games)
end
else
send(msg.chat_id_, msg.id_,'   \n'..'\n* -› '..Id..'\n -›* ['..UserName_User..']*\n -› '..Status_Gps..'\n -› '..NumMsg..'\n -› '..message_edit..' \n -› '..TotalMsg..'\n  -› '..Num_Games..'*') 
end
else
if get_id then
local get_id = get_id:gsub('#AddMem',Add_Mem) 
local get_id = get_id:gsub('#id',Id) 
local get_id = get_id:gsub('#username',UserName_User) 
local get_id = get_id:gsub('#msgs',NumMsg) 
local get_id = get_id:gsub('#edit',message_edit) 
local get_id = get_id:gsub('#stast',Status_Gps) 
local get_id = get_id:gsub('#auto',TotalMsg) 
local get_id = get_id:gsub('#Description',Description) 
local get_id = get_id:gsub('#game',Num_Games) 
local get_id = get_id:gsub('#photos',Total_Photp) 
send(msg.chat_id_, msg.id_,'['..get_id..']') 
else
send(msg.chat_id_, msg.id_,'\n* -› '..Id..'\n -›* ['..UserName_User..']*\n -› '..Status_Gps..'\n -› '..NumMsg..'\n -› '..message_edit..' \n -› '..TotalMsg..'\n  -› '..Num_Games..'*') 
end
end
end,nil)   
end,nil)   
end
end
if text == ' ' and BasicConstructor(msg) then   
if database:get(bot_id..'Lock:delmsg'..msg.chat_id_)  then
database:del(bot_id..'Lock:delmsg'..msg.chat_id_) 
Text = '\n   ' 
else
Text = '\n   '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == ' ' and BasicConstructor(msg) then  
if not database:get(bot_id..'Lock:delmsg'..msg.chat_id_)  then
database:set(bot_id..'Lock:delmsg'..msg.chat_id_,true) 
Text = '\n   ' 
else
Text = '\n   '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match('^ (%d+)$') and Constructor(msg) and database:get(bot_id..'Lock:delmsg'..msg.chat_id_) then                
if not database:get(bot_id..'GranD:Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then           
local Number = tonumber(text:match('^ (%d+)$')) 
if Number > 1000 then 
send(msg.chat_id_, msg.id_,'     *~ 1000* ') 
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576
end
send(msg.chat_id_, msg.id_,'  *~ '..Number..'*  .')  
database:setex(bot_id..'GranD:Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end
end


if text == '' and tonumber(msg.reply_to_message_id_) > 0 and not database:get(bot_id..'GranD:Lock:ID:Bot'..msg.chat_id_) then
function Function_GranD(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
if data.first_name_ == false then
send(msg.chat_id_, msg.id_,'      ')
return false
end
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = ' '
end
local Id = data.id_
local NumMsg = database:get(bot_id..'GranD:messageUser'..msg.chat_id_..':'..data.id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'GranD:message_edit'..msg.chat_id_..data.id_) or 0
local Num_Games = database:get(bot_id.."Tshak:Msg_User"..msg.chat_id_..":"..data.id_) or 0
local Add_Mem = database:get(bot_id.."GranD:Add:Memp"..msg.chat_id_..":"..data.id_) or 0
send(msg.chat_id_, msg.id_,'* - '..Id..'\n - '..NumMsg..'\n - *['..UserName_User..']*\n - '..TotalMsg..'\n - '..Status_Gps..'\n - '..message_edit..'\n - '..Add_Mem..'\n  -  \n*') 
end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, Function_GranD, nil)
return false
end

if text and text:match("^ @(.*)$")  and not database:get(bot_id..'GranD:Lock:ID:Bot'..msg.chat_id_) then
local username = text:match("^ @(.*)$") 
function Function_GranD(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data.username_ then
UserName_User = '@'..data.username_
else
UserName_User = ' '
end
local Id = data.id_
local NumMsg = database:get(bot_id..'GranD:messageUser'..msg.chat_id_..':'..data.id_) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = Get_Rank(Id,msg.chat_id_)
local message_edit = database:get(bot_id..'GranD:message_edit'..msg.chat_id_..data.id_) or 0
local Num_Games = database:get(bot_id.."Tshak:Msg_User"..msg.chat_id_..":"..data.id_) or 0
local Add_Mem = database:get(bot_id.."GranD:Add:Memp"..msg.chat_id_..":"..data.id_) or 0
send(msg.chat_id_, msg.id_,'* - '..Id..'\n - '..NumMsg..'\n - *['..UserName_User..']*\n - '..TotalMsg..'\n - '..Status_Gps..'\n - '..message_edit..'\n - '..Add_Mem..'\n  -  \n*') 
end,nil)   
else
send(msg.chat_id_, msg.id_,'    ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_GranD, nil)
return false
end
if text == "" or text == "" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."Tshak:Set:Sma"..msg.chat_id_)
Random = {"","","","","","","","","","","","","","","","","","","","","","","","","??","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""}
SM = Random[math.random(#Random)]
database:set(bot_id.."Tshak:Random:Sm"..msg.chat_id_,SM)
send(msg.chat_id_, msg.id_,"     ? ~ {`"..SM.."`}")
return false
end
end
if text == ""..(database:get(bot_id.."Tshak:Random:Sm"..msg.chat_id_) or "").."" and not database:get(bot_id.."Tshak:Set:Sma"..msg.chat_id_) then
if not database:get(bot_id.."Tshak:Set:Sma"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"    \n    ~{  ,  }")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."Tshak:Set:Sma"..msg.chat_id_,true)
return false
end 
if text == "" or text == "" then
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."Tshak:Speed:Tr"..msg.chat_id_)
KlamSpeed = {"","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""};
name = KlamSpeed[math.random(#KlamSpeed)]
database:set(bot_id.."Tshak:Klam:Speed"..msg.chat_id_,name)
name = string.gsub(name,"","   ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","      ")
name = string.gsub(name,"","   ")
name = string.gsub(name,"","   ")
name = string.gsub(name,"","   ")
name = string.gsub(name,"","   ")
name = string.gsub(name,"","       ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","   ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","   ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","     ")
name = string.gsub(name,"","   ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","   ")
name = string.gsub(name,"","     ")
name = string.gsub(name,"","     ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","     ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","      ")
name = string.gsub(name,"","   ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","   ")
name = string.gsub(name,"","  ")
name = string.gsub(name,"","   ")
name = string.gsub(name,"","   ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","    ")
name = string.gsub(name,"","      ")
name = string.gsub(name,"","   ")
name = string.gsub(name,"","  ")
send(msg.chat_id_, msg.id_,"   ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."Tshak:Klam:Speed"..msg.chat_id_) or "").."" and not database:get(bot_id.."Tshak:Speed:Tr"..msg.chat_id_) then
if not database:get(bot_id.."Tshak:Speed:Tr"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"    \n    ~{  ,  }")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."Tshak:Speed:Tr"..msg.chat_id_,true)
end 

if text == "" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."Tshak:Set:Hzora"..msg.chat_id_)
Hzora = {""," ","","","5","","","7",""," ","","","","","","22",""," ","","","","","","","","","","","","","","",""};
name = Hzora[math.random(#Hzora)]
database:set(bot_id.."Tshak:Klam:Hzor"..msg.chat_id_,name)
name = string.gsub(name,"","      ")
name = string.gsub(name," ","          ")
name = string.gsub(name,"","           ")
name = string.gsub(name,"","          ")
name = string.gsub(name,"5","        5   ")
name = string.gsub(name,"","        ")
name = string.gsub(name,"","        ")
name = string.gsub(name,"7","   6     .    ")
name = string.gsub(name,"","      ")
name = string.gsub(name," ","          ")
name = string.gsub(name,"","      .   ")
name = string.gsub(name,"","          ")
name = string.gsub(name,"","       ")
name = string.gsub(name,"","            ")
name = string.gsub(name,"","          ")
name = string.gsub(name,"22","          ")
name = string.gsub(name,"","         ")
name = string.gsub(name," ","       ")
name = string.gsub(name,"","        ")
name = string.gsub(name,"","      ")
name = string.gsub(name,"","         ")
name = string.gsub(name,"","        ")
name = string.gsub(name,"","        ")
name = string.gsub(name,"","        ")
name = string.gsub(name,"","        ")
name = string.gsub(name,"","       ")
name = string.gsub(name,"","       ")
name = string.gsub(name,"","        ")
name = string.gsub(name,"","          ")
name = string.gsub(name,"","          ")
name = string.gsub(name,"","        ")
name = string.gsub(name,"","         ")
name = string.gsub(name,"","         ")
send(msg.chat_id_, msg.id_,"    \n {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."Tshak:Klam:Hzor"..msg.chat_id_) or "").."" and not database:get(bot_id.."Tshak:Set:Hzora"..msg.chat_id_) then
if not database:get(bot_id.."Tshak:Set:Hzora"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"    \n    ~{  }")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."Tshak:Set:Hzora"..msg.chat_id_,true)
end 

if text == "" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."Tshak:Set:Maany"..msg.chat_id_)
Maany_Rand = {"","","","","","","","","","","","","","","","","","","","","","","","",""}
name = Maany_Rand[math.random(#Maany_Rand)]
database:set(bot_id.."Tshak:Maany"..msg.chat_id_,name)
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
send(msg.chat_id_, msg.id_,"     ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."Tshak:Maany"..msg.chat_id_) or "").."" and not database:get(bot_id.."Tshak:Set:Maany"..msg.chat_id_) then
if not database:get(bot_id.."Tshak:Set:Maany"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"    \n    ~{  }")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."Tshak:Set:Maany"..msg.chat_id_,true)
end 
if text == "" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
database:del(bot_id.."Tshak:Set:Aks"..msg.chat_id_)
katu = {"","","","","","","","","","","","","","","","","","","","","",""," ","",""}
name = katu[math.random(#katu)]
database:set(bot_id.."Tshak:Set:Aks:Game"..msg.chat_id_,name)
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name," "," ")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
send(msg.chat_id_, msg.id_,"    ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."Tshak:Set:Aks:Game"..msg.chat_id_) or "").."" and not database:get(bot_id.."Tshak:Set:Aks"..msg.chat_id_) then
if not database:get(bot_id.."Tshak:Set:Aks"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,"    \n    ~{  }")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."Tshak:Set:Aks"..msg.chat_id_,true)
end 

if database:get(bot_id.."Tshak:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
send(msg.chat_id_, msg.id_,"        { 20 }     { 1  20 }\n")
return false  end 
local GETNUM = database:get(bot_id.."Tshak:GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del(bot_id.."Tshak:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)
database:del(bot_id.."Tshak:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_,5)  
send(msg.chat_id_, msg.id_,"     \n  { 5 }   \n")
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:incrby(bot_id.."Tshak:SADD:NUM"..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(database:get(bot_id.."Tshak:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)) >= 3 then
database:del(bot_id.."Tshak:SADD:NUM"..msg.chat_id_..msg.sender_user_id_)
database:del(bot_id.."Tshak:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"     \n     \n     { "..GETNUM.." }")
else
send(msg.chat_id_, msg.id_,"   \n     ")
end
end
end
end
if text == "" or text == "" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end   
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
Num = math.random(1,20)
database:set(bot_id.."Tshak:GAMES:NUM"..msg.chat_id_,Num) 
send(msg.chat_id_, msg.id_,"\n      :\n\n".."  { 3 }       \n\n".."      {1  20}          ")
database:setex(bot_id.."Tshak:GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end

if database:get(bot_id.."Tshak:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
send(msg.chat_id_, msg.id_,"    { 6 }      \n")
return false  end 
local GETNUM = database:get(bot_id.."Tshak:Games:Bat"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del(bot_id.."Tshak:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"       { "..NUM.." }\n   { 3 }     ")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_,3)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:del(bot_id.."Tshak:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,"   \n    { "..GETNUM.." }\n     ")
end
end
end

if text == "" or text == "" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then   
Num = math.random(1,6)
database:set(bot_id.."Tshak:Games:Bat"..msg.chat_id_,Num) 
TEST = [[
*                             
                           
 ‹›  ‹›  ‹›  ‹›  ‹› 
       
   { 3 }   *
]]
send(msg.chat_id_, msg.id_,TEST)
database:setex(bot_id.."Tshak:SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end

if text == "" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
mktlf = {"","","","","","","","","","","","","","","","","","","","","","","","",};
name = mktlf[math.random(#mktlf)]
database:del(bot_id.."Tshak:Set:Moktlf:Bot"..msg.chat_id_)
database:set(bot_id.."Tshak::Set:Moktlf"..msg.chat_id_,name)
name = string.gsub(name,"","")
name = string.gsub(name,"","??")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","????")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","??")
name = string.gsub(name,"","??")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
name = string.gsub(name,"","")
send(msg.chat_id_, msg.id_,"    ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."Tshak::Set:Moktlf"..msg.chat_id_) or "").."" then 
if not database:get(bot_id.."Tshak:Set:Moktlf:Bot"..msg.chat_id_) then 
database:del(bot_id.."Tshak::Set:Moktlf"..msg.chat_id_)
send(msg.chat_id_, msg.id_,"    \n    ~{  }")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."Tshak:Set:Moktlf:Bot"..msg.chat_id_,true)
end
if text == "" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id.."Tshak:Lock:Games"..msg.chat_id_) then
mthal = {"","","","","","","","","","","","","","","","","","","","",};
name = mthal[math.random(#mthal)]
database:set(bot_id.."Tshak:Set:Amth"..msg.chat_id_,name)
database:del(bot_id.."Tshak:Set:Amth:Bot"..msg.chat_id_)
name = string.gsub(name,"","____ ")
name = string.gsub(name,"","   ___")
name = string.gsub(name,"","___ ")
name = string.gsub(name,""," ___")
name = string.gsub(name,"","  ___")
name = string.gsub(name,""," ___  ")
name = string.gsub(name,"","  ___")
name = string.gsub(name,""," ___   ")
name = string.gsub(name,"","     ___")
name = string.gsub(name,"","___   ")
name = string.gsub(name,"","     ___")
name = string.gsub(name,"","___  ")
name = string.gsub(name,"","___ ")
name = string.gsub(name,"","___     ")
name = string.gsub(name,"","___    ")
name = string.gsub(name,"","___ ")
name = string.gsub(name,"","__  ")
name = string.gsub(name,"","  __    ")
name = string.gsub(name,"","__  ")
name = string.gsub(name,"","___")
send(msg.chat_id_, msg.id_,"    ~ {"..name.."}")
return false
end
end
if text == ""..(database:get(bot_id.."Tshak:Set:Amth"..msg.chat_id_) or "").."" then 
if not database:get(bot_id.."Tshak:Set:Amth:Bot"..msg.chat_id_) then 
database:del(bot_id.."Tshak:Set:Amth"..msg.chat_id_)
send(msg.chat_id_, msg.id_,"    \n    ~{  }")
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id.."Tshak:Set:Amth:Bot"..msg.chat_id_,true)
end
if text == " " and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end   
database:del(bot_id.."Tshak:Lock:Games"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"\n  ") 
end
if text == " " and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end  
database:set(bot_id.."Tshak:Lock:Games"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"\n  ") 
end
if text == '' then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
Teext = [[
  
 — — — — — — — — — 
  -› 
  -› 
  -› 
  -› 
  -› 
  -› 
  -›  
  -› 
  -› 
 — — — — — — — — — 
 -›   
  +  -›    50 
]]
send(msg.chat_id_, msg.id_,Teext) 
end
if text == '' then
local nummsg = database:get(bot_id..'GranD:messageUser'..msg.chat_id_..':'..msg.sender_user_id_) or 1
local Text = '   *~ '..nummsg..'*'
send(msg.chat_id_, msg.id_,Text) 
end
if text == ' ' then
database:del(bot_id..'GranD:messageUser'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = '    '
send(msg.chat_id_, msg.id_,Text) 
end
if text == '' or text == '' then
local edit = database:get(bot_id..'GranD:message_edit'..msg.chat_id_..msg.sender_user_id_) or 0
local Text = '   *~ '..edit..'*'
send(msg.chat_id_, msg.id_,Text) 
end
if text == ' ' or text == ' ' then
database:del(bot_id..'GranD:message_edit'..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, '    ') 
end
if text == '' then
local addmem = database:get(bot_id.."GranD:Add:Memp"..msg.chat_id_..":"..msg.sender_user_id_) or 0
local Text = '    *~ '..addmem..'*'
send(msg.chat_id_, msg.id_,Text) 
end
if text == ' ' then
database:del(bot_id..'GranD:Add:Memp'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = '     '
send(msg.chat_id_, msg.id_,Text) 
end
if text == "" then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end 
local Num = database:get(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_) or 0
if Num == 0 then 
Text = "      "
else
Text = "     *~ { "..Num.." }  *"
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match("^  (%d+)$") then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local NUMPY = text:match("^  (%d+)$") 
if tonumber(NUMPY) == tonumber(0) then
send(msg.chat_id_,msg.id_,"\n*     1 *") 
return false 
end
if tonumber(database:get(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_)) == tonumber(0) then
send(msg.chat_id_,msg.id_,"     \n     \n    ! ") 
else
local NUM_GAMES = database:get(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_)
if tonumber(NUMPY) > tonumber(NUM_GAMES) then
send(msg.chat_id_,msg.id_,"\n     \n    \n    !") 
return false 
end
local NUMNKO = (NUMPY * 50)
database:decrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..msg.sender_user_id_,NUMPY)  
database:incrby(bot_id.."GranD:messageUser"..msg.chat_id_..":"..msg.sender_user_id_,NUMNKO)  
send(msg.chat_id_,msg.id_,"  *~ { "..NUMPY.." }*   \n * ~ { "..(NUMPY * 50).." }    *")
end 
return false 
end
if text ==("") and Addictive(msg) and tonumber(msg.reply_to_message_id_) > 0 then
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_})   
end   
if database:get(bot_id.."Tshak:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^$") then 
database:del(bot_id.."Tshak:id:user"..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "   ") 
database:del(bot_id.."Tshak:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."Tshak:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id.."Tshak:id:user"..msg.chat_id_)  
database:del(bot_id.."Tshak:Msg_User"..msg.chat_id_..":"..msg.sender_user_id_) 
database:incrby(bot_id.."GranD:messageUser"..msg.chat_id_..":"..iduserr,numadded)  
send(msg.chat_id_, msg.id_,"   {"..numadded.."}  ")  
end
if database:get(bot_id.."Tshak:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^$") then 
database:del(bot_id.."Tshak:idgem:user"..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "   ") 
database:del(bot_id.."Tshak:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."Tshak:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id.."Tshak:idgem:user"..msg.chat_id_)  
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..iduserr,numadded)  
send(msg.chat_id_, msg.id_,"   {"..numadded.."}  ")  
end
------------------------------------------------------------
if text and text:match("^  (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end    
taha = text:match("^  (%d+)$")
database:set(bot_id.."Tshak:id:user"..msg.chat_id_,taha)  
database:setex(bot_id.."Tshak:numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, "    ") 
return false
end
if text and text:match("^  (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end  
taha = text:match("^  (%d+)$")
database:set(bot_id.."Tshak:idgem:user"..msg.chat_id_,taha)  
database:setex(bot_id.."Tshak:gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, "    ") 
return false
end
if text and text:match("^  (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local Num = text:match("^  (%d+)$")
function reply(extra, result, success)
database:incrby(bot_id.."Tshak:Add:Num"..msg.chat_id_..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_,"   {"..Num.."}  ")  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if text and text:match("^  (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^  (%d+)$")
function reply(extra, result, success)
database:del(bot_id.."Tshak:Msg_User"..msg.chat_id_..":"..result.sender_user_id_) 
database:incrby(bot_id.."GranD:messageUser"..msg.chat_id_..":"..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_, "\n   {"..Num.."}  ")  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end

if text == " " and DevGranD(msg) then
local pv = database:smembers(bot_id..'GranD:UsersBot')  
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m-› THE USER IS SAVE ME \n-› '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m-› THE USER IS BLOCK ME \n-› '..pv[i]..'\n\27[1;37m')
database:srem(bot_id..'GranD:UsersBot',pv[i])  
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,'   ')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'*   ~ '..#pv..'\n   ~ '..sendok..'    \n    ~ '..ok..'  *')   
end
end
end,nil)
end,nil)
end
return false
end
if text == " " and DevGranD(msg) then
local group = database:smembers(bot_id..'GranD:Chek:Groups')  
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m-› THE BOT IS NOT ADMIN \n-› '..group[i]..'\n\27[1;37m')
database:srem(bot_id..'GranD:Chek:Groups',group[i])  
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'GranD:Chek:Groups',group[i])  
q = q + 1
print('\27[30;35m-› THE BOT IS LEFT GROUP \n-› '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'GranD:Chek:Groups',group[i])  
q = q + 1
print('\27[30;36m-› THE BOT IS KICKED GROUP \n-› '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'GranD:Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,'    ')   
else
local taha = (w + q)
local sendok = #group - taha
if q == 0 then
taha = ''
else
taha = '\n   ~ '..q..'   '
end
if w == 0 then
storm = ''
else
storm = '\n   ~'..w..'    '
end
send(msg.chat_id_, msg.id_,'*    ~ '..#group..'  '..storm..''..taha..'\n    ~ '..sendok..' *\n')   
end
end
end,nil)
end
return false
end
if text == (" ") and DevGranD(msg) then  
send(msg.chat_id_,msg.id_,' ')
os.execute('rm -rf GranD.lua')
os.execute('rm -rf start.lua')
os.execute('wget https://raw.githubusercontent.com/SourceGranD/GranD/master/GranD.lua')
os.execute('wget https://raw.githubusercontent.com/SourceGranD/GranD/master/start.lua')
dofile('GranD.lua')  
return false
end
if text == "" then
rpl = {" ","",""};
sender = rpl[math.random(#rpl)]
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendmessage?chat_id=' .. msg.sender_user_id_ .. '&text=' .. URL.escape(sender))
end
if text == " " and Owner(msg) then
send(msg.chat_id_, msg.id_, '   ')
database:set(bot_id.."GranD:zhrf_Bots"..msg.chat_id_,"close")
end
if text == " " and Owner(msg) then
send(msg.chat_id_, msg.id_,'   ')
database:set(bot_id.."GranD:zhrf_Bots"..msg.chat_id_,"open")
end
if text and text:match("^ (.*)$") and database:get(bot_id.."GranD:zhrf_Bots"..msg.chat_id_) == "open" then
local TextZhrfa = text:match("^ (.*)$")
zh = https.request('https://GranD-source.tk/GranDTeAM/frills.php?en='..URL.escape(TextZhrfa)..'')
zx = JSON.decode(zh)
t = "\n  \n — — — — — — — — — \n"
i = 0
for k,v in pairs(zx.ok) do
i = i + 1
t = t..i.."-  `"..v.."` \n"
end
send(msg.chat_id_, msg.id_, t..' — — — — — — — — —\n    ')
end
if text == " " and Owner(msg) then
send(msg.chat_id_, msg.id_, '   ')
database:set(bot_id.."GranD:brj_Bots"..msg.chat_id_,"close")
end
if text == " " and Owner(msg) then
send(msg.chat_id_, msg.id_,'   ')
database:set(bot_id.."GranD:brj_Bots"..msg.chat_id_,"open")
end
if text and text:match("^ (.*)$") and database:get(bot_id.."GranD:brj_Bots"..msg.chat_id_) == "open" then
local Textbrj = text:match("^ (.*)$")
gk = https.request('https://GranD-source.tk/GranDTeAM/Horoscopes.php?br='..URL.escape(Textbrj)..'')
br = JSON.decode(gk)
send(msg.chat_id_, msg.id_, br.ok.hso)
end
if text == "  " and Owner(msg) then
send(msg.chat_id_, msg.id_, '    ')
database:set(bot_id.."GranD:age_Bots"..msg.chat_id_,"close")
end
if text == "  " and Owner(msg) then
send(msg.chat_id_, msg.id_,'    ')
database:set(bot_id.."GranD:age_Bots"..msg.chat_id_,"open")
end
if text and text:match("^ (.*)$") and database:get(bot_id.."GranD:age_Bots"..msg.chat_id_) == "open" then
local Textage = text:match("^ (.*)$")
ge = https.request('https://GranD-source.tk/GranDTeAM/Calculateage.php?age='..URL.escape(Textage)..'')
ag = JSON.decode(ge)
send(msg.chat_id_, msg.id_, ag.ok.hso)
end
if text == " " and Owner(msg) then
send(msg.chat_id_, msg.id_, '   ')
database:set(bot_id.."GranD:insta_bot"..msg.chat_id_,"close")
end
if text == " " and Owner(msg) then
send(msg.chat_id_, msg.id_,'   ')
database:set(bot_id.."GranD:insta_bot"..msg.chat_id_,"open")
end
if text and text:match("^ (.*)$") and database:get(bot_id.."GranD:insta_bot"..msg.chat_id_) == "open" then
local Textni = text:match("^ (.*)$")
data,res = https.request('https://GranD-source.tk/GranDTeAM/infoInstagram.php?username='..URL.escape(Textni)..'')
if res == 200 then
muaed = json:decode(data)
if muaed.Info == true then
local msg_id = msg.id_/2097152/0.5
SendP(msg.chat_id_, msg_id,muaed.ph, muaed.info) 
end
end
end
if text == " " and Owner(msg) then
send(msg.chat_id_, msg.id_, '   ')
database:set(bot_id.."GranD:movie_bot"..msg.chat_id_,"close")
end
if text == " " and Owner(msg) then
send(msg.chat_id_, msg.id_,'   ')
database:set(bot_id.."GranD:movie_bot"..msg.chat_id_,"open")
end

if text and text:match("^ (.*)$") and database:get(bot_id.."GranD:movie_bot"..msg.chat_id_) == "open" then
local Textm = text:match("^ (.*)$")
data,res = https.request('https://GranD-source.tk/GranDTeAM/movie.php?serch='..URL.escape(Textm)..'')
if res == 200 then
getmo = json:decode(data)
if getmo.Info == true then
local Text =' '..getmo.info
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '   240',url=getmo.sd}},
{{text = '   480', url=getmo.Web},{text = '   1080', url=getmo.hd}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
if text == "" then
data,res = https.request('https://Black-source.tk/BlackTeAM/audios.php')
if res == 200 then
audios = json:decode(data)
if audios.Info == true then
local Text ='    '
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '- GranD TeAM .',url="t.me/aaaaw"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice='..URL.escape(audios.info)..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
if text and text:match("^ (.*)$") then
local Textxt = text:match("^ (.*)$")
send(msg.chat_id_, msg.id_, Textxt)
end
if (msg.content_.sticker_)  and msg.reply_to_message_id_ == 0 and database:get(bot_id.."GranD:Lock:Xn"..msg.chat_id_)=="del" then      
sticker_id = msg.content_.sticker_.sticker_.persistent_id_
st = https.request('https://GranD-source.tk/GranDTeAM/ImageInfo.php?token='..token..'&url='..sticker_id.."&type=sticker")
eker = JSON.decode(st)
if eker.ok.Info == "Indecent" then
local list = database:smembers(bot_id.."GranD:Basic:Constructor"..msg.chat_id_)
t = "     \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "   "
end
Reply_Status(msg,msg.sender_user_id_,"reply","   \n"..t)  
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.id_),msg.id_})   
end   
end
if (msg.content_.photo_) and msg.reply_to_message_id_ == 0 and database:get(bot_id.."GranD:Lock:Xn"..msg.chat_id_)=="del" then
photo_id = msg.content_.photo_.sizes_[1].photo_.persistent_id_  
Srrt = https.request('https://GranD-source.tk/GranDTeAM/ImageInfo.php?token='..token..'&url='..photo_id.."&type=photo")
Sto = JSON.decode(Srrt)
if Sto.ok.Info == "Indecent" then
local list = database:smembers(bot_id.."GranD:Basic:Constructor"..msg.chat_id_)
t = "     \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "   "
end
Reply_Status(msg,msg.sender_user_id_,"reply","   \n"..t)  
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.id_),msg.id_})   
end   
end
if text == '' then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.photo_ then 
local pn = result.content_.photo_.sizes_[1].photo_.persistent_id_
Addsticker(msg,msg.chat_id_,pn,msg.sender_user_id_..'.png')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == '' then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.voice_ then 
local mr = result.content_.voice_.voice_.persistent_id_ 
Addmp3(msg,msg.chat_id_,mr,msg.sender_user_id_..'.mp3')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == '' then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.audio_ then 
local mr = result.content_.audio_.audio_.persistent_id_
Addvoi(msg,msg.chat_id_,mr,msg.sender_user_id_..'.ogg')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == '' then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.sticker_ then 
local Str = result.content_.sticker_.sticker_.persistent_id_ 
Addjpg(msg,msg.chat_id_,Str,msg.sender_user_id_..'.jpg')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == '  ' and DevGranD(msg) then  
database:del(bot_id..'GranD:Free:Add:Bots') 
send(msg.chat_id_, msg.id_,'    ') 
end
if text == '  ' and DevGranD(msg) then  
database:set(bot_id..'GranD:Free:Add:Bots',true) 
send(msg.chat_id_, msg.id_,'   ') 
end
if text and text:match("^   (%d+)$") and DevGranD(msg) then
local Num = text:match("   (%d+)$") 
database:set(bot_id..'GranD:Num:Add:Bot',Num) 
send(msg.chat_id_, msg.id_,'     *~'..Num..'* ')
end
if text =='' and DevBot(msg) then
local Groups = database:scard(bot_id..'GranD:Chek:Groups')  
local Users = database:scard(bot_id..'GranD:UsersBot')  
send(msg.chat_id_, msg.id_,'  \n\n  *~ '..Groups..'\n  ~ '..Users..'*')
end
if text == '  ' and DevGranD(msg) then
local list = database:smembers(bot_id..'GranD:Chek:Groups')  
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'GranD Chat'
ASAS = database:smembers(bot_id.."GranD:Basic:Constructor"..v)
MNSH = database:smembers(bot_id.."GranD:Constructor"..v)
MDER = database:smembers(bot_id.."GranD:Manager"..v)
MOD = database:smembers(bot_id.."GranD:Mod:User"..v)
link = database:get(bot_id.."GranD:Link_Group"..v) or ''
if k == 1 then
t = t..'"'..v..'":{"GranD":"'..NAME..'",'
else
t = t..',"'..v..'":{"GranD":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./File_Libs/'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,'./File_Libs/'..bot_id..'.json', '      { '..#list..'}')
end
if text == '' or text == '' or text == '' then
local Text_Dev = database:get(bot_id..'GranD:Text_Dev')
if Text_Dev then 
send(msg.chat_id_, msg.id_,Text_Dev)
else
tdcli_function ({ID = "GetUser",user_id_ = Sudo},function(arg,data) 
send(msg.chat_id_, msg.id_," :: ["..data.first_name_.."](T.me/"..data.username_..")")  
end,nil)   
end
end
if text == '' and DevGranD(msg) then
t = '  : \n — — — — — — — — — \n'
i = 0
for v in io.popen('ls GranD_Files'):lines() do
if v:match(".lua$") then
i = i + 1
t = t..i..'*~ '..v..'*\n'
end
end
send(msg.chat_id_, msg.id_,t)
end
if text == " " or text == '' then
if DevGranD(msg) then
local Get_Files, res = https.request("https://raw.githubusercontent.com/SourceGranD/files_GranD/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n     \n    \n      \n — — — — — — — — — \n"
local TextE = "\n — — — — — — — — — \n  ()  \n".."  ()  \n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local Check_File_is_Found = io.open("GranD_Files/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "()"
else
CeckFile = "()"
end
NumFile = NumFile + 1
TextS = TextS..'*'..NumFile.."-›* {`"..name..'`} -› '..CeckFile..'\n[-  About to the file]('..Info..')\n'
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"      api \n") 
end
return false
end
end

if text and text:match("^( ) (.*)(.lua)$") and DevGranD(msg) then
local name_t = {string.match(text, "^( ) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("GranD_Files/"..file,"r")
if file_bot then
io.close(file_bot)
t = "*  -› {"..file.."}\n     \n*"
else
t = "*      -› {"..file.."} \n*"
end
local json_file, res = https.request("https://raw.githubusercontent.com/GranD/files_GranD/master/files_GranD/"..file)
if res == 200 then
os.execute("rm -fr GranD_Files/"..file)
send(msg.chat_id_, msg.id_,t) 
dofile('GranD.lua')  
else
send(msg.chat_id_, msg.id_,"*        *\n") 
end
return false
end
if text and text:match("^( ) (.*)(.lua)$") and DevGranD(msg) then
local name_t = {string.match(text, "^( ) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("GranD_Files/"..file,"r")
if file_bot then
io.close(file_bot)
t = "*      -› {"..file.."} \n*"
else
t = "*  -› {"..file.."}\n     \n*"
end
local json_file, res = https.request("https://raw.githubusercontent.com/GranD/files_GranD/master/files_GranD/"..file)
if res == 200 then
local chek = io.open("GranD_Files/"..file,'w+')
chek:write(json_file)
chek:close()
send(msg.chat_id_, msg.id_,t) 
dofile('GranD.lua')  
else
send(msg.chat_id_, msg.id_,"*        *\n") 
end
return false
end
if text == "  " and DevGranD(msg) then
os.execute("rm -fr GranD_Files/*")
send(msg.chat_id_,msg.id_,"   ")
return false
end
if text == ' ' and DevGranD(msg) then
local Users = database:smembers('GranD:'..bot_id.."userss")
local Groups = database:smembers('GranD:'..bot_id..'groups') 
for i = 1, #Groups do
database:sadd(bot_id..'GranD:Chek:Groups',Groups[i])  
end
for i = 1, #Users do
database:sadd(bot_id..'GranD:UsersBot',Users[i])  
end
send(msg.chat_id_, msg.id_,'  : '..#Groups..' \n  : '..#Users..'  \n     ')
end
if text == '  ' and DevGranD(msg) then
database:del(bot_id..'GranD:Text_Dev')
send(msg.chat_id_, msg.id_,'    ')
end
if text == '  ' and DevGranD(msg) then
database:set(bot_id..'GranD:Set:Text_Dev'..msg.chat_id_,true)
send(msg.chat_id_,msg.id_,'   ')
return false
end
if text and database:get(bot_id..'GranD:Set:Text_Dev'..msg.chat_id_) then
if text == '' then 
database:del(bot_id..'GranD:Set:Text_Dev'..msg.chat_id_)
send(msg.chat_id_,msg.id_,'    ')
return false
end
database:set(bot_id..'GranD:Text_Dev',text)
database:del(bot_id..'GranD:Set:Text_Dev'..msg.chat_id_)
send(msg.chat_id_,msg.id_,'   ')
return false
end
if text == '  ' and DevGranD(msg) then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
add_file(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == "" and DevGranD(msg) then
dofile("GranD.lua")  
send(msg.chat_id_, msg.id_, " ")
end

if text == '' or text == '' or text == '' or text == ' ' then  

Text = [[
*- GranD Team .*
 — — — — — — — — — 
     
[ GranD   .](http://t.me/aaaaw)
     
[ GranD Developer .](http://t.me/nnnnn)
]]
send(msg.chat_id_, msg.id_,Text)
end
if text == ' ' or text == ' ' then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
Text = [[   https://my.telegram.org/auth ]]
send(msg.chat_id_, msg.id_,Text)
end
if text == '' and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
Text = [[
  {5}  
 — — — — — — — — —
 1 -›   
 2 -›   
 3 -›   
 4 -›   
 5 -›   
 — — — — — — — — — 
[Ch Source](t.me/aaaaw)
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == '1' and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
Text = [[
  
 — — — — — — — — — 
/ +   
/ +    
 — — — — — — — — — 

























 — — — — — — — — — 
[Ch Source](t.me/aaaaw)
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == '2' and Addictive(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
Text = [[
 
 — — — — — — — — —  
 / 
  / 
  + 
/ 
 
 
 — — — — — — — — —





 — — — — — — — — —
 



 
 — — — — — — — — —
 
 
 
 
 — — — — — — — — —
 









 
 — — — — — — — — — 
 
 
 
 
 
 
 — — — — — — — — — 
  
 
 
 
 
 
 
 
 
 
 — — — — — — — — — 
[Ch Source](t.me/aaaaw)
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == '3' and Owner(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
Text = [[
 
— — — — — — — — — 
 
 
 
 
  
 
 

 
 
 
 
 
 + 
 — — — — — — — — — 
/ 
/ 
/ 
/ 
/ 
/  
/  
/  
/ /
/ /
/  
/  
/ / 
 — — — — — — — — — 
[Ch Source](t.me/aaaaw)
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == '4' and Constructor(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
Text = [[
   
 — — — — — — — — — 
/  
/ 

 
  
 — — — — — — — — — 
 
 — — — — — — — — — 
/ 

 
/ 
/ 
 
/  
  +  
  +  
 — — — — — — — — — 
[Ch Source](t.me/aaaaw)
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
if text == '5' and DevBot(msg) then
Text = [[
    
 — — — — — — — — — 
 
 
 
 
 

  
  
   
   
 
  
  
  
 
 
  
  
  
 /  
   
   
   
  
  +  
  +  
    + 
 — — — — — — — — — 
 
 
  
  
 
 + 
 /
 
  
  
/  
  
 — — — — — — — — — 
[Ch Source](t.me/aaaaw)
]]
send(msg.chat_id_, msg.id_,Text)
return false
end

end ---- Chat_Type = 'GroupBot' 
end ---- Chat_Type = 'GroupBot' 

if text == '' and DevBot(msg) then 
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'     !') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'GranD:Num:Add:Bot') or 0) and not DevGranD(msg) then
send(msg.chat_id_, msg.id_,'     *~ {'..(database:get(bot_id..'GranD:Num:Add:Bot') or 0)..'* ')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if database:sismember(bot_id..'GranD:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'   ')
else
Reply_Status(msg,result.id_,'reply_Add','   ~ '..chat.title_..'')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
database:sadd(bot_id.."creator"..msg.chat_id_,admins[i].user_id_)
end 
end  
end,nil)
database:sadd(bot_id..'GranD:Chek:Groups',msg.chat_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local NumMember = data.member_count_
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = ' '
end
Text = '   \n'..
'\n ~ '..Name..''..
'\n  ~ `'..IdChat..'`'..
'\n   *~ '..NumMember..'*'..
'\n  ~ ['..NameChat..']'..
'\n ~ ['..LinkGp..']'
if not DevGranD(msg) then
sendText(Id_Sudo,Text,0,'md')
end
end
end,nil) 
end,nil) 
end,nil)
end
if text == '' and DevBot(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if not database:sismember(bot_id..'GranD:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'   ')
else
Reply_Status(msg,result.id_,'reply_Add','   ~ '..chat.title_..'')
database:srem(bot_id..'GranD:Chek:Groups',msg.chat_id_)  
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = ' '
end
Text = '   \n'..
'\n ~ '..Name..''..
'\n  ~ `'..IdChat..'`'..
'\n  ~ ['..NameChat..']'..
'\n ~ ['..LinkGp..']'
if not DevGranD(msg) then
sendText(Id_Sudo,Text,0,'md')
end
end
end,nil) 
end,nil) 
end
if text == '' and not DevBot(msg) and not database:get(bot_id..'GranD:Free:Add:Bots') then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'      . \n     ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'     !') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusEditor" or da and da.status_.ID == "ChatMemberStatusCreator" then
if da and da.user_id_ == msg.sender_user_id_ then
if da.status_.ID == "ChatMemberStatusCreator" then
var = ''
elseif da.status_.ID == "ChatMemberStatusEditor" then
var = ''
else 
var= ''
end
if database:sismember(bot_id..'GranD:Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'   ')
else
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'GranD:Num:Add:Bot') or 0) and not DevGranD(msg) then
send(msg.chat_id_, msg.id_,'     *~ {'..(database:get(bot_id..'GranD:Num:Add:Bot') or 0)..'* ')
return false
end
Reply_Status(msg,result.id_,'reply_Add','   ~ '..chat.title_..'')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
database:sadd(bot_id.."creator"..msg.chat_id_,admins[i].user_id_)
end 
end  
end,nil)
database:sadd(bot_id..'GranD:Chek:Groups',msg.chat_id_)  
database:sadd(bot_id..'GranD:Basic:Constructor'..msg.chat_id_, msg.sender_user_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NumMember = data.member_count_
local NameChat = chat.title_
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub('"',"") 
NameChat = NameChat:gsub("`","") 
NameChat = NameChat:gsub("*","") 
NameChat = NameChat:gsub("{","") 
NameChat = NameChat:gsub("}","") 
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = ' '
end
Text = '   \n'..
'\n ~ '..Name..''..
'\n   ~ '..AddPy..'' ..
'\n  ~ `'..IdChat..'`'..
'\n   *~ '..NumMember..'*'..
'\n  ~ ['..NameChat..']'..
'\n ~ ['..LinkGp..']'
if not DevGranD(msg) then
sendText(Id_Sudo,Text,0,'md')
end
end
end
end
end,nil)   
end,nil) 
end,nil) 
end,nil)
end

if Chat_Type == 'UserBot' then
if text == '/start' then  
if DevGranD(msg) then
local Text = '     '
local keyboard = {
{'   ','   '},
{'  ','  '},
{'  ','  '},
{'   ','   '},
	     {'   '},      
{'   ','   '},
{'  ','  '},
{'  ','   '},
{' '},                     
{' ','  '},
{' ','  '},
{'  ','   '},
{'-     .','-     .'},
{'  ','  '},
{'  ','   '},
{'-     .','    .'},
{'-     .','-    .'},
{'-    .'},
{'  ',' '},
{'  ','  '},
{' '}
}
send_inline_key(msg.chat_id_,Text,keyboard)
else
if not database:get(bot_id..'GranD:Start:Time'..msg.sender_user_id_) then
local start = database:get(bot_id.."Start:Bot")  
if start then 
Test = start
else
tdcli_function ({ID = "GetUser",user_id_ = Sudo},function(arg,data) 
Test = '    \n      ...\n           \n  @['..data.username_..']'
end,nil)
end 
send(msg.chat_id_, msg.id_, Test) 
end
end
database:setex(bot_id..'GranD:Start:Time'..msg.sender_user_id_,60,true)
return false
end
if text and text:match("^/start ph(.*)$") then
Sf = database:get(bot_id.."GranD:Filter:msg")
local list = database:smembers(bot_id.."GranD:List:Filter:Photo"..Sf)  
for k,v in pairs(list) do
if v then
inline = {
{{text = '-   .',callback_data="pito"..v}},
}
send_inline_Media(msg.chat_id_,"sendPhoto","photo",v,inline) 
end
end
if #list == 0 then
send(msg.chat_id_, msg.id_,"   "  )  
end
Zs = {
{{text = '-   .',callback_data="delallph"..Sf}},
}
send_inlin_key(msg.chat_id_,"     ",Zs,msg.id_)
end  
if text and text:match("^/start msg(.*)$") then
sl = text:match("^/start msg(.*)$")
local list = database:smembers(bot_id.."GranD:List:Filter:text"..sl)
t = "\n   \n — — — — — — — — — \n"
for k,v in pairs(list) do
if v then
t = t..""..k.."- ["..v.."]\n"
end
end
if #list == 0 then
t = "   "  
end
send(msg.chat_id_, msg.id_,t)  
end  
if text and text:match("^/start gif(.*)$") then
Sf = text:match("^/start gif(.*)$")
local list = database:smembers(bot_id.."GranD:List:Filter:Animation"..Sf)
for k,v in pairs(list) do
if v then
inline = {
{{text = '-   .',callback_data="animation"..v.."chatid"..Sf}},
}
send_inline_Media(msg.chat_id_,"sendanimation","animation",v,inline) 
end
end
if #list == 0 then
t = "   "  
send(msg.chat_id_, msg.id_,t)  
end
ZsText = "     "
Zs = {
{{text = '-   .',callback_data="delallanimation"..Sf}},
}
send_inlin_key(msg.chat_id_,ZsText,Zs,msg.id_)
end  
if text and text:match("^/start Sti(.*)$") then
Sf = text:match("^/start Sti(.*)$")
local list = database:smembers(bot_id.."GranD:List:Filter:Sticker"..Sf)
for k,v in pairs(list) do
if v then
inline = {
{{text = '-   .',callback_data="Sticker"..v.."chatid"..Sf}},
}
send_inline_Media(msg.chat_id_,"sendSticker","sticker",v,inline) 
end
end
if #list == 0 then
t = "   "  
send(msg.chat_id_, msg.id_,t)  
end
ZsText = "      "
Zs = {
{{text = '-   .',callback_data="delallSticker"..Sf}},
}
send_inlin_key(msg.chat_id_,ZsText,Zs,msg.id_)
end
if not DevGranD(msg) and not database:sismember(bot_id..'BaN:In:User',msg.sender_user_id_) and not database:get(bot_id..'Texting:In:Bv') and not database:get(bot_id.."GranD:Filter"..msg.sender_user_id_) then
send(msg.sender_user_id_,msg.id_,'    ')    
tdcli_function({ID ="GetChat",chat_id_=Id_Sudo},function(arg,chat)  
tdcli_function({ID ="GetChat",chat_id_=msg.sender_user_id_},function(arg,chat)  
tdcli_function({ID="ForwardMessages",chat_id_=Id_Sudo,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,ta) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
sendText(Id_Sudo,'    ~ ['..string.sub(ta.first_name_,0, 40)..'](tg://user?id='..ta.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end,nil);end
if DevGranD(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == '' then
sendText(Id_Sudo,'  -› ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n     ',msg.id_/2097152/0.5,'md')
database:sadd(bot_id..'BaN:In:User',data.id_)  
return false  
end 
if text ==' ' then
sendText(Id_Sudo,' -› ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n      ',msg.id_/2097152/0.5,'md')
database:srem(bot_id..'BaN:In:User',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,ta) 
if ta.code_ == 400 or ta.code_ == 5 then
send(msg.chat_id_, msg.id_,'\n        ') 
return false  
end 
if text then    
send(id_user,msg.id_,text)    
Text = '    .. '
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '    .. '
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_,msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '    .. '
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, msg.content_.animation_.animation_.persistent_id_)    
Text = '    .. '
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, msg.content_.voice_.voice_.persistent_id_)    
Text = '    .. '
end     
sendText(Id_Sudo,Text..'\n'..' ~ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);end,nil);end,nil);end,nil);end 
if DevGranD(msg) then
if text == '  ' then  
database:del(bot_id..'Texting:In:Bv') 
send(msg.chat_id_, msg.id_,'    ') 
end
if text == '  ' then  
database:set(bot_id..'Texting:In:Bv',true) 
send(msg.chat_id_, msg.id_,'    ') 
end
if text ==' ' then
local Groups = database:scard(bot_id..'GranD:Chek:Groups')  
local Users = database:scard(bot_id..'GranD:UsersBot')  
send(msg.chat_id_, msg.id_,'  \n\n  *~ '..Groups..'\n  ~ '..Users..'*')
end
if text == "  " then
local pv = database:smembers(bot_id..'GranD:UsersBot')  
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m-› THE USER IS SAVE ME \n-› '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m-› THE USER IS BLOCK ME \n-› '..pv[i]..'\n\27[1;37m')
database:srem(bot_id..'GranD:UsersBot',pv[i])  
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,'   ')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'*   ~ '..#pv..'\n   ~ '..sendok..'    \n    ~ '..ok..'  *')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "  " then
local group = database:smembers(bot_id..'GranD:Chek:Groups')  
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m-› THE BOT IS NOT ADMIN \n-› '..group[i]..'\n\27[1;37m')
database:srem(bot_id..'GranD:Chek:Groups',group[i])  
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'GranD:Chek:Groups',group[i])  
q = q + 1
print('\27[30;35m-› THE BOT IS LEFT GROUP \n-› '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'GranD:Chek:Groups',group[i])  
q = q + 1
print('\27[30;36m-› THE BOT IS KICKED GROUP \n-› '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'GranD:Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,'    ')   
else
local taha = (w + q)
local sendok = #group - taha
if q == 0 then
taha = ''
else
taha = '\n   ~ '..q..'   '
end
if w == 0 then
storm = ''
else
storm = '\n   ~'..w..'    '
end
send(msg.chat_id_, msg.id_,'*    ~ '..#group..'  '..storm..''..taha..'\n    ~ '..sendok..' *\n')   
end
end
end,nil)
end
return false
end
if database:get(bot_id.."GranDBTSS:Set:Name:Bot"..msg.sender_user_id_) then 
if text == "" or text == " " then   
send(msg.chat_id_, msg.id_,"     ") 
database:del(bot_id.."GranDBTSS:Set:Name:Bot"..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."GranDBTSS:Set:Name:Bot"..msg.sender_user_id_) 
database:set(bot_id.."GranD:Name:Bot",text) 
send(msg.chat_id_, msg.id_, "    ")  
return false
end 
if text == "   " or text == "   " and VIP_DeV(msg) then 
database:setex(bot_id.."GranDBTSS:Set:Name:Bot"..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_,"     ")  
end
if text =='   ' and VIP_DeV(msg) then
send(msg.chat_id_, msg.id_,'    ')
database:set(bot_id..'LACKBOTSS:Ed:DevBots',true) 
end
if text =='   ' and not VIP_DeV(msg) then
send(msg.chat_id_, msg.id_,'     .')
end
if VIP_DeV(msg) then
if text == "-    ."  then  
if database:get(bot_id..'add:ch:username') then
local addchusername = database:get(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_, "    \n  -› ["..addchusername.."]")
else
send(msg.chat_id_, msg.id_, "      ")
end
return false  
end
if text == "-     ."  then  
if database:get(bot_id..'add:ch:id') then
local addchusername = database:get(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_,"   \n  -› ["..addchusername.."]")
else
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_,"   \n   ")
end
return false  
end
if text == "-     ."  then  
database:del(bot_id..'add:ch:id')
database:del(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_, "    ")
return false  
end
if text == '-    .' then
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, '    ')
return false  
end
if text == '-     .' then
database:setex(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, '     ')
return false  
end
if text == "    ." then
database:del(bot_id..'text:ch:user')
send(msg.chat_id_, msg.id_, "    ")
return false  
end
if text == '-     .' then
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, '    ')
return false  
end
end
if not VIP_DeV(msg) then
if text == "-    ."  or text == "-     ."  or text == "-     ."  or text == '-     .' or text == '-    .' or text == "    ." or text == '-     .' then
send(msg.chat_id_, msg.id_,'     .')
end
end
if database:get(bot_id.."LACKBOTSS:Ed:DevBots") then
if text and text:match("^(%d+)$") then
local IdDe = text:match("^(%d+)$")
send(msg.chat_id_,msg.id_, "    (    ) ")
local A = io.open("sudo.lua", 'w')
A:write([[
s = "BGBBB"

q = "aaaaw"

token = "]]..token..[["

Sudo = ]]..IdDe..[[  
]])
A:close()
database:del(bot_id.."LACKBOTSS:Ed:DevBots")
end
end
if text == '   ' then
database:del(bot_id..'GranD:Free:Add:Bots') 
send(msg.chat_id_, msg.id_,'\n    ') 
end
if text == '   ' then
database:set(bot_id..'GranD:Free:Add:Bots',true) 
send(msg.chat_id_, msg.id_,'\n   ') 
end
if text=="  " and msg.reply_to_message_id_ == 0 then
if database:get(bot_id.."GranD:Status:Bc") and not DevGranD(msg) then 
send(msg.chat_id_, msg.id_,"     ")
return false
end
database:setex(bot_id.."GranD:GranD:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"   ~ { , , ,  }\n   ") 
return false
end 

if text==" " and msg.reply_to_message_id_ == 0 then
if database:get(bot_id.."GranD:Status:Bc") and not DevGranD(msg) then 
send(msg.chat_id_, msg.id_,"     ")
return false
end
database:setex(bot_id.."GranD:GranD:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"   ~ { , , ,  }\n   ") 
return false
end  
if text=="  " and msg.reply_to_message_id_ == 0  then
if database:get(bot_id.."GranD:Status:Bc") and not DevGranD(msg) then 
send(msg.chat_id_, msg.id_,"     ")
return false
end
database:setex(bot_id.."GranD:GranD:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"   ") 
return false
end 
if text=="   " and msg.reply_to_message_id_ == 0  then
if database:get(bot_id.."GranD:Status:Bc") and not DevGranD(msg) then 
send(msg.chat_id_, msg.id_,"     ")
return false
end
database:setex(bot_id.."GranD:GranD:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"   ") 
return false
end 
if text == "  " then
database:del(bot_id.."GranD:Status:Bc") 
send(msg.chat_id_, msg.id_,"\n   " ) 
return false
end 
if text == "  " then
database:set(bot_id.."GranD:Status:Bc",true) 
send(msg.chat_id_, msg.id_,"\n  ") 
return false
end 
if text == "  " then
database:del(bot_id.."GranD:Left:Bot"..msg.chat_id_)  
send(msg.chat_id_, msg.id_,"   ") 
return false 
end
if text == "  " then
database:set(bot_id.."GranD:Left:Bot"..msg.chat_id_,true)   
send(msg.chat_id_, msg.id_, "   ") 
return false 
end
if text and database:get(bot_id..'Start:Bots') then
if text == ' ' then   
send(msg.chat_id_, msg.id_,"    ") 
database:del(bot_id..'Start:Bots') 
return false
end
database:set(bot_id.."Start:Bot",text)  
send(msg.chat_id_, msg.id_,'   ') 
database:del(bot_id..'Start:Bots') 
return false
end
if text == '   ' then
database:set(bot_id..'Start:Bots',true) 
send(msg.chat_id_, msg.id_,'   ') 
return false
end
if text == '   ' then
database:del(bot_id..'Start:Bot') 
send(msg.chat_id_, msg.id_,'   ') 
end
if text == (" ") then
local list = database:smembers(bot_id.."DEV:Sudo:T")
t = "\n    \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "   "
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("  ") and VIP_DeV(msg) then
database:del(bot_id.."DEV:Sudo:T")
send(msg.chat_id_, msg.id_, "     ")
end
if text == ("  ") and not VIP_DeV(msg) then
send(msg.chat_id_, msg.id_,'     .')
end
if text == '   ' then
database:set(bot_id..'docu:Bots',true) 
send(msg.chat_id_, msg.id_, "      ")
end
if msg.content_.ID == "MessageDocument" and database:get(bot_id..'docu:Bots') then    
local ID_FILE = msg.content_.document_.document_.persistent_id_ 
local File_Name = msg.content_.document_.file_name_
add_file(msg,msg.chat_id_,ID_FILE,File_Name)
database:del(bot_id..'docu:Bots') 
end
if database:get(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^$") then 
send(msg.chat_id_, msg.id_, "   ")
database:del(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
database:del(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local username = string.match(text, "@[%a%d_]+") 
tdcli_function ({    
ID = "SearchPublicChat",    
username_ = username  
},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '    ')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '        ')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_,'       ')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'    \n     \n  ('..data.id_..')\n  ([@'..data.type_.channel_.username_..'])')
database:set(bot_id..'add:ch:id',data.id_)
database:set(bot_id..'add:ch:username','@'..data.type_.channel_.username_)
else
send(msg.chat_id_, msg.id_,'     ')
end
return false  
end
end,nil)
end
if database:get(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^$") then 
send(msg.chat_id_, msg.id_, "   ")
database:del(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
database:del(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
database:set(bot_id..'text:ch:user',texxt)
send(msg.chat_id_, msg.id_,'    ')
end
if text == ("   ") and DevGranD(msg) then
database:del(bot_id.."GranD:GBan:User")
send(msg.chat_id_, msg.id_, "\n   ")
return false
end
if text == ("  ") and DevGranD(msg) then
database:del(bot_id.."GranD:Sudo:User")
send(msg.chat_id_, msg.id_, "\n      ")
end
if text == ("  ") and DevGranD(msg) then
local list = database:smembers(bot_id.."GranD:GBan:User")
t = "\n   \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "   "
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == (" ") and DevGranD(msg) then
local list = database:smembers(bot_id.."GranD:Sudo:User")
t = "\n   \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "  "
end
send(msg.chat_id_, msg.id_, t)
end

if text == '  ' then
local list = database:smembers(bot_id..'GranD:Chek:Groups')  
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'GranD Chat'
ASAS = database:smembers(bot_id.."GranD:Basic:Constructor"..v)
MNSH = database:smembers(bot_id.."GranD:Constructor"..v)
MDER = database:smembers(bot_id.."GranD:Manager"..v)
MOD = database:smembers(bot_id.."GranD:Mod:User"..v)
link = database:get(bot_id.."GranD:Link_Group"..v) or ''
if k == 1 then
t = t..'"'..v..'":{"GranD":"'..NAME..'",'
else
t = t..',"'..v..'":{"GranD":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./File_Libs/'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,'./File_Libs/'..bot_id..'.json', '      { '..#list..'}')
end
if text == "  " then
send(msg.chat_id_,msg.id_,' ')
os.execute('rm -rf GranD.lua')
os.execute('rm -rf start.lua')
os.execute('wget https://raw.githubusercontent.com/SourceGranD/GranD/master/GranD.lua')
os.execute('wget https://raw.githubusercontent.com/SourceGranD/GranD/master/start.lua')
dofile('GranD.lua')  
return false
end
if text == "  " then
dofile("GranD.lua")  
send(msg.chat_id_, msg.id_, " ")
end
end
end --- Chat_Type = 'UserBot' 
end
end
function tdcli_update_callback(data)
if data.ID == "UpdateChannel" then 
if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
database:srem(bot_id..'GranD:Chek:Groups','-100'..data.channel_.id_)  
end
end
if data.ID == "UpdateNewCallbackQuery" then
local Chat_id = data.chat_id_
local From_id = data.id_
local Msg_id = data.message_id_
local msg_idd = Msg_id/2097152/0.5
local DAata = data.payload_.data_
if DAata and DAata:match("^animation(.*)$") and Addictive(data) then  
idch = DAata:match("-100(%d+)")
local idchci = "-100"..idch
local animation = DAata:match("^animation(.*)$"):gsub('chatid',''):gsub('chatid',''):gsub(idch,''):gsub('-100','')
local Text ="   "
inline = {
{{text = ' GranD   .',url='http://t.me/aaaaw'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
database:srem(bot_id.."GranD:List:Filter:Animation"..idchci,animation)  
end
if DAata and DAata:match("^pito(.*)$") and Addictive(data) then  
local idchci = database:get(bot_id.."GranD:Filter:msg")
local photo = DAata:match("^pito(.*)$")
local Text ="   "
inline = {
{{text = ' GranD   .',url='http://t.me/aaaaw'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
database:srem(bot_id.."GranD:List:Filter:Photo"..idchci,photo)  
end
if DAata and DAata:match("^Sticker(.*)$") and Addictive(data) then  
idch = DAata:match("-100(%d+)")
local idchci = "-100"..idch
local Sticker = DAata:match("^Sticker(.*)$"):gsub('chatid',''):gsub('chatid',''):gsub(idch,''):gsub('-100','')
local Text ="   "
inline = {
{{text = ' GranD   .',url='http://t.me/aaaaw'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
database:srem(bot_id.."GranD:List:Filter:Sticker"..idchci,Sticker)  
end
if DAata and DAata:match("^delallSticker(.*)$") and Addictive(data) then  
local delallSticker = DAata:match("^delallSticker(.*)$")
local Text ="    "
inline = {
{{text = ' GranD ??  .',url='http://t.me/aaaaw'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
local listSticker = database:smembers(bot_id.."GranD:List:Filter:Sticker"..delallSticker)  
for k,v in pairs(listSticker) do  
database:srem(bot_id.."GranD:List:Filter:Sticker"..delallSticker,v)  
end  
end
if DAata and DAata:match("^delallanimation(.*)$") and Addictive(data) then  
local delallmation = DAata:match("^delallanimation(.*)$")
local Text ="    "
inline = {
{{text = ' GranD   .',url='http://t.me/aaaaw'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
local listAnimation = database:smembers(bot_id.."GranD:List:Filter:Animation"..delallmation)  
for k,v in pairs(listAnimation) do  
database:srem(bot_id.."GranD:List:Filter:Animation"..delallmation,v)  
end  
end
if DAata and DAata:match("^delallph(.*)$") and Addictive(data) then  
local delallph = DAata:match("^delallph(.*)$")
local Text ="    "
inline = {
{{text = ' GranD   .',url='http://t.me/aaaaw'}},
}
https.request("https://api.telegram.org/bot"..token.."/deleteMessage?chat_id="..Chat_id.."&message_id="..msg_idd)
send_inlin_key(Chat_id,Text,inline)
local listPhoto = database:smembers(bot_id.."GranD:List:Filter:Photo"..delallph)  
for k,v in pairs(listPhoto) do  
database:srem(bot_id.."GranD:List:Filter:Photo"..delallph,v)  
end  
end
end
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
local text = msg.content_.text_
if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
print("OLD MESSAGE")
return false
end
if msg.sender_user_id_ and Muted_Groups(msg.chat_id_,msg.sender_user_id_) then 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
return false  
end
--------------------------------------------------------------------------------------------------------------
if tonumber(msg.sender_user_id_) ~= tonumber(bot_id) then  
if msg.sender_user_id_ and Ban_Groups(msg.chat_id_,msg.sender_user_id_) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false  
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban_Groups(msg.chat_id_,msg.content_.members_[0].id_) then 
Kick_Group(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and Ban_All_Groups(msg.sender_user_id_) then 
Kick_Group(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false 
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban_All_Groups(msg.content_.members_[0].id_) then 
Kick_Group(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
end 
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == "MessagePinMessage" or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatChangeTitle" or msg.content_.ID == "MessageChatDeleteMember" then   
if database:get(bot_id.."GranD:Lock:tagservr"..msg.chat_id_) then  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false
end    
end   
if text and not database:sismember(bot_id..'GranD:Spam:Group'..msg.sender_user_id_,text) then
database:del(bot_id..'GranD:Spam:Group'..msg.sender_user_id_) 
end
------------------------------------------------------------------------
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
database:set(bot_id..'GranD:User:Name'..msg.sender_user_id_,data.username_)
end;end,nil)   
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
database:set(bot_id.."GranD:Who:Added:Me"..msg.chat_id_..":"..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = database:get(bot_id.."GranD:Lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Addictive(msg) and Bots == "kick" then   
https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
Get_Info = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(Get_Info)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_Addictive(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
local Bots = database:get(bot_id.."GranD:Lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Addictive(msg) and Bots == "del" then   
Get_Info = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(Get_Info)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_Addictive(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
------------------------------------------------------------------------
if text and database:get(bot_id.."GranD:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = database:get(bot_id.."GranD:Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
database:del(bot_id.."GranD:Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
database:del(bot_id.."GranD:Set:Cmd:Group:New"..msg.chat_id_)
database:srem(bot_id.."GranD:List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,"    ")  
else
send(msg.chat_id_, msg.id_,"         ")  
end
database:del(bot_id.."GranD:Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
------------------------------------------------------------------------
if data.message_.content_.text_ then
local NewCmmd = database:get(bot_id.."GranD:Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
local Name_Bot = (database:get(bot_id.."GranD:Name:Bot") or "")
if not database:get(bot_id.."GranD:Fun_Bots"..msg.chat_id_) then
if text ==  ""..Name_Bot..'   ' and tonumber(msg.reply_to_message_id_) > 0 then     
function FunBot(extra, result, success) 
local Fun = {'      ','      ','   ', '   ','   ','    ','  ','     ','    ','    ', '   ','           ','   ' } 
send(msg.chat_id_, result.id_,''..Fun[math.random(#Fun)]..'')   
end   
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunBot, nil)
return false
end  
if text == ""..Name_Bot..'   ' and tonumber(msg.reply_to_message_id_) > 0 then    
function FunBot(extra, result, success) 
local Fun = {'    ','  ','   ','     ','            ','       ','    ','            7 ','    ','   ','        ','     6  ',' ','      ','               ','         ' } 
send(msg.chat_id_,result.id_,''..Fun[math.random(#Fun)]..'') 
end  
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunBot, nil)
return false
end    
end
if text and text:match('^'..Name_Bot..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..Name_Bot..' ','')
end
------------------------------------------------------------------------
GranD_Started_Bot(msg,data)
GranD_Files(msg)
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
database:incr(bot_id..'GranD:message_edit'..result.chat_id_..result.sender_user_id_)
local Text = result.content_.text_
if database:get(bot_id.."GranD:Lock:edit"..msg.chat_id_) and not Text and not BasicConstructor(result) then
local list = database:smembers(bot_id.."GranD:Basic:Constructor"..msg.chat_id_)
t = "     \n — — — — — — — — — \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."GranD:User:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "   "
end
Reply_Status(result,result.sender_user_id_,"reply","   "..t)  
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
end
local text = result.content_.text_
if not Addictive(result) then
------------------------------------------------------------------------
if text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("[hH][tT][tT][pP][sT]") or text and text:match("[tT][eE][lL][eE][gG][rR][aA].[Pp][Hh]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa].[Pp][Hh]") then
if database:get(bot_id.."GranD:Lock:Link"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(@)(.*)") then
if database:get(bot_id.."GranD:Lock:User:Name"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("@") then
if database:get(bot_id.."GranD:Lock:User:Name"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(#)(.*)") then
if database:get(bot_id.."GranD:Lock:hashtak"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("#") then
if database:get(bot_id.."GranD:Lock:hashtak"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("/") then
if database:get(bot_id.."GranD:Lock:Cmd"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end 
if text and text:match("(.*)(/)(.*)") then
if database:get(bot_id.."GranD:Lock:Cmd"..msg.chat_id_) then
DeleteMessage(result.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text then
local GranD_Msg = database:sismember(bot_id.."GranD:List:Filter:text"..result.chat_id_,text) 
if GranD_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","   ")  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
if msg.content_.ID == 'MessageAnimation' then    
local Animation_Msg = database:sismember(bot_id.."GranD:List:Filter:Animation"..result.chat_id_,result.content_.animation_.animation_.persistent_id_) 
if Animation_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","   ")  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
if msg.content_.ID == 'MessagePhoto' then    
local Photo_Msg = database:sismember(bot_id.."GranD:List:Filter:Photo"..result.chat_id_,result.content_.photo_.sizes_[1].photo_.persistent_id_) 
if Photo_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","   ")  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
if msg.content_.ID == 'MessageSticker' then    
local Sticker_Msg = database:sismember(bot_id.."GranD:List:Filter:Sticker"..result.chat_id_,result.content_.sticker_.sticker_.persistent_id_) 
if Sticker_Msg then    
Reply_Status(result,result.sender_user_id_,"reply","   ")  
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
end
end,nil)
------------------------------------------------------------------------
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local Get_Msg_Pin = database:get(bot_id..'GranD:Msg:Pin:Chat'..msg.chat_id_)
if Get_Msg_Pin ~= nil then
if text == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) if d.ID == 'Ok' then;database:del(bot_id..'GranD:Msg:Pin:Chat'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if Get_Msg_Pin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'GranD:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'GranD:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'GranD:Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
end
end
if (data.ID == "UpdateOption" and data.value_.value_ == "Ready") then
print("\27[34m"..[[
>> The Bot is Running
>> Bot source > GranD
>>Source channel > @aaaaw
>>Source developer > @nnnnn


]].."\27[m")
local list = database:smembers(bot_id..'GranD:UsersBot')  
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local list = database:smembers(bot_id..'GranD:Chek:Groups') 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
database:srem(bot_id..'GranD:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'GranD:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'GranD:Chek:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'GranD:Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id..'GranD:Chek:Groups',v)  
end end,nil)
end;CleangGroups();end;end
