//
//  MickeyUITextView.h
//  supersound
//
//  Created by Mickey on 2017/8/6.
//  Copyright © 2017年 Mickey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MickeyUITextView : UITextView
@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

- (void)textChanged:(NSNotification*)notification;

@end
