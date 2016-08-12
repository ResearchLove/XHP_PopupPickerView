//
//  CustomMenuCell.h
//  XHP_PopupPickerView
//
//  Created by xiaohaiping on 16/8/12.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomMenuCell : UITableViewCell
@property (strong,nonatomic) UIImageView *leftIcon;
@property (strong,nonatomic) UIView *bottomLineView;


+ (CGFloat)cellHeight;
- (void)setInfo:(id)info;
- (void)setIsSelect:(BOOL)selected;

@end
