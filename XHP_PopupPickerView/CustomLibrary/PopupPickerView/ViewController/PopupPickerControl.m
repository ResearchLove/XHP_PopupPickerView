//
//  PopupPickerView.m
//  XHP_PopupPickerView
//
//  Created by xiaohaiping on 16/8/9.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "PopupPickerControl.h"
#import "PopupPickerMenuCell.h"
#import "PopupPickerMenuHeader.h"


#define CURRENT_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height  //当前屏幕的高
#define CURRENT_SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width   //当前屏幕的宽

static Class _cellClass = nil;
static Class _headClass = nil;

@interface PopupPickerControl () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) PopupPickerControlBlock block;
@property (nonatomic, copy) NSArray *titles;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *baseView;
@property (nonatomic, assign) NSInteger index;

@end

@implementation PopupPickerControl


+ (void)setCellClass:(Class)cellClass
{
    _cellClass = cellClass;
}

+ (void)setHeadClass:(Class)headClass
{
    _headClass = headClass;
}

+ (void)showWithTitle:(NSString *)title
           WithTitles:(NSArray *)titles
         defaultIndex:(NSInteger)index
        selectedBlock:(PopupPickerControlBlock)selectedHandle
{
    PopupPickerControl *picker = [[PopupPickerControl alloc] initWithTitle:title WithTitles:titles defaultIndex:index selectedBlock:selectedHandle];
    [[[UIApplication sharedApplication].windows firstObject] addSubview:picker];
    [picker showView];
}

- (id)initWithTitle:(NSString *)title
         WithTitles:(NSArray *)titles
       defaultIndex:(NSInteger)index
      selectedBlock:(PopupPickerControlBlock)selectedHandle
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        self.block = selectedHandle;
        self.titles = titles;
        self.clipsToBounds = YES;
        
        UIButton *baseBtn = [[UIButton alloc] initWithFrame:self.bounds];
        [baseBtn addTarget:self action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:baseBtn];
        
        if (!_headClass) {
            _headClass = [PopupPickerMenuHeader class];
        }
        if (!_cellClass) {
            _cellClass = [PopupPickerMenuCell class];
        }
        
        self.baseView = [[UIView alloc] initWithFrame:CGRectMake(0, CURRENT_SCREEN_HEIGHT, CURRENT_SCREEN_WIDTH, [_headClass headHeight] + [_cellClass tableHeight])];
        _baseView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_baseView];
        
        [_baseView addSubview:[_headClass addHeaderTo:self withTitle:title]];
        
        self.index = index;
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [_headClass headHeight], CURRENT_SCREEN_WIDTH, [_cellClass tableHeight])];
        [_baseView addSubview:_tableView];
        
        [_tableView registerClass:_cellClass forCellReuseIdentifier:NSStringFromClass(_cellClass)];
        _tableView.bounces = FALSE;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

/**
 *   UITableViewDataSource
 *
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PopupPickerMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(_cellClass)];
    [cell setInfo:_titles[indexPath.row]];
    [cell setIsSelect:(_index == indexPath.row)];
    cell.tag = indexPath.row + 1000;
    return cell;
}

/**
 *  UITableViewDelegate
 *
 */
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [_cellClass cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *cells = [tableView visibleCells];
    for (PopupPickerMenuCell *cell in cells) {
        [cell setIsSelect:(cell.tag == indexPath.row + 1000)];
    }
    if (_index != indexPath.row) {
        _index = indexPath.row;
        if (self.block) {
            self.block(_titles[indexPath.row], indexPath.row);
        }
    }
    [self hideView];
}

/**
 *  显示选择视图
 */
- (void)showView
{
    CGRect frame = _baseView.frame;
    frame.origin.y -= frame.size.height;
    [UIView animateWithDuration:0.25 animations:^{
        _baseView.frame = frame;
    } completion:^(BOOL finished) {}];
}

/**
 *  隐藏选择视图
 */
- (void)hideView
{
    CGRect frame = _baseView.frame;
    frame.origin.y += frame.size.height;
    [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        _baseView.frame = frame;
    } completion:^(BOOL finished) {
        if (self.block) {
            self.block(nil, -1);
        }
        [UIView animateWithDuration:0.15 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
