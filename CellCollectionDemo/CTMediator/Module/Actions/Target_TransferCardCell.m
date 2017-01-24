//
//  Target_TransferCardCell.m
//  CellCollectionDemo
//
//  Created by ak on 2017/1/24.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "Target_TransferCardCell.h"
#import "TransferSelectCardView.h"
@implementation Target_TransferCardCell

-(void)Action_registerClsName:(NSDictionary *)param{
    UITableView* tb = param[@"tb"];
    [tb registerClass:[TransferCardCell class] forCellReuseIdentifier:[TransferCardCell identify]];
    
}
-(UITableViewCell*)Action_cellforRowAtIndexPath:(NSDictionary*)param{
    UITableView* tb = param[@"tb"];
    TransferCardCell*cell= [tb dequeueReusableCellWithIdentifier:[TransferCardCell identify]];
    return cell;
    
}
-(id)Action_heightForRowAtIndexPath:(NSDictionary*)param{
    
    return @([TransferCardCell rowHeight]);
}

-(void)Action_didSelectRowAtIndexPath:(NSDictionary*)param{
    [super Action_didSelectRowAtIndexPath:param];
//    [tableView reloadRowsAtIndexPaths:[tableView indexPathsForSelectedRows]  withRowAnimation:UITableViewRowAnimationNone];
    
    
    UITableView* tableView = param[@"tb"];
    NSIndexPath* indexPath = param[@"indexpath"];
    TransferCardCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected=YES;
}

@end
