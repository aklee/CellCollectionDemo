//
//  PercentDetailCell.m
//  JiuCai
//
//  Created by ak on 15/8/25.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import "PercentDetailCell.h"
#import "NSString+Tool.h" 
@interface PercentDetailCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *dateLb;
@property (weak, nonatomic) IBOutlet UILabel *percentLb;
@property (weak, nonatomic) IBOutlet UILabel *moneyLb;

@end
@implementation PercentDetailCell

+(NSString*)identify{
    return @"PercentDetailCell";
}
+(float)rowHeight{
    return 100;
}
+(PercentDetailCell*)cellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView {
    PercentDetailCell*cell  = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        //       请在nib中设置identifier
        cell=(PercentDetailCell*)[[[UINib nibWithNibName:@"PercentDetailCell" bundle:nil]instantiateWithOwner:nil options:nil  ]firstObject ];
        

    }
    return cell;
    
}
-(void)setIsFromAsset:(bool)isFromAsset{
    _isFromAsset=isFromAsset;
    
    if (isFromAsset) {
    
        [self setBorder:0.5 color:[UIColor lightGrayColor]];
        
    }
    else{
        [self setBorder:0 color:[UIColor lightGrayColor]];
        
    }
}
-(void)setFrame:(CGRect)frame{
    float margin=15,marginL=10;
//    if (IS_IPHONE6OrLater) {
//        margin=0;
//    }
    frame.origin.y+=margin;
    frame.origin.x=10;
    frame.size.height-=margin;
    frame.size.width=kUIScreenWidth-marginL*2;
    [super setFrame:frame];
}

//-(void)setModel:(Asset99Y *)model{
//   
//    _model=model;
//    
//    self.titleLb.text=model.prdName;
//    
//    self.moneyLb.text=model.prdValueStr;
//    
//    self.dateLb.text=[NSString stringWithFormat:@"到期日：%@",model.endDate];
//    
//    self.percentLb.attributedText=[NSString Percent:model.guestRateStr intFontSize:22 decimalFontSize:15];
//    
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    //设置选中样式
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    
    [self setCorner:5];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)test{
    self.titleLb.text=@"宝宝金产品";

    self.moneyLb.text=@"1,000,000.00";

    self.dateLb.text=[NSString stringWithFormat:@"到期日：%@",@"2016-01-01"];

    self.percentLb.attributedText=[NSString Percent:@"0.1234" intFontSize:22 decimalFontSize:15];


}
@end
