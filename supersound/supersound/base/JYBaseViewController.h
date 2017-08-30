//
//  JYBaseViewController.h
//  SuperEngineers
//
//  Created by 商佳敏 on 16/4/26.
//  Copyright © 2016年 商佳敏. All rights reserved.

#import <UIKit/UIKit.h>
#import "ProjectMacro.h"
#import "UIImageView+WebCache.h"
#import "UINavigationBar+Awesome.h"
#import "UIButton+WebCache.h"
#import "AppDelegate.h"
#import "MJRefresh.h"
#import "Constants.h"

#define PICTURE_WIDTH_DP   750
#define NAVBAR_CHANGE_POINT 50

@interface JYBaseViewController : UIViewController
{
    CGFloat originY; 
    NSUserDefaults *userDefaults;
}

@property(retain, nonatomic) UIScrollView *scrollView;

// Many pages need a scrollView so that they can show all information.
- (void)initScrollView;
- (void)cancelLoadAlert;
- (void)setBarBackBtnWithoutTitle;

// Left button on the navigation bar.
- (void)addNavigationBarLeftButtonWith: (NSString*)title;
// left button's click event
- (void)respondToLeftButtonClickEvent;

// Navigation bar right button.
- (void)addRightBarButtonWith: (NSString *)title;
- (NSString *)addwatermark:(NSString *)url;
// Responds to click event of right button.
- (void)reactToRightButtonClickEvent;
- (BOOL)isBlankString:(NSString *)string;
// Right button with no title, but a image.
- (void)addRightBarButnWithImage:(UIImage *)image;
- (void)addLeftBarButnWithImage:(UIImage *)image;
// To tell whether user's input is empty or not. (NSString object can call this function~)
- (BOOL) isEmpty:(NSString *) str;

- (void)createLabelWith: (UIColor *)color Font:(UIFont*) font WithSuper:(UIView *)superView Frame: (CGRect)frame Text:(NSString*)text Alignment:(NSTextAlignment)alignment;
- (UILabel*) newLabel: (CGRect)frame Text: (NSString *)text WithView: (UIView *)superView Color: (UIColor *)color Font: (UIFont *)font;

// Show warning message, need user to make a decision!
- (void)showMessageBox:(NSString*)title Message:(NSString*)message;

- (void)showAlertMessage:(NSString *)message showTime:(CGFloat) time;

// Return a button with style like: subjectColor as background color, textColor is white...
// We call it subjectButton.
- (void)addSubjectButtonWith: (CGRect)frame Title:(NSString *)title SuperView:(UIView *)superView Tag:(NSInteger)tag;
// Write down things to do when subjectButton clicked! You can override it as your wish.
- (void)respondToSubjectButonClickEvent: (UIButton *)subjectButton;

// Accordingly, this method returns a button with white background color. Additionally, It has border.
- (void)addWhiteButtonWith: (CGRect)frame Title:(NSString *)title SuperView:(UIView *)superViewe Tag: (NSInteger)tag;
- (void)respondToWhiteButonClickEvent: (UIButton *)whiteButton;

// Init a round imageView, it usually is used to display user's avatar!
- (UIImageView *)newRoundImageView:(CGRect)frame AddToView:(UIView *)superView;


// Cut-off line~ For the interface
- (void)createLineWith: (UIColor *)color Frame: (CGRect)frame Super: (UIView *)superView;

// The max is five stars.
// @Parameter: starAmount is the real amount of stars the doctor or patient has got!
- (void)designStarViewWithAmount: (NSInteger)starAmount AddTo:(UIView *)superView Frame:(CGRect)frame;

- (void)contactThroughPhoneNumber:(NSString *)phoneNumber;

// We need to cauculate the size of a certain piece of words constantly, so we do it here~
- (CGSize)sizeOfText:(NSString *)text Font: (UIFont *)font ConstrictedSize:(CGSize)limitedSize;

// Rescale a image
- (UIImage *)getNewImageFromeImage:(UIImage *)image;


@end
