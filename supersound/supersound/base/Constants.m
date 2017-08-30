//
//  Constants.m
//
//

#import "Constants.h"

//数据请求的接口
//数据API
//NSString * const API = @"http://120.26.55.28:6066/";
////app端，将api前缀设置为：http://api.comaking.net，
NSString * const service_ = @"dev";//pro
//dev
NSString * const API = @"http://api.comaking.net/";
NSString * const Dev_API = @"http://114.55.92.151/supersound/api/web/v1/";
//NSString * const Dev_API = @"http://192.168.12.29/";
//NSString * const API = @"http://192.168.12.51:5067/";

//NSString * const API = @"http://192.168.12.247:5063/";
////图片API
//NSString * const IMAGEAPI = @"http://121.40.142.244:58080/img/";
//版本号
NSString * const APIVersion = @"v1/";


//Http报文头
NSString * const HTTPHEADKEY = @"JOKE";
NSString * const HTTPHEADVALUE = @"yifu!";
NSString * const HTTPCONTENTKEY = @"Content-Type";
NSString * const HTTPCONTENTVALUE = @"application/json";
NSString * const HTTPACCEPTKEY = @"Accept";
NSString * const HTTPACCEPTVALUE = @"application/json";
NSString * const HTTPDeviceKEY = @"Device";
NSString * const Authorization = @"Authorization";

//ItemName
NSString * const HomeItemName = @"主页";
NSString * const ThemeItemName = @"话题";
NSString * const UserItemName = @"我的";

//User页面信息
NSString * const PackCellName = @"我的包裹";
NSString * const HistoryCellName = @"我的历史";
NSString * const IssueCellName = @"反馈问题";
NSString * const RegardCellName = @"我的关注";
NSString * const HelpCellName = @"使用帮助";
NSString * const AboutCellName = @"关于";
NSString * const QuitCellName = @"退出登录";
NSString * const ApplyCellName = @"申请话题";

//邀请好友
NSString * const LetterWxBery = @"邀请朋友圈好友";
NSString * const LetterWxHail = @"邀请微信好友";
NSString * const LetterQQ = @"邀请QQ好友";
NSString * const LetterWb = @"邀请新浪微博好友";

//搜索提示
NSString * const SearchBarPlaceholder = @"搜索政府、企业、明星";

NSInteger const numberOfItemsInRow = 3;      //弹出框

//加载与刷新
NSString * const headerPullToRefreshText = @"下拉刷新";
NSString * const headerReleaseToRefreshText = @"松开马上刷新";
NSString * const headerRefreshingText = @"正在赶来...";

NSString * const footerPullToRefreshText = @"上拉加载";
NSString * const footerReleaseToRefreshText = @"松开马上加载";
NSString * const footerRefreshingText = @"正在赶来...";

//环信
NSString * const khxAppKey = @"syx573560989#yuwoyg";
NSString * const khxClientId = @"YXA6a9EgAOaOEeWCiOXO8DRhFA";
NSString * const khxClientSecret = @"YXA6ziIdyTl3m_Qqk2PjxRNxFrKxUDQ";
//环信推送
NSString * const PuchDevelopment = @"ywoygPuchDevelopment";
NSString * const PuchDistribution = @"ywoygPuchDistribution";
//环信用户登录密码
NSString * const asyncLoginPass = @"12345";

//极光推送
NSString * const JPushAppKey = @"05eea31f031644802f1ead4d";
NSString * const JPushChannel = @"App Store";
NSString * const JPushMasterSecret = @"450fbf3a07df48482dead636";

//Weibo
NSString * const kAppKey = @"3616484697";
NSString * const kwbScheme = @"57b1b51a437352c93afd8b0108bdf683";
NSString * const kRedirectURI = @"https://api.weibo.com/oauth2/default.html";
NSString * const wbScheme = @"wb3616484697";
//请求用户信息
NSString * const kwbURL = @"https://api.weibo.com/2/users/show.json";
//Weixin
NSString * const kwxAppId = @"wx20d500e51d4fe60f";
NSString * const kwxAppSecret = @"98ce0384dc2173f5eb01aaf796d54ee8";
NSString * const kwxScheme = @"wx20d500e51d4fe60f";
NSString * const wxScheme = @"wx20d500e51d4fe60f";
NSString * const wxTokenApi = @"https://api.weixin.qq.com/sns/oauth2/access_token";
NSString * const userInfoApi = @"https://api.weixin.qq.com/sns/userinfo";
//授权域
NSString * const kwxAuthScope = @"snsapi_message,snsapi_userinfo,snsapi_friend,snsapi_contact";
NSString * const kwxAuthOpenID = @"wx07c78c7f9b88b01e";
NSString * const kwxAuthState = @"iSailor";
//QQ
NSString * const kqqAppId = @"1105394662";
NSString * const kqqAppKey = @"w3eoVudG8SIbPmf1";
NSString * const kqqScheme = @"tencent1105394662";
NSString * const qqScheme = @"tencent1105394662";

