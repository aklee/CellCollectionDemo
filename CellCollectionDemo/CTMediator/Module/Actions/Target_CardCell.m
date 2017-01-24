//
//  Target_CardCell.m
//  CellCollectionDemo
//
//  Created by ak on 2017/1/24.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "Target_CardCell.h"
#import "CardCell.h"
@implementation Target_CardCell

-(void)Action_registerClsName:(NSDictionary *)param{
    UITableView* tb = param[@"tb"];
    [tb registerNib:[UINib nibWithNibName:@"CardCell" bundle:nil] forCellReuseIdentifier:[CardCell identify]];
}
-(UITableViewCell*)Action_cellforRowAtIndexPath:(NSDictionary*)param{
    
    UITableView* tb  =param[@"tb"];
    CardCell* cell=[tb dequeueReusableCellWithIdentifier:[CardCell identify]];
    [cell test1];
    return cell;
    
}
-(id)Action_heightForRowAtIndexPath:(NSDictionary*)param{
    
    return @([CardCell CardCellH]);
} 

@end
