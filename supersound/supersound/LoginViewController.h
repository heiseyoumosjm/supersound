//
//  LoginViewController.h
//  supersound
//
//  Created by Mickey on 2017/8/18.
//  Copyright © 2017年 Mickey. All rights reserved.
//

#import "JYBaseViewController.h"

@interface LoginViewController : JYBaseViewController

@property (weak, nonatomic) IBOutlet UITextField *phone;

@property (weak, nonatomic) IBOutlet UITextField *psw;
- (IBAction)toregiste:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginbtn;

- (IBAction)tologinclick:(UIButton *)sender;

- (IBAction)forgetbtn:(UIButton *)sender;

- (IBAction)qqlogin:(UIButton *)sender;

- (IBAction)wxlogin:(UIButton *)sender;
@end
