//
//  MessageHelper.m
//  ywyg
//
//  Created by Sailor on 16/2/26.
//  Copyright © 2016年 iSailor. All rights reserved.
//

#import "MessageHelper.h"

@implementation MessageHelper

+(MessageHelper*)messageHelper
{
    static MessageHelper *messageHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        messageHelper = [[MessageHelper alloc] init];
    });
    return messageHelper;
}

-(void)showMessage:(UIViewController*)vc title:(NSString*)title sub:(NSString*)sub
{
    [TSMessage showNotificationInViewController:vc
                                          title:title
                                       subtitle:sub
                                           type:TSMessageNotificationTypeMessage
                                       duration:2.0];
}

-(void)showErrMessage:(UIViewController*)vc title:(NSString*)title sub:(NSString*)sub
{
    [TSMessage showNotificationInViewController:vc.navigationController
                                          title:title
                                       subtitle:sub
                                          image:nil
                                           type:TSMessageNotificationTypeError
                                       duration:TSMessageNotificationDurationAutomatic
                                       callback:nil
                                    buttonTitle:nil
                                 buttonCallback:nil
                                     atPosition:TSMessageNotificationPositionNavBarOverlay
                           canBeDismissedByUser:YES];
}

-(void)showWarnMessage:(UIViewController*)vc title:(NSString*)title sub:(NSString*)sub;
{
    [TSMessage showNotificationInViewController:vc
                                          title:title
                                       subtitle:sub
                                           type:TSMessageNotificationTypeWarning
                                       duration:2.0];
}

-(void)showSuccessMessage:(UIViewController*)vc title:(NSString*)title sub:(NSString*)sub
{
    [TSMessage showNotificationInViewController:vc
                                          title:title
                                       subtitle:sub
                                           type:TSMessageNotificationTypeSuccess
                                       duration:4.0];
}

-(void)showWarnForShortTime:(UIViewController*)vc title:(NSString*)title sub:(NSString*)sub
{
    [TSMessage showNotificationInViewController:vc.navigationController
                                          title:title
                                       subtitle:sub
                                          image:nil
                                           type:TSMessageNotificationTypeWarning
                                       duration:2.0
                                       callback:nil
                                    buttonTitle:nil
                                 buttonCallback:nil
                                     atPosition:TSMessageNotificationPositionNavBarOverlay
                           canBeDismissedByUser:YES];
}

@end
