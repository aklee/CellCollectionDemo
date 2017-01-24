//
//  FinancialNewsTableViewCell.h
//  JiuCai
//
//  Created by ak on 15/7/15.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import <UIKit/UIKit.h>
//自定义cell 
@interface FinancialNewsTableViewCell : UITableViewCell
//@property(nonatomic,copy)FinancialInfo*model;
+(NSString*)identify;
+(FinancialNewsTableViewCell*)cellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView  ;
+(float)FinancialNewsTableViewCellH;

@end
