//
//  KQUINavigationViewController.m
//  Kaoqian3.0
//
//  Created by wihan on 16/4/7.
//  Copyright © 2016年 wihan. All rights reserved.
//

#import "KQUINavigationViewController.h"

@interface KQUINavigationViewController ()

@end

@implementation KQUINavigationViewController

#pragma mark – life cycle
/**
 *第一次调用类的时候会调用一次该方法
 */
+ (void)initialize {
    //设置UIBarButtonItem的主题
    [self setupBarButtonItemTheme];
    
    //设置UINavigationBar的主题
    [self setupNavigationBarTheme];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark – private function
/**
 *设置UINavigationBar的主题
 */
+ (void)setupNavigationBarTheme {
    
    //通过设置appearance对象，能够修改整个项目中所有UINavigationBar的样式
    UINavigationBar *appearance = [UINavigationBar appearance];
    
    //设置导航栏的背景
    if (kIOS7) {
        
        //        appearance.barTintColor = kMyColor(55, 172, 238);
        //        [appearance setBackgroundImage:[UIImage imageNamed:@"nav_home_topbar"] forBarMetrics:UIBarMetricsDefault];
        
        [appearance setBackgroundImage:[UIImage imageNamed:@"pic_top"]
                        forBarPosition:UIBarPositionAny
                            barMetrics:UIBarMetricsDefault];
        
        [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    }
    
    //设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //设置字体颜色
    textAttrs[NSForegroundColorAttributeName] = kMyColor(0, 0, 0);
    //设置字体
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
    [appearance setTitleTextAttributes:textAttrs];
    [appearance setTranslucent:NO];
}

/**
 *设置UIBarButtonItem的主题
 */
+ (void)setupBarButtonItemTheme {
    
    //通过设置appearance对象，能够修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    //设置文字的属性
    //1.设置普通状态下文字的属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //设置字体
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    //设置颜色为橙色
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //2.设置高亮状态下文字的属性
    NSMutableDictionary *hightextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    //设置颜色为红色
    hightextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [appearance setTitleTextAttributes:hightextAttrs forState:UIControlStateHighlighted];
    
    //3.设置不可用状态下文字的属性
    NSMutableDictionary *disabletextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    //设置颜色为灰色
    disabletextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disabletextAttrs forState:UIControlStateDisabled];
    
    //设置背景
    [appearance setBackButtonBackgroundImage:[UIImage imageWithName:@"btn_back_nor"]forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

#pragma mark – overload

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    //如果现在push的不是栈顶控制器，那么久隐藏tabbar工具条
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        //拦截push操作，设置导航栏的左上角和右上角按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"btn_back_nor" highImageName:@"btn_back_pre" target:self action:@selector(back)];
    }
    
    //增加自定义返回键后，手势返回上一级
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //        self.interactivePopGestureRecognizer.delegate = nil;
        //        self.interactivePopGestureRecognizer.enabled = YES;
    }
    
    [super pushViewController:viewController animated:YES];
}

/**
 * 不要调用我自己(就是UINavigationController)的preferredStatusBarStyle方法，而是去调用navigationController.topViewController的preferredStatusBarStyle方法，这样写的话，就能保证当前显示的UIViewController的preferredStatusBarStyle方法能影响statusBar的前景部分。
 */
- (UIViewController *)childViewControllerForStatusBarStyle{
    
    return self.topViewController;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskPortrait|UIInterfaceOrientationMaskPortraitUpsideDown;//这里返回哪个值，就看你想支持那几个方向了。这里必须和后面plist文件里面的一致（我感觉是这样的）。
}

- (BOOL)shouldAutorotate {
    
    return NO;//支持转屏
}

#pragma mark – overload

- (UIStatusBarStyle)preferredStatusBarStyle
{
    //Status bar 字体白色
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    //返回NO表示要显示，返回YES将hiden
    return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return (interfaceOrientation == UIDeviceOrientationPortrait);
}


#pragma mark – event response
- (void)back {

    [self popViewControllerAnimated:YES];
}


@end
