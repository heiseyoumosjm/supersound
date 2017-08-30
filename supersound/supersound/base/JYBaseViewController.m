//
//  JYBaseViewController.m
//  SuperEngineers
//
//  Created by 商佳敏 on 16/4/26.
//  Copyright © 2016年 商佳敏. All rights reserved.

#import "JYBaseViewController.h"
#import "MBProgressHUD.h"

@interface JYBaseViewController () <UIScrollViewDelegate,MBProgressHUDDelegate>

@property (nonatomic, strong)MBProgressHUD *mbProgressHUD;

@end

@implementation JYBaseViewController

- (void) dealloc
{
    self.scrollView = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = UIColorFromRGB(BackColorValue);
    userDefaults = [NSUserDefaults standardUserDefaults];
    originY = 0.0;
}

- (void)initScrollView
{
    UIScrollView *theScrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-48)];
    theScrollView.contentSize = CGSizeMake(ScreenWidth, ScreenHeight+2000); // The initial contentSize of scrollView, it will change later!
    theScrollView.backgroundColor = UIColorFromRGB(BackColorValue);
    theScrollView.delegate = self;
    [self.view addSubview:theScrollView];
     self.scrollView = theScrollView;
    self.scrollView.showsVerticalScrollIndicator = FALSE;
    self.scrollView.showsHorizontalScrollIndicator = FALSE;
    [theScrollView release];
}

// We do not need a title for the left back button~
// It works out in the next pushed view controller.
- (void)setBarBackBtnWithoutTitle
{
    UIBarButtonItem *goBackBtnItem = [[UIBarButtonItem alloc]init];
    goBackBtnItem.title = @"";
    self.navigationItem.backBarButtonItem = goBackBtnItem;
    [goBackBtnItem release];
}

// Left bar button on the navigation~
- (void)addNavigationBarLeftButtonWith:(NSString *)title
{
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain
                                                                 target:self action:@selector(respondToLeftButtonClickEvent)];
    [leftButtonItem setTintColor: [UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    [leftButtonItem release];
}

- (void)respondToLeftButtonClickEvent
{
}

- (NSString *)addwatermark:(NSString *)url
{
    return [NSString stringWithFormat:@"%@%s",url,"@!600"];
}
// Navigation bar right button.
- (void)addRightBarButtonWith: (NSString *)title
{
    // Responds to click event.
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain
                                                                 target:self action:@selector(reactToRightButtonClickEvent)];
    [rightItem setTintColor: [UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightItem release];
}

- (void)addRightBarButnWithImage:(UIImage *)image
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(reactToRightButtonClickEvent) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button release];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    [rightBarButton release];
}

// Responds to click event of right button.
- (void)reactToRightButtonClickEvent
{
    
}
- (void)addLeftBarButnWithImage:(UIImage *)image
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(reactToLeftButtonClickEvent) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button release];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    [leftBarButton release];
}
- (void)reactToLeftButtonClickEvent
{
    
}

- (BOOL) isEmpty:(NSString *) str {
    
    if (!str) {
        return YES;
    } else {
        //A character set containing only the whitespace characters space (U+0020) and tab (U+0009) and the newline and nextline characters (U+000A–U+000D, U+0085).
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        //Returns a new string made by removing from both ends of the receiver characters contained in a given character set.
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return YES;
        } else {
            return NO;
        }
    }
}

// Create label without any further operation.
- (void)createLabelWith: (UIColor *)color Font:(UIFont*) font WithSuper:(UIView *)superView Frame: (CGRect)frame Text:(NSString*)text Alignment:(NSTextAlignment)alignment
{
    UILabel *myLabel = [[UILabel alloc] initWithFrame:frame];
    myLabel.textColor = color;
    myLabel.textAlignment = alignment;
    myLabel.text = text;
    myLabel.font = font;
    myLabel.numberOfLines = 0;
    myLabel.backgroundColor = [UIColor clearColor];
    [superView addSubview: myLabel];
    [myLabel release];
}

// When we need to do further operation on a label(change its color, hide it or modify its text, etc.),
// we must return it to a global variable.
//
- (UILabel*) newLabel: (CGRect)frame Text: (NSString *)text WithView: (UIView *)superView Color: (UIColor *)color Font: (UIFont *)font
{
    UILabel *promptLabel = [[UILabel alloc] initWithFrame:frame];
    promptLabel.text = text;
    promptLabel.textColor = color;
    promptLabel.font = font;
    promptLabel.backgroundColor = [UIColor clearColor];
    [superView addSubview:promptLabel];
    return promptLabel;
}

- (void)showMessageBox:(NSString*)title Message:(NSString*)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:self  cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
        [alertView release];
    });
}

