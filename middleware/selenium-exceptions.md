1. Exceptions（异常）:异常可能发生在所有的WebDriver中的代码。

**异常：** selenium.common.exceptions.ElementNotSelectableException(msg=None, screen=None, stacktrace=None)
**依据：** selenium.common.exceptions.InvalidElementStateException 当尝试选择一个未能选中的元素时，异常会抛出

异常：      selenium.common.exceptions.ElementNotVisibleException(msg=None, screen=None, stacktrace=None)
依据:        selenium.common.exceptions.InvalidElementStateException 虽然当一个元素呈现在DOM，但它是不可见的，因此不能够以进行交互，异常将抛出

异常： 　    selenium.common.exceptions.ErrorInResponseException(response, msg)
依据:　　    selenium.common.exceptions.WebDriverException 服务器端有错误时，异常将抛出（这个原因可能是因为Firefox插件或者远程server）
      
异常： 　　selenium.common.exceptions.ImeActivationFailedException(msg=None, screen=None, stacktrace=None)
依据:　　   selenium.common.exceptions.WebDriverException 激活输入法失败时异常会抛出。
                
异常：　　 selenium.common.exceptions.ImeNotAvailableException(msg=None, screen=None, stacktrace=None)
依据:         selenium.common.exceptions.WebDriverException 当输入法不支持的时候异常将抛出。
                 
异常：　　 selenium.common.exceptions.InvalidCookieDomainException(msg=None, screen=None, stacktrace=None)
依据:　　   selenium.common.exceptions.WebDriverException 试图在不同的domain而不是目前的URL中添加一个cookie时抛出异常
                
异常：　　 selenium.common.exceptions.InvalidElementStateException(msg=None, screen=None, stacktrace=None)
依据: 　　  selenium.common.exceptions.WebDriverException无效的元素状态
                
异常：　　 selenium.common.exceptions.InvalidSelectorException(msg=None, screen=None, stacktrace=None)
依据:         selenium.common.exceptions.NoSuchElementException当选择器没有返回一个web元素时，异常抛出。
                
异常：　　 selenium.common.exceptions.InvalidSwitchToTargetException(msg=None, screen=None, stacktrace=None)
依据: 　　  selenium.common.exceptions.WebDriverException当切换的窗口或者框架不存在的时候，异常将抛出。
                
异常：　　 selenium.common.exceptions.MoveTargetOutOfBoundsException(msg=None, screen=None, stacktrace=None)
依据:　　   selenium.common.exceptions.WebDriverException提供给ActionChainsmovable()方法的目标无效时，异常将抛出，例如：超出文件外
                
异常：　　 selenium.common.exceptions.NoAlertPresentException(msg=None, screen=None, stacktrace=None)
依据:　　   selenium.common.exceptions.WebDriverException切换到没有呈现的警示时抛出异常
      
异常：　　 selenium.common.exceptions.NoSuchAttributeException(msg=None, screen=None, stacktrace=None)
依据： 　　selenium.common.exceptions.WebDriverException当元素的属性不能被发现时异常抛出
      
异常：　　 selenium.common.exceptions.NoSuchElementException(msg=None, screen=None, stacktrace=None)
依据: 　　   selenium.common.exceptions.WebDriverException元素不能被找到时异常抛出
                 
异常：　　 selenium.common.exceptions.NoSuchFrameException(msg=None, screen=None, stacktrace=None)
依据: 　　  selenium.common.exceptions.InvalidSwitchToTargetException需要切换的目标框架不存在时，异常抛出
                
异常： 　　selenium.common.exceptions.NoSuchWindowException(msg=None, screen=None, stacktrace=None)
依据:　　   selenium.common.exceptions.InvalidSwitchToTargetException需要切换的目标窗口不存在时，异常抛出
                
异常： 　　selenium.common.exceptions.RemoteDriverServerException(msg=None, screen=None, stacktrace=None)
依据:　　  selenium.common.exceptions.WebDriverException

异常：　　 selenium.common.exceptions.StaleElementReferenceException(msg=None, screen=None, stacktrace=None)
依据: 　　  selenium.common.exceptions.WebDriverException 一个参考的元素现在是“过时”时抛出异常。 
                “过时”是指这个元素不再出现在页面的Dom中。
                
