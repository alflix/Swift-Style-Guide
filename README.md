<!-- TOC -->

- [命名规范](#命名规范)
    - [基本法则](#基本法则)
        - [使用美式英语](#使用美式英语)
        - [使用驼峰命名法](#使用驼峰命名法)
        - [大小写](#大小写)
    - [让代码被正确调用](#让代码被正确调用)
        - [保证命名让使用的人不会产生歧义](#保证命名让使用的人不会产生歧义)
        - [省略无用的词](#省略无用的词)
        - [在弱类型参数前加一个名词描述它的角色](#在弱类型参数前加一个名词描述它的角色)
        - [尽量让函数的使用语句接近正常的语法](#尽量让函数的使用语句接近正常的语法)
    - [用好术语](#用好术语)
        - [避免使用缩写，尤其是非标准的缩写](#避免使用缩写尤其是非标准的缩写)
        - [尊重先例用法](#尊重先例用法)
    - [文件名](#文件名)
    - [类名前缀](#类名前缀)
    - [初始化方法](#初始化方法)
    - [属性](#属性)
        - [基本法则](#基本法则-1)
        - [静态属性](#静态属性)
        - [全局常量](#全局常量)
        - [bool  类型](#bool--类型)
        - [数字](#数字)
    - [函数](#函数)
        - [避免函数只有返回类型不同](#避免函数只有返回类型不同)
        - [充分利用默认参数](#充分利用默认参数)
        - [给 API 中的 tuple 成员和闭包参数命名](#给-api-中的-tuple-成员和闭包参数命名)
        - [创建型的函数](#创建型的函数)
    - [协议](#协议)
    - [代理](#代理)
        - [只有一个参数](#只有一个参数)
        - [多个参数](#多个参数)
    - [枚举](#枚举)
    - [选择器](#选择器)
    - [Attribute](#attribute)
    - [泛型](#泛型)
    - [资源文件](#资源文件)
    - [Bundle Id](#bundle-id)
- [代码格式](#代码格式)
    - [文件夹分类](#文件夹分类)
    - [行数限制](#行数限制)
    - [代码组织方式](#代码组织方式)
    - [移除无用代码](#移除无用代码)
    - [分号](#分号)
    - [圆括号](#圆括号)
    - [花括号](#花括号)
    - [空格](#空格)
    - [空白行](#空白行)
    - [禁止属性水平对齐](#禁止属性水平对齐)
    - [版权声明](#版权声明)
- [编程实践](#编程实践)
    - [Import](#import)
    - [缩略 self](#缩略-self)
    - [计算属性](#计算属性)
    - [访问控制](#访问控制)
    - [Final](#final)
    - [尽可能使用 let](#尽可能使用-let)
    - [更加 Swiftly](#更加-swiftly)
        - [首选 struct 而非 class](#首选-struct-而非-class)
        - [使用 Swift 提供的原生类型](#使用-swift-提供的原生类型)
        - [使用 Swift 原生的结构体构造器](#使用-swift-原生的结构体构造器)
        - [灵活运用函数式操作 map, filter, reduce 等](#灵活运用函数式操作-map-filter-reduce-等)
    - [类型推导](#类型推导)
    - [类型标注](#类型标注)
    - [语法糖](#语法糖)
    - [少用全局函数](#少用全局函数)
    - [闭包表达式](#闭包表达式)
    - [内存管理](#内存管理)
    - [控制流](#控制流)
        - [不要用 while-condition-increment](#不要用-while-condition-increment)
        - [使用 for where 优化](#使用-for-where-优化)
        - [多个条件判断语句，提前用变量表示判断条件](#多个条件判断语句提前用变量表示判断条件)
        - [使用 guard 提前退出](#使用-guard-提前退出)
    - [Optional](#optional)
    - [注释](#注释)
    - [StoryBoard 和 Xib](#storyboard-和-xib)
    - [UI 必须还原设计稿](#ui-必须还原设计稿)
    - [性能优化](#性能优化)
    - [代码复用](#代码复用)
    - [编译器警告](#编译器警告)
    - [Playground Literal](#playground-literal)
    - [引入 SDK，Pod](#引入-sdkpod)
    - [资源文件配置](#资源文件配置)

<!-- /TOC -->

<a id="markdown-命名规范" name="命名规范"></a>
## 命名规范

<a id="markdown-基本法则" name="基本法则"></a>
### 基本法则  

<a id="markdown-使用美式英语" name="使用美式英语"></a>
#### 使用美式英语

```swift
✅
let catalog = "catalog"
let color = "red"
let smile = "smile"
```

不要使用拼音/中文/Emoji

```swift
❌
let catalogue = "catalogue"
let zhangjie = "章节"
let 颜色 = "red"
let 😊 = "smile"
```

<a id="markdown-使用驼峰命名法" name="使用驼峰命名法"></a>
#### 使用驼峰命名法

<a id="markdown-大小写" name="大小写"></a>
#### 大小写

类、结构体、枚举、协议这些类型名应该首字母大写，而函数、变量则应该首字母小写。

```swift
✅
private let maximumWidgetCount = 100
class WidgetContainer {
    var widgetButton: UIButton
    let widgetHeightPercentage = 0.85
}
❌
let MAX_WIDGET_COUNT = 100
class app_widgetContainer {
    var wBut: UIButton
    let wHeightPct = 0.85
}
```

<a id="markdown-让代码被正确调用" name="让代码被正确调用"></a>
### 让代码被正确调用  

<a id="markdown-保证命名让使用的人不会产生歧义" name="保证命名让使用的人不会产生歧义"></a>
#### 保证命名让使用的人不会产生歧义

比如在集合中有一个函数，根据给定的位置移除元素。
如果在函数签名中省略了 at，使用的时候就会以为是删除一个等于 x 的元素，而不是移除索引在 x 的元素：

```swift
✅
extension List {
    public mutating func remove(at position: Index) -> Element
}
employees.remove(at: x)
❌
extension List {
    public mutating func remove(_ position: Index) -> Element
}
employees.remove(x) // 不够清晰: 这里感觉像是移除 x
```

<a id="markdown-省略无用的词" name="省略无用的词"></a>
#### 省略无用的词

如果使用者已经知道某些信息，那么这个信息在命名中就可以省略。

```swift
❌
public mutating func removeElement(_ member: Element) -> Element?
allViews.removeElement(cancelButton)
```

上面的例子中 Element没有传达出更多有效的信息。

```swift
✅
public mutating func remove(_ member: Element) -> Element?
allViews.remove(cancelButton) // 更清晰
```

<a id="markdown-在弱类型参数前加一个名词描述它的角色" name="在弱类型参数前加一个名词描述它的角色"></a>
#### 在弱类型参数前加一个名词描述它的角色

一个参数的类型是 NSObject 、 Any、 AnyObject 或者像 Int 、 String 这种基础类型时，类型信息和使用时的上下文不能很好的传递出参数的用途。
下面这个例子中声明虽然可以说是清晰的，但是使用的时候还是会有让人看不明白。

```swift
❌
func add(_ observer: NSObject, for keyPath: String)
grid.add(self, for: graphics) 
```

为了能够重新表达清晰，在每个弱类型参数前加一个名词描述它的角色：

```swift
✅
func addObserver(_ observer: NSObject, forKeyPath path: String)
grid.addObserver(self, forKeyPath: graphics) // clear
```

<a id="markdown-尽量让函数的使用语句接近正常的语法" name="尽量让函数的使用语句接近正常的语法"></a>
#### 尽量让函数的使用语句接近正常的语法

```swift
✅
x.insert(y, at: z)          “x, insert y at z”
x.subViews(havingColor: y)  “x's subviews having color y”
x.capitalizingNouns()       “x, capitalizing nouns”
❌
x.insert(y, position: z)
x.subViews(color: y)
x.nounCapitalize()
```

<a id="markdown-用好术语" name="用好术语"></a>
### 用好术语  

<a id="markdown-避免使用缩写尤其是非标准的缩写" name="避免使用缩写尤其是非标准的缩写"></a>
#### 避免使用缩写，尤其是非标准的缩写

标准的缩写通常指该缩写应该很容易通过搜索引擎搜索到，当使用常见的缩略词时，应该保持它们的大小写一致性，要么所有字母都大写，要么所有字母都小写。比如：

```swift
✅
let urlString: URLString
let userID: UserID
```

```swift
❌
let uRLString: UrlString
let userId: UserId
```

<a id="markdown-尊重先例用法" name="尊重先例用法"></a>
#### 尊重先例用法

如果是连续的数据结构，命名为 Array 比使用简化的术语 List 好。虽然初学者更容易理解 List 的含义，但是 Array 是现代计算的基础类型，每一个程序员都会知道它。
在一个特定的编程领域，比如数学，使用广泛的术语比声明一个解释性短语好，如 sin(x) 比verticalPositionOnUnitCircleAtOriginOfEndOfRadiusWithAngle(x) 更可取。在这种情况下，先例比避免使用缩写的指导原则更重要。

<a id="markdown-文件名" name="文件名"></a>
### 文件名 

所有 swift 源文件都使用 .swift 扩展名。 通常使用源文件中主体（primary entity）命名。如果是扩展现有类型，在现有类型有使用 + 号，带上扩展的内容。 例子：

- 如果是一个单一的类型 MyType，那么文件名为 MyType.swift。
- 如果是扩展 MyType 实现 MyProtocol，那么文件名为 MyType+MyProtocol.swift。
- 如果是给 MyType 增加了一下扩展方法，那么文件的前缀是 MyType+ ，比如可以是 MyType+Additions.swift。
- 如果文件里的声明不是在一个相关类型下，可以描述这些声明的作用、场景。比如 Math.swift。

<a id="markdown-类名前缀" name="类名前缀"></a>
### 类名前缀 

Swift 的类自动被包含在模块分配的命名空间中。不应该再添加类似于 Objective-C 的类前缀。
如果不同模块的两个命名冲突，可以在类名前添加模块名来消除歧义。无论如何，仅在少数可能引起混淆的情况下指明模块名。

<a id="markdown-初始化方法" name="初始化方法"></a>
### 初始化方法  

如果初始化参数和自身的属性是一一对应的关系，参数名和属性名保持一致。

```swift
✅
public struct Person {
    public let name: String
    public init(name: String, phoneNumber: String) {
        self.name = name
    }
}
❌
public struct Person {
    public let name: String
    public init(name otherName: String, phoneNumber otherPhoneNumber: String) {
        name = otherName
    }
}
```

如果初始化方法来自实现字面量初始化协议 ExpressibleByLiteral ，永远不要直接调用这个初始化方法，使用字面量初始化。

```swift
struct Kilometers: ExpressibleByIntegerLiteral {
    init(integerLiteral value: Int) {}
}
✅
let k1: Kilometers = 10
❌
let k = Kilometers(integerLiteral: 10) 
```

其他初始化方法也不要直接调用 .init，因为是可省略的。
只有在把初始化方法当做闭包传递，和在使用元类型信息初始化时才能直接调用  .init。

<a id="markdown-属性" name="属性"></a>
### 属性 

<a id="markdown-基本法则-1" name="基本法则-1"></a>
#### 基本法则

一般形式的变量、常量都应该用名词命名。
局部变量声明的地方尽量靠近在使用的地方。
每一行只声明一个变量。

```swift
❌
var a = 5, b = 10
```

根据承担的角色命名变量、参数、关联类型，而不是它们的类型限制。

```swift
❌
var string = "Hello"
protocol ViewController {
    associatedtype ViewType : View
}
class ProductionLine {
    func restock(from widgetFactory: WidgetFactory)
}
✅
var greeting = "Hello"
protocol ViewController {
    associatedtype ContentView : View
}
class ProductionLine {
    func restock(from supplier: WidgetFactory)
}
```

常量、变量的类型信息如果不明显并且会引起歧义，在名称中加入类型信息。

```swift
❌
class ConnectionTableViewCell: UITableViewCell {
    // 这样会让人以为是图片，而不是图片控件
    let personImage: UIImageView
    // 这样会让人以为是一个字符串
    let text: UILabel
    // 这个名称会让人不知道应该使用什么赋值，animation 与 interval 完全不相关。
    let animation: TimeInterval
    // 这里是一个需要展示的文本，应该命名为 `transitionText` 或者 `transitionString`
    let transition: String
    // 这会让人误以为是一个 UIView 对象
    let popupView: UIViewController
    // 不要使用缩写，所以缩写成 VC 不好
    let popupVC: UIViewController
    // 显式的让外面知道这是一个 TableViewController
    let popupViewController: UITableViewController
    // 为了保持一致性，所有的类型都写在末尾
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var buttonSubmit: UIButton!
    // outlet 应该总是有类型信息在末尾，这里应该是改成 firstNameLabel
    @IBOutlet weak var firstName: UILabel!
}
```

<a id="markdown-静态属性" name="静态属性"></a>
#### 静态属性

如果一个静态属性返回的是自身的类型，不用在属性名称后缀中重复声明类型。

```swift
✅
public class UIColor {
    public class var red: UIColor {}
}
public class URLSession {
    public class var shared: URLSession {}
}
❌
public class UIColor {
    public class var redColor: UIColor {}
}
public class URLSession {
    public class var sharedSession: URLSession {}
}
```

<a id="markdown-全局常量" name="全局常量"></a>
#### 全局常量

就像正常变量一样使用匈牙利命名方式，不要在前面加上 k 或其他特别的格式。

```swift
✅
let secondsPerMinute = 60
❌
let SecondsPerMinute = 60
let kSecondsPerMinute = 60
let SECONDS_PER_MINUTE = 60
```

<a id="markdown-bool--类型" name="bool--类型"></a>
#### bool  类型

bool 类型 或返回类型为 bool  的函数，使用 is 作为前缀，读起来应该是一个判断。

```swift
let isHidden = false
```

<a id="markdown-数字" name="数字"></a>
#### 数字

如果是一个很长的数字时，建议使用下划线按照语言习惯三位或者四位一组分割连接。

```swift
let number = 100_0000
```

<a id="markdown-函数" name="函数"></a>
### 函数 

<a id="markdown-避免函数只有返回类型不同" name="避免函数只有返回类型不同"></a>
#### 避免函数只有返回类型不同

这会影响系统的类型推断。

```swift
❌
extension Box {
    func value() -> Int? { ... }
    func value() -> String? { ... }
}
```

<a id="markdown-充分利用默认参数" name="充分利用默认参数"></a>
#### 充分利用默认参数

默认参数比用一组家族函数更好，因为使用者可以更容易的理解 API。倾向于把默认参数放在参数列表的尾部。没有默认值的参数通常对函数的语义更重要，不可省略的参数放在前面也可以使函数调用的方式更加一致。

<a id="markdown-给-api-中的-tuple-成员和闭包参数命名" name="给-api-中的-tuple-成员和闭包参数命名"></a>
#### 给 API 中的 tuple 成员和闭包参数命名

这些命名可以更好的解释含义，在文档注释中会被引用，也可以在访问 tuple 成员的时候被使用到。

<a id="markdown-创建型的函数" name="创建型的函数"></a>
#### 创建型的函数

如果是创建型的函数，那么第一个参数的标签不要考虑组合成一个句子
因为这样的函数名称已经知道是要创建一个实例，那么参数再用介词修饰让句子流畅显得多余

```swift
✅
let foreground = Color(red: 32, green: 64, blue: 128)
let newPart = factory.makeWidget(gears: 42, spindles: 14)
let ref = Link(target: destination)
```

如果为了句子的连贯性就会声明成下面这样（但是并不推荐这样做）：

```swift
❌
let foreground = Color(havingRGBValuesRed: 32, green: 64, andBlue: 128)
let newPart = factory.makeWidget(havingGearCount: 42, andSpindleCount: 14)
let ref = Link(to: destination)
```

<a id="markdown-协议" name="协议"></a>
### 协议 

当协议是用来「描述一个东西是什么」时，协议名应该是一个名词，比如：Collection、WidgetFactory。当协议是用来「描述一种能力」时，协议名应该以 -ing、-able  结尾，比如：Equatable、Decodable。

<a id="markdown-代理" name="代理"></a>
### 代理 

代理方法的命名和正常函数命名会有明显的区别，命名的方式参考了 Cocoa 的 protocol，代理的主体作为方法第一个参数。

<a id="markdown-只有一个参数" name="只有一个参数"></a>
#### 只有一个参数

- 如果返回值是 void，方法名以主体开头，接一个动词短语表示发生的事件。隐藏参数名称标签。

```swift
func scrollViewDidBeginScrolling(_ scrollView: UIScrollView)
```

- 如果返回值是 Bool，方法名以主体开头，接一个表示判断的短语。隐藏参数名称标签。

```swift
func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool
```

- 如果返回的是其他类型的值，方法名则是一个描述了返回值角色的名词短语。参数标签会尽量使用介词或者词组来连接方法名和主体。

```swift
func numberOfSections(in scrollView: UIScrollView) -> Int
```

<a id="markdown-多个参数" name="多个参数"></a>
#### 多个参数

代理方法多个参数的情况下，第一个参数总是隐藏标签。 命名的分类与上面提到的相似，区别只是方法的基础名字都是主体，对于方法的具体作用描述声明在参数标签里。

```swift
func tableView(
  _ tableView: UITableView,
  willDisplayCell cell: UITableViewCell,
  forRowAt indexPath: IndexPath)
func tableView(
  _ tableView: UITableView,
  heightForRowAt indexPath: IndexPath
) -> CGFloat
```

<a id="markdown-枚举" name="枚举"></a>
### 枚举 

使用首字母小写的驼峰命名法来给枚举值命名，enum 下的每个 case 都是单独一行

```swift
enum Shape {
    case rectangle
    case square
    case rightTriangle
    case equilateralTriangle
}
```

Switch 中的 case 语句默认就有 break 的功能，所以不需要特别声明 break。
在访问枚举类型时，基于上下文推断使用更简洁的点语法

```swift
let shape = .rectangle
```

如果每一个 case 都是 indirect，那么直接在 enum 上声明 indirect。

```swift
✅
public indirect enum DependencyGraphNode {
    case userDefined(dependencies: [DependencyGraphNode])
    case synthesized(dependencies: [DependencyGraphNode])
}
❌
public enum DependencyGraphNode {
    indirect case userDefined(dependencies: [DependencyGraphNode])
    indirect case synthesized(dependencies: [DependencyGraphNode])
}
```

枚举的选项顺序必须有意义。如果没有特别的逻辑可以参考，按照每项的首字母顺序。
Switch 中如果有几个 case 都对应相同的逻辑，case 使用逗号连接条件，而不是使用 fallthrough：

```swift
✅
switch value {
    case 1: print("one")
    case 2...4: print("two to four")
    case 5, 7: print("five or seven")
    default: break
}
❌
switch value {
    case 1: print("one")
    case 2: fallthrough
    case 3: fallthrough
    case 4: print("two to four")
    case 5: fallthrough
    case 7: print("five or seven")
    default: break
}

```

<a id="markdown-选择器" name="选择器"></a>
### 选择器 

不要用字符串来指定选择器，而应该使用新的语法方式，更安全。通常，使用上下文推断来缩短选择器表达式。

```swift
✅
let sel = #selector(viewDidLoad)
❌
let sel = #selector(ViewController.viewDidLoad)
```

<a id="markdown-attribute" name="attribute"></a>
### Attribute 

带参数的特性（比如 [@availability(...)](https://www.yuque.com/...)、[@objc(...)](https://www.yuque.com/...)）单独声明在一行里。 

```swift
✅
@available(iOS 9.0, *)
public func coolNewFeature() {
  // ...
}
❌
@available(iOS 9.0, *) public func coolNewFeature() {
  // ...
}
```

不带参数的特性（比如 @IBOutlet、@NSManaged）则声明在同一行里。如果写到同一行后代码长度超过长度限制，则将特性标签单独声明一行。

```swift
✅
public class MyViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
}
```

<a id="markdown-泛型" name="泛型"></a>
### 泛型 

泛型名应该有较好的阅读性，用首字母大写的驼峰式命名。当一个类型没有有意义的关系和角色，使用传统的 T、U、V 来替代。

```swift
✅
struct Stack<Element> { ... }
func writeTo<Target: OutputStream>(inout target: Target)
func max<T: Comparable>(x: T, _ y: T) -> T
❌
struct Stack<T> { ... }
func writeTo<target: OutputStream>(inout t: target)
func max<Thing: Comparable>(x: Thing, _ y: Thing) -> Thing
```

注意没有类型限制（Any，AnyObject，没有类型限制的泛型参数）的多态使用，避免在重载中引发歧义。

```swift
❌
struct Array {
    /// Inserts `newElement` at `self.endIndex`.
    public mutating func append(_ newElement: Element)    
    /// Inserts the contents of `newElements`, in order, at
    /// `self.endIndex`.
    public mutating func append(_ newElements: S)
    where S.Generator.Element == Element
}
```

```swift
❌
var values: [Any] = [1, "a"]
values.append([2, 3, 4]) // [1, "a", [2, 3, 4]] or [1, "a", 2, 3, 4]?
```

为了消除歧义，给第二个函数更加明确的命名。

```swift
✅
struct Array {
    public mutating func append(_ newElement: Element)    
    public mutating func append(contentsOf newElements: S)
    where S.Generator.Element == Element
}
```

<a id="markdown-资源文件" name="资源文件"></a>
### 资源文件 

为了区分资源文件名称和代码对象冲突，资源文件命名单词间使用下划线连接。
最开始前缀表示类型。

- 视频：video
- 音频：audio
- 图片
  - 背景：bg
  - 图标：icon
  - 按钮：btn
  - 其他：image
  - 高亮在最后加上 hl（表示 highlight）

资源第二个名字最好是业务/逻辑分类。比如用户模块的等级图标：icon_account_level，导航的返回按钮：btn_nav_back。因此一个规范的资源命名应该至少有三个单词：`类型_模块_名称`。
项目中可以创建多个 xcassets 文件，在 xcassets 内部也可以创建多个文件夹进行图片资源管理分组。
颜色命名使用 Zeplin 生成的颜色配置文件

<a id="markdown-bundle-id" name="bundle-id"></a>
### Bundle Id 

项目在开发阶段，Xcode 的项目设置中，组织应该被设置为 Ganguo ，并且 Bundle Id 采用反域名命名规范。即被设置为 hk.ganguo.Project ，其中 Project 是项目的名称。
上架阶段， Bundle Id 设置为 com.company.Project 其中 company 是组织的名称。

<a id="markdown-代码格式" name="代码格式"></a>
## 代码格式

<a id="markdown-文件夹分类" name="文件夹分类"></a>
### 文件夹分类 

```swift
├── App                            
    ├── Controller          
    ├── View                
    └── Model                
    ├── Api                  
├── Extension                
├── Modules                  
    ├── Downloader           
    └── Util                 
├── Config  
    ├── UIColor+Config
    └── AppConfig    
├── Vendors
├── Supporting Files           
├── Resources                
    ├── Font                 
    ├── info.plist           
    └── Assets.xcassets 
├── I18n                    
└── Xcconfig                 
```

其中 App 内下一级的文件夹，按 UI 页面/功能 分类，其中 Controller 的划分一般按照页面的结构关系来划分，View 或 Model，由于通常存在复用的可能性，按照最小颗粒度的结构来划分。

```swift
├── Controller                            
    ├── Home          
    ├── Search                
    └── Me                                
├── View                  
    ├── Author           
    └── Article    
```

如果由于 UI 变更或需求变更，应该及时更新文件夹的命名和文件位置。
文件夹命名均以大写开头。
创建任何 Xcode group 应该与文件系统中的文件夹保持映射，以避免文件管理杂乱。

<a id="markdown-行数限制" name="行数限制"></a>
### 行数限制 

每个文件的代码行数不超过 400 行。
每行最多 160 个字符，这样可以避免一行过长。 (Xcode->Preferences->Text Editing->Page guide at column: 设置成160即可
例外的情况：

- 如果是一串有意义的连续文本不需要换行，比如一句注释里的一个很长的 URL
- import 声明
- 生成的代码

遵守 Xcode 内置的缩进格式。( 如果已经遵守，按下CTRL-i 组合键文件格式没有变化)

<a id="markdown-代码组织方式" name="代码组织方式"></a>
### 代码组织方式 

类型、变量、函数在源文件中的布局顺序对代码的可读性有很大的影响。必须按照一定的逻辑来组织这些元素。

- 重载的声明放在一起。
- 如果一个类型有多个初始化方法一个类型有多个基本名字相同的方法（参数标签不同），要把它们写在一起。
- 使用 extension 组织不同功能块的代码。

当你为一个类实现某些协议时，使用一个独立的 extension 来实现具体的协议函数，这样可以让协议相关的代码聚合在一起，从而保持代码结构的清晰性。

```swift
❌
class MyViewcontroller: UIViewController, UITableViewDataSource, UIScrollViewDelegate {
    // all methods
}
```

对于 UIKit 的 ViewControllers/UIView，将 UI，IBAction， Function , 放在独立的 extension 中实现，lifeCircle和变量声明在 class 中实现。最后的代码组织方式如下(注意顺序)：

```swift
✅
class MyViewcontroller: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let dataSource: [ViewModel] = []
    
    deinit {}
    
    override func viewWillAppear(_ animated: Bool) {}
    override func viewWillDisappear(_ animated: Bool) {}
    override func viewDidLoad() {}
}

// MARK: - UI
private extension MyViewcontroller {
    func setupTableView() {}
}

// MARK: - IBAction
private extension MyViewcontroller {
    @IBAction func titleBtnClick() {}
}

// MARK: - Function
extension MyViewcontroller {
    @objc func handle(notification: Notification?) {}
}

// MARK: - UITableViewDataSource
extension MyViewcontroller: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
}

// MARK: - EmptyDataSetDelegate
extension MyViewcontroller: EmptyDataSetDelegate {    
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView) -> Bool {
        return true
    }
}
```

<a id="markdown-移除无用代码" name="移除无用代码"></a>
### 移除无用代码 

无用代码，包括 Xcode 模板代码和占位注释，应该被移除掉。包括任何为空的或无用的 UIApplicationDelegate 函数。包括功能调整之前的旧代码，重构之后的旧代码。基于 Git 可以很清楚地回溯代码，所以不要抱着以后可以有用这行代码先注释掉的想法。

```swift
❌
override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
}
override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return Database.contacts.count
}
✅
override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Database.contacts.count
}
```

<a id="markdown-分号" name="分号"></a>
### 分号 

Swift 不需要在一行代码结束时使用分号。只有当你想把多行代码放在一行写时，才需要用分号隔开它们，但是一般不推荐这样做。只有在使用 for-conditional-increment 时用到分号是例外，但更推荐使用 for-in。

```swift
✅ 
let swift = "not a scripting language"
❌ 
let swift = "not a scripting language";
```

<a id="markdown-圆括号" name="圆括号"></a>
### 圆括号 

条件判断语句外的圆括号不是必须的，省略它们。

```swift
✅
if name == "Hello" {
    print("World")
}
❌
if (name == "Hello") {
    print("World")
}
```

但在更大的表达式中或者在有复杂的条件表达式，可选括号有时可以让代码读起来更清晰，提示用户的计算优先级。此时必须加上圆括号。

```swift
✅
let playerMark = (player == current ? "X" : "O")
if (x == 0 || y == 1) && z == 2 {
    print("...")
}
```

<a id="markdown-花括号" name="花括号"></a>
### 花括号 

非空的 block 花括号默认使用 [K&R](https://en.wikipedia.org/wiki/Indentation_style#K&R) style。比如：

```swift
✅
if user.isHappy {
    // Do something
} else {
    // Do something else
}
```

```swift
❌
if user.isHappy
{
    // Do something
}
else{
    // Do something else
}
```

左花括号后是一个换行，除非：

- 后面要声明闭包的参数，改为在 in 关键字后面换行。
- 符合每行只声明一件事情况，忽略换行，把内容写在一行里。
- 如果是空的 block ，直接声明为 { }。

```swift
✅
guard let value = value else { return 0 }
let squares = numbers.map { $0 * $0 }
```

<a id="markdown-空格" name="空格"></a>
### 空格 

使用 Tab 而非空格。
一个 Unicode 空格只出现在以下地方:

- 条件关键字后面。
- 使用二元运算符(+, -，==, 或->)的前后都需要添加空格。
- 冒号，逗号的左边总是不空格，右边空 1 格。(除了在三元运算符 ? : 和空字典 [:] 和带有未命名参数 (_:) 的 #selector 语法中)
- 当定义操作符时，两边留空格。
- 表示在协议中表示合成类型的 & 两边。
- 表示返回值的 -> 两边。
- 如果闭包中的代码在同一行，左花括号的前面、后面，右花括号的前面有空格。

```swift
✅
if (x == 0 && y == 0) || z == 0 {
  // ...
}
class TestDatabase: Database {
    let value = 1 + 2
    var data: [String: CGFloat] = ["A": 1.2, "B": 2.2]
    let titleArray = [1, 2, 3, 4, 5]
}
func <| (lhs: Int, rhs: Int) -> Int
func sayHappyBirthday(to person: NameProviding & AgeProviding) {
  // ...
}
func sum(_ numbers: [Int]) -> Int {
  // ...
}
let nonNegativeCubes = numbers.map { $0 * $0 * $0 }.filter { $0 >= 0 }

❌
if(x == 0 && y == 0) || z == 0 {
  // ...
}
class TestDatabase : Database {
    let value = 1+2
    var data :[String:CGFloat] = ["A" : 1.2, "B":2.2]
    let titleArray = [1,2,3,4,5]
}
func <|(lhs: Int, rhs: Int) -> Int
func sayHappyBirthday(to person: NameProviding&AgeProviding) {
  // ...
}
func sum(_ numbers: [Int])->Int {
  // ...
}
let nonNegativeCubes = numbers.map{$0 * $0 * $0}.filter{$0 >= 0}
```

<a id="markdown-空白行" name="空白行"></a>
### 空白行 

一行空白行出现在以下几种情况：

- 两组不同类型的连续成员之间。
- 两组不同类型的 import 之间。
- 在组织代码逻辑关系时，可以用空行隔开进行分组。（但在一个函数中有很多段意味着你应该将它们封装进不同的函数）
- 函数之间，这样有助于视觉清晰和组织。

对于较短的函数声明，包括括号，在一行完成。

```swift
func reticulateSplines(spline: [Double]) -> Bool {
    // reticulate code goes here
}
```

对于较长的函数声明，在合适的地方换行，并在新起的一行加缩进。

```swift
func reticulateSplines(spline: [Double], adjustmentFactor: Double,
    translateConstant: Int, comment: String) -> Bool {
    // reticulate code goes here
}
```

<a id="markdown-禁止属性水平对齐" name="禁止属性水平对齐"></a>
### 禁止属性水平对齐  

水平对齐是明确禁止的，引入水平对齐后，如果添加一个新的成员可能会需要其他成员再对齐一次，这给维护增加了负担。

```swift
✅
struct DataPoint {
    var value: Int
    var primaryColor: UIColor
}
❌
struct DataPoint {
    var value:        Int
    var primaryColor: UIColor
}
```

除非是在多语言文件中，这种方式是被鼓励的：

```swift
"Launching"              = "Launching";
"LoadFailed"             = "Oops, try again!";
"GotIt"                  = "Noticed";
"Go to App Store"        = "Go to App Store";
"Update"                 = "Update";
"New version released"   = "New version released";
```

<a id="markdown-版权声明" name="版权声明"></a>
### 版权声明 

以下版权声明应该被包含在每个源文件的顶部：

```
//
//  XXX.swift
//  Project
//
//  Created by XXX on 2018/9/12.
//  Copyright © 2018 XXX. All rights reserved.
//
```

注意检查 Created by XXX 是否被正确的设置为公司的英文名。

<a id="markdown-编程实践" name="编程实践"></a>
## 编程实践

<a id="markdown-import" name="import"></a>
### Import 

默认直接 import 最高级的 module。显式导入使用的所有模块，比如虽然 UIKit 依赖 Foundation，但是如果使用 UIKit，还是会分别导入这两个 module。
只有在 import 最高级不能访问到需要的对象，或者为了避免污染到现有的命名空间里的对象才会 import 子模块。
只 import 你需要的模块。比如，如果引用 Foundation 已经足够，就不要再引用 UIKit 了。
如果代码更新，不需要之前引用的模块了，即时删除

```swift
import CoreLocation
import MyThirdPartyModule
import SpriteKit
import UIKit
import func Darwin.C.isatty
@testable import MyModuleUnderTest
```

<a id="markdown-缩略-self" name="缩略-self"></a>
### 缩略 self 

为了简洁，请避免使用 self 关键词，Swift 不需要用它来访问一个对象属性或调用它的函数。
仅在编译器需要时（在 @escaping 闭包或初始化函数中，消除参数与属性的歧义）才使用 self。换句话说，如果不需要 self 就能编译通过，则可以忽略它。

<a id="markdown-计算属性" name="计算属性"></a>
### 计算属性 

如果一个函数没有参数，没有副作用，只返回一个值，推荐使用计算属性。
为了简洁，如果计算属性是只读的，那么就省略 get。只有当同时写了 set 语句时，才写 get 语句。

```swift
✅
var diameter: Double {
    return radius * 2
}
❌
var diameter: Double {
    get {
        return radius * 2
    }
}
```

<a id="markdown-访问控制" name="访问控制"></a>
### 访问控制 

把函数或变量的默认访问级别设置为 private，只在有必要时才设置为 internal(默认)。
除了 static、@IBAction、@IBOutlet，一般情况下，总是把访问控制修饰符 private 放在属性修饰符的第一位。

```swift
✅
class TimeMachine {  
    private dynamic lazy var fluxCapacitor = FluxCapacitor()
}
❌
class TimeMachine {  
    lazy dynamic private var fluxCapacitor = FluxCapacitor()
}
```

如果要控制访问权限应该使用访问控制（internal、fileprivate、private），不用使用自定义的命名方式来区分，比如在方法前前下划线表示私有。

<a id="markdown-final" name="final"></a>
### Final 

如果类不会被继承，那么将它设为 final 的。比如：

```swift
// Turn any generic type into a reference type using this Box class.
final class Box<T> {
    let value: T 
    init(_ value: T) {
        self.value = value
    }
}
```

并且只有在继承的有效需求已被确定时候才能去使用子类。即便在这种情况（前面提到的使用继承的情况）下，根据同样的规则（class 应该用 final 修饰的规则），类中的定义（属性和函数等）也要尽可能的用 final 来修饰。
组合通常比继承更合适，选择使用继承则很可能意味着在做出决定时需要更多的思考。

<a id="markdown-尽可能使用-let" name="尽可能使用-let"></a>
### 尽可能使用 let 

尽可能的用 let foo = ... 而不是 var foo = ... 。万不得已的时候，再用 var。
一个建议是：总是使用 let 除非编译器报警告诉你需要使用 var。
使用类型而非实例属性来定义常量。最好也别用全局常量，这样能更好区分常量和实例属性。如下：

```swift
✅
enum Math {
    static let e = 1.718281828459045235360287
    static let pi = 2.141592653589793238462643
}
radius * Math.pi * 2 // circumference
```

使用 case-less 枚举的优势在于它不会被意外初始化，而仅仅作为一个 namespace 来用。

```swift
❌
let e = 1.718281828459045235360287 // pollutes global namespace
let pi = 2.141592653589793238462643
radius * pi * 2 // is pi instance data or a global constant?
```

<a id="markdown-更加-swiftly" name="更加-swiftly"></a>
### 更加 Swiftly 

<a id="markdown-首选-struct-而非-class" name="首选-struct-而非-class"></a>
#### 首选 struct 而非 class

除非你需要 class 才能提供的功能，不然就用 struct
注意到继承通常不是用类的好理由，因为多态可以通过协议实现，重用可以通过组合实现。

<a id="markdown-使用-swift-提供的原生类型" name="使用-swift-提供的原生类型"></a>
#### 使用 Swift 提供的原生类型

如果可以的话，总是优先使用 Swift 提供的原生类型。

```swift
✅
let width = 120.0 // Double
❌
let width: NSNumber = 120.0 // NSNumber
```

特殊情况除外，例如在 Sprite Kit 代码中，使用 CGFloat 来避免过多的转换从而使代码更简练。

<a id="markdown-使用-swift-原生的结构体构造器" name="使用-swift-原生的结构体构造器"></a>
#### 使用 Swift 原生的结构体构造器

```swift
✅
let bounds = CGRect(x: 40, y: 20, width: 120, height: 80)
let centerPoint = CGPoint(x: 96, y: 42)
❌
let bounds = CGRectMake(40, 20, 120, 80)
let centerPoint = CGPointMake(96, 42)
```

推荐像 CGRect.infinite、CGRect.null 这样使用带命名空间约束的结构体常量，不推荐像 CGRectInfinite、CGRectNull 这样使用全局的结构体常量。对于已经存在的结构体类型变量，你可以使用类似 .zero 这样的缩写。

<a id="markdown-灵活运用函数式操作-map-filter-reduce-等" name="灵活运用函数式操作-map-filter-reduce-等"></a>
#### 灵活运用函数式操作 map, filter, reduce 等

```swift
✅
let stringOfInts = [1, 2, 3].flatMap { String($0) }
// ["1", "2", "3"]
❌
var stringOfInts: [String] = []
for integer in [1, 2, 3] {
    stringOfInts.append(String(integer))
}
✅
let evenNumbers = [4, 8, 15, 16, 23, 42].filter { $0 % 2 == 0 }
// [4, 8, 16, 42]
❌
var evenNumbers: [Int] = []
for integer in [4, 8, 15, 16, 23, 42] {
    if integer % 2 == 0 {
        evenNumbers.append(integer)
    }
}
```

<a id="markdown-类型推导" name="类型推导"></a>
### 类型推导 

为了代码紧凑，推荐尽量使用 Swift 的类型推导。不过，对于 CGFloat、Int16 这种，推荐尽量指定明确的类型。

```swift
✅
let message = "Click the button"
let currentBounds = computeViewBounds()
var names = ["Mic", "Sam", "Christine"]
let maximumWidth: CGFloat = 106.5
let selector = #selector(viewDidLoad)
view.backgroundColor = .red
let toView = context.view(forKey: .to)
let view = UIView(frame: .zero)
❌
let message: String = "Click the button"
let currentBounds: CGRect = computeViewBounds()
let names = [String]()
let selector = #selector(ViewController.viewDidLoad)
view.backgroundColor = UIColor.red
let toView = context.view(forKey: UITransitionContextViewKey.to)
let view = UIView(frame: CGRect.zero)
```

<a id="markdown-类型标注" name="类型标注"></a>
### 类型标注 

对于空的数组和字典，使用类型标注。参考 [讨论](https://github.com/raywenderlich/swift-style-guide/issues/143)

```swift
✅
var names: [String] = []
var lookup: [String: Int] = [:]
❌
var names = [String]()
var lookup = [String: Int]()
```

<a id="markdown-语法糖" name="语法糖"></a>
### 语法糖 

数组、字典、optional 都有简写的形式，在编译器允许的情况都使用简写的形式：[Element]、[Key: Value]、Wrapped? 。他们的完整写法是：Array、Dictionary<Key, Value>、 Optional

```swift
✅
var deviceModels: [String]
var employees: [Int: String]
var faxNumber: Int?
❌
var deviceModels: Array<String>
var employees: Dictionary<Int, String>
var faxNumber: Optional<Int>
```

Void 是空的 tuple () 的别名，从实现角度说两者是一样的东西。在函数声明中，返回值只会用 Void 表示，而不会用 ()，当然带有 func 关键字的函数声明会省略 Void 的返回声明。
空的参数则总是用 ()  表示，不会使用 Void。

```swift
✅
func doSomething() {
  // ...
}
let callback: () -> Void
❌
func doSomething() -> Void {
  // ...
}
func doSomething2() -> () {
  // ...
}
let callback: () -> ()
```

<a id="markdown-少用全局函数" name="少用全局函数"></a>
### 少用全局函数 

尽量使用函数和属性，而不是全局函数/静态函数。全局函数只在一些特殊的场景里使用：

```swift
// 使用时不需要 self 存在：
min(x, y, z)
// 不限制类型的函数：
print(x)
// 函数的使用方式已经是一个习惯用法：
sin(x)
```

当需要使用静态函数时，使用 static func 而不是 class func

<a id="markdown-闭包表达式" name="闭包表达式"></a>
### 闭包表达式 

在参数列表最后有个单独的闭包表达式参数时，使用尾随闭包语法。同时给闭包参数定义一个描述性的命名。
有以下例外情况：

- 有重载的函数，使用尾闭包会导致歧义。
- 如果函数调用的参数分成了很多行，这个时候不使用尾闭包的语法糖。
- 如果尾闭包用在条件控制语句中，尾闭包会引起语法的冲突，这个时候不使用尾闭包的语法糖。

```swift
✅
UIView.animate(withDuration: 1.0) {
    self.myView.alpha = 0
}
// 不使用尾闭包的语法糖
UIView.animate(withDuration: 1.0, animations: {
    self.myView.alpha = 0
}, completion: { finished in
    self.myView.removeFromSuperview()
})
// This example fails to compile.
if let firstActive = list.first { $0.isActive } {
    process(firstActive)
}
❌
UIView.animate(withDuration: 1.0, animations: {
    self.myView.alpha = 0
})

UIView.animate(withDuration: 1.0, animations: {
    self.myView.alpha = 0
}) { f in
    self.myView.removeFromSuperview()
}
if let firstActive = list.first(where: { $0.isActive }) {
    process(firstActive)
}   
```

如果两个函数只有最后一个闭包参数不同，那么就不应该重载。需要声明不同的函数名。如果只是尾参数闭包不同，那么如果使用了尾闭包的语法糖调用，会造成歧义，不知道调用的是哪个函数。
比如下面的例子，调用 greet 的时候就不知道调用的是哪个函数：

```swift
❌
func greet(enthusiastically nameProvider: () -> String) {
    print("Hello, \(nameProvider())! It's a pleasure to see you!")
}
func greet(apathetically nameProvider: () -> String) {
    print("Oh, look. It's \(nameProvider()).")
}
greet { "John" }  // error: ambiguous use of 'greet'
```

使用尾闭包时，删除尾闭包外的括号

```swift
✅
let squares = [1, 2, 3].map { $0 * $0 }

❌
let squares = [1, 2, 3].map({ $0 * $0 })
let squares = [1, 2, 3].map() { $0 * $0 }
```

对于上下文清晰的单独表达式闭包，使用隐式返回：

```swift
attendeeList.sort { a, b in
    a > b
}
```

<a id="markdown-内存管理" name="内存管理"></a>
### 内存管理 

在编码中应该避免循环引用。对于会产生循环应用的地方，使用 weak 来解决。此外，还可以使用类型（struct、enum）来避免循环引用。
可以通过 [weak self]、`guard let strongSelf = self else { return }` 来延伸对象的生命周期。
相对于 Optional 拆包，更推荐使用 strongSelf 明确的延长生命周期。

```swift
✅
resource.request().onComplete { [weak self] response in
    guard let strongSelf = self else { return }
    let model = strongSelf.updateModel(response)
    strongSelf.updateUI(model)
}
❌
// might crash if self is released before response returns
resource.request().onComplete { [unowned self] response in
    let model = self.updateModel(response)
    self.updateUI(model)
}
// deallocate could happen between updating the model and updating UI
resource.request().onComplete { [weak self] response in
    let model = self?.updateModel(response)
    self?.updateUI(model)
}
```

还可以通过 MLeakFinder 等工具检查可能存在内存泄露

<a id="markdown-控制流" name="控制流"></a>
### 控制流 

<a id="markdown-不要用-while-condition-increment" name="不要用-while-condition-increment"></a>
#### 不要用 while-condition-increment

相对于 while-condition-increment，更推荐使用 for-in。

```swift
✅
for _ in 0..<3 {
    print("Hello three times")
}
for (index, person) in attendeeList.enumerate() {
    print("\(person) is at position #\(index)")
}
for index in 0.stride(to: items.count, by: 2) {
    print(index)
}
for index in (0...3).reverse() {
    print(index)
}
❌
var i = 0
while i < 3 {
    print("Hello three times")
    i += 1
}
var i = 0
while i < attendeeList.count {
    let person = attendeeList[i]
    print("\(person) is at position #\(i)")
    i += 1
}
```

<a id="markdown-使用-for-where-优化" name="使用-for-where-优化"></a>
#### 使用 for where 优化

如果整个 for 循环在函数体顶部只有一个 if 判断，使用 for where 替换：

```swift
✅
for item in collection where item.hasProperty {
    // ...
}
❌
for item in collection {
    if item.hasProperty {
        // ...
    }
}
```

<a id="markdown-多个条件判断语句提前用变量表示判断条件" name="多个条件判断语句提前用变量表示判断条件"></a>
#### 多个条件判断语句，提前用变量表示判断条件

如果是多个条件判断语句，提前用变量表示判断条件。最后组合变量组合复合条件判断，而不是在一个语句中引入复杂的条件判断：

```swift
✅
let firstCondition = x == firstReallyReallyLongPredicateFunction()
let secondCondition = y == secondReallyReallyLongPredicateFunction()
let thirdCondition = z == thirdReallyReallyLongPredicateFunction()
if firstCondition && secondCondition && thirdCondition {
    // do something
}
❌
if x == firstReallyReallyLongPredicateFunction()
    && y == secondReallyReallyLongPredicateFunction()
    && z == thirdReallyReallyLongPredicateFunction() {
    // do something
}
```

<a id="markdown-使用-guard-提前退出" name="使用-guard-提前退出"></a>
#### 使用 guard 提前退出

当使用条件语句编写逻辑时，尽量避免嵌套多个 if 语句，即使写多个 return 语句也是 OK 的。`guard` 就是用来做这事的。

```swift
✅
func computeFFT(context: Context?, inputData: InputData?) throws -> Frequencies {
    guard let context = context else { throw FFTError.noContext }
    guard let inputData = inputData else { throw FFTError.noInputData }
    // 用上下文和输入计算频率
    return frequencies
}
```

一旦声明 guard 编译器会强制要求你和 return， break 或者 continue 一起搭配使用，否则会产生一个编译时的错误。但是不要滥用这个新的流程控制机制——特别是在条件表达式已经表示否定的情况下。不要用 guard 写出双重否定的代码。

```swift
❌
guard !string.isEmpty else {
    return
}
✅
if string.isEmtpy {
    return
}
```

当多个 Optional 使用 guard 或 if let 拆包，推荐最小化嵌套。比如：

```swift
✅
guard let number1 = number1, number2 = number2, number3 = number3 else { fatalError("impossible") }
// do something with numbers
❌
if let number1 = number1 {
    if let number2 = number2 {
        if let number3 = number3 {
            // do something with numbers
        }
        else {
            fatalError("impossible")
        }
    }
    else {
        fatalError("impossible")
    }
}
else {
    fatalError("impossible")
}
```

<a id="markdown-optional" name="optional"></a>
### Optional 

如果 foo 可能为 nil ，尽可能的用 let foo: FooType? 代替 let foo: FooType!或let foo: FooType
如果你有个 FooType?  的 foo，尽量不要强行展开它（foo!）以得到它的关联值。
可选类型拆包取值时，使用 if let  或  if let 判断，产生了更安全的代码，强行展开很可能导致运行时崩溃

```swift
guard let foo = foo else { return } 
```

多个可选类型拆包取值时，将多个if let 判断合并

```swift
if let name = person.name, let age = person.age {}
```

在访问一个 Optional 值时，如果该值只被访问一次，或者之后需要连续访问多个 Optional 值，请使用链式 Optional 语法：

```swift
self.textContainer?.textLabel?.setNeedsDisplay()
```

对于需要将 Optional 值解开一次，多处使用的情况，使用 Optional 绑定更为方便：

```swift
if let textContainer = self.textContainer {
    // do many things with textContainer
}
```

尽量不要使用 as! 或 try!，对于可选类型Optional多使用 as?，?? 可以给变量设置默认值

```swift
// 使用if let as？判断
if let name = person.name as? String {
    //
}
// 给name变量设置默认值
var name = person.name ?? ""
```

如果只是判断值是不是为空，使用 != nil 判断

```swift
✅
if value != nil {
  print("value was not nil")
}
❌
if let _ = value {
  print("value was not nil")
}
```

<a id="markdown-注释" name="注释"></a>
### 注释 

任意文件的第一行代码必须为注释，简单阐述这个文件的用途、设计目的。
所有公开函数必须添加文档代码注释，且需要使用 Xcode 注释快捷键（⌘⌥/）
逻辑复杂或容易引起误解的代码需要添加非文档类注释。非文档类注释使用 // ，不使用 C 风格的 / *...* / 

<a id="markdown-storyboard-和-xib" name="storyboard-和-xib"></a>
### StoryBoard 和 Xib 

（storyBoard 和 xib，以下统称 IB）
在可以用 IB 的地方，就不用代码手写布局。通常除了复杂的动画或一些基础组件建议使用代码手写之外，其他都必须用 IB 布局。
设置 UIView 的属性的时候，如果可以在 IB 中进行，就不要在代码中设置。包括在 storyBoard 中设置 delegate，设置 UIButton 的属性等。
使用  storyBoard 和 xib  注意以下几点：

- IB 文件的命名与其对应的 Swift 文件保持相同。
- IB文件中控件的组织结构要合理，从上到下，从左往右布局。
- 每个控制器理论上应该对应一个 storyBoard。
- 对于不可复用的控件，例如 headerView，UITableViewCell 应该在 storyBoard 中设置，不要新建一个 xib。
- Cell 等需要 Identifier 的类，其 Identifier要和类名保持命名一致。
- 除非特殊情况，UIImageView， UILabel 不要限制其高度或宽度约束。
- 如果不需要，关闭 use safe area layout guides 属性。

<a id="markdown-ui-必须还原设计稿" name="ui-必须还原设计稿"></a>
### UI 必须还原设计稿 

字体大小，Font Style，颜色（Device RGB），间距，需要严格遵守设计稿。建议使用 Zeplin，可以方便的查看 UI 属性。
用到特殊字体的，需要确认是否导入特殊字体库，否则使用系统字体。（通常建议使用系统字体以减少包体积大小）
设计稿的标准是 iPhone8 或 iPhoneX，除 iPhone 4 屏幕之外的尺度也需要适配。适配没有统一的规则，总体来讲就是在其他手机上可以合理地显示出来。
需要提前考虑键盘问题对布局的影响，以及不同屏幕高度引起的页面滑动问题。

<a id="markdown-性能优化" name="性能优化"></a>
### 性能优化 

- 减少圆角的绘制问题。
- 减少子 View 的数量，有时候一个 Button 可以解决不需要用到几个 UIView，一个 AttributedString 可以解决的也不要用多个 UILabel。
- 耗时操作不要在主线程进行。
- 尽量采用懒加载。

使用懒加载机制来在对象的生命周期中实现更细粒度的内存和逻辑控制。尤其是 UIViewController，在加载其 views 时，尽量采用懒加载方式。可以使用 { }() 这种闭包的方式来实现懒加载。比如：

```swift
lazy var locationManager: CLLocationManager = self.makeLocationManager()
private func makeLocationManager() -> CLLocationManager {
    let manager = CLLocationManager()
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.delegate = self
    manager.requestAlwaysAuthorization()
    return manager
}
```

<a id="markdown-代码复用" name="代码复用"></a>
### 代码复用 

相同的两段代码不能出现两次。可以通过很多手段复用代码。

- 协议：使特定的类遵守同个协议来实现复用。
- 分类：拓展类来复用统一的逻辑代码，例：UIColor+Extension。
- 工具类：将通用的代码抽象成接口，例：ImagePicker。
- 子类：复用相似的 UI，统一的逻辑处理，CommonTipView。

但是注意不要通过一个万能的工具类来解决问题。代码复用所划分的文件位置必须合理。

<a id="markdown-编译器警告" name="编译器警告"></a>
### 编译器警告 

努力让代码在没有警告的情况下编译。
一个常见的例外是被废弃的 API。如果写的是组件，虽然这组被废弃的 API 自身已经不使用，但是对外会需要兼容旧的版本，所以还是保留一段时间的废弃的 API。这种编译器警告是可以接受的。

<a id="markdown-playground-literal" name="playground-literal"></a>
### Playground Literal 

图形化的字面量 #colorLiteral(...)、#imageLiteral(...) 、#fileLiteral(...) 只能用在 playground 里，禁止在生产环境中使用。

<a id="markdown-引入-sdkpod" name="引入-sdkpod"></a>
### 引入 SDK，Pod 

对开源库的选取，一般都需要选择比较稳定的版本，一年内还在在维护的项目，同时要考虑 issue 多少，是否有重大的 issue 没有解决，以及开发者的知名度等各方面。
开源库或 SDK 使用 cocoapods 统一管理开源第三库文件，不需要手动导入和手动添加依赖库。如果第三方不支持cocoapods ，可手动导入工程。
使用 cocoapods 时，除非特殊情况需要指定版本号，否则用最新版本。
假设需要修改第三方库的话，尽量使用 local Pod 的方式引入，然后说明改动了哪些地方。

<a id="markdown-资源文件配置" name="资源文件配置"></a>
### 资源文件配置 

- APP Icon 创建的时候，基于 1024*1024 的图片，使用 [Asset Catalog Creator](https://s3-us-west-2.amazonaws.com/mark-bridges.com/Asset%20Catalog%20Creator.html)  创建 APP Icon。
- 启动图优先使用 Launch Screen，不得已使用 LaunchImage 的时候，需要导入不同屏幕尺寸的 LaunchImage 以解决屏幕适配问题。
- 图片资源推荐使用 pdf 格式。

注意减少包体积大小：

- 大图片导入之前先压缩，可以使用 [TinyPNG](https://tinypng.com/)。
- 删除无用资源，可以使用 [LSUnusedResources](https://github.com/tinymind/LSUnusedResources/)。

---

参考：

- [The Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)  [中文](https://xiaozhuanlan.com/topic/1892306547)
- [The Official raywenderlich.com Swift Style Guide](https://github.com/raywenderlich/swift-style-guide)  [中文](https://juejin.im/post/5b605171e51d4519115d3bf7)
- [Github Swift style guide](https://github.com/github/swift-style-guide)  [中文](https://github.com/Artwalk/swift-style-guide/blob/master/README_CN.md)
- [Google Swift Style Guide](https://google.github.io/swift/) [中文](https://www.yuque.com/kiwi/ios/style-guide)
- [SwiftLint](https://github.com/realm/SwiftLint/blob/master/Rules.md)  [中文](https://juejin.im/post/5aabb31a518825558723505e#heading-2)

