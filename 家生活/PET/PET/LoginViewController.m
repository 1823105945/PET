//
//  ViewController.m
//  PET
//
//  Created by liu_yakai on 16/8/31.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import "LoginViewController.h"
#import "PET.h"
#import "AppDelegate.h"
#import "BluetoothObject.h"


@interface LoginViewController ()
{
    AppDelegate *app;
}
@end

@implementation LoginViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
//同步参数 注意时间问题
- (IBAction)clock:(id)sender {
    
   [app send:[NSString stringWithFormat:@"5a0100%@00010001",[self str]]];
}

-(NSString *)str{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YY,MM,dd,hh,mm,ss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    NSLog(@"dateString:%@",dateString);
    NSArray *b = [dateString componentsSeparatedByString:@","];
    NSString *str=@"";
    for (int i=0; i<b.count; i++) {
        NSLog(@"%@",[b objectAtIndex:i]);
        NSString *ff=[self ToHex:[[b objectAtIndex:i] longLongValue]];
        NSLog(@"%@",ff);
        str=[str stringByAppendingString:ff];
        NSLog(@"%@",str);
    }
    return str;
}
//时间转成16进制
-(NSString *)ToHex:(long long int)tmpid

{
    NSString * result;
    if(tmpid<10)
        
        result = [NSString stringWithFormat:@"0%llx",tmpid];
    
    else
        
        result = [NSString stringWithFormat:@"%llx",tmpid];
    return result;
}
//绑定设备
- (IBAction)bangding:(id)sender {
    [app send:[NSString stringWithFormat:@"5a0B0001c0eefb47870200000000000000000000"]];
//    ,app.uuidStr
}
//查询设备版本
- (IBAction)chaxunshebei:(id)sender {
    
}
//更新固件
- (IBAction)genxingujian:(id)sender {
}

//检查版本
- (IBAction)jianchabanben:(id)sender {
}
BOOL end;
- (void)viewDidLoad {
    [super viewDidLoad];
    app=KeyApp;
    }

//解绑
- (IBAction)jiebang:(id)sender {
    [app send:[NSString stringWithFormat:@"5a0B0003c0eefb47870200000000000000000000"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//重连

- (IBAction)连接:(id)sender {
    [app.manager connectPeripheral:app.peripheral options:nil];
}
- (IBAction)断开:(id)sender {
    [app.manager cancelPeripheralConnection:app.peripheral];
}

@end
