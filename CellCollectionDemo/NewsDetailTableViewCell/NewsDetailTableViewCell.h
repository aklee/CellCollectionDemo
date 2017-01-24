//
//  NewsDetailTableViewCell.h
//  JiuCai
//
//  Created by ak on 15/7/13.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "NewsDetailModel.h"

@interface NewsDetailTableViewCell : UITableViewCell

+(NSString*)identify;
+(float)rowHeight;
//@property(nonatomic,copy)NewsDetailModel*model;

+(NewsDetailTableViewCell*)cellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView ;
//-(void)test;
@end
