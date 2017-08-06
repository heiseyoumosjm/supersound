//
//  Constants.h
//  ywyg
//
//  Created by Sailor on 16/2/26.
//  Copyright © 2016年 iSailor. All rights reserved.
//

#import <Foundation/Foundation.h>


#define wtdAppDelegate (AppDelegate *)[[UIApplication sharedApplication] delegate]

#ifdef DEBUG
#define FLOG(fmt,...)    NSLog((@"[%@][%d] " fmt),[[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,##__VA_ARGS__)
#else
#define FLOG(str, args...) ((void)0)
#endif

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define NavBarFrame self.navigationController.navigationBar.frame

//Bar尺寸
//NavBar高度
#define NavigationBar_HEIGHT 64
//TabBar高度
#define TabBar_HEIGHT 44
//UserView高度
#define UserView_HEIGHT 75
//头像高度
#define HeadImage_HEIGHT 60

//获取版本
#define appBuild [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] integerValue]

//颜色
//主色调
#define colorHome [UIColor colorWithRed:58/255.0 green:148/255.0 blue:240/255.0 alpha:1]
#define colorHomeLeftButton [UIColor colorWithRed:248.0/255.0 green:24.0/255.0 blue:8.0/255.0 alpha:1.0]
#define colorHomeRightButton [UIColor colorWithRed:254.0/255.0 green:195.0/255.0 blue:13.0/255.0 alpha:1.0]

#define colorLetterGray [UIColor colorWithRed:169.0/255.0 green:183.0/255.0 blue:183.0/255.0 alpha:1.0]
#define colorIconGray [UIColor colorWithRed:183.0/255.0 green:183.0/255.0 blue:183.0/255.0 alpha:1.0]
#define colorGray [UIColor colorWithRed:231.0/255.0 green:231.0/255.0 blue:231.0/255.0 alpha:1.0]
#define colorUserGray [UIColor colorWithRed:150.0/255.0 green:150.0/255.0 blue:150.0/255.0 alpha:1.0]

#define colorTitleLetter [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]
#define colorNatureLetter [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0]
#define colorNewsWireLetter [UIColor colorWithRed:205.0/255.0 green:205.0/255.0 blue:205.0/255.0 alpha:1.0]
#define colorIntroduceLetter [UIColor colorWithRed:85.0/255.0 green:85.0/255.0 blue:85.0/255.0 alpha:1.0]

#define colorPlaceholder [UIColor colorWithRed:189.0/255.0 green:189.0/255.0 blue:195.0/255.0 alpha:1.0]

#define colorEnterButton [UIColor colorWithRed:78.0/255.0 green:235.0/255.0 blue:149.0/255.0 alpha:1.0]
//聊天表情背景
#define MoreViewBackgroundColor [UIColor colorWithRed:240 / 255.0 green:242 / 255.0 blue:247 / 255.0 alpha:1.0]

//ItemName
extern NSString * const HomeItemName;
extern NSString * const ThemeItemName;
extern NSString * const UserItemName;

//User页面信息
extern NSString * const PackCellName;
extern NSString * const HistoryCellName;
extern NSString * const IssueCellName;
extern NSString * const RegardCellName;
extern NSString * const HelpCellName;
extern NSString * const AboutCellName;
extern NSString * const QuitCellName;
extern NSString * const ApplyCellName;

//邀请好友
extern NSString * const LetterWxBery;
extern NSString * const LetterWxHail;
extern NSString * const LetterQQ;
extern NSString * const LetterWb;

//Search提示内容
extern NSString * const SearchBarPlaceholder;;

//弹出框
extern NSInteger const numberOfItemsInRow;

//加载与刷新
extern NSString * const headerPullToRefreshText;
extern NSString * const headerReleaseToRefreshText;
extern NSString * const headerRefreshingText;

extern NSString * const footerPullToRefreshText;
extern NSString * const footerReleaseToRefreshText;
extern NSString * const footerRefreshingText;

