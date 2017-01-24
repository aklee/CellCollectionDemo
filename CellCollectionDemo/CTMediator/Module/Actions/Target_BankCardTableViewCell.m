//
//  Target_BankCardTableViewCell.m
//  CellCollectionDemo
//
//  Created by ak on 2017/1/24.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "Target_BankCardTableViewCell.h"
#import "BankCardTableViewCell.h"
@implementation Target_BankCardTableViewCell

-(void)Action_registerClsName:(NSDictionary *)param{
   UITableView* tb = param[@"tb"];
    [tb registerNib:[UINib nibWithNibName:@"BankCardTableViewCell" bundle:nil] forCellReuseIdentifier:[BankCardTableViewCell identify]];
}
-(UITableViewCell*)Action_cellforRowAtIndexPath:(NSDictionary*)param{
    
    UITableView* tb  =param[@"tb"];
    BankCardTableViewCell* cell=[tb dequeueReusableCellWithIdentifier:[BankCardTableViewCell identify]];
    
    return cell;
    
}
-(id)Action_heightForRowAtIndexPath:(NSDictionary*)param{
    
    return @(50);
}


@end
