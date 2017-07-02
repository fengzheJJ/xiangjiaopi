//
//  XJGirlPlayViewController.m
//  xiangjiaopi
//
//  Created by 邓汉森 on 2017/7/1.
//  Copyright © 2017年 appstore@dongao.com. All rights reserved.
//

#import "XJGirlPlayViewController.h"
#import "ZJScrollPageView.h"
#import "XJHotViewController.h"
#import "XJFollowViewController.h"
#import "XJNewPersonViewController.h"


@interface XJGirlPlayViewController ()<ZJScrollPageViewDelegate>

@property (nonatomic,strong)ZJScrollPageView * pageView;

@property (nonatomic,strong)NSArray *titles;
/**
 首页滑动条风格样式
 */
@property (strong, nonatomic) ZJSegmentStyle *indexStyle;
@end

@implementation XJGirlPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupScrollView];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)setupScrollView{
    
    if (!_pageView) {
        _pageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width,self.view.bounds.size.height -20)
                                               segmentStyle:self.indexStyle
                                                     titles:self.titles
                                       parentViewController:self delegate:self];
        [_pageView setSelectedIndex:0 animated:YES];
//        [self.view insertSubview:_pageView belowSubview:self.toolView];
        [self.view addSubview:_pageView];
    }
}

#pragma mark - scrollView delegate
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}


- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    
    UIViewController<ZJScrollPageViewChildVcDelegate> * childVc = nil;
    if (index == 0) {
        childVc = [[XJHotViewController alloc]init];
    } else if (index == 1){
        childVc = [[XJNewPersonViewController alloc]init];
    } else{
        childVc = [[XJFollowViewController alloc]init];
    }
    return childVc;
}
- (NSArray *)titles{
    
    if (!_titles) {
        _titles = [NSArray arrayWithObjects:@"热门",@"新人", @"关注", nil];
    }
    return _titles;
}
/**
 首页风格样式
 
 @return 首页风格
 */
- (ZJSegmentStyle *)indexStyle
{
    if (!_indexStyle) {
        _indexStyle = [[ZJSegmentStyle alloc] init];
        //显示滚动条
        _indexStyle.showLine = YES;
        _indexStyle.scaleTitle = YES;
        _indexStyle.scrollTitle = YES;
        _indexStyle.adjustCoverOrLineWidth = NO;
        _indexStyle.autoAdjustTitlesWidth = YES;
        _indexStyle.adjustTitleWhenBeginDrag = YES;
        _indexStyle.titleFont = [UIFont boldSystemFontOfSize:18];
        _indexStyle.normalTitleColor = [UIColor colorWithRed:121/255.0 green:118/255.0 blue:127/255.0 alpha:1.0];
        _indexStyle.selectedTitleColor = [UIColor colorWithRed:255.0/255.0 green:141/255.0 blue:52/255.0 alpha:1.0];
        _indexStyle.scrollLineColor = [UIColor colorWithRed:255.0/255.0 green:141/255.0 blue:52/255.0 alpha:1.0];
        // 颜色渐变
        _indexStyle.gradualChangeTitleColor = YES;
        _indexStyle.scrollLineWidth = 15.f;
        _indexStyle.showExtraButton = NO;
        _indexStyle.titleAlignmentStyle = TitleAlignmentStyleCenter;
        _indexStyle.titleMargin = 20.f;
        _indexStyle.extraBtnBackgroundImageName = @"btn_nav_menu.png";
    }
    
    return _indexStyle;
}

@end
