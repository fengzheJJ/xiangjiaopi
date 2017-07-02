//
//  KQTabBarViewController.m
//  Kaoqian3.0
//
//  Created by wihan on 16/4/7.
//  Copyright © 2016年 wihan. All rights reserved.
//

#import "CMTabBarViewController.h"
#import "UIImage+Extension.h"
//#import "CLCHomePageController.h"
//#import "CLCClassRoomController.h"
#import "KQUINavigationViewController.h"
//#import "CLCDiscoverController.h"
//#import "CLCMyProfileController.h"
//#import "Dispatcher+LoginActions.h"
//#import "CLCProductsListController.h"
//#import "CLCClassRoomExamListController.h"

#import "XJMessageViewController.h"
#import "XJGirlPlayViewController.h"
#import "XJMyProfileViewController.h"
#import <UIKit/UIKit.h>

#define kClassName @"学堂"

@interface CMTabBarViewController ()<UITabBarControllerDelegate>
@end

@implementation CMTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加四个子控制器
    XJGirlPlayViewController *homepage = [[XJGirlPlayViewController alloc] init];
    [self addOneChildVc:homepage title:@"美女主播" imageName:@"tab_home_n" selectedImageName:@"tab_home_h"];
    
    XJMessageViewController * newClassRoomVc = [[XJMessageViewController alloc]init];
    [self addOneChildVc:newClassRoomVc title:@"消息" imageName:@"tab_classrm_n" selectedImageName:@"tab_classrm_h"];
    
    XJMyProfileViewController * myProfile = [[XJMyProfileViewController alloc]init];
    [self addOneChildVc:myProfile title:@"我的" imageName:@"tab_my_n" selectedImageName:@"tab_my_h"];
    
    //设置tabbar背景色
//    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kTabBarHeight)];
//    backView.backgroundColor = [UIColor yellowColor];
//    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    
    self.delegate = self;
    
    //去除分割线
//    CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, 49);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
//    CGContextFillRect(context, rect);
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    [self.tabBar setBackgroundImage:img];
//    [self.tabBar setShadowImage:img];
    
//    //确定小红点的位置
//    float percentX = (3 + 0.6) / self.childViewControllers.count;
//    CGFloat x = ceilf(percentX * self.tabBar.frame.size.width);
//    CGFloat y = 4;
//    self.dotImage.frame = CGRectMake(x, y, 10, 10);
//    [self.tabBar addSubview:self.dotImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self removeBackgroundInTabBarButton];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中时的图标
 */
-(void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    //随机设置子控制器的背景颜色
    childVc.view.backgroundColor = [UIColor whiteColor];
    //设置标题
    childVc.title = title;  //相当于设置了后两者的标题
    //设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    //设置选中时的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    
    if (kIOS7) {
        //声明这张图片用原图(别渲染)
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectedImage;
    
    //设置tabbar字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kMyColor(121, 118, 127), NSForegroundColorAttributeName, [UIFont systemFontOfSize:10], NSFontAttributeName, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:                                                         [NSDictionary dictionaryWithObjectsAndKeys:kMyColor(255, 141, 52),NSForegroundColorAttributeName, [UIFont systemFontOfSize:10], NSFontAttributeName, nil]forState:UIControlStateSelected];
    
    //添加为tabbar控制器的子控制器
    KQUINavigationViewController *nav = [[KQUINavigationViewController alloc] initWithRootViewController:childVc];
    
    //添加子控制器到tabbar
    [self addChildViewController:nav];
}

/**
 *  ios6系统下去掉tabbar背景
 */
-(void)removeBackgroundInTabBarButton {
    
    if(kIOS7)
        return;
    for (UIView *child in self.tabBar.subviews) {
        //如果不是UITabBarButton，就过掉
        if (![child isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        BOOL selected = NO;
        
        for (UIView *childchild in child.subviews) {
            if ([childchild isKindOfClass:NSClassFromString(@"UITabBarSelectionIndicatorView")]) {//说明是个选中的背景
                [childchild removeFromSuperview];
                selected = YES;
            }
            
            if ([childchild isKindOfClass:[UILabel class]]) {//说明是个UIlable
                UILabel *label = (UILabel *)childchild;
                if (selected) {//说明这个button选中，设置文字的颜色为橙色
                    label.textColor = [UIColor orangeColor];
                }
                else//说明这个button没有选中，设置label颜色为黑色
                {
                    label.textColor = [UIColor blackColor];
                }
            }
        }
    }
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    [self removeBackgroundInTabBarButton];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
//    if ([viewController.title isEqualToString:kClassName]) {
//        return [self tabBarController:tabBarController willSelectedIndex:1 shouldSelectedVc:viewController];
//    }
    
    return YES;
}

/**
 * 登录拦截处理
 */
- (BOOL)tabBarController:(UITabBarController *)tabBarController willSelectedIndex:(NSInteger)willSelectedIndex   shouldSelectedVc:(UIViewController *)viewController{
    BOOL success = YES;
    return success;
}

/**
 * 不要调用我自己(就是UINavigationController)的preferredStatusBarStyle方法，而是去调用navigationController.topViewController的preferredStatusBarStyle方法，这样写的话，就能保证当前显示的UIViewController的preferredStatusBarStyle方法能影响statusBar的前景部分。
 */
//- (UIViewController *)childViewControllerForStatusBarStyle{
//    
//    return self.topViewController;
//}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskPortrait;//这里返回哪个值，就看你想支持那几个方向了。这里必须和后面plist文件里面的一致（我感觉是这样的）。
}

- (BOOL)shouldAutorotate {
    
    return NO;//支持转屏
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return (interfaceOrientation == UIDeviceOrientationPortrait);
}

@end