//AMap
NSString * const kAmapAppkey = @"136dbe85f5c7fdb30d2df2ff8759dfd9";

//openIm
NSString * const KOpenImKey= @"23363410";
NSString * const ChatName= @"超级工程师app";
NSString * const KDEV_OpenImKey= @"23359705";
NSString * const DEV_ChatName= @"宁波超级工程师";

///// 个推开发者网站中申请App时，注册的AppId、AppKey、AppSecret
//#define kGtAppId           @"iMahVVxurw6BNr7XSn9EF2"
//#define kGtAppKey          @"yIPfqwq6OMAPp6dkqgLpG5"
//#define kGtAppSecret       @"G0aBqAD6t79JfzTB6Z5lo5"

//NSString * const kGtAppId= @"mWSzIR9d6J85qAGIB0Eqa8";
//NSString * const kGtAppKey= @"Za3mxEr4YU60ZrwKgskmQA";
//NSString * const kGtAppSecret= @"3xzCVng3rb9vSUcxMRFA38";

NSString * const kGtAppId= @"1uLs3EmkcK6G3PmHCdBL73";
NSString * const kGtAppKey= @"orpgI2nLGz9wt2EiQroXj5";
NSString * const kGtAppSecret= @"XHdUBMwoOh8vNzWgWP9HB7";

NSString * const kDEV_GtAppId= @"mWSzIR9d6J85qAGIB0Eqa8";
NSString * const kDEV_GtAppKey= @"Za3mxEr4YU60ZrwKgskmQA";
NSString * const kDEV_GtAppSecret= @"3xzCVng3rb9vSUcxMRFA38";

//日期格式
NSString * const TimeStyle = @"YYYY-MM-dd";
NSString * const TimeDetailedStyle = @"YYYY-MM-dd HH:mm";


//微信支付
NSString * const ActivityBannerImageURL = @"http://xiangqu.cz001.com.cn/res/yancheng.jpg";
NSString * const ActivityBannerURL = @"http://xiangqu.cz001.com.cn/h5/index?id=1";


//支付宝接口
NSString * const kSeller = @"2088501081501218";
NSString * const kPartner = @"2088501081501218";
NSString * const kPrivate = @"MIICXQIBAAKBgQDP8gFPOs0fGwhgDdSZ8o4mDbjNJHixbc+mzs0C5pqMJecbs7ofb+5RujcnICrVxfZPfk1gOJiBH2uPadXi8hfiyiuWC7A5V6dB8rUZk7RIlXoShHIPYysQWdDPSSEMWVmmE3rE511zN+cvoNGTJjQk9RqY+ZbjvJytTn3Q/+e0DwIDAQABAoGAcvmQF8qfV6+Ote1vu58NUaUMpQChaxkYU1bMq+ntUcgzPHHnWzJ8Rtv7WrrCdGh8g/+FsMoaKGrDAgy2okDRSyimp/EFeKkulPwj8HetyGfgPN7vylvQZQxNfmiSFtv+YNV2Z5P1ROMlotrYbJF6WD82WeDQrfJZdTASqA2GiiECQQDx+B0TtzviHRJZA70cZ8w5QtrYRRbtAA8+a+N5G9BwpChhxAch2Auy51zgEvI4ClD2THJhZNTsAFFUS5Fd5W6dAkEA3ADT7+/g9IOAX8iATSX/BNyrdM+thWFXNTSFspIja/4OA9clsTJfdnTNWhzDnoIndkRLc0yaHH2sTrE+lgI3mwJBALvD9YxfHDESrjI1HIL2aRvmLTy2IFw5N5sQzawlUVKXkF6NZ5tzs2BY+VFIYn3qQ3ldSUUaob+hX3sySNO8PmECQQCvygGOwK+Q8NpMrprGCkxBCEn/5kmSP/s8yiDiVJ71FWUBcJHvin542k+TZ1RvfTQm7d8T2+twRIK/xiRqHI9tAkAKZWU9xJa2rFjts0/VJYfGTtddaLdlZZyV82jWGv/Ok+rM2P0adPqTFPi4G0bLCZDmgkV0K0/vIyQn8hVS6i4+";
NSString * const kPublic =  @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDHgkWgmIcl/dJuyXzeKByv1DdaPQ+Ack5tCHezieirq7seBG/tWW/Ps49Ki2zS/7t6wqw1OHtwfvvpwo7qCivQxDjv/21e+XTGfL+LZ2Mpts/JlBE4ezoSxjPBP2FoRnkDf5Ycsky7grH8Wggpyf1QN20R79fToMM0lbYv8xDX7QIDAQAB";

NSString *const kStoreAppId=@"1123264588";
@implementation Constants

@end
