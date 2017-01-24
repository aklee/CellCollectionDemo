//
//  Target_NewsDetailTableViewCell.m
//  CellCollectionDemo
//
//  Created by ak on 2017/1/24.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "Target_NewsDetailTableViewCell.h"
#import "NewsDetailTableViewCell.h"
@implementation Target_NewsDetailTableViewCell

-(void)Action_registerClsName:(NSDictionary *)param{
    UITableView* tb = param[@"tb"];
    [tb registerNib:[UINib nibWithNibName:@"NewsDetailTableViewCell" bundle:nil] forCellReuseIdentifier:[NewsDetailTableViewCell identify]];
}
-(UITableViewCell*)Action_cellforRowAtIndexPath:(NSDictionary*)param{
    
    UITableView* tb  =param[@"tb"];
    NewsDetailTableViewCell* cell=[tb dequeueReusableCellWithIdentifier:[NewsDetailTableViewCell identify]];
    
//    [cell test];
    return cell;
    
}
-(id)Action_heightForRowAtIndexPath:(NSDictionary*)param{
    
    return @([NewsDetailTableViewCell rowHeight]);
}

@end
