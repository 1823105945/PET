//
//  AppDelegate.h
//  PET
//
//  Created by liu_yakai on 16/8/31.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) CBCentralManager        *manager;
@property (nonatomic, strong) CBPeripheral            *peripheral;
@property (strong ,nonatomic) CBCharacteristic        *writeCharacteristic;
//发送数据读取蓝牙数据
-(void)send:(NSString *)sendStr;

@end

