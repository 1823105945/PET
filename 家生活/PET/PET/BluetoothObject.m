//
//  BluetoothObject.m
//  PET
//
//  Created by liu_yakai on 16/9/5.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import "BluetoothObject.h"

@implementation BluetoothObject

static BluetoothObject *bluetoothObject;
+(BluetoothObject *)shar{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bluetoothObject = [[BluetoothObject alloc]init];
       
    });
    return bluetoothObject;
}


+(NSString *)reple:(NSString *)repleStr Str:(NSString *)str RepFish:(NSString *)repFish{
    return [str stringByReplacingOccurrencesOfString:repleStr withString:repFish];
}

+(NSArray *)readPlish:(NSString *)name{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
    NSArray *data = [[NSArray alloc] initWithContentsOfFile:plistPath];
    return data;
}

+(NSString *)getNDay:(NSInteger)n{

     NSDate*nowDate = [NSDate date];

     NSDate* theDate;

     if(n!=0){

         NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
         theDate = [nowDate initWithTimeIntervalSinceNow: oneDay*n ];//initWithTimeIntervalSinceNow是从现在往前后推的秒数

     }else{

         theDate = nowDate;
     }

     NSDateFormatter *date_formatter = [[NSDateFormatter alloc] init];
     [date_formatter setDateFormat:@"yyyy/MM/dd"];
     NSString *the_date_str = [date_formatter stringFromDate:theDate];
    
     return the_date_str;
 }


@end
