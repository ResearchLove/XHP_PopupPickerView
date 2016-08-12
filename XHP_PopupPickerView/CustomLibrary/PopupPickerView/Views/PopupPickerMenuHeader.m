//
//  PopupPickerMenuHeader.m
//  XHP_PopupPickerView
//
//  Created by xiaohaiping on 16/8/9.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "PopupPickerMenuHeader.h"

#define CURRENT_SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width   //当前屏幕的宽
#define kHeadH 44
#define kHeadFont [UIFont systemFontOfSize:15]
#define kTextColor [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]
#define kBackColor [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0]
#define kLineColor [UIColor colorWithRed:178/255.0 green:178/255.0 blue:178/255.0 alpha:1.0]
#define kCancelColor [UIColor colorWithRed:0/255.0 green:198/255.0 blue:12/255.0 alpha:1.0]

@implementation PopupPickerMenuHeader

+ (CGFloat)headHeight
{
    return kHeadH;
}

+ (UIView *)addHeaderTo:(PopupPickerControl *)control withTitle:(NSString *)title
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CURRENT_SCREEN_WIDTH, kHeadH)];
    if (headView) {
        headView.backgroundColor = kBackColor;
        
        UIView *topLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CURRENT_SCREEN_WIDTH, 0.6)];
        topLineView.backgroundColor = kLineColor;
        [headView addSubview:topLineView];
        UIView *bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, kHeadH - 0.6, CURRENT_SCREEN_WIDTH, 0.6)];
        bottomLineView.backgroundColor = kLineColor;
        [headView addSubview:bottomLineView];
        
        UILabel *headLbl = [[UILabel alloc] initWithFrame:headView.bounds];
        headLbl.text = title;
        headLbl.font = kHeadFont;
        headLbl.textColor = kTextColor;
        headLbl.textAlignment = NSTextAlignmentCenter;
        [headView addSubview:headLbl];
        
        UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, kHeadH)];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:kCancelColor forState:UIControlStateNormal];
        [cancelBtn.titleLabel setFont:kHeadFont];
        [cancelBtn addTarget:control action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
        [headView addSubview:cancelBtn];
    }
    return headView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
