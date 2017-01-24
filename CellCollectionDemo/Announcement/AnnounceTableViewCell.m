//
//  AnnounceTableViewCell.m
//  JiuCai
//
//  Created by ak on 15/7/15.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import "AnnounceTableViewCell.h"
#import "UILabel+Tool.h"
#define UnReadClassColor [UIColor colorWithHex:@"#333333"]
#define UnReadInfoColor [UIColor colorWithHex:@"#333333"]

#define ReadClassColor [UIColor colorWithHex:@"#999999"]
#define ReadInfoColor [UIColor colorWithHex:@"#999999"]


@interface AnnounceTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *circle;


@property (weak, nonatomic) IBOutlet UILabel *infoLb;
@property (weak, nonatomic) IBOutlet UILabel *dateLb;

@end
@implementation AnnounceTableViewCell

+(NSString*)identify{
    return @"AnnounceTableViewCell";
}
+(float)rowHeight{
    return 50;
}
+(AnnounceTableViewCell*)cellWithIdentifier:(NSString *)identifier tableView:(UITableView *)tableView {
    AnnounceTableViewCell*cell  = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell=(AnnounceTableViewCell*)[[[UINib nibWithNibName:@"AnnounceTableViewCell" bundle:nil]instantiateWithOwner:nil options:nil  ]firstObject ];
        //设置选中样式
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    
//    cell.isNew=YES;
//    
    return cell;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.circle.layer.cornerRadius=self.circle.bounds.size.width*0.5;
    self.circle.layer.masksToBounds=YES;
    
    if (IS_IPHONE6Plus) {
        [self.infoLb addFontSize:2];
        [self.dateLb addFontSize:2];
 
    }
   }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)test{
    bool isNew=NO;
    self.circle.hidden=isNew;
    
    self.dateLb.text=@"29/12";
    
    
    NSDictionary *attrClass = nil;
    
    NSDictionary *attrInfo = nil;
    
    
    if (isNew==NO) {
        //已读
        attrClass = @{NSForegroundColorAttributeName:ReadClassColor};
        attrInfo = @{NSForegroundColorAttributeName: ReadInfoColor};
        
    }
    if (isNew==YES) {
        //未读
        
        attrClass = @{NSForegroundColorAttributeName:UnReadClassColor};
        attrInfo = @{NSForegroundColorAttributeName: UnReadInfoColor};
    }
    
    NSString* topic = @"必读";
    NSString* content=@"我也不知道我也不知道";
    
    // 设置字体颜色
    NSString *text = [NSString stringWithFormat:@"[%@] %@",topic,content];
    
    NSMutableAttributedString *attrText = [[NSMutableAttributedString alloc] initWithString:text];
    
    [attrText setAttributes:attrClass range:NSMakeRange(0, topic.length+3)];
    
    [attrText setAttributes:attrInfo range:NSMakeRange(topic.length+3,content
                                                       .length)];
    // 设置行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:10];//调整行间距
    
    [attrText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    self.infoLb.attributedText = attrText;
}
/*
-(void)setModel:(AnnounceModel *)model{
    self.circle.hidden=!model.isNew;
    
//    self.infoLb.text=[NSString stringWithFormat:@"[%@] %@",model.classInfo,model.info];
    self.dateLb.text=model.date;
    
    
    NSDictionary *attrClass = nil;
    
    NSDictionary *attrInfo = nil;
    
    
    if (model.isNew==NO) {
        //已读
        attrClass = @{NSForegroundColorAttributeName:ReadClassColor};
        attrInfo = @{NSForegroundColorAttributeName: ReadInfoColor};
        
    }
    if (model.isNew==YES) {
        //未读
        
        attrClass = @{NSForegroundColorAttributeName:UnReadClassColor};
        attrInfo = @{NSForegroundColorAttributeName: UnReadInfoColor};
    }
    

    
    // 设置字体颜色
    NSString *text = [NSString stringWithFormat:@"[%@] %@",model.classInfo?model.classInfo:@"",model.info?model.info:@""];
    
    NSMutableAttributedString *attrText = [[NSMutableAttributedString alloc] initWithString:text];
    
    [attrText setAttributes:attrClass range:NSMakeRange(0, model.classInfo.length+3)];
    
    [attrText setAttributes:attrInfo range:NSMakeRange(model.classInfo.length+3, model.info
                                                       .length)];
    // 设置行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:10];//调整行间距
    
    [attrText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    self.infoLb.attributedText = attrText;
    
    //注： 调整行间距后  需要调整xib中dateLb的top间距来调整居中对齐
    
}
*/
@end
