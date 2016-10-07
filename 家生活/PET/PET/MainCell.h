//
//  MainCell.h
//  PET
//
//  Created by liu_yakai on 16/10/7.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *celltime;
-(void)_init:(NSDictionary *)keyDic Title:(NSString *)titleTime;
@end
