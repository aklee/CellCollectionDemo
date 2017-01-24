//
//  CTMediator+CellManager.h
//  CellCollectionDemo
//
//  Created by ak on 2017/1/24.
//  Copyright © 2017年 ak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTMediator.h"
@interface CTMediator(CellManager)

-(void)CTM_tableView:(UITableView*)tb registerClsName:(NSString*)clsName;

-(UITableViewCell*)CTM_tableView:(UITableView*)tb cellforRowAtIndexPath:(NSIndexPath*)ip clsName:(NSString*)clsName;
-(float)CTM_tableView:(UITableView*)tb heightForRowAtIndexPath:(NSIndexPath*)ip  clsName:(NSString*)clsName;
-(void)CTM_tableView:(UITableView*)tb didSelectRowAtIndexPath:(NSIndexPath*)ip  clsName:(NSString*)clsName;

-(void)CTM_CleanTargetClsCache;
@end
