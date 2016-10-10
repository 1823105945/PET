//
//  WeekViewController.m
//  PET
//
//  Created by liu_yakai on 16/10/10.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import "WeekViewController.h"
#import "BluetoothObject.h"

@interface WeekViewController (){
    NSInteger index;
}
@property (weak, nonatomic) IBOutlet UILabel *timeLable;

@end

@implementation WeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    index=0;
    self.timeLable.text=[NSString stringWithFormat:@"%@-%@",[self dateTime:index-30],[self dateTime:index]];
}

- (IBAction)beforeClock:(id)sender {
    UIButton *button=(UIButton *)sender;
    if (button.tag==1000) {
        index=index-7;
        self.timeLable.text=[NSString stringWithFormat:@"%@-%@",[self dateTime:index-7],[self dateTime:index]];
    }else{
        index=index+7;
        self.timeLable.text=[NSString stringWithFormat:@"%@-%@",[self dateTime:index],[self dateTime:index+7]];
    }
}

-(NSString *)dateTime:(NSInteger)n{
    return [BluetoothObject getNDay:n];
}
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
