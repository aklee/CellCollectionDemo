//
//  BankCardTableViewCell.m
//  JiuCai
//
//  Created by ak on 15/7/18.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import "BankCardTableViewCell.h"
@interface BankCardTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *numLb;

@end
@implementation BankCardTableViewCell
+(NSString*)identify{
    return @"bankcardTbCell";
}
+(instancetype)BankCardView{
         //       请在nib中设置identifier
      BankCardTableViewCell*  cell=(BankCardTableViewCell*)[[[UINib nibWithNibName:@"BankCardTableViewCell" bundle:nil]instantiateWithOwner:nil options:nil  ]firstObject ];
        //设置选中样式
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
     cell.titleLb.text=@"招商银行";
     cell.imgV.image=[UIImage imageNamed:@"banklogo"];
     cell.numLb.text=[NSString stringWithFormat:@"( 尾号 %@ )",@"9999" ];
    return cell;
    
}
//
//-(void)setCard:(Card *)card{
//
//    _card=card;
//    
//    self.imgV.image=[UIImage imageNamed:card.bankLogoPath1];
//    
//    self.titleLb.text=card.bankName;
//    
//    if (card.bankCardNo .length<4) {
//        self.numLb.text=[NSString stringWithFormat:@"( 尾号 %@ )",@"卡号错误" ];
//    }
//    else{
////        截取最后4位数字
//        NSString*carNumber=[card.bankCardNo substringFromIndex:card.bankCardNo.length-4];
//        self.numLb.text=[NSString stringWithFormat:@"( 尾号 %@ )",carNumber ];
//
//    }
//}

-(void)layoutSubviews{
    [super layoutSubviews];
 
}
@end