//数据请求的接口
//数据API
extern NSString * const service_;
extern NSString * const API;
extern NSString * const Dev_API;
//图片API
extern NSString * const IMAGEAPI;
//版本号
extern NSString * const APIVersion;
extern NSString * const Developer;

//关于页面
extern NSString * const AboutAPI;
//帮助页面
extern NSString * const HelpAPI;
//分享包裹
extern NSString * const SharePackage;
//分享信息
extern NSString * const ShareInfo;

//公共参数
extern NSString * const appkey;
extern NSString * const nonce;
extern NSString * const phone_ip;
extern NSString * const phone_memo;
extern NSString * const phone_type;
extern NSString * const phone_uuid;

//发送验证码的5中情况
extern NSString * const SendCodeSignName;      //验证码常量
extern NSString * const SendCodeLogin;         //注册
extern NSString * const SendCodeChangePassword;    //修改密码
extern NSString * const SendCodeBound;        //绑定
extern NSString * const SendCodeUnChain;      //解绑
extern NSString * const SendCodeAskForTheme;     //申请话题

//回帖类型
extern NSString * const TalkReplyTypeOne;      //主贴的回帖
extern NSString * const TalkReplyTypeTwo;      //回帖的回帖

//删除回帖类型
extern NSString * const DeleteTalkReplyTypeOne;      //题主删除
extern NSString * const DeleteTalkReplyTypeTwo;      //发帖人删除

//#define HTTP_URL [NSString stringWithFormat:@"?appkey=%@&nonce=%@&phone_ip=%@&phone_memo=%@&phone_type=%@&phone_uuid=%@",appkey,nonce,phone_ip,phone_memo,phone_type,phone_uuid]

//Http报文头
extern NSString * const HTTPHEADVALUE;
extern NSString * const HTTPHEADKEY;
extern NSString * const HTTPCONTENTVALUE;
extern NSString * const HTTPCONTENTKEY;
extern NSString * const HTTPACCEPTVALUE;
extern NSString * const HTTPACCEPTKEY;
extern NSString * const HTTPDeviceKEY;

//日期格式
extern NSString * const TimeStyle;
extern NSString * const TimeDetailedStyle;

//环信
extern NSString * const khxAppKey;
extern NSString * const khxClientId;
extern NSString * const khxClientSecret;
//环信推送
extern NSString * const PuchDevelopment;
extern NSString * const PuchDistribution;
//环信用户登录密码
extern NSString * const asyncLoginPass;

//极光推送
extern NSString * const JPushAppKey;
extern NSString * const JPushChannel;
extern NSString * const JPushMasterSecret;

//Weibo
extern NSString * const kAppKey;
extern NSString * const kRedirectURI;
extern NSString * const kwbScheme;
extern NSString * const wbScheme;
//请求用户信息
extern NSString * const kwbURL;
//Weixin
extern NSString * const kwxAppId;
extern NSString * const kwxAppSecret;
extern NSString * const kwxScheme;
extern NSString * const wxScheme;
extern NSString * const wxTokenApi;
extern NSString * const userInfoApi;
extern NSString * const kwxAuthScope;
extern NSString * const kwxAuthOpenID;
extern NSString * const kwxAuthState;
//QQ
extern NSString * const kqqAppId;
extern NSString * const kqqAppKey;
extern NSString * const kqqScheme;
extern NSString * const qqScheme;
//AMap
extern NSString * const kAmapAppkey;

//AMap
extern NSString * const KOpenImKey;
extern NSString * const ChatName;
extern NSString * const KDEV_OpenImKey;
extern NSString * const DEV_ChatName;
//#define kGtAppId           @"iMahVVxurw6BNr7XSn9EF2"
//#define kGtAppKey          @"yIPfqwq6OMAPp6dkqgLpG5"
//#define kGtAppSecret
extern NSString * const kGtAppId;
extern NSString * const kGtAppKey;
extern NSString * const kGtAppSecret;

