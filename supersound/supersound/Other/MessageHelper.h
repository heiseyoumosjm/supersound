//
//  MessageHelper.h
//  ywyg
//
//  Created by Sailor on 16/2/26.
//  Copyright © 2016年 iSailor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSMessage.h"
#import "TSMessageView.h"
#import "Constants.h"

@interface MessageHelper : NSObject

+(MessageHelper*)messageHelper;

-(void)showMessage:(UIViewController*)vc title:(NSString*)title sub:(NSString*)sub;
-(void)showErrMessage:(UIViewController*)vc title:(NSString*)title sub:(NSString*)sub;
-(void)showWarnMessage:(UIViewController*)vc title:(NSString*)title sub:(NSString*)sub;

-(void)showSuccessMessage:(UIViewController*)vc title:(NSString*)title sub:(NSString*)sub;
-(void)showWarnForShortTime:(UIViewController*)vc title:(NSString*)title sub:(NSString*)sub;


@end
