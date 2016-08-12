//
//  TestButton.m
//  XHP_PopupPickerView
//
//  Created by xiaohaiping on 16/8/12.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "TestButton.h"

#define DEGREES_TO_RADIANS(angle) ((angle)/180.0 * M_PI)
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kImageWidth (12)
#define kImageHeight (7)
#define kSpaceW (10)
#define kSpaceLeft (20)
#define kSpaceRight (20)

@implementation TestButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [self initUI];
}

- (void)initUI
{
    self.layer.borderWidth = 0.6;
    self.layer.borderColor = [UIColor greenColor].CGColor;
    self.layer.cornerRadius = 4;
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [self.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.titleLabel setMinimumScaleFactor:0.5];
    
    [self setImage:[UIImage imageNamed:@"icon_arrow"] forState:UIControlStateNormal];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self.titleLabel sizeToFit];
    
    CGFloat titleWidth = self.titleLabel.frame.size.width;
    
    CGFloat btnWidth = titleWidth + kImageWidth + kSpaceW + kSpaceLeft + kSpaceRight;
    
    CGRect frame = self.frame;
    frame.size.width = btnWidth;
    CGPoint center = self.center;
    self.frame = frame;
    self.center = center;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -kImageWidth + kSpaceLeft, 0, kImageWidth + kSpaceW + kSpaceRight);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, kSpaceLeft + titleWidth + kSpaceW, 0, -titleWidth + kSpaceLeft);
}

- (void)setSelected:(BOOL)selected
{
    if (selected != self.selected) {
        [UIView animateWithDuration:0.25 animations:^{
            self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, DEGREES_TO_RADIANS(180));
        }];
    }
    [super setSelected:selected];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
