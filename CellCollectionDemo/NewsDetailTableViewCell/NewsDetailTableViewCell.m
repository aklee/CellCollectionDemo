//
//  NewsDetailTableViewCell.m
//  JiuCai
//
//  Created by ak on 15/7/13.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import "NewsDetailTableViewCell.h"
@interface NewsDetailTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *desLb;
@property (weak, nonatomic) IBOutlet UILabel *dateLb;

@end
@implementation NewsDetailTableViewCell

+(NSString*)identify{
    return @"NewsDetailTableViewCell";
}
+(float)rowHeight{
    return 98;
}
+(NewsDetailTableViewCell*)cellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView {
    NewsDetailTableViewCell*cell  = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell=(NewsDetailTableViewCell*)[[[UINib nibWithNibName:@"NewsDetailTableViewCell" bundle:nil]instantiateWithOwner:nil options:nil  ]firstObject ];
        //设置选中样式
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return cell;
    
}
-(void)setFrame:(CGRect)frame{
    float margin=12;
    frame.origin.y+=margin;
    frame.size.height-=margin;
    [super setFrame:frame];
}
//
//-(void)setModel:(NewsDetailModel *)model{
//    _model=model;
// 
//    self.titleLb.text=model.title;
//    self.desLb.text=model.info;
//    self.dateLb.text=model.date;
//    
//}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