异常：　　 selenium.common.exceptions.TimeoutException(msg=None, screen=None, stacktrace=None)
依据:　　   selenium.common.exceptions.WebDriverException 一条命令在足够的时间内没有完成则会抛出异常
                
异常： 　　selenium.common.exceptions.UnableToSetCookieException(msg=None, screen=None, stacktrace=None)
依据: 　　  selenium.common.exceptions.WebDriverException

　　　　　　当一个驱动程序无法设置cookie时抛出异常。
      
异常：　　selenium.common.exceptions.UnexpectedAlertPresentException(msg=None, screen=None, stacktrace=None)
依据：　　selenium.common.exceptions.WebDriverException
               当一个意外的警告出现时将抛出异常。
异常：　　selenium.common.exceptions.UnexpectedTagNameException(msg=None, screen=None, stacktrace=None)
依据：　　selenium.common.exceptions.WebDriverException
              辅助类没有获取到期待的web元素时，会抛出异常
              
异常：        selenium.common.exceptions.WebDriverException(msg=None, screen=None, stacktrace=None)
依据：        exceptions.Exception
                WebDriver基础的异常类


Action Chains
ActionChains 实现
class     selenium.webdriver.common.action_chains.ActionChains(driver)
依据：　object
生成用户操作
　　所有操作都存储在ActionChains对象。调用执行来引起存储操作。 
click(on_element=None)
     clicks an element
　　Args: on_element:单击该元素。如果没有，点击当前鼠标的位置
click_and_hold(on_element=None)
     按住鼠标左键在元素上。
     Args：on_element：鼠标点击下的元素，如果元素不存在，则单击目前鼠标的位置
context_click(on_element = None)
     执行右击一个元素
     Args: on_element: 右击元素，如果元素不存在，则单击鼠标目前所在位置
double_click（on_element = None）
     右击一个元素
    Args：on_element： 右击元素，如果元素不存在，则右击目前鼠标所在位置
drag_and_drop(source,target)
     左击源元素，直至移动到目的元素后放开左击
     Args： · source 按下鼠标在元素上
               · target 松开鼠标的地方
drag_and_drop_by_offset(source,xoffset,yoffset)
     按住源元素上的鼠标左键， 
     然后移动到目标偏移和释放鼠标按钮。

Args: source: 按下鼠标在元素上
         xoffset：x坐标移动
         yoffset：y坐标移动
key_down(value，element = None)
    按住一个键，不释放（常用于Control、Alt和Shift）
    Args： value：修饰符键发送。值在按键类中定义。
              element： 发送键的元素。如果没有，发送一个键到当前的焦点元素
key_up(value,element = None)
      释放一个按键
    Args： value：修饰符键发送。值在按键类中定义。
              element： 发送键的元素。如果没有，发送一个键到当前的焦点元素
move_by_offset(xoffset,yoffset)
    将鼠标移动到从当前鼠标位置的偏移
Args:          xoffset：x坐标移动
                  yoffset：y坐标移动
move_to_element(to_element)
　　移动鼠标到元素中间
Args： to_element： 移动的元素
move_to_element_with_offset（to_element，xoffset，yoffset）
perform()
release(on_element= None)
send_keys(*keys_to_send)
send_keys_to_element(element,*key_to_send)


Alerts
警示的实现
class：  selenium.webdriver.common.alert.Alert(driver)
bases：object
允许在警示的状态下工作
accept()
　　接受警示的可用
dismiss()
　　拒绝警示的可用
send_keys(keysToSend)
　　发送按键至警示
text
　　获取警示的文本信息

