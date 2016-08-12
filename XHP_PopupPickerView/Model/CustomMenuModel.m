//
//  CustomMenuModel.m
//  XHP_PopupPickerView
//
//  Created by xiaohaiping on 16/8/12.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CustomMenuModel.h"

@implementation CustomMenuModel

+(CustomMenuModel *)imageName:(NSString *)imageName title:(NSString *)title
{
    CustomMenuModel *menuModel = [[CustomMenuModel alloc]init];
    menuModel.title = title;
    menuModel.imageName = imageName;
    return menuModel;
}

@end
