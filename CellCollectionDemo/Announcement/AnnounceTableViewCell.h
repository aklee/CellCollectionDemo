//
//  AnnounceTableViewCell.h
//  JiuCai
//
//  Created by ak on 15/7/15.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "AnnounceModel.h"

@interface AnnounceTableViewCell : UITableViewCell

+(NSString*)identify;
+(float)rowHeight;

+(AnnounceTableViewCell*)cellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView ;
//@property(nonatomic,copy)AnnounceModel*model;
-(void)test;
@end
