//
//  RegisterViewController.m
//  supersound
//
//  Created by Mickey on 2017/8/19.
//  Copyright © 2017年 Mickey. All rights reserved.
//

#import "RegisterViewController.h"
#import "MessageHelper.h"
#import "IQKeyboardManager.h"
#import "IQKeyboardReturnKeyHandler.h"
#import "HttpHelper.h"
#import "RegisterSuccessViewController.h"

@interface RegisterViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSMutableArray *_province;
    NSMutableArray *_city;
    NSMutableArray *_regionArea;
    
    NSString *provinceId;
    NSString *cityId;
    NSString *regionId;
    
    NSInteger row1;//pick
    NSInteger row2;//pick
    NSInteger row3;//pick
    UILabel *lab;
    UIButton *btn;
    UIButton *cancal;

}
@property (strong, nonatomic) UIPickerView *pickerView;

@end

@implementation RegisterViewController
@synthesize
pickerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES; // 控制整个功能是否启用。
    manager.shouldResignOnTouchOutside =YES; // 控制点击背景是否收起键盘
    manager.shouldToolbarUsesTextFieldTintColor =YES; // 控制键盘上的工具条文字颜色是否用户自定义
    manager.enableAutoToolbar =YES; // 控制是否显示键盘上的工具条
    manager.toolbarManageBehaviour =IQAutoToolbarByTag; // 最新版的设置键盘的returnKey的关键字 ,可以点击键盘上的next键，自动跳转到下一个输入框，最后一个输入框点击完成，自动收起键盘。
    IQKeyboardReturnKeyHandler *retuenKeyHandler = [[IQKeyboardReturnKeyHandler alloc]initWithViewController:self];
    retuenKeyHandler.lastTextFieldReturnKeyType =UIReturnKeyDone; // 设置最后一个
    
    self.navigationController.navigationBarHidden=NO;
    self.view.backgroundColor=[UIColor whiteColor];
     _finishbtn.layer.cornerRadius=22.5;
    [_finishbtn.layer setBorderWidth:1.0];
     _finishbtn.layer.borderColor=UIColorFromRGB(0x5fbff9).CGColor;
    
    row1 = row2 = row3 = 0;
    [self getProvinceList];

    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)finishclick:(UIButton *)sender {
    if ([self isBlankString:_name.text]) {
         [[MessageHelper messageHelper] showWarnMessage:self title:@"温馨提示" sub:@"请输入名字"];
        
    }else if ([self isBlankString:_hospital.text]) {
         [[MessageHelper messageHelper] showWarnMessage:self title:@"温馨提示" sub:@"请输入您所在的医院"];
        
    }else if ([self isBlankString:_classroom.text]) {
         [[MessageHelper messageHelper] showWarnMessage:self title:@"温馨提示" sub:@"请输入您的科室"];
        
    } else if ([self isBlankString:_motionnum.text]) {
        [[MessageHelper messageHelper] showWarnMessage:self title:@"温馨提示" sub:@"请输入造影设备型号"];
        
    }else if ([self isBlankString:_email.text]) {
         [[MessageHelper messageHelper] showWarnMessage:self title:@"温馨提示" sub:@"请输入您的邮箱"];
        
    }else if ([self isBlankString:_zhichen.text]) {
         [[MessageHelper messageHelper] showWarnMessage:self title:@"温馨提示" sub:@"请输入您的职称"];
        
    }else if ([self isBlankString:_mobile.text]) {
         [[MessageHelper messageHelper] showWarnMessage:self title:@"温馨提示" sub:@"请输入您的手机号码"];
        
    }else if ([self isBlankString:provinceId]) {
         [[MessageHelper messageHelper] showWarnMessage:self title:@"温馨提示" sub:@"请选择您的地址"];
        
    }else if ([self isBlankString:_address.text]) {
         [[MessageHelper messageHelper] showWarnMessage:self title:@"温馨提示" sub:@"请填写单位详细地址"];
    }else{
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params setValue:_name.text forKey:@"name"];
        [params setValue:_hospital.text forKey:@"hospital"];
        [params setValue:_classroom.text forKey:@"department"];
        [params setValue:_motionnum.text forKey:@"device_number"];
        [params setValue:_email.text forKey:@"email"];
        [params setValue:_zhichen.text forKey:@"professional_title"];
        [params setValue:_mobile.text forKey:@"mobile"];
        [params setValue:provinceId forKey:@"province"];
        [params setValue:cityId forKey:@"city"];
        [params setValue:regionId forKey:@"region"];
        [params setValue:_address.text forKey:@"address"];
        [[HttpHelper httpHelper]postAchieveListParamsURL:[NSString stringWithFormat:@"user/apply"] andParams:params andSuccess:^(NSDictionary *successData) {
            if ([[successData objectForKey:@"api_code"] integerValue]==200) {
                RegisterSuccessViewController *regist=[[RegisterSuccessViewController alloc]init];
                [self.navigationController pushViewController:regist animated:YES];
            }
        } andError:^(NSError *error) {
            
        }];
        
    }
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    CGPoint point = [touch locationInView:self.view];  //返回触摸点在视图中的当前坐标
    float y = point.y;
    if (pickerView && y < pickerView.frame.origin.y) {
        [pickerView removeFromSuperview];
        [lab removeFromSuperview];
        [btn removeFromSuperview];
        [cancal removeFromSuperview];
        pickerView = nil;
        if (_regionArea.count > 0) {
            [_choosebtn setTitle:[NSString stringWithFormat:@"%@%@%@",[_province[row1] objectForKey:@"region_name"],[_city[row2] objectForKey:@"region_name"],[_regionArea[row3] objectForKey:@"region_name"]] forState:UIControlStateNormal];
            [_choosebtn setTitleColor:UIColorFromRGB(0x000000) forState:UIControlStateNormal];
        }
        else{
            [_choosebtn setTitle:[NSString stringWithFormat:@"%@%@",[_province[row1] objectForKey:@"region_name"],[_city[row2] objectForKey:@"region_name"]] forState:UIControlStateNormal];
            [_choosebtn setTitleColor:UIColorFromRGB(0x000000) forState:UIControlStateNormal];
            
        }
    }

}
- (IBAction)choosebtnclick:(UIButton *)sender {
    NSLog(@"+++++++++++修改城市按钮点击事件");
    [self.view endEditing:YES];
    
    if (pickerView) {
        [pickerView removeFromSuperview];
        pickerView = nil;
    }
    pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-150 , SCREEN_WIDTH, 150)];
    pickerView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    if (lab) {
        [lab removeFromSuperview];
        lab = nil;
    }
    if (btn) {
        [btn removeFromSuperview];
        btn = nil;
    }
    if (cancal) {
         [cancal removeFromSuperview];
        cancal=nil;
    }
    
