//
//  CardCell.m
//  JiuCai
//
//  Created by ak on 15/7/13.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import "UILabel+Tool.h"
#import "CardCell.h"
//#import "MJExtension.h"
//#import "PwdAlertViewController.h"
@interface CardCell()
@property (weak, nonatomic) IBOutlet UIImageView *bankImgV;
@property (weak, nonatomic) IBOutlet UILabel *bankName;
@property (weak, nonatomic) IBOutlet UILabel *bankNo;
@property (weak, nonatomic) IBOutlet UILabel *dateLb;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIImageView *bgImgV;
@property (weak, nonatomic) IBOutlet UILabel *personNameLb;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bankImgVH;
@property (weak, nonatomic) IBOutlet UIImageView *jiucaiLogo;

@property (weak, nonatomic) IBOutlet UIButton *ridBtn;
- (IBAction)ridBind;

@end
@implementation CardCell
+(NSString*)identify{
    return @"CardCellIdentify";
}
+ (CardCell *)CardCellView
{
    CardCell * cellView = (CardCell*)[[[UINib nibWithNibName:@"CardCell" bundle:nil]instantiateWithOwner:nil options:nil  ]lastObject ];
    return cellView;
}

+(CardCell*)cellWithTableView:(UITableView *)tableView {
    CardCell*cell  = [tableView dequeueReusableCellWithIdentifier:[CardCell identify]];
    
    if (!cell) {
        NSLog(@"%p",cell);
//       请在nib中设置identifier
        cell=(CardCell*)[[[UINib nibWithNibName:@"CardCell" bundle:nil]instantiateWithOwner:nil options:nil  ]lastObject ];
        //设置选中样式
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return cell;
    
}
-(void)setHideRidBtn:(bool)hideRidBtn{
    self.ridBtn.hidden=YES;
}


-(void)awakeFromNib{

    [super awakeFromNib];
    
    float rate=0.14 ,contentMarginL=18;
    if (IS_IPHONE6OrLater) {
        contentMarginL=30;
    }
    
    float logoBgViewW =(kUIScreenWidth-contentMarginL*2)*rate;
    
    float bankImgVW =logoBgViewW;
    
    self.layer.backgroundColor=[UIColor clearColor].CGColor;
    
    self.bankImgVH.constant=bankImgVW;
    
    [self.bankImgV setCorner:bankImgVW/2.0];
    
    [self.bankImgV setBorder:2 color:[UIColor whiteColor]];
    
    self.bankImgV.layer.backgroundColor=[UIColor whiteColor].CGColor;
    
    [self setCorner:18];
    
    if (IS_IPHONE6PlusOrLater) {
        [self.bankNo addFontSize:2];
        [self.bankName addFontSize:2];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
        
}


-(void)setFrame:(CGRect)frame{

    float marginT=20, marginL=18;
    if (IS_IPHONE6OrLater) {
        marginT=30;
        marginL=30;
    }
    frame.origin.y+=marginT;
    frame.size.height-=marginT;
    
    frame.size.width-=2*marginL;
    frame.origin.x+=marginL;
    [super setFrame:frame];
}



-(void)test1{
    self.lineView .backgroundColor=[UIColor clearColor];
    self.bgImgV.image=[UIImage imageNamed:@"电子账户卡面"];
    self.personNameLb.text=@"钱多多";
    
    self.bankImgV.image=[UIImage imageNamed:@"banklogo"];
    self.ridBtn.hidden=YES;
    self.bankNo.text = @"6216610100008898222";
    self.dateLb.text =[NSString stringWithFormat:@"开卡日期：%@", @"2017-01-01"];
    self.jiucaiLogo.hidden=NO;
    self.bankName.hidden=YES;
    
    self.bankName.text = @"招商银行";
}

-(void)test2{
    
    self.lineView .backgroundColor=[UIColor colorWithHex:@""];
    self.bgImgV.image=nil;
    self.personNameLb.text=@"";
    
//    [self.bankImgV sd_setImageWithURL:[NSURL URLWithString: card.bankLogoPath1] placeholderImage:[UIImage imageNamed:LoadingImg] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
//        if (!error) {
//            self.bankImgV.image=image;
//            return;
//        }
//        else{
//            self.bankImgV.image=[UIImage imageNamed:ErrorImg];
//        }
//    }];
    self.ridBtn.hidden=NO;
    self.dateLb.text =[NSString stringWithFormat:@"绑定日期：%@", @"123123"];;
    
    self.bankNo.text = @"6216610100008898222";
    
    self.jiucaiLogo.hidden=YES;
    self.bankName.hidden=NO;
}
/*
-(void)setCard:(Card *)card{
 
//    NSLog(@"setCard %@",@(self.logoBgView.size.height/2.0));
    
//    [self.logoBgView setCorner:self.logoBgView.size.height/2.0];
//    [self.bankImgV setCorner:self.bankImgV.size.height/2.0];
     _card=card;

//    03030000

//    9c自定义卡片
    if ([card.bankNo isEqualToString:@"000000"]) {
        self.lineView .backgroundColor=[UIColor clearColor];
        self.bgImgV.image=[UIImage imageNamed:@"电子账户卡面"];
        self.personNameLb.text=card.personName;
        
        self.bankImgV.image=[UIImage imageNamed:@"电子账户卡面logo"];
        self.ridBtn.hidden=YES;
        self.bankNo.text = card.bankCardNo;
        self.dateLb.text =[NSString stringWithFormat:@"开卡日期：%@", card.bindDate];
        self.jiucaiLogo.hidden=NO;
        self.bankName.hidden=YES;
        
    
    }
    else{
        
        self.lineView .backgroundColor=[UIColor colorWithHexString:card.color.bgColor];
        self.bgImgV.image=nil;
          self.personNameLb.text=@"";
        
        [self.bankImgV sd_setImageWithURL:[NSURL URLWithString: card.bankLogoPath1] placeholderImage:[UIImage imageNamed:LoadingImg] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            if (!error) {
                self.bankImgV.image=image;
                return;
            }
            else{
                self.bankImgV.image=[UIImage imageNamed:ErrorImg];
            }
        }];
        self.ridBtn.hidden=NO;
        self.dateLb.text =[NSString stringWithFormat:@"绑定日期：%@", card.bindDate];;
        
        self.bankNo.text = card.bankCardNoSecure;
        
        self.jiucaiLogo.hidden=YES;
        self.bankName.hidden=NO;
    }
    self.bankName.text = card.bankName;
    

}
 
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)ridBind {
    if ([self.cardDelegate respondsToSelector:@selector(cardCellRidBind:)]) {
        [self.cardDelegate cardCellRidBind:self];
    }
}

+(float )CardCellH{
   
    
    if (IS_IPHONE6OrLater) {
        return 165;
    }
    if (IS_IPHONE6PlusOrLater) {
        return 200;
    }
    
    return 135;
}

+(float )CardCellW{
    
    float  marginL=18;
    
    if (IS_IPHONE6OrLater) {
         marginL=30;
    }
    

    return kUIScreenWidth-2*marginL;
}


@end
