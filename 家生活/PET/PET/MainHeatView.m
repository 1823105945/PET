//
//  MainHeatView.m
//  PET
//
//  Created by liu_yakai on 16/10/7.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import "MainHeatView.h"
#import "PET.h"


@implementation MainHeatView

- (void)awakeFromNib {
    [super awakeFromNib];
    __weak typeof(self)selfWeak=self;
    self.heatView=[[[NSBundle mainBundle]loadNibNamed:@"HeatView" owner:self options:nil]lastObject];
    self.heatView.Clock=^(UIButton *heatButton){
        if (selfWeak.Clock) {
            selfWeak.Clock(heatButton);
        }
    };
    self.heatView.frame=CGRectMake(screen_width/2-72, 0, 128, 128);
    [self.mainheatScroller addSubview:self.heatView];
}

@end