//    UIButton *cancal=[[UIButton alloc]initWithFrame:CGRectMake(10,SCREEN_HEIGHT-150-48, 50, 48)];
//    [cancal setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [cancal addTarget: self action: @selector(cancal) forControlEvents: UIControlEventTouchUpInside];
//    [cancal setTitle:@"取消" forState:UIControlStateNormal];
//    cancal.titleLabel.font = [UIFont systemFontOfSize:15];
//    [self.view addSubview:cancal];
    
    lab=[[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-150-48, SCREEN_WIDTH, 48)];
    lab.backgroundColor=[UIColor groupTableViewBackgroundColor];
    lab.text=@"请选择地址";
    lab.textAlignment=NSTextAlignmentCenter;
    lab.font=[UIFont systemFontOfSize:15.f];
    [self.view addSubview:lab];
    
     cancal=[[UIButton alloc]initWithFrame:CGRectMake(10,SCREEN_HEIGHT-150-48, 50, 48)];
    [cancal setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancal addTarget: self action: @selector(cancal) forControlEvents: UIControlEventTouchUpInside];
    [cancal setTitle:@"取消" forState:UIControlStateNormal];
    cancal.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:cancal];
    
    
    btn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60,SCREEN_HEIGHT-150-48, 50, 48)];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget: self action: @selector(ok) forControlEvents: UIControlEventTouchUpInside];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:btn];
    
//    pickerView.backgroundColor = [UIColor whiteColor];
    pickerView.delegate = self;
    pickerView.dataSource =self;
    [pickerView selectRow:row1 inComponent:0 animated:NO];
    [pickerView selectRow:row2 inComponent:1 animated:NO];
    [pickerView selectRow:row3 inComponent:2 animated:NO];
    [self.view addSubview:pickerView];
}

-(void)cancal
{
    [pickerView removeFromSuperview];
    [lab removeFromSuperview];
    [btn removeFromSuperview];
    [cancal removeFromSuperview];
    pickerView = nil;
}
-(void)ok
{
    [pickerView removeFromSuperview];
    [lab removeFromSuperview];
    [btn removeFromSuperview];
    [cancal removeFromSuperview];
    pickerView = nil;
    if (_regionArea.count > 0) {
        [_choosebtn setTitle:[NSString stringWithFormat:@"%@%@%@",[_province[row1] objectForKey:@"region_name"],[_city[row2] objectForKey:@"region_name"],[_regionArea[row3] objectForKey:@"region_name"]] forState:UIControlStateNormal];
        [_choosebtn setTitleColor:UIColorFromRGB(0x000000) forState:UIControlStateNormal];
    }
    else{
        [_choosebtn setTitle:[NSString stringWithFormat:@"%@%@",[_province[row1] objectForKey:@"region_name"],[_city[row2] objectForKey:@"region_name"]] forState:UIControlStateNormal];
        [_choosebtn setTitleColor:UIColorFromRGB(0x000000) forState:UIControlStateNormal];
    }
    
}
#pragma mark --------------- PickerView相关代理 ------------------
#pragma mark - pickerView列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

