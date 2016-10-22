//
//  AppDelegate.m
//  PET
//
//  Created by liu_yakai on 16/8/31.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import "AppDelegate.h"
#import "SvUDIDTools.h"
#import "BluetoothObject.h"

@interface AppDelegate ()<CBCentralManagerDelegate,CBPeripheralDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self C_init];
   
    return YES;
}

-(void)C_init{
   _manager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
}
//开始查看服务，蓝牙开启
- (void)centralManagerDidUpdateState:(CBCentralManager *)central{
    switch (central.state) {
        case CBCentralManagerStatePoweredOn:
        {
//            蓝牙打开
            [_manager scanForPeripheralsWithServices:nil/*@[[CBUUID UUIDWithString:@"FF15"]]*/  options:@{CBCentralManagerScanOptionAllowDuplicatesKey : @YES }];
        }
            break;
        case CBCentralManagerStatePoweredOff:
//            蓝牙未打开
            break;
        default:
            break;
    }
}

//查到外设后，停止扫描，连接设备
-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    
    _peripheral = peripheral;
//    连接蓝牙
        [_manager connectPeripheral:_peripheral options:nil];
    
    [self.manager stopScan];
    
 
}

//连接外设成功，开始发现服务
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    
    [self.peripheral setDelegate:self];
    [self.peripheral discoverServices:nil];
    
   
}

//连接外设失败
-(void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    NSLog(@"%@",error);
    }
//已发现服务
-(void) peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error{
    
  
    for (CBService *s in peripheral.services) {
        
        
        if ([s.UUID isEqual:[CBUUID UUIDWithString:@"000056ef-0000-1000-8000-00805f9b34fb"]]) {
            [peripheral discoverCharacteristics:nil forService:s];
        }
    }
}


//已搜索到Characteristics
-(void) peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error{
    
    for (CBCharacteristic *c in service.characteristics) {
        
        if ([c.UUID isEqual:[CBUUID UUIDWithString:@"000034e1-0000-1000-8000-00805f9b34fb"]]) {
            _writeCharacteristic = c;
            //同步所有数据
            [self sendBut];
            
        }
        
        if ([c.UUID isEqual:[CBUUID UUIDWithString:@"000034e2-0000-1000-8000-00805f9b34fb"]]) {
            [_peripheral readValueForCharacteristic:c];
            [_peripheral setNotifyValue:YES forCharacteristic:c];
        }
        
    }
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    NSLog(@"断开设备连接");
   
}
//获取外设发来的数据，不论是read和notify,获取数据都是从这个方法中读取。
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    
    NSLog(@"%@",characteristic.value);
    NSData *data=characteristic.value;
}
//中心读取外设实时数据
- (void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
//    if (error) {
//        NSLog(@"Error changing notification state: %@", error.localizedDescription);
//    }
//    
//    // Notification has started
//    if (characteristic.isNotifying) {
//        [peripheral readValueForCharacteristic:characteristic];
//    } else { // Notification has stopped
//        // so disconnect from the peripheral
//        NSLog(@"Notification stopped on %@.  Disconnecting", characteristic);
////        断开连接
////        [self.manager cancelPeripheralConnection:self.peripheral];
//    }
}
//用于检测中心向外设写数据是否成功
-(void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    if (error) {
        NSLog(@"=======%@",error.userInfo);
    }else{
        NSLog(@"发送数据成功");
    }
    
    /* When a write occurs, need to set off a re-read of the local CBCharacteristic to update its value */
//    读取蓝牙设备
//    [peripheral readValueForCharacteristic:characteristic];
}

//发送数据读取蓝牙数据
-(void)send:(NSString *)sendStr{
    NSLog(@"%@",sendStr);
        for (int i=(int)sendStr.length; i<40; i++) {
            sendStr=[sendStr stringByAppendingString:@"0"];
        }
    NSLog(@"%lu",(unsigned long)sendStr.length);
    if (self.peripheral.state == CBPeripheralStateConnected) {
         NSData *testData=[self hexToBytes:sendStr];
        NSLog(@"%@",testData);
        [self.peripheral writeValue:testData forCharacteristic:self.writeCharacteristic type:CBCharacteristicWriteWithResponse];
        [self.peripheral setNotifyValue:YES forCharacteristic:self.writeCharacteristic];
    }
}
//将发送的命令转成data数据返回
- (NSData *)hexToBytes:(NSString *)str
{
    NSMutableData* data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 <= str.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString* hexStr = [str substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}


-(void)sendBut{
     [self send:[NSString stringWithFormat:@"5a0100%@00010001",[self str]]];
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

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
//    self.uuidStr=[[SvUDIDTools UDID] stringByReplacingOccurrencesOfString:@"-" withString:@""];
//    NSLog(@"udid in keychain %@", self.uuidStr);
//    
//    NSLog(@"current identityForVendor %@", [UIDevice currentDevice].identifierForVendor);
}






- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