extern NSString * const kDEV_GtAppId;
extern NSString * const kDEV_GtAppKey;
extern NSString * const kDEV_GtAppSecret;

//微信支付
#define kIP @"http://211.149.242.216"
#define APP_ID          @"wx20d500e51d4fe60f"                  //APPID
#define APP_SECRET      @"98ce0384dc2173f5eb01aaf796d54ee8"    //appsecret
//商户号，填写商户对应参数
#define MCH_ID          @"1344132601"
////商户API密钥，填写相应参数
//#define PARTNER_ID      @"NanJingGaiWuWangLuoKeJi128632130"
////支付结果回调页面
//#define NOTIFY_URL      @"http://211.149.242.216/cooperation/ifachui/wxpay/money.jsp"
////获取服务器端支付数据地址（商户自定义）
//#define SP_URL          @"http://211.149.242.216/cooperation/ifachui/wxpay/money.jsp"
//商户API密钥，填写相应参数
#define PARTNER_ID      @"3868369e063359ba50cf2a15d381511b"
//支付结果回调页面
#define NOTIFY_URL      @"http://wxpay.weixin.qq.com/pub_v2/pay/notify.v2.php"
//获取服务器端支付数据地址（商户自定义）
#define SP_URL          @"http://wxpay.weixin.qq.com/pub_v2/app/app_pay.php"
extern NSString * const ActivityBannerImageURL;
extern NSString * const ActivityBannerURL;


//支付宝接口
extern NSString * const kSeller;
extern NSString * const kPartner;
extern NSString * const kPrivate;
extern NSString * const kPublic;
extern NSString * const kStoreAppId;

////选择地址代理方法
//@protocol SelectAddressDelegate<NSObject>
//
//- (void)selectAddressSucceed:(MyAreaSubModel *)areaModel;
//
//@end
//
////选择微信账号成功
//@protocol SelectWeixinDelegate<NSObject>
//
//- (void)selectWeixinSucceed:(AccountModel *)model;
//
//@end
//
////选择支付宝账号成功
//@protocol SelectZfbDelegate<NSObject>
//
//- (void)selectZfbSucceed:(AccountModel *)model;
//
//@end














//更换频道时的代理
@protocol ChannelDelegate<NSObject>


@end
//添加话题的代理
@protocol AttentionThemeDelegate<NSObject>


@end
//添加话题的代理
@protocol ThreadCommentDelegate<NSObject>

- (void)threadCommentSucceed;

@end
//置顶话题的代理
@protocol TopThreadDelegate<NSObject>

- (void)topThreadSucceed;

@end
//收藏页面的代理
@protocol CollectThreadDelegate<NSObject>

- (void)collectThreadSucceed:(NSString *)url;

@end

// 选择全部分类
@protocol ChooseCategoryDelegate<NSObject>

- (void)chooseCategorySucceed:(NSString *)obj andType:(NSString *)type;

@end
// 选择全部分类
@protocol ChooseCategoryDelegate1<NSObject>

- (void)chooseCategorySucceed1:(NSString *)obj andType:(NSString *)type;

@end
// 选择全国地址
@protocol ChooseCityDelegate<NSObject>

- (void)chooseCitySucceed:(NSString *)proviceId andCityId:(NSString *)cityId andType:(NSString *)type;

@end
// 更多
@protocol ChooseMoreInfoDelegate<NSObject>

- (void)chooseMoreInfoSucceed:(NSMutableDictionary *)datadic andType:(NSString *)type;

@end
//用户登录成功
@protocol LoginDelegate<NSObject>


@end
//用户注册成功
@protocol SignInDelegate<NSObject>

- (void)signInSucceed:(NSString *)username andType:(NSInteger)type;

@end
//关注用户成功
@protocol AttentionDelegate<NSObject>

- (void)attention:(NSString *)modelId andAttentionState:(NSString *)state;

@end
@interface Constants : NSObject

@end
