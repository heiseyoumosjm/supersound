//
//  UserModel.h
//  supersound
//
//  Created by Mickey on 2017/8/19.
//  Copyright © 2017年 Mickey. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol UserModel
@end
@interface UserModel : JSONModel
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
@property (strong, nonatomic) NSString<Optional> *avatar;
@property (strong, nonatomic) NSString<Optional> *birthday;
@property (strong, nonatomic) NSMutableArray<Optional> *devices;
@property (strong, nonatomic) NSString<Optional> *gender;
@property (strong, nonatomic) NSString<Optional> *id;
@property (strong, nonatomic) NSString<Optional> *nickname;
@property (strong, nonatomic) NSMutableArray<Optional> *oauths;
@property (strong, nonatomic) NSString<Optional> *reg_time;
@end
