//
//  TransferSelectCardView.h
//  BreezeLib
//
//  Created by ak on 2017/1/22.
//  Copyright © 2017年 hundsun. All rights reserved.


#import <UIKit/UIKit.h>
//银行卡选择View
@interface TransferSelectCardView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* tb;
@property(nonatomic,strong)UIView* toolView;
@property(nonatomic,copy)void(^didSelect)(NSString* cardNum);
-(void)show;
-(void)hide;
@end


@interface TransferCardCell: UITableViewCell
+(NSString*)identify;
+(float)rowHeight;
@end



@interface TransferPwdView :UIView
@property(nonatomic,copy)void(^pay)(NSString* pwd,NSString* money);
-(void)show;
-(void)hide;
@end
