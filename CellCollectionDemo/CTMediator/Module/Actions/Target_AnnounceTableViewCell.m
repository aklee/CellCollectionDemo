//
//  Target_AnnounceTableViewCell.m
//  CellCollectionDemo
//
//  Created by ak on 2017/1/24.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "Target_AnnounceTableViewCell.h"
#import "AnnounceTableViewCell.h"
@implementation Target_AnnounceTableViewCell

-(void)Action_registerClsName:(NSDictionary *)param{
    UITableView* tb = param[@"tb"];
    [tb registerNib:[UINib nibWithNibName:@"AnnounceTableViewCell" bundle:nil] forCellReuseIdentifier:[AnnounceTableViewCell identify]];
}
-(UITableViewCell*)Action_cellforRowAtIndexPath:(NSDictionary*)param{
    
    UITableView* tb  =param[@"tb"];
    AnnounceTableViewCell* cell=[tb dequeueReusableCellWithIdentifier:[AnnounceTableViewCell identify]];
    
    [cell test];
    return cell;
    
}
-(id)Action_heightForRowAtIndexPath:(NSDictionary*)param{
    
    return @([AnnounceTableViewCell rowHeight]);
}
@end
