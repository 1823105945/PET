//
//  HeatView.h
//  PET
//
//  Created by liu_yakai on 16/10/7.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeatView : UIView
@property (weak, nonatomic) IBOutlet UIButton *heatButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *heatTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *ageLabe;
@property(nonatomic,copy)void(^ Clock)(UIButton *heatButton);

@end
