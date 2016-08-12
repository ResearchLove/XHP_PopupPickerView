//
//  PopupPickerMenuCell.m
//  XHP_PopupPickerView
//
//  Created by xiaohaiping on 16/8/9.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "PopupPickerMenuCell.h"

#define CURRENT_SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width   //当前屏幕的宽
#define kTextSpace 0
#define kTextFont [UIFont systemFontOfSize:14]
#define kTextColor [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]
#define kIconImage [UIImage imageNamed:@"tag_list_s"]
#define kCellH 34
#define kTableH 266
#define kIconW 18
#define kIconH 18
#define kIconSpace 15
#define kLineColor [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0]


@implementation PopupPickerMenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (CGFloat)tableHeight
{
    return kTableH;
}

+ (CGFloat)cellHeight
{
    return kCellH;
}

- (void)setInfo:(id)info
{
    if (!_bottomLineView) {
        [self initUI];
    }
    self.textLabel.text = info;
}

- (void)setIsSelect:(BOOL)selected
{
    self.imageView.hidden = (selected ? FALSE : TRUE);
}

- (void)initUI
{
    self.textLabel.textColor = kTextColor;
    self.textLabel.font = kTextFont;
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    
    self.imageView.image = kIconImage;
    
    _bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, kCellH - 0.6, CURRENT_SCREEN_WIDTH, 0.6)];
    _bottomLineView.backgroundColor = kLineColor;
    [self addSubview:_bottomLineView];
    self.backgroundColor = [UIColor clearColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(CURRENT_SCREEN_WIDTH - kIconW - kIconSpace, (kCellH - kIconH) * 0.5, kIconW, kIconH);
    self.textLabel.frame = CGRectMake(kTextSpace, 0, CURRENT_SCREEN_WIDTH - kTextSpace, kCellH);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
