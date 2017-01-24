//
//  CTMediator+CellManager.m
//  CellCollectionDemo
//
//  Created by ak on 2017/1/24.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "CTMediator+CellManager.h"
#define ktarget @"NormalCell"
@implementation  CTMediator(CellManager)
-(void)CTM_tableView:(UITableView*)tb registerClsName:(NSString*)clsName{
    
    [self performTarget:clsName action:@"registerClsName" params:@{@"tb":tb} shouldCacheTarget:YES];
    
}

-(UITableViewCell*)CTM_tableView:(UITableView*)tb cellforRowAtIndexPath:(NSIndexPath*)ip clsName:(NSString*)clsName{
    
    
    return  [self performTarget:clsName action:@"cellforRowAtIndexPath" params:@{@"tb":tb} shouldCacheTarget:YES];
    
}
-(float)CTM_tableView:(UITableView*)tb heightForRowAtIndexPath:(NSIndexPath*)ip  clsName:(NSString*)clsName{
     id h  =  [self performTarget:clsName action:@"heightForRowAtIndexPath" params:@{@"tb":tb} shouldCacheTarget:YES];
    return [h floatValue] ;
    
}
-(void)CTM_tableView:(UITableView*)tb didSelectRowAtIndexPath:(NSIndexPath*)ip clsName:(NSString*)clsName{
    
    [self performTarget:clsName action:@"didSelectRowAtIndexPath" params:@{@"tb":tb,@"indexpath":ip} shouldCacheTarget:YES];
    
}




-(void)CTM_CleanTargetClsCache{
    [self releaseCachedTargetWithTargetName:ktarget];
}








@end
