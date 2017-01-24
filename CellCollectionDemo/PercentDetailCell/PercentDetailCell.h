//
//  PercentDetailCell.h
//  JiuCai
//
//  Created by ak on 15/8/25.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define  TableViewIdentify @"PercentDetailCell"

@interface PercentDetailCell : UITableViewCell
+(NSString*)identify;
+(float)rowHeight;
//@property(nonatomic,copy)Asset99Y*model;
//引用自账户资产
@property(nonatomic,assign)bool isFromAsset;

+(PercentDetailCell*)cellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView ;

-(void)test;
@end
