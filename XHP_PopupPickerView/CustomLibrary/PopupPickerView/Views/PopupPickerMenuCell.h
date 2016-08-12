//
//  PopupPickerMenuCell.h
//  XHP_PopupPickerView
//
//  Created by xiaohaiping on 16/8/9.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PopupPickerMenuCell : UITableViewCell

@property (strong,nonatomic) UIView *bottomLineView;

+ (CGFloat)tableHeight;
+ (CGFloat)cellHeight;
- (void)setInfo:(id)info;
- (void)setIsSelect:(BOOL)selected;

@end
