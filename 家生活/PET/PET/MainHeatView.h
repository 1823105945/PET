//
//  MainHeatView.h
//  PET
//
//  Created by liu_yakai on 16/10/7.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeatView.h"

@interface MainHeatView : UICollectionReusableView
@property(nonatomic,weak)HeatView *heatView;
@property (weak, nonatomic) IBOutlet UIScrollView *mainheatScroller;
@property (weak, nonatomic) IBOutlet UILabel *heatTime;
@property(nonatomic,copy)void (^ Clock)(UIButton *button);
@end
