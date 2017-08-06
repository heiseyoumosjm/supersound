//
//  MickeyUITextView.m
//  supersound
//
//  Created by Mickey on 2017/8/6.
//  Copyright © 2017年 Mickey. All rights reserved.
//

#import "MickeyUITextView.h"
@interface MickeyUITextView ()

@property (nonatomic, retain) UILabel *micekyLabel;

@end
@implementation MickeyUITextView
CGFloat const UI_PLACEHOLDER_TEXT_CHANGED_ANIMATION_DURATION = 0.25;

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
#if __has_feature(objc_arc)
#else
    [_sailorLabel release]; _sailorLabel = nil;
    [_placeholderColor release]; _placeholderColor = nil;
    [_placeholder release]; _placeholder = nil;
    [super dealloc];
#endif
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Use Interface Builder User Defined Runtime Attributes to set
    // placeholder and placeholderColor in Interface Builder.
    if (!self.placeholder) {
        [self setPlaceholder:@""];
    }
    
    if (!self.placeholderColor) {
        [self setPlaceholderColor:[UIColor lightGrayColor]];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (id)initWithFrame:(CGRect)frame
{
    if( (self = [super initWithFrame:frame]) )
    {
        [self setPlaceholder:@""];
        [self setPlaceholderColor:[UIColor lightGrayColor]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textChanged:(NSNotification *)notification
{
    if([[self placeholder] length] == 0)
    {
        return;
    }
    
    [UIView animateWithDuration:UI_PLACEHOLDER_TEXT_CHANGED_ANIMATION_DURATION animations:^{
        if([[self text] length] == 0)
        {
            [[self viewWithTag:999] setAlpha:1];
        }
        else
        {
            [[self viewWithTag:999] setAlpha:0];
        }
    }];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

- (void)drawRect:(CGRect)rect
{
    if( [[self placeholder] length] > 0 )
    {
        if (_micekyLabel == nil )
        {
            _micekyLabel = [[UILabel alloc] initWithFrame:CGRectMake(3,8,self.bounds.size.width-6,0)];
            _micekyLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _micekyLabel.numberOfLines = 0;
            _micekyLabel.font = [UIFont systemFontOfSize:14];
            _micekyLabel.backgroundColor = [UIColor clearColor];
            _micekyLabel.textColor = self.placeholderColor;
            _micekyLabel.alpha = 0;
            _micekyLabel.tag = 999;
            [self addSubview:_micekyLabel];
        }
        
        _micekyLabel.text = self.placeholder;
        [_micekyLabel sizeToFit];
        [self sendSubviewToBack:_micekyLabel];
    }
    
    if( [[self text] length] == 0 && [[self placeholder] length] > 0 )
    {
        [[self viewWithTag:999] setAlpha:1];
    }
    
    [super drawRect:rect];
}


@end
