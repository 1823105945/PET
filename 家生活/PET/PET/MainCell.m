//
//  MainCell.m
//  PET
//
//  Created by liu_yakai on 16/10/7.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import "MainCell.h"
#import "PET.h"

@implementation MainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)_init:(NSDictionary *)keyDic Title:(NSString *)titleTime{
   NSArray *keys= [keyDic allKeys];
    NSString *key=[keys objectAtIndex:0];
    NSLog(@"%@",key);
    self.cellImageView.image=OdeSetImageName(key);
    self.cellTitle.text=[keyDic objectForKey:key];
    self.celltime.text=titleTime;
}

@end
