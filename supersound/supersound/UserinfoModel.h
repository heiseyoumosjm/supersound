//
//  UserinfoModel.h
//  supersound
//
//  Created by Mickey on 2017/8/19.
//  Copyright © 2017年 Mickey. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "UserModel.h"

@interface UserinfoModel : JSONModel
//"api_code" = 200;
//token = "5997e7cd76d4b_1503127501";
//user =     {
//    avatar = "/img/avatar.png";
//    birthday = "<null>";
//    devices =         (
//                       {
//                           device = jmjpc;
//                           "last_active" = 1502682500;
//                       },
//                       {
//                           device = iOS;
//                           "last_active" = 1503127501;
//                       }
//                       );
//    gender = 0;
//    id = 100020;
//    nickname = 15726818141;
//    oauths =         (
//                      {
//                          "external_name" = 15726818141;
//                          "external_uid" = 15726818141;
//                          type = 1;
//                      }
//                      );
//    "reg_time" = 1502417259;
//};
@property (strong, nonatomic) NSString<Optional> *api_code;
@property (strong, nonatomic) NSString<Optional> *token;
@property (strong, nonatomic) UserModel<Optional> *user;
@end
