//
//  ActionCellManager.h
//  CellCollectionDemo
//
//  Created by ak on 2017/1/24.
//  Copyright © 2017年 ak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Target_CellBase : NSObject


-(void)Action_registerClsName:(NSDictionary*)param;
-(UITableViewCell*)Action_cellforRowAtIndexPath:(NSDictionary*)param;
-(id)Action_heightForRowAtIndexPath:(NSDictionary*)param;
-(void)Action_didSelectRowAtIndexPath:(NSDictionary*)param;

@end
