//
//  BaseTableViewViewController.m
//  PET
//
//  Created by liu_yakai on 16/10/8.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import "BaseTableViewViewController.h"

static NSString *Identifier=@"Identifier";

@interface BaseTableViewViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BaseTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.baseTableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.baseTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Identifier];
    self.baseTableView.delegate=self;
    self.baseTableView.dataSource=self;
    self.baseTableView.tableFooterView=[[UIView alloc]init];
    [self.view addSubview:self.baseTableView];
}

//调整cell的分割线
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [cell setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:UIEdgeInsetsZero];
        
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.baseArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [[self.baseArray objectAtIndex:section]count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section  {
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    UITableView *cell=[super tableView:tableView cellForRowAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    return cell;
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
