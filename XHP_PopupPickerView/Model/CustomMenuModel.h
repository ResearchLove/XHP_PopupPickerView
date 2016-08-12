//
//  CustomMenuModel.h
//  XHP_PopupPickerView
//
//  Created by xiaohaiping on 16/8/12.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomMenuModel : NSObject

@property (strong,nonatomic) NSString *imageName;
@property (strong,nonatomic) NSString *title;

+(CustomMenuModel *)imageName:(NSString *)imageName title:(NSString *)title;

@end
