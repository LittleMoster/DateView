//
//  DateView.m
//  BusinessiOS
//
//  Created by cguo on 2017/8/14.
//  Copyright © 2017年 zjq. All rights reserved.
//

#import "DateView.h"

@interface DateView ()

@property(nonatomic,strong)UIDatePicker *picket;
@property(nonatomic,strong) UIToolbar*toolbarDate;
@end

@implementation DateView

-(instancetype)initDateViewWithFrame:(CGRect)frame WithdatePicker:(UIDatePicker*)datepicker
{
    self=[super init];
    if (self) {
        
        self.frame=frame;
        self.picket=datepicker;
        self.picket.frame=CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, frame.size.height-44);
        self.toolbarDate=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        self.toolbarDate.tag=2;
        UIBarButtonItem *DateBtnCancel=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
        UIBarButtonItem*DateBtnFlexible=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem*DateBtnOK=[[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(setDate)];
        [self.toolbarDate setItems:@[DateBtnCancel,DateBtnFlexible,DateBtnOK]];
        
        [self addSubview:self.picket];
        [self addSubview:self.toolbarDate];

    }
    return self;
}

-(void)cancel
{
    [self removeFromSuperview];
}

-(void)setDate
{

    NSTimeZone *timeZone=[NSTimeZone timeZoneForSecondsFromGMT:8];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setTimeZone:timeZone];//相差八小时问题
    if (self.picket.datePickerMode==UIDatePickerModeTime)
    {
         [formatter setDateFormat:@"hh-mm-ss"];
    }else if(self.picket.datePickerMode==UIDatePickerModeDate)
    {
        [formatter setDateFormat:@"yyyy-MM-dd"];
    }else if(self.picket.datePickerMode==UIDatePickerModeDateAndTime)
    {
         [formatter setDateFormat:@"yyyy-MM-dd-hh-mm-ss"];//改成HH就变成24进制
    }else if (self.picket.datePickerMode==UIDatePickerModeCountDownTimer)//倒计时器模式
    {
         [formatter setDateFormat:@"hh-mm"];
    }
   
    NSString *dateStr= [formatter stringFromDate:self.picket.date];
    

    if (_setChooseDateblock!=nil) {
        _setChooseDateblock(dateStr,self.picket.date);
    }

    [self removeFromSuperview];
}
@end
