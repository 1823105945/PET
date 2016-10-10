//
//  DayViewController.m
//  PET
//
//  Created by liu_yakai on 16/10/10.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import "DayViewController.h"
#import "BluetoothObject.h"

@interface DayViewController (){
    NSInteger index;
}
@property (weak, nonatomic) IBOutlet UILabel *timeLable;


@end

@implementation DayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    index=0;
    self.timeLable.text=[self dateTime:index];

}

- (IBAction)beforeClock:(id)sender {
    UIButton *button=(UIButton *)sender;
    if (button.tag==1000) {
        index=index-1;
        self.timeLable.text=[self dateTime:index];
    }else{
        index=index+1;
        self.timeLable.text=[self dateTime:index];
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
