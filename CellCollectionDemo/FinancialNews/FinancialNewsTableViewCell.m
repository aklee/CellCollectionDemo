//
//  FinancialNewsTableViewCell.m
//  JiuCai
//
//  Created by ak on 15/7/15.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//
#import "UILabel+Tool.h"
#import "FinancialNewsTableViewCell.h"
@interface FinancialNewsTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;

@end
@implementation FinancialNewsTableViewCell
+(NSString*)identify{
    return @"FinancialNewsTableViewCell";
}
+(FinancialNewsTableViewCell*)cellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView {
    FinancialNewsTableViewCell*cell  = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell=(FinancialNewsTableViewCell*)[[[UINib nibWithNibName:@"FinancialNewsTableViewCell" bundle:nil]instantiateWithOwner:nil options:nil  ]firstObject ];
        //设置选中样式
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return cell;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    if (IS_IPHONE6OrLater) {
        [self.titleLb addFontSize:2];
        [self.timeLb addFontSize:2];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(float)FinancialNewsTableViewCellH{
    return 0.13*kUIScreenHeight;
}

-(void)test{
//        self.titleLb.text=model.newsTitle;
//        self.timeLb.text=model.newsDate;
//                self.imgV.image=image;
}
//-(void)setModel:(FinancialInfo *)model{
//    _model=model;
//    
//    
//    self.titleLb.text=model.newsTitle;
//    self.timeLb.text=model.newsDate;
//
//    [self.imgV sd_setImageWithURL:[NSURL URLWithString:model.imagePath] placeholderImage:[UIImage imageNamed:LoadingImg] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
//        if (!error) {
//            self.imgV.image=image;
//            return;
//        }
//        
//        else{
//            
//            self.imgV.image=[UIImage imageNamed:ErrorImg] ;
//        }
//        
//        
//        
//    }];
//
//}
@end
