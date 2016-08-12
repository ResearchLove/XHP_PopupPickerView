//
//  PopupPickerView.h
//  XHP_PopupPickerView
//
//  Created by xiaohaiping on 16/8/9.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PopupPickerControlBlock)(id title, NSInteger index);

@interface PopupPickerControl : UIView

+ (void)setCellClass:(Class )cellClass;

+ (void)showWithTitle:(NSString *)title
           WithTitles:(NSArray *)titles
         defaultIndex:(NSInteger)index
        selectedBlock:(PopupPickerControlBlock)selectedHandle;

- (void)hideView;

@end