//隐藏
- (void)cancelLoadAlert
{
    if (self.mbProgressHUD) {
        [self.mbProgressHUD removeFromSuperview];
        [self.mbProgressHUD hide:YES];
        self.mbProgressHUD = nil;
    }
}
// *********************************************************************************************************************************
// Buttons with specified style.
// *********************************************************************************************************************************
- (void)addSubjectButtonWith:(CGRect)frame Title:(NSString *)title SuperView:(UIView *)superView Tag:(NSInteger)tag
{
    UIButton *subjectButton = [[UIButton alloc] initWithFrame:frame];
    subjectButton.titleLabel.font = AppBoldFont17;
    subjectButton.tag = tag;
    subjectButton.backgroundColor = UIColorFromRGB(SubjectColorValue);
    subjectButton.layer.cornerRadius = 4;
    [subjectButton setTitle:title forState:UIControlStateNormal];
    [subjectButton setTitleColor: UIColorFromRGB(0x333333) forState:UIControlStateNormal];
    [subjectButton setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateHighlighted];
    [subjectButton addTarget:self action:@selector(respondToSubjectButonClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview: subjectButton];
    [subjectButton release];
}
// Override it if needed~
- (void)respondToSubjectButonClickEvent:(UIButton *)subjectButton
{}

- (void)addWhiteButtonWith:(CGRect)frame Title:(NSString *)title SuperView:(UIView *)superView Tag:(NSInteger)tag
{
    UIButton *whiteButton = [[UIButton alloc] initWithFrame:frame];
    whiteButton.titleLabel.font = AppBoldFont17;
    whiteButton.tag = tag;
    whiteButton.backgroundColor = [UIColor whiteColor];
    whiteButton.layer.cornerRadius = 4;
    whiteButton.layer.borderColor = [UIColorFromRGB(SubjectColorValue) CGColor];
    whiteButton.layer.borderWidth = 0.5;
    [whiteButton setTitle:title forState:UIControlStateNormal];
    [whiteButton setTitleColor: UIColorFromRGB(SubjectColorValue) forState:UIControlStateNormal];
    [whiteButton setTitleColor:[UIColor colorWithRed:23/255 green:145/255 blue:166/255 alpha:0.5] forState:UIControlStateHighlighted];
    [whiteButton addTarget:self action:@selector(respondToWhiteButonClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview: whiteButton];
    [whiteButton release];
}
// Override it if needed~1791a6
- (void)respondToWhiteButonClickEvent:(UIButton*)whiteButton
{}

- (UIImageView *)newRoundImageView:(CGRect)frame AddToView:(UIView *)superView
{
    UIImageView *roundImageView = [[UIImageView alloc] initWithFrame:frame];
    roundImageView.backgroundColor = [UIColor clearColor];
    roundImageView.layer.cornerRadius = frame.size.height/2; // That's the way we make it a circle!
    [roundImageView setContentScaleFactor:[[UIScreen mainScreen] scale]]; // Retina or normal. They are different!
    roundImageView.contentMode = UIViewContentModeScaleAspectFill;
    roundImageView.autoresizingMask = UIViewAutoresizingNone;
    roundImageView.clipsToBounds = YES;
    [superView addSubview:roundImageView];
    
    return roundImageView;
}

// Cut-off line~ For the interface
- (void)createLineWith: (UIColor *)color Frame: (CGRect)frame Super: (UIView *)superView
{
    UIView *line = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = color;
    [superView addSubview:line];
    [line release];
}

// The max is five stars.
// @Parameter: starAmount is the real amount of stars the doctor has got!
// The size of a single star is 12 x 12.
- (void)designStarViewWithAmount: (NSInteger)starAmount AddTo:(UIView *)superView Frame:(CGRect)frame
{
    if (starAmount > 5 || starAmount < 0) return;   // It is impossible there are more than five or fewer than zero stars;
    // Else, show the stars with the help of a for loop.
    for (NSUInteger index = 0; index < starAmount; ++index) {
        frame.origin.x += 12;
        UIImageView *singleStarView = [[UIImageView alloc] initWithFrame:frame];
        singleStarView.image = [UIImage imageNamed:@"star.png"];
        [superView addSubview:singleStarView];
        [singleStarView release];
    }
    // Empty stars the doctor hasn't got.
    for (NSUInteger index = starAmount; index < 5; ++index) {
        frame.origin.x += 12;
        UIImageView *singleStarView = [[UIImageView alloc] initWithFrame:frame];
        singleStarView.image = [UIImage imageNamed:@"star_empty.png"];
        [superView addSubview:singleStarView];
        [singleStarView release];
    }
}

// To call us.
- (void)contactThroughPhoneNumber:(NSString *)phoneNumber
{
    NSMutableString *hotlineStr = [[NSMutableString alloc]initWithString:
                                   [NSString stringWithFormat:@"tel:%@", phoneNumber]];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:hotlineStr]]];
    [self.view addSubview:callWebview];
    [callWebview release];
    [hotlineStr release];
}

- (CGSize)sizeOfText:(NSString *)text Font:(UIFont *)font ConstrictedSize:(CGSize)limitedSize
{
    NSDictionary *textDic = @{NSFontAttributeName: font};
    CGSize descriptionSize = [text boundingRectWithSize:limitedSize options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:textDic context:nil].size;
    return descriptionSize;
}

/*
 The original photo we take with iPhone may be a little too large which
 */
- (UIImage *)getNewImageFromeImage:(UIImage *)image
{
    CGFloat imgWidth = PICTURE_WIDTH_DP;
    CGFloat imgHeight = imgWidth * image.size.height / image.size.width;
    UIImage  *newImage = [self imageWithImageSimple:image scaledToSize:CGSizeMake(imgWidth, imgHeight)];
    return newImage;
}

// Show alert message.
- (void)showAlertMessage:(NSString *)message showTime:(CGFloat) time
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText = message;
    HUD.mode = MBProgressHUDModeText;
    HUD.delegate = self;
    //指定距离中心点的X轴和Y轴的偏移量，如果不指定则在屏幕中间显示
    //    HUD.yOffset = 150.0f;
    //    HUD.xOffset = 100.0f;
    
    [HUD show:YES];
    [HUD hide:YES afterDelay:time];
}
//处理照片尺寸
- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)isBlankString:(NSString *)string
{
    if (string == nil || string == NULL)
    {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)
    {
        return YES;
    }
    return NO;
}
@end
