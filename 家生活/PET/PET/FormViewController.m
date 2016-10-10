//
//  FormViewController.m
//  CloudPaletteBar
//
//  Created by test on 16/8/15.
//  Copyright © 2016年 test. All rights reserved.
//

#import "FormViewController.h"
#import "FormSelectView.h"
#import "PET.h"
#import "DayViewController.h"
#import "WeekViewController.h"
#import "MonthViewController.h"

@interface FormViewController ()

@end

@implementation FormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FormSelectView *formSelectView=[[FormSelectView alloc]initWithFrame:CGRectMake(0, 64, screen_width, 50)];
    formSelectView.tag=100;
    formSelectView.selectIndex=self.selectIndex;
    [self.view addSubview:formSelectView];
    NSMutableArray *lineArray=[NSMutableArray arrayWithObjects:@"no_select_line_Image",@"no_select_line_Image",@"", nil];
    NSMutableArray *imageNameArray=[NSMutableArray arrayWithObjects:@"no_select_Image",@"no_select_Image",@"no_select_Image", nil];
    
    [formSelectView addSubVc:[self _InitController] subTitles:@[@"当天",@"7天",@"30天"] LineArray:lineArray ImageNameArray:imageNameArray];
   
}
-(NSArray *)_InitController{
    DayViewController *officeEstateViewController=[[DayViewController alloc]init];
    WeekViewController *officeBanViewController=[[WeekViewController alloc]init];
    MonthViewController *officeHouseViewController=[[MonthViewController alloc]init];
    return @[officeEstateViewController,officeBanViewController,officeHouseViewController];
}

//-(void)blackVC{
//    if (self.BlackVC) {
//        self.BlackVC();
//    }
//    [self.navigationController popViewControllerAnimated:YES];
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