#pragma mark - 每列行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {//省
        return _province.count;
    }
    if (component == 1) {//市
        return _city.count;
    }
    if (component == 2) {//区
        return _regionArea.count;
    }
    return 0;
}

#pragma mark - 每列,行title
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {//省
        return [_province[row] objectForKey:@"region_name"];
    }
    if (component == 1) {//市
        return [_city[row] objectForKey:@"region_name"];
    }
    if (component == 2) {//区
        return [_regionArea[row] objectForKey:@"region_name"];
    }
    return nil;
}

#pragma mark - 选择代理方法
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        if (row != row1) {
            row1 = row;
            [self getCityList:[_province[row] objectForKey:@"id"]];
            provinceId = nil;
            provinceId = [NSString stringWithFormat:@"%@",[_province[row] objectForKey:@"id"]];
        }
    }
    if (component == 1) {
        
        if (row != row2) {
            row2 = row;
            [self getRegionArea:[_city[row] objectForKey:@"id"]];
            cityId = nil;
            cityId = [NSString stringWithFormat:@"%@",[_city[row] objectForKey:@"id"]];
        }
    }
    if (component == 2) {
        if (row != row3) {
            row3 = row;
            regionId = nil;
            regionId = [NSString stringWithFormat:@"%@",[_regionArea[row] objectForKey:@"id"]];
        }
    }
}
#pragma mark - 请求省份数据
-(void)getProvinceList
{
    [[HttpHelper httpHelper]getAchieveListParamsURL:@"region/provinces" andParams:nil andSuccess:^(NSDictionary *successData) {
        _province = [successData objectForKey:@"data"];
        [self getCityList:[_province[row1] objectForKey:@"id"]];
    } andError:^(NSError *error) {
        
    }];
}

#pragma mark - 请求城市数据
-(void)getCityList:(NSString *)province
{
     NSMutableDictionary *params = [NSMutableDictionary dictionary];
     [params setValue:province forKey:@"province"];
    [[HttpHelper httpHelper]getAchieveListParamsURL:[NSString stringWithFormat:@"region/cities"] andParams:params andSuccess:^(NSDictionary *successData) {
        _city = [successData objectForKey:@"data"];
        if (pickerView) {
            [pickerView reloadComponent:1];
        }
        if (_city.count < row2 + 1) {
            row2 = _city.count - 1;
             cityId=[[_city lastObject] objectForKey:@"id"];
            [self getRegionArea:[[_city lastObject] objectForKey:@"id"]];
        }
        else{
             cityId=[_city[row2] objectForKey:@"id"];
            [self getRegionArea:[_city[row2] objectForKey:@"id"]];
        }
        
        
    } andError:^(NSError *error) {
        
        
    }];
}

#pragma mark - 请求区县数据
-(void)getRegionArea:(NSString *)city
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:city forKey:@"city"];
    [[HttpHelper httpHelper]getAchieveListParamsURL:[NSString stringWithFormat:@"region/regions"] andParams:params andSuccess:^(NSDictionary *successData) {
        _regionArea = [successData objectForKey:@"data"];
        if (row3 > _regionArea.count - 1) {
            row3 = _regionArea.count - 1;
        }
        if (pickerView) {
            [pickerView reloadComponent:2];
        }
        
    } andError:^(NSError *error) {
        
    }];
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *myView = nil;
    
    myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 180, 30)];
    if (component == 0) {
        for (int i = 0; i < _province.count; ++i) {
                myView.text = [_province[row] objectForKey:@"region_name"];
        }
    }
    if (component == 1) {
        
        for (int i = 0; i < _city.count; ++i) {
                myView.text = [_city[row] objectForKey:@"region_name"];
        }
    }
    if (component == 2) {
        for (int i = 0; i < _regionArea.count; ++i) {
                myView.text = [_regionArea[row] objectForKey:@"region_name"];
        }
    }
    
    myView.textAlignment = NSTextAlignmentCenter;
    
    myView.font = [UIFont systemFontOfSize:14.f];
    
    myView.backgroundColor = [UIColor clearColor];
    
    return myView;
}
@end
