//
//  RegisterViewController.h
//  supersound
//
//  Created by Mickey on 2017/8/19.
//  Copyright © 2017年 Mickey. All rights reserved.
//

#import "JYBaseViewController.h"

@interface RegisterViewController : JYBaseViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *mobile;
@property (weak, nonatomic) IBOutlet UITextField *hospital;
@property (weak, nonatomic) IBOutlet UITextField *classroom;
@property (weak, nonatomic) IBOutlet UITextField *motionnum;
@property (weak, nonatomic) IBOutlet UITextField *email;

@property (weak, nonatomic) IBOutlet UITextField *zhichen;
@property (weak, nonatomic) IBOutlet UITextField *provice;
@property (weak, nonatomic) IBOutlet UITextField *address;

@property (weak, nonatomic) IBOutlet UIButton *finishbtn;

- (IBAction)finishclick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *choosebtn;
- (IBAction)choosebtnclick:(UIButton *)sender;

@end
