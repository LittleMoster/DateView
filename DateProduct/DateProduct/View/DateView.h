//
//  DateView.h
//  BusinessiOS
//
//  Created by cguo on 2017/8/14.
//  Copyright © 2017年 zjq. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^GetDateBlock)(NSString *dateStr,NSDate *date);
@interface DateView : UIView

-(instancetype)initDateViewWithFrame:(CGRect)frame WithdatePicker:(UIDatePicker*)datepicker;
@property(nonatomic,copy)GetDateBlock setChooseDateblock;
@end