Special Keys
按键功能实现
class ：selenium.webdriver.common.keys.Keys
Bases：object
设置的特殊键代码：
ADD = u'\ue025'
ALT = u'\ue00a'
ARROW_DOWN = u'\ue015'
ARROW_LEFT = u'\ue012'
ARROW_RIGHT = u'\ue014'
ARROW_UP = u'\ue013'
BACK_SPACE = u'\ue003'
CANCEL = u'\ue001'
CLEAR = u'\ue005'
COMMAND = u'\ue03d'
CONTROL = u'\ue009'
DECIMAL = u'\ue028'
DELETE = u'\ue017'
DIVIDE = u'\ue029'
DOWN = u'\ue015'
END = u'\ue010'
ENTER = u'\ue007'
EQUALS = u'\ue019'
ESCAPE = u'\ue00c'
F1 = u'\ue031'
F10 = u'\ue03a'
F11 = u'\ue03b'
F12 = u'\ue03c'
F2 = u'\ue032'
F3 = u'\ue033'
F4 = u'\ue034'
F5 = u'\ue035'
F6 = u'\ue036'
F7 = u'\ue037'
F8 = u'\ue038'
F9 = u'\ue039'
HELP = u'\ue002'
HOME = u'\ue011'
INSERT = u'\ue016'
LEFT = u'\ue012'
LEFT_ALT = u'\ue00a'
LEFT_CONTROL = u'\ue009'
LEFT_SHIFT = u'\ue008'
META = u'\ue03d'
MULTIPLY = u'\ue024'
NULL = u'\ue000'
NUMPAD0 = u'\ue01a'
NUMPAD1 = u'\ue01b'
NUMPAD2 = u'\ue01c'
NUMPAD3 = u'\ue01d'
NUMPAD4 = u'\ue01e'
NUMPAD5 = u'\ue01f'
NUMPAD6 = u'\ue020'
NUMPAD7 = u'\ue021'
NUMPAD8 = u'\ue022'
NUMPAD9 = u'\ue023'
PAGE_DOWN = u'\ue00f'
PAGE_UP = u'\ue00e'
PAUSE = u'\ue00b'
RETURN = u'\ue006'
RIGHT = u'\ue014'
SEMICOLON = u'\ue018'
SEPARATOR = u'\ue026'
SHIFT = u'\ue008'
SPACE = u'\ue00d'
SUBTRACT = u'\ue027'
TAB = u'\ue004'
UP = u'\ue013'

Firefox WebDriver
class ：selenium.webdriver.firefox.webdriver.WebDriver(firefox_profile=None, firefox_binary=None, timeout=30, capabilities=None, proxy=None)
Bases：selenium.webdriver.remote.webdriver.WebDriver
quit()

NATIVE_EVENTS_ALLOWED = True

firefox_profile

Chrome WebDriver
略
Remote WebDriver
WebDriver的实现
class     selenium.webdriver.remote.webdriver.WebDriver(command_executor='http://127.0.0.1:4444/wd/hub', desired_capabilities=None, browser_profile=None, proxy=None)
Bases： object
通过发送命令到远程服务器来控制一个浏览器，浏览器将在WebDriver定义的协议中运行
属性：command_executor - command、commandexexutor用于执行命令
　　   error_handler - 用于验证服务器没有返回错误errorhandler.ErrorHandler对象。 

　　   SESSION_ID - 会话ID发送与每一个命令。 

　　   capabilities - 实例会话的底层浏览器的字典能力。 

　　   proxy - 一个selenium.webdriver.common.proxy.Proxy对象，指定要使用的浏览器的代理。

 

add_cookie(cookie_dict)
　　增加一个cookie到你目前的会话中
　　Args：cookie_dict：一个字典对象，和需要的关键字：name和value
　　          其他的关键字：path、domain、secure、expiry

　　Usage：
　　　　　　driver.add_cookie({‘name’ : ‘foo’, ‘value’ : ‘bar’}) 
                 driver.add_cookie({‘name’ : ‘foo’, ‘value’ : ‘bar’, ‘path’ : ‘/’}) 
                 driver.add_cookie({‘name’ : ‘foo’, ‘value’ : ‘bar’, ‘path’ : ‘/’, ‘secure’:True})
back():
      浏览器后退一步
　　Usage：
　　　　driver.back()
close()
　　关闭目前的窗口
　　Usage：
　　　　driver.close()
create_web_element(element_id)
　　创建具有指定element_id网页元素。
delete_all_cookies()
　　删除当前会话范围的所有cookies
　　Usage：driver.delete_all_cookies()
delete_cookie(name)
　　删除指定name的cookie
　　Usage：driver.delete_cookie(my_cookie)
execute(driver_command,params = None)
　　发送到由一个command.Command执行器能够执行的命令。
　　Args: driver_command: 作为一个字符串来执行的命令的名称 
         params:发送命令的命名参数的字典
　　Returns:加载在一个字典对象
execute_async_script(script, *args)
　　异步执行的JavaScript在当前窗口/框架。
　　Args： script:将被执行的javascript
                 *args:为你的JavaScript任何适用的参数。
