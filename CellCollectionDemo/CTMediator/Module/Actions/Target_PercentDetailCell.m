//
//  Target_PercentDetailCell.m
//  CellCollectionDemo
//
//  Created by ak on 2017/1/24.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "Target_PercentDetailCell.h"
#import "PercentDetailCell.h"
@implementation Target_PercentDetailCell

-(void)Action_registerClsName:(NSDictionary *)param{
    UITableView* tb = param[@"tb"];
    [tb registerNib:[UINib nibWithNibName:@"PercentDetailCell" bundle:nil] forCellReuseIdentifier:[PercentDetailCell identify]];
}
-(UITableViewCell*)Action_cellforRowAtIndexPath:(NSDictionary*)param{
    
    UITableView* tb  =param[@"tb"];
    PercentDetailCell* cell=[tb dequeueReusableCellWithIdentifier:[PercentDetailCell identify]];
    
    [cell test];
    return cell;
    
}
-(id)Action_heightForRowAtIndexPath:(NSDictionary*)param{
    
    return @([PercentDetailCell rowHeight]);
}

@end
