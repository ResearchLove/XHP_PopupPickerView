//
//  ViewController.h
//  XHP_PopupPickerView
//
//  Created by xiaohaiping on 16/8/9.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomMenuModel.h"
#import "PopupPickerControl.h"
#import "CustomMenuCell.h"
#import "TestButton.h"

@interface ViewController : UIViewController

@property (assign,nonatomic) NSInteger index;
@property (strong,nonatomic) NSArray *menuAry;
@property (strong,nonatomic) TestButton *testBtn;

@end