　　Usage：driver.execute_async_script(‘document.title’)
execute_script(script, *args)
　　在窗口或者框架中同步执行javascript
　　Args： script:将被执行的javascript
                 *args:为你的JavaScript任何适用的参数。
　　Usage：driver.execute_script(‘document.title’)
find_element(by='id', value=None)
　　‘Private’ method 用于 find_element_by_* methods.

Usage: Use the corresponding find_element_by_* instead of this.

find_element_by_class_name(name)
通过类名来查找元素.

　　Args: name: The class name of the element to find.
　　Usage:driver.find_element_by_class_name(‘foo’)

find_element_by_css_selector(css_selector)
css selector定位element.

　　Args:   css_selector: The css selector to use when finding elements.
　　Usage: driver.find_element_by_css_selector(‘#foo’)

find_element_by_id(id_)
id定位element.

　　Args:    id_ - The id of the element to be found.
　　Usage:  driver.find_element_by_id(‘foo’)

find_element_by_link_text(link_text)
link text定位element.

　　Args:        link_text: The text of the element to be found.
　　Usage:     driver.find_element_by_link_text(‘Sign In’)

find_element_by_name(name)
name属性定位元素.

　　Args:    name: The name of the element to find.
　　Usage:  driver.find_element_by_name(‘foo’)

find_element_by_partial_link_text(link_text)
通过partial match link text定位element

　　Args:     link_text: The text of the element to partially match on.
　　Usage:   driver.find_element_by_partial_link_text(‘Sign’)

find_element_by_tag_name(name)
定位element通过tag name.

　　Args:   name: The tag name of the element to find.
　　Usage: driver.find_element_by_tag_name(‘foo’)

find_element_by_xpath(xpath)
定位element 通过 xpath.

　　Args:   xpath - The xpath locator of the element to find.
　　Usage: driver.find_element_by_xpath(‘//div/td[1]’)

find_elements(by='id', value=None)
私有method used by the find_elements_by_* methods.

　　Usage: 使用相应的 find_elements_by_* 替代

find_elements_by_class_name(name)

通过class name定位一组元素.

　　Args:    name: The class name of the elements to find.
　　Usage:  driver.find_elements_by_class_name(‘foo’)

find_elements_by_css_selector(css_selector)

css selector定位一组elements.

　　Args:   css_selector: The css selector to use when finding elements.
　　Usage: driver.find_element_by_css_selector(‘#foo’)

find_elements_by_id(id_)

定位多种 elements 通过 id.

　　Args:   id_ - The id of the elements to be found.
　　Usage: driver.find_element_by_id(‘foo’)

find_elements_by_link_text(text)

定位elements 通过 link text.

　　Args:    Link_text: The text of the elements to be found.
　　Usage:  driver.find_elements_by_link_text(‘Sign In’)

find_elements_by_name(name)
定位 elements 通过 name属性.

　　Args:   name: The name of the elements to find.
　　Usage: driver.find_elements_by_name(‘foo’)

find_elements_by_partial_link_text(link_text)
通过部分匹配的链接文本内容来定位elements.

　　Args:   link_text: The text of the element to partial match on.
　　Usage: driver.find_element_by_partial_link_text(‘Sign’)

find_elements_by_tag_name(name)
通过 tag name 定位 elements .

　　Args:     name: The tag name the use when finding elements.
　　Usage:   driver.find_elements_by_tag_name(‘foo’)

find_elements_by_xpath(xpath)
Finds multiple elements by xpath.

　　Args:   xpath - The xpath locator of the elements to be found.
　　Usage: driver.find_elements_by_xpath(“//div[contains(@class, ‘foo’)]”)

forward()
Goes one step forward in the browser history.（back以后的forward()）

　　Usage: driver.forward()

get(url)

Loads a web page in the current browser session.

get_cookie(name)

Get a single cookie by name. Returns the cookie if found, None if not.

　　Usage:  driver.get_cookie(‘my_cookie’)

get_cookies()
　　Returns a set of dictionaries, corresponding to cookies visible in the current session.

　　Usage:  driver.get_cookies()

get_log(log_type)

获取给定的日志类型的日志 

　　Args:   log_type: type of log that which will be returned
　　Usage:  driver.get_log(‘browser’) 
                  driver.get_log(‘driver’) 
                  driver.get_log(‘client’) 
                  driver.get_log(‘server’)

get_screenshot_as_base64()

获取当前窗口的屏幕截图作为一个base64编码的字符串 
这是在HTML中嵌入的图像是有用的。

　　Usage: driver.get_screenshot_as_base64()

get_screenshot_as_file(filename)
得到当前窗口的截图. Returns False if there is
any IOError, else returns True. Use full paths in your filename.
　　Args:    filename: The full path you wish to save your screenshot to.
　　Usage: driver.get_screenshot_as_file(‘/Screenshots/foo.png’)

get_screenshot_as_png()
Gets the screenshot of the current window as a binary data.

　　Usage: driver.get_screenshot_as_png()

get_window_position(windowHandle='current')
Gets the x,y position of the current window.

　　Usage: driver.get_window_position()

get_window_size(windowHandle='current')
Gets the width and height of the current window.

　　Usage: driver.get_window_size()

implicitly_wait(time_to_wait)（隐性wait）
为implicitly wait查找元素时设置一个固定超时时间 ,或者为一个命令设置超时时间.这个方法仅仅需要在每个会话一段时间内调用即可.To set the timeout for calls to execute_async_script, see set_script_timeout.
　　 Args:   time_to_wait: Amount of time to wait (in seconds)
　　Usage: driver.implicitly_wait(30)

is_online()
Returns a boolean if the browser is online or offline

maximize_window()

Maximizes the current window that webdriver is using

quit()

Quits the driver and closes every associated window.

　　Usage: driver.quit()

refresh()
Refreshes the current page.

　　Usage: driver.refresh()

save_screenshot(filename)
Gets the screenshot of the current window. Returns False if there is
any IOError, else returns True. Use full paths in your filename.
　　Args:     filename: The full path you wish to save your screenshot to.
　　Usage:   driver.get_screenshot_as_file(‘/Screenshots/foo.png’)

set_page_load_timeout(time_to_wait)

设置一个时间wait页面完全加载在页面抛出异常前.
　　Args:    time_to_wait: The amount of time to wait
　　Usage:  driver.set_page_load_timeout(30)

set_script_timeout(time_to_wait)

执行脚本时，在其发生异常前设置一个超时时间.
　　Args: time_to_wait: The amount of time to wait (in seconds)
　　Usage: driver.set_script_timeout(30)

set_window_position(x, y, windowHandle='current')

Sets the x,y position of the current window. (window.moveTo)

　　Args: 
                 x: the x-coordinate in pixels to set the window position
                 y: the y-coordinate in pixels to set the window position
　　Usage: driver.set_window_position(0,0)

set_window_size(width, height, windowHandle='current')

Sets the width and height of the current window. (window.resizeTo)

　　Args: 
　　　　　　width: the width in pixels to set the window to
　　　　　　height: the height in pixels to set the window to
　　Usage: 
　　　　　　driver.set_window_size(800,600)

start_client()

　　Called before starting a new session. This method may be overridden to define custom startup behavior.

start_session(desired_capabilities, browser_profile=None)

　　Creates a new session with the desired capabilities.

Args: 
　　browser_name - The name of the browser to request.
　　version - Which browser version to request.
　　platform - Which platform to request the browser on.
　　javascript_enabled - Whether the new session should support JavaScript.
　　browser_profile - A selenium.webdriver.firefox.firefox_profile.FirefoxProfile object. Only used if Firefox is requested.

stop_client()
　　Called after executing a quit command. This method may be overridden to define custom shutdown behavior.

switch_to_active_element()

　　Returns the element with focus, or BODY if nothing has focus.

　　Usage: driver.switch_to_active_element()

switch_to_alert()

Switches focus to an alert on the page.

　　Usage: driver.switch_to_alert()

switch_to_default_content()
Switch focus to the default frame.

　　Usage: driver.switch_to_default_content()

switch_to_frame(frame_reference)
Switches focus to the specified frame, by index, name, or webelement.

　　Args:   frame_reference: The name of the window to switch to, an integer representing the index,
or a webelement that is an (i)frame to switch to.

　　Usage: driver.switch_to_frame(‘frame_name’) 
　　　　　   driver.switch_to_frame(1) 
                 driver.switch_to_frame(driver.find_elements_by_tag_name(“iframe”)[0])

switch_to_window(window_name)

Switches focus to the specified window.

　　Args:    window_name: The name or window handle of the window to switch to.
　　Usage:  driver.switch_to_window(‘main’)

 application_cache

Returns a ApplicationCache Object to interact with the browser app cache

current_url

Gets the URL of the current page.

　　Usage: driver.current_url

current_window_handle
Returns the handle of the current window.

　　Usage: driver.current_window_handle

desired_capabilities
　　returns the drivers current desired capabilities being used

 log_types

Gets a list of the available log types

　　Usage: driver.log_types

name
Returns the name of the underlying browser for this instance.

　　Usage: driver.name

orientation
Gets the current orientation of the device

　　Usage: orientation = driver.orientation

page_source
Gets the source of the current page.

　　Usage: driver.page_source

title
Returns the title of the current page.

　　Usage: driver.title

window_handles
Returns the handles of all windows within the current session.

　　Usage: driver.window_handles

WebElement
WebElement的实现
class    selenium.webdriver.remote.webelement.LocalFileDetector
Bases: object

classmethod is_local_file(*keys)

class    selenium.webdriver.remote.webelement.WebElement(parent, id_)
Bases: object

Represents an HTML element.

Generally, all interesting operations to do with interacting with a page will be performed through this interface.

clear()
　　如果文本输入框有内容将被清除
click()
　　单击元素
find_element(by='id',value=None)

find_element_by_class_name(name)
　　通过元素的class name寻找
find_element_by_css_selector(css_selector)
　　Find and return an element by CSS selector.

find_element_by_id(id_)
　　Finds element by id.

find_element_by_link_text(link_text)
　　Finds element by link text.

find_element_by_name(name)
　　Find element by name.

find_element_by_partial_link_text(link_text)
find_element_by_tag_name(name)
find_element_by_xpath(xpath)
Finds element by xpath.

find_elements(by='id', value=None)
find_elements_by_class_name(name)
Finds elements by their class name.

find_elements_by_css_selector(css_selector)
　　Find and return list of multiple elements by CSS selector.

find_elements_by_id(id_)
find_elements_by_link_text(link_text)
find_elements_by_name(name)
find_elements_by_partial_link_text(link_text)
find_elements_by_tag_name(name)
find_elements_by_xpath(xpath)

get_attribute(name)
　　Gets the attribute value.

is_displayed()
　　Whether the element would be visible to a user

is_enabled()
　　Whether the element is enabled.

is_selected()
　　Whether the element is selected.

send_keys(*value)
　　Simulates typing into the element.

submit()
　　Submits a form.

value_of_css_property(property_name)
　　Returns the value of a CSS property

id

location
　　Returns the location of the element in the renderable canvas

location_once_scrolled_into_view
　　CONSIDERED LIABLE TO CHANGE WITHOUT WARNING. Use this to discover where on the screen an element is so that we can click it. This method should cause the element to be scrolled into view.

Returns the top lefthand corner location on the screen, or None if the element is not visible

parent

size
　　Returns the size of the element

tag_name
　　Gets this element’s tagName property.

text
　　Gets the text of the element.




UI Support
class selenium.webdriver.support.select.Select(webelement)
deselect_all()
　　清除所有选中的条目,只有在支持多选的条件下有效，否则会抛出NotImplementedError

deselect_by_index(index)
取消选择给定索引处的选项。这是通过追问元素的“索引”属性，而不是仅仅通过计算完成的。

　　Args: index - The option at this index will be deselected

deselect_by_value(value)
Deselect all options that have a value matching the argument. That is, when given “foo” this would deselect an option like:

<option value=”foo”>Bar</option>
　　Args: value - The value to match against

deselect_by_visible_text(text)
Deselect all options that display text matching the argument. That is, when given “Bar” this would deselect an option like:

<option value=”foo”>Bar</option>

　　Args: text - The visible text to match against

select_by_index(index)
Select the option at the given index. This is done by examing the “index” attribute of an element, and not merely by counting.

　　Args: index - The option at this index will be selected

select_by_value(value)
Select all options that have a value matching the argument. That is, when given “foo” this would select an option like:

<option value=”foo”>Bar</option>

　　Args: value - The value to match against

select_by_visible_text(text)
Select all options that display text matching the argument. That is, when given “Bar” this would select an option like:

<option value=”foo”>Bar</option>
　　Args: text - The visible text to match against

all_selected_options
Returns a list of all selected options belonging to this select tag

first_selected_option
The first selected option in this select tag (or the currently selected option in a normal select)

options
Returns a list of all options belonging to this select tag

class    selenium.webdriver.support.wait.WebDriverWait(driver, timeout, poll_frequency=0.5, ignored_exceptions=None)
Bases: object

until(method, message='')
Calls the method provided with the driver as an argument until the return value is not False.

until_not(method, message='')
Calls the method provided with the driver as an argument until the return value is False.

Color Support
class    selenium.webdriver.support.color.Color(red, green, blue, alpha=1)
Bases: object

Color conversion support class

例如：
from selenium.webdriver.support.color import Color

print(Color.from_string('#00ff33').rgba)
print(Color.from_string('rgb(1, 255, 3)').hex)
print(Color.from_string('blue').rgba)
static from_string(str_)
hex
rgb
rgba

 

Expected Conditions Support
class selenium.webdriver.support.expected_conditions.alert_is_present
Bases: object

Expect an alert to be present.

class selenium.webdriver.support.expected_conditions.element_located_selection_state_to_be(locator, is_selected)

Bases: object

An expectation to locate an element and check if the selection state specified is in that state. locator is a tuple of (by, path) is_selected is a boolean

class selenium.webdriver.support.expected_conditions.element_located_to_be_selected(locator)

Bases: object

An expectation for the element to be located is selected. locator is a tuple of (by, path)

class selenium.webdriver.support.expected_conditions.element_selection_state_to_be(element, is_selected)

Bases: object

An expectation for checking if the given element is selected. element is WebElement object is_selected is a Boolean.”

class selenium.webdriver.support.expected_conditions.element_to_be_clickable(locator)

Bases: object

An Expectation for checking an element is visible and enabled such that you can click it.

class selenium.webdriver.support.expected_conditions.element_to_be_selected(element)

Bases: object

An expectation for checking the selection is selected. element is WebElement object

class selenium.webdriver.support.expected_conditions.frame_to_be_available_and_switch_to_it(locator)

Bases: object

An expectation for checking whether the given frame is available to switch to. If the frame is available it switches the given driver to the specified frame.

class selenium.webdriver.support.expected_conditions.invisibility_of_element_located(locator)

Bases: object

An Expectation for checking that an element is either invisible or not present on the DOM.

locator used to find the element

class selenium.webdriver.support.expected_conditions.presence_of_all_elements_located(locator)

Bases: object

An expectation for checking that there is at least one element present on a web page. locator is used to find the element returns the list of WebElements once they are located

class selenium.webdriver.support.expected_conditions.presence_of_element_located(locator)

Bases: object

An expectation for checking that an element is present on the DOM of a page. This does not necessarily mean that the element is visible. locator - used to find the element returns the WebElement once it is located

class selenium.webdriver.support.expected_conditions.staleness_of(element)

Bases: object

Wait until an element is no longer attached to the DOM. element is the element to wait for. returns False if the element is still attached to the DOM, true otherwise.

class selenium.webdriver.support.expected_conditions.text_to_be_present_in_element(locator, text_)

Bases: object

An expectation for checking if the given text is present in the specified element. locator, text

class selenium.webdriver.support.expected_conditions.text_to_be_present_in_element_value(locator, text_)

Bases: object

An expectation for checking if the given text is present in the element’s locator, text

class selenium.webdriver.support.expected_conditions.title_contains(title)

Bases: object

An expectation for checking that the title contains a case-sensitive substring. title is the fragment of title expected returns True when the title matches, False otherwise

class selenium.webdriver.support.expected_conditions.title_is(title)

Bases: object

An expectation for checking the title of a page. title is the expected title, which must be an exact match returns True if the title matches, false otherwise.

class selenium.webdriver.support.expected_conditions.visibility_of(element)

Bases: object

An expectation for checking that an element, known to be present on the DOM of a page, is visible. Visibility means that the element is not only displayed but also has a height and width that is greater than 0. element is the WebElement returns the (same) WebElement once it is visible

 

class selenium.webdriver.support.expected_conditions.visibility_of_element_located(locator)
Bases: object

An expectation for checking that an element is present on the DOM of a page and visible. Visibility means that the element is not only displayed but also has a height and width that is greater than 0. locator - used to find the element returns the WebElement once it is located and visible
