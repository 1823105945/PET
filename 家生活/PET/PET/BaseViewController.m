//
//  BaseViewController.m
//  PET
//
//  Created by liu_yakai on 16/9/5.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self blackUI];
}
-(void)blackUI{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 20, 100, 44);
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(blackClock) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)blackClock{
    [self.navigationController popViewControllerAnimated:YES];
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
