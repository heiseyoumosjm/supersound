//
//  LoginViewController.m
//  supersound
//
//  Created by Mickey on 2017/8/18.
//  Copyright © 2017年 Mickey. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "MessageHelper.h"
#import "HttpHelper.h"
#import "UserinfoModel.h"

@interface LoginViewController ()<UITabBarControllerDelegate>

@end

@implementation LoginViewController
- (void)viewWillAppear:(BOOL)animated
{
     self.navigationController.navigationBarHidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationController.navigationBarHidden=YES;
     self.view.backgroundColor=[UIColor whiteColor];
      _loginbtn.layer.cornerRadius=22.5;
     [_loginbtn.layer setBorderWidth:1.0];
      _loginbtn.layer.borderColor=UIColorFromRGB(0x5fbff9).CGColor;
     [self setBarBackBtnWithoutTitle];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)toregiste:(UIButton *)sender {
    RegisterViewController *regis=[[RegisterViewController alloc]init];
    [self.navigationController pushViewController:regis animated:YES];
}
- (IBAction)tologinclick:(UIButton *)sender {
    if ([self isBlankString:_phone.text]) {
        
        [[MessageHelper messageHelper] showWarnMessage:self title:@"温馨提示" sub:@"请输入名字"];
        
    }else if ([self isBlankString:_psw.text]) {
        
        [[MessageHelper messageHelper] showWarnMessage:self title:@"温馨提示" sub:@"请输入密码"];
        
    }else{
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params setValue:_phone.text forKey:@"username"];
        [params setValue:_psw.text forKey:@"password"];
        [[HttpHelper httpHelper]postAchieveListParamsURL:[NSString stringWithFormat:@"user/login"] andParams:params andSuccess:^(NSDictionary *successData) {
            if ([[successData objectForKey:@"api_code"] integerValue]==200) {
                UserinfoModel *userinfo=[[UserinfoModel alloc]initWithDictionary:successData error:nil];
                [[HttpHelper httpHelper] setUserToken:userinfo.token];
                //                    [self loginhx];
                NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
                [defaults setObject:userinfo.token forKey:@"usertoken"];
                [defaults synchronize];
                
                CYXTabBarController *dragVC = [[CYXTabBarController alloc]init];
                UIViewController *vc = [AppDelegate sharedAppDelegate].window.rootViewController;
                [AppDelegate sharedAppDelegate].window.rootViewController = dragVC;
                dragVC.delegate = self;
                [vc removeFromParentViewController];
                

                
            }
        } andError:^(NSError *error) {
            
        }];

    }
}

- (IBAction)forgetbtn:(UIButton *)sender {
}

- (IBAction)qqlogin:(UIButton *)sender {
}

- (IBAction)wxlogin:(UIButton *)sender {
}
@end
