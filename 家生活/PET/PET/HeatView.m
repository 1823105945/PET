//
//  HeatView.m
//  PET
//
//  Created by liu_yakai on 16/10/7.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import "HeatView.h"

@implementation HeatView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)clock:(id)sender {
    UIButton *button=(UIButton *)sender;
    NSLog(@"%@",button.currentBackgroundImage);
    if (self.Clock) {
        self.Clock(button);
    }
}

@end
