//
//  ActionCellManager.m
//  CellCollectionDemo
//
//  Created by ak on 2017/1/24.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "Target_CellBase.h"

@implementation Target_CellBase

-(void)Action_registerClsName:(NSDictionary*)param{
    
}

-(UITableViewCell*)Action_cellforRowAtIndexPath:(NSDictionary*)param{
    
    return nil;
    
}
-(id)Action_heightForRowAtIndexPath:(NSDictionary*)param{
 
    return @(50);
}
-(void)Action_didSelectRowAtIndexPath:(NSDictionary*)param{
    NSLog(@"u tap %@",NSStringFromClass(self.class));
}

@end
