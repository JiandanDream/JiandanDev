# JiandanDev
Xcode templates for JDAppTests which can add unit tests on devices.

本项目是 Xcode 工程模板：JDAppTests，是对 Single View App 模板的修改。

JDAppTests 是对 XCTests 的补充，实质是一个 App 工程，主要用于在真机上进行单元测试，一般用于对 Framework 的测试。

[JDAppTests 详细介绍](https://www.jianshu.com/p/a5cc2c2a0588)

## How To Get Started
Install
```sh
sudo git clone --recursive https://github.com/JiandanDream/JiandanDev.git /opt/JiandanDev
```

Add templates
```sh
ln -sv /opt/JiandanDev/templates ~/Library/Developer/Xcode/Templates/JiandanDev
```

Restart Xcode

## Usage
Add a Target in Xcode and choose `JDAppTests` from the templates.

Xcode 中新建一个 Target，选择 `JDAppTests`，创建一个 App 工程的 Target。

![AddTarget](https://ws4.sinaimg.cn/large/006tNc79gy1fqovyzo9auj30cq0bujsb.jpg)

![CreateJDAppTests](https://ws4.sinaimg.cn/large/006tNc79gy1fqovz8kmzqj30jp08swey.jpg)

Add a `Cocoa Touch Class`, subclass of `JDAppTestCase`.

创建一个类，继承自 JDAppTestCase。

![Subclass](https://ws2.sinaimg.cn/large/006tNc79gy1fqovwoln2gj30ka0emq3l.jpg)

Add methods with prefix `test`.

添加测试方法：必须以 `test` 开头。

e.g.
```objc
//.h
#import "JDAppTestCase.h"

@interface NetRequestAppTests : JDAppTestCase

@end

//.m
#import "NetRequestAppTests.h"

@implementation NetRequestAppTests
- (void)testPOST {
    NSLog(@"POST");
}
@end

```

Run

![Example](https://ws3.sinaimg.cn/large/006tNc79gy1fqov2n91ing308w0hxgym.gif)

Like XCTest, you can add any test methods quickly.

跟 XCTest 类似，添加测试用例时，无需其他修改，可以方便快捷地测试某个方法。