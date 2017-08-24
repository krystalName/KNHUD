# KNHUD


### 先看效果图

![](https://github.com/krystalName/KNHUD/blob/master/HUD.gif)

#### 实现很简单，用的是系统自带的转菊花动画

##### 使用代码如下

``` objc

#import "UIView+KnHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //第一个参数是描叙， 第二个是允许用户交互。 第三个是显示时间
    [self.view KNHUDShow:@"正在加载" userInteraction:YES afterDelay:15];
}

```
#### 消失也是一句话

``` objc
    [self.view KNHUDDismiss];
```

## 觉得不错。 可以给一颗星鼓励一下。。 感谢各位
