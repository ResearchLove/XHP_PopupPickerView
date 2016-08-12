//
//  PopupPickerMenuHeader.h
//  XHP_PopupPickerView
//
//  Created by xiaohaiping on 16/8/9.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopupPickerControl.h"

@class PopupPickerControl;

@interface PopupPickerMenuHeader : UIView

+ (CGFloat)headHeight;
+ (UIView *)addHeaderTo:(PopupPickerControl *)control withTitle:(NSString *)title;

@end
