//
//  SettingCell.m
//  PET
//
//  Created by liu_yakai on 16/10/8.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import "SettingCell.h"

@implementation SettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)cellClock:(id)sender {
    if (self.Clock) {
        self.Clock();
    }
}

@end
