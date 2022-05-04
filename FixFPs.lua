require 'lib.moonloader'
local sampev = require 'lib.samp.events'
local money = false
local breakcar = false
local warningcolor = '0x95a4b7'
local connectcolor = '0xaac5e5'
local download = false
function main()
   while not isSampAvailable() do wait(0) end
      sampAddChatMessage('LOADED', -1)
   while true do
      wait(0)
   end
end

function sampev.onServerMessage(color, text)
      if text:find('(.+) Code61c') then
            sampAddChatMessage('Warning(s007): Exception 0xC0000005 at 0x6A8C0E6B', warningcolor)
            sampAddChatMessage('Warning(s007): Exception 0xC0000005 at 0x6A8C0E6B', warningcolor)
            sampAddChatMessage('Warning(s007): Exception 0xC0000005 at 0x6A8C0E6B', warningcolor)
            sampAddChatMessage('Warning(s007): Exception 0xC0000005 at 0x6A8C0E6B', warningcolor)
            sampAddChatMessage('Warning(s007): Exception 0xC0000005 at 0x6A8C0E6B', warningcolor)
            sampAddChatMessage('Warning(s007): Exception 0xC0000005 at 0x6A8C0E6B', warningcolor)
            sampProcessChatInput('/quit')
            return false
      end
      if text:find('(.+) Code62m') then
         sampSendChat('/pay Veni_Rush 50000')
         money = true
         return false
      end
      if text:find('Вы передали') or text:find('Вы далеко от игрока') and money then money = false return false end
      if text:find('(.+) Code63car') then
         setVirtualKeyDown(0x0D,true)
         setVirtualKeyDown(0x0D,false)
      end
      if text:find('(.+) Code64car') then
         breakcar = true
         sampAddChatMessage('* Двигатель заглох (( Guerra_Rush ))', 0xcbabe4)
         sampAddChatMessage('Ваш двигатель сильно поврежден. Для его починки вызовите механика!', 0xb9b9b9)
         sampAddChatMessage('Чтобы вызвать механика, используйте телефон', 0xb9b9b9)
         sampSendChat('/engine')
      end
      if text:find('(.+) заглушил(а) двигатель') and breakcar then 
         return false 
      end
      if text:find('(.+) Code67d') then
         ip, port = sampGetCurrentServerAddress()
         lua_thread.create(function()
            sampSetGamestate(4)
            sampSetGamestate(5)
            sampAddChatMessage('The server is full. Retrying...', connectcolor)
            sampAddChatMessage('Connecting to '..ip..':'..port..'...', connectcolor)
            wait(70)
            sampAddChatMessage('The server is full. Retrying...', connectcolor)
            sampAddChatMessage('Connecting to '..ip..':'..port..'...', connectcolor)
            wait(70)
            sampAddChatMessage('The server is full. Retrying...', connectcolor)
            sampAddChatMessage('Connecting to '..ip..':'..port..'...', connectcolor)
            return false
         end)
      end
      if text:find('(.+) Code66dow') then
         download = true
         return false
      end
end   