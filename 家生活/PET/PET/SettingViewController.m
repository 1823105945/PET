//
//  SettingViewController.m
//  PET
//
//  Created by liu_yakai on 16/10/7.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import "SettingViewController.h"
#import "BluetoothObject.h"
#import "SttingHeatView.h"
#import "SettingCell.h"
#import "settingCell1.h"
#import "SttingCell2.h"
#import "SettingCell3.h"

static NSString *Identifier=@"Identifier";
static NSString *Identifier1=@"Identifier1";
static NSString *Identifier2=@"Identifier2";
static NSString *Identifier3=@"Identifier3";
@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initUI ];
}

-(void)_initUI{
    self.baseArray=[BluetoothObject readPlish:@"SttingPlish"];
    [self registercell:@"SettingCell" Mark:Identifier ];
    [self registercell:@"settingCell1" Mark:Identifier1 ];
     [self registercell:@"SttingCell2" Mark:Identifier2 ];
     [self registercell:@"SettingCell3" Mark:Identifier3 ];
    
}

-(void)registercell:(NSString *)xibName Mark:(NSString *)mark{
    
    [self.baseTableView registerNib:[UINib nibWithNibName:xibName bundle:nil] forCellReuseIdentifier:mark];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.baseArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [[self.baseArray objectAtIndex:section]count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section  {
    SttingHeatView *sttingHeatView=[[[NSBundle mainBundle]loadNibNamed:@"SttingHeatView" owner:self options:nil]lastObject];
    return sttingHeatView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        NSLog(@"最后一周运动统计异常次数");
    }else{
        if (indexPath.row==0) {
            NSLog(@"选择一个设备或宠物");
        }else if (indexPath.row==1){
            NSLog(@"消息通知");
        }else if(indexPath.row==2){
            NSLog(@"分享");
        }else{
            NSLog(@"关于");
            [self performSegueWithIdentifier:@"About" sender:nil];
        }
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 150;
    }
    return 0.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 60;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array=[self.baseArray objectAtIndex:indexPath.section];
    if (indexPath.section==0) {
        SettingCell *settingCell=(SettingCell *)[self C_init:Identifier RowAtIndexPath:indexPath];
        settingCell.selectionStyle=UITableViewCellSelectionStyleNone;
        settingCell.Clock=^(){
            NSLog(@"最后一周睡眠数据异常次数");
        };
        return settingCell;
    }else{
        if (indexPath.row==0) {
            settingCell1 *settingCell=(settingCell1 *)[self C_init:Identifier1 RowAtIndexPath:indexPath];
            settingCell.selectionStyle=UITableViewCellSelectionStyleNone;
            return settingCell;
        }else if (indexPath.row==1){
            SttingCell2 *settingCell=(SttingCell2 *)[self C_init:Identifier2 RowAtIndexPath:indexPath];
            settingCell.selectionStyle=UITableViewCellSelectionStyleNone;
            return settingCell;
        }else{
            SettingCell3 *settingCell=(SettingCell3 *)[self C_init:Identifier3 RowAtIndexPath:indexPath];
            settingCell.cellLable.text=[array objectAtIndex:indexPath.row];
            return settingCell;
        }
    }
    return nil;
}

-(UITableViewCell *)C_init:(NSString *)Name RowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.baseTableView dequeueReusableCellWithIdentifier:Name forIndexPath:indexPath];
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
