//
//  JiuCai
//
//  Created by ak on 15/7/13.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CardCell;
//#define  CardCellH 160
#define  CardCellIdentify
@protocol CardCellDelegate <NSObject>

-(void)cardCellRidBind:(CardCell*)cell;
@end

@interface CardCell : UITableViewCell
+(NSString* )identify;
//@property(nonatomic,copy)Card *card;

//default :NO
//@property(nonatomic,assign)bool isEAccount;
@property(nonatomic,assign)bool hideRidBtn;

@property(nonatomic,weak)id<CardCellDelegate> cardDelegate;

+(instancetype)cellWithTableView:(UITableView *)tableView ;

+ (CardCell *)CardCellView;

+(float)CardCellH;

+(float )CardCellW;

-(void)test1;

@end
