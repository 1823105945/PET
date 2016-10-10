//
//  AboutViewController.m
//  PET
//
//  Created by liu_yakai on 16/10/9.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import "AboutViewController.h"
#import "AboutHeatView.h"
#import "AboutCell.h"
#import "PET.h"
#import "AboutFootView.h"

static NSString *Identifier=@"Identifier";

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.baseTableView.frame=CGRectMake(0, 46, screen_width, screen_height-64);
    self.baseArray=[[NSMutableArray alloc]initWithObjects:@"APP版本更新", nil];
    [self.baseTableView registerNib:[UINib nibWithNibName:@"AboutCell" bundle:nil] forCellReuseIdentifier:Identifier];
    AboutFootView *aboutFootView=[[[NSBundle mainBundle]loadNibNamed:@"AboutFootView" owner:self options:nil]lastObject];
    aboutFootView.frame=CGRectMake(0, screen_height-70, screen_width, 70);
    [self.view addSubview: aboutFootView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.baseArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [self.baseArray count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section  {
    AboutHeatView *sttingHeatView=[[[NSBundle mainBundle]loadNibNamed:@"AboutHeatView" owner:self options:nil]lastObject];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    sttingHeatView.vLable.text=[NSString stringWithFormat:@"爱宠物V%@",app_build];
    return sttingHeatView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 150;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 60;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        AboutCell *settingCell=[tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    settingCell.cellLable.text=[self.baseArray objectAtIndex:indexPath.row];
        return settingCell;
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
