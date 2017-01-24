//
//  Target_FinancialNews.m
//  CellCollectionDemo
//
//  Created by ak on 2017/1/24.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "Target_FinancialNewsTableViewCell.h"
#import "FinancialNewsTableViewCell.h"
@implementation Target_FinancialNewsTableViewCell

-(void)Action_registerClsName:(NSDictionary *)param{
    UITableView* tb = param[@"tb"];
    [tb registerNib:[UINib nibWithNibName:@"FinancialNewsTableViewCell" bundle:nil] forCellReuseIdentifier:[FinancialNewsTableViewCell identify]];
}
-(UITableViewCell*)Action_cellforRowAtIndexPath:(NSDictionary*)param{
    
    UITableView* tb  =param[@"tb"];
    FinancialNewsTableViewCell* cell=[tb dequeueReusableCellWithIdentifier:[FinancialNewsTableViewCell identify]];
    
    return cell;
    
}
-(id)Action_heightForRowAtIndexPath:(NSDictionary*)param{
    
    return @([FinancialNewsTableViewCell FinancialNewsTableViewCellH]);
}

@end
