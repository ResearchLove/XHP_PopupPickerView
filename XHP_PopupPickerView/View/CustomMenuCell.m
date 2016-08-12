//
//  CustomMenuCell.m
//  XHP_PopupPickerView
//
//  Created by xiaohaiping on 16/8/12.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CustomMenuCell.h"
#import "CustomMenuModel.h"

#define CURRENT_SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width   //当前屏幕的宽
#define kTextSpace 15
#define kTextFont [UIFont systemFontOfSize:16]
#define kTextColor [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]
#define kIconImage [UIImage imageNamed:@"tag_list_s"]
#define kCellH 44
#define kTableH 266
#define kIconW 18
#define kIconH 18
#define kIconSpace 15
#define kLineColor [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0]
#define kIconLeftW 25
#define kIconLeftH 25

@implementation CustomMenuCell



+ (CGFloat)tableHeight
{
    return kTableH;
}

+ (CGFloat)cellHeight
{
    return kCellH;
}

- (void)setInfo:(CustomMenuModel *)info
{
    if (!_bottomLineView) {
        [self initUI];
    }
    
    self.textLabel.text = info.title;
    [_leftIcon setImage:[UIImage imageNamed:info.imageName]];
}

- (void)setIsSelect:(BOOL)selected
{
    self.imageView.hidden = (selected ? FALSE : TRUE);
}

- (void)initUI
{
    self.textLabel.textColor = kTextColor;
    self.textLabel.font = kTextFont;
    
    self.imageView.image = kIconImage;
    
    _leftIcon = [[UIImageView alloc] initWithFrame:CGRectMake(kIconSpace, (kCellH - kIconLeftH) * 0.5, kIconLeftW, kIconLeftH)];
    [self addSubview:_leftIcon];
    
    _bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(kIconSpace + kIconLeftW + kIconSpace, kCellH - 0.6, CURRENT_SCREEN_WIDTH, 0.6)];
    _bottomLineView.backgroundColor = kLineColor;
    [self addSubview:_bottomLineView];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(CURRENT_SCREEN_WIDTH - kIconW - kIconSpace, (kCellH - kIconH) * 0.5, kIconW, kIconH);
    self.textLabel.frame = CGRectMake(kTextSpace + CGRectGetMaxX(_leftIcon.frame), 0, CGRectGetMinX(self.imageView.frame) - kTextSpace - CGRectGetMaxX(_leftIcon.frame), kCellH);
}


@end
