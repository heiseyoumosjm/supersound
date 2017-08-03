//
//  ProjectMacro.h
//  SuperEngineers
//
//  Created by 商佳敏 on 16/4/26.
//  Copyright © 2016年 商佳敏. All rights reserved.
//

#ifndef IOCDOCForDoctor_ProjectMacro_h
#define IOCDOCForDoctor_ProjectMacro_h

// Define color myself.
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// It is clear that this is height of screen.
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
// Width
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

// The subject color value for our application.
#define SubjectColorValue  0x5fbff9/*x01afb7*/
// Background color value.
#define BackColorValue 0xf8f8f8
// Line's color
#define LineColor 0xcccccc
// Default text color
#define ColorNO1 0x8Ac458
#define ColorNO2 0x191919
#define ColorNO3 0x999999
#define ColorNO4 0xffffff
#define ColorNO5 0x666666
#define ColorNO6 0xcccccc
#define ColorNO7 0xF7B33C
#define ColorNO8 0xEE793D
#define GrayTextColor 0x999999

// Font we adopt
#define AppFont17           [UIFont systemFontOfSize:17]
#define AppFont15           [UIFont systemFontOfSize:15]
#define AppFont16           [UIFont systemFontOfSize:16]
#define AppFont14           [UIFont systemFontOfSize:14]
#define AppFont12           [UIFont systemFontOfSize:12]
#define AppFont10           [UIFont systemFontOfSize:10]
#define AppBoldFont17       [UIFont boldSystemFontOfSize:17]
//颜色（RGB）
#define RGBCOLOR(r,g,b)          [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]];
#define RGBACOLOR(r,g,b,a)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

// NSLog will consume memory and time, so we do not use it when we release our application.
// Below statements can achieve this purpose because when it is on devices, __OPTIMIZE__ are usually defined.
#ifndef __OPTIMIZE__
# define NSLog(...) NSLog(__VA_ARGS__)
#else
# define NSLog(...)
#endif

// Baidu Map AK
#define BAIDU_API_KEY       @"tIbFY22d5EXWa9KFLdLVgGyY"

//--------------------------------------------------------------------------------------------
// Keys for user account, like phone number, nickname, etc.
//--------------------------------------------------------------------------------------------
//#define APP_NET_WORK_ROOT_URL     @"http://www.ibeiliang.com:8080/JiaDian/data/data!"
//#define ProductionPoliceUrl       @"http://www.ibeiliang.com:8080//JiaDian/file/policy/"
//#define imgUrl                    @"http://192.168.12.51:5065/"
//#define imgUrl                    @"http://192.168.12.247:5064/"
//app端，将api前缀设置为：http://api.comaking.net，
//将图片前缀设置为http://seller.comaking.net，
//将webview前缀设置为http://seller.comaking.net
//#define imgUrl                      @"http://120.26.55.28:6064/"
  #define imgUrl                      @"http://dev.image.alimmdn.com"
  #define linkUrl                     @"www.comaking.net/"
//#define imgUrl                        @"http://cjgcs-dev.image.alimmdn.com/"

#endif
