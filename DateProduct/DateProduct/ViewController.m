//
//  ViewController.m
//  DateProduct
//
//  Created by cguo on 2017/8/26.
//  Copyright © 2017年 zjq. All rights reserved.
//

#import "ViewController.h"
#import "DateView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIDatePicker*pickerDate=[[UIDatePicker alloc]init];
    pickerDate.datePickerMode=UIDatePickerModeDate;
    DateView *dateView=[[DateView alloc]initDateViewWithFrame:CGRectMake(0, self.view.bounds.size.height-250, self.view.bounds.size.width, 250) WithdatePicker:pickerDate];
    dateView.setChooseDateblock=^(NSString *dateStr,NSDate *date)
        {
                NSLog(@"%@",dateStr);
                NSLog(@"%@",date);
        };
    [self.view addSubview:dateView];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
