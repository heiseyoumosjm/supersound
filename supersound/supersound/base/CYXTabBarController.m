//
//  CYXTabBarController.m
//   
//
//  Created by Macx on 15/9/4.
//  Copyright (c) 2015年 CYX. All rights reserved.
//

#import "CYXTabBarController.h"
#import "InformationExpressViewController.h"
#import "TrainingMeetingViewController.h"
#import "ExpertSupportViewController.h"
#import "StudyGardenViewController.h"
#import "OtherViewController.h"
#import "CYXNavigationController.h"
#import "ProjectMacro.h"
//#import "PublishViewController.h"
//#import "NewsViewController.h"
//#import "MineViewController.h"
//#import "NewHomeViewController.h"
//#import "CYXNavigationController.h"
//#import "AppDelegate.h"
//#import "NewMineViewController.h"
//#import "ChoosePublishCategoryViewController.h"
@interface CYXTabBarController ()<UITabBarControllerDelegate,UITabBarDelegate>
{
    NSInteger selectedItem;
}
@end

@implementation CYXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.delegate=self;
     self.tabBar.translucent = NO;
    [self setUpAllChildViewController];

}

/**
 *  添加所有子控制器
 */
- (void)setUpAllChildViewController{
    // 1.添加第一个控制器
    /*添加子控制器 */
    /** 首页 */
    [self setUpChildControllerWith:[[InformationExpressViewController alloc]init] norImage:[UIImage imageNamed:@"tabBar_0"] selImage:[UIImage imageNamed:@"tabBar_0_on"] title:@"信息快递"];
    
    /** 发布 */
    [self setUpChildControllerWith:[[TrainingMeetingViewController alloc] init] norImage:[UIImage imageNamed:@"tabBar_1"] selImage:[UIImage imageNamed:@"tabBar_1_on"]title:@"培训会议"];
    
    /** 消息 */
    [self setUpChildControllerWith:[[ExpertSupportViewController alloc]init] norImage:[UIImage imageNamed:@"tabBar_2"] selImage:[UIImage imageNamed:@"tabBar_2_on"] title:@"专家支持"];
    
    /** 我的 */
    [self setUpChildControllerWith:[[StudyGardenViewController alloc] init] norImage:[UIImage imageNamed:@"tabBar_3"] selImage:[UIImage imageNamed:@"tabBar_3_on"] title:@"学习园地"];
    
    /** 我的 */
    [self setUpChildControllerWith:[[OtherViewController alloc] init] norImage:[UIImage imageNamed:@"tabBar_4"] selImage:[UIImage imageNamed:@"tabBar_4_on"] title:@"其他"];


    
//    // 4.添加第4个控制器
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"CYXFourViewController" bundle:nil];
//    
//    MineViewController *fourVC = [storyBoard instantiateInitialViewController];
////    CYXFourViewController *fourVC = [[CYXFourViewController alloc]init];
//
//    [self setUpOneChildViewController:fourVC image:[UIImage imageNamed:@"user"] title:@"设置"];
}
///**
// *  创建会话列表页面
// */
//- (YWConversationListViewController *)exampleMakeConversationListControllerWithSelectItemBlock:(YWConversationsListDidSelectItemBlock)aSelectItemBlock
//{
//    YWConversationListViewController *result = [[AppDelegate sharedAppDelegate].ywIMKit makeConversationListViewController];
//    
//    [result setDidSelectItemBlock:aSelectItemBlock];
//    
//    return result;
//}
///*
//*  打开某个会话
//*/
//- (void)exampleOpenConversationViewControllerWithConversation:(YWConversation *)aConversation fromNavigationController:(UINavigationController *)aNavigationController
//{
//    __block YWConversationViewController *alreadyController = nil;
//    [aNavigationController.viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        if ([obj isKindOfClass:[YWConversationViewController class]]) {
//            YWConversationViewController *c = obj;
//            if (aConversation.conversationId && [c.conversation.conversationId isEqualToString:aConversation.conversationId]) {
//                alreadyController = c;
//                *stop = YES;
//            }
//        }
//    }];
//    
//    if (alreadyController) {
//        /// 必须判断当前是否已有该会话，如果有，则直接显示已有会话
//        /// @note 目前IMSDK不允许同时存在两个相同会话的Controller
//        [aNavigationController popToViewController:alreadyController animated:YES];
//        [aNavigationController setNavigationBarHidden:NO];
//        return;
//    } else {
//        YWConversationViewController *conversationController = [[AppDelegate sharedAppDelegate].ywIMKit makeConversationViewControllerWithConversationId:aConversation.conversationId];
//        
//        __weak typeof(conversationController) weakController = conversationController;
//        [conversationController setViewWillAppearBlock:^(BOOL aAnimated) {
//            [weakController.navigationController setNavigationBarHidden:NO animated:aAnimated];
//        }];
//        
//        [aNavigationController pushViewController:conversationController animated:YES];
//        
//    }
//}
/**
 *  添加一个子控制器的方法
 */
//- (void)setUpOneChildViewController:(UIViewController *)viewController image:(UIImage *)image title:(NSString *)title{
//    
//    CYXNavigationController *navC = [[CYXNavigationController alloc]initWithRootViewController:viewController];
//    navC.title = title;
//    navC.tabBarItem.image = image;
//    [navC.navigationBar setBackgroundImage:[UIImage imageNamed:@"commentary_num_bg"] forBarMetrics:UIBarMetricsDefault];
//    viewController.navigationItem.title = title;
//    
//    [self addChildViewController:navC];
//}
- (void)setUpChildControllerWith:(UIViewController *)childVc norImage:(UIImage *)norImage selImage:(UIImage *)selImage title:(NSString *)title
{
    CYXNavigationController *nav = [[CYXNavigationController alloc] initWithRootViewController:childVc];
    
    childVc.title = title;
    childVc.tabBarItem.image = [norImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置 tabbarItem 选中状态的图片(不被系统默认渲染,显示图像原始颜色)
//    UIImage *imageHome = [UIImage imageNamed:selectedImage];
    selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [childVc.tabBarItem setSelectedImage:selImage];

//    childVc.tabBarItem.selectedImage = selImage;
    
    // 设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
    NSDictionary *dictHome = [NSDictionary dictionaryWithObject:UIColorFromRGB(SubjectColorValue) forKey:NSForegroundColorAttributeName];
    [childVc.tabBarItem setTitleTextAttributes:dictHome forState:UIControlStateSelected];
    
    [self addChildViewController:nav];
    
}


//* 抽取成一个方法
//* 传入控制器、标题、正常状态下图片、选中状态下图片
//* 直接调用这个方法就可以了
//*/
- (void)controller:(UIViewController *)controller Title:(NSString *)title tabBarItemImage:(NSString *)image tabBarItemSelectedImage:(NSString *)selectedImage
{
    controller.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:image];
    // 设置 tabbarItem 选中状态的图片(不被系统默认渲染,显示图像原始颜色)
    UIImage *imageHome = [UIImage imageNamed:selectedImage];
    imageHome = [imageHome imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [controller.tabBarItem setSelectedImage:imageHome];
    // 设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
    NSDictionary *dictHome = [NSDictionary dictionaryWithObject:[UIColor orangeColor] forKey:NSForegroundColorAttributeName];
    [controller.tabBarItem setTitleTextAttributes:dictHome forState:UIControlStateSelected];
}

@end
