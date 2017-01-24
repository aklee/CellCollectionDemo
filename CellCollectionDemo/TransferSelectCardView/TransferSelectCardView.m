//
//  TransferSelectCardView.m
//  BreezeLib
//
//  Created by ak on 2017/1/22.
//  Copyright © 2017年 hundsun. All rights reserved.
//

#import "TransferSelectCardView.h"

#import "NSString+WPAttributedMarkup.h"
//#import "RectPassword.h"

float tbH = 200;
float toolH=50;
@implementation TransferSelectCardView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    ({
    //mask
        UIView* v= [[UIView alloc]initWithFrame:self.bounds];
        v.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        [self addSubview:v];
    });
    
    
   self.toolView= ({
        //tool
        UIView* v= [[UIView alloc]initWithFrame:CGRectMake(0, self.t_height, self.t_width, toolH)];
        v.backgroundColor=[UIColor whiteColor];
        //返回
        UIButton* lBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, toolH, toolH)];
        [lBtn setImage:[UIImage imageNamed:@"layer-close"] forState:UIControlStateNormal];
        [lBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        [v addSubview:lBtn];
        
        //完成
        UIButton* rBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.t_width-toolH, 0, toolH, toolH)];
        rBtn.titleLabel.font=[UIFont systemFontOfSize:13];
        [rBtn setTitle:@"完成" forState:UIControlStateNormal];
        [rBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [rBtn addTarget:self action:@selector(finish) forControlEvents:UIControlEventTouchUpInside];
        [v addSubview:rBtn];
        
        [self addSubview:v];
       v;
    });
    
    self.tb = ({//tb
        UITableView* tb= [[UITableView alloc]initWithFrame:CGRectMake(0, self.t_height, self.t_width, tbH)];
        tb.separatorStyle=UITableViewCellSeparatorStyleNone;
        tb.rowHeight=50;
        tb.delegate=self;
        tb.dataSource=self;
        [tb registerClass:[TransferCardCell class] forCellReuseIdentifier:[TransferCardCell identify]];
        [self addSubview:tb];
        tb;
    });
    return self;
}
-(void)show{
    [UIView animateWithDuration:0.25 animations:^{
        self.tb.t_y = self.t_height-tbH;
        self.toolView.t_y = self.t_height-tbH-toolH;
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)hide{
    [UIView animateWithDuration:0.25 animations:^{
        self.tb.t_y = self.t_height;
        self.toolView.t_y = self.t_height;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
-(void)finish{
    if (self.didSelect) {
        self.didSelect(@"银行卡号");
    }
    [self hide];
}

//MARK:tb delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell*cell= [tableView dequeueReusableCellWithIdentifier:[TransferCardCell identify]];
    
    cell.textLabel.text=@"adsf";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //refresh unselected rows
    [[tableView indexPathsForSelectedRows] enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        
    }];
    [tableView reloadRowsAtIndexPaths:[tableView indexPathsForSelectedRows]  withRowAnimation:UITableViewRowAnimationNone];
    TransferCardCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected=YES;
    
}
@end

@interface TransferCardCell()
@property(nonatomic,weak)UIImageView* cardImgV;
@property(nonatomic,weak)UILabel* titleLb;
@property(nonatomic,weak)UIImageView* selectImgV;
@end
@implementation TransferCardCell
+(NSString*)identify{
    return @"TransferSelectCardView";
}
+(float)rowHeight{
    return 50;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    UIImageView* imgv=[UIImageView new];
    [self addSubview:imgv];
    imgv.image=[UIImage imageNamed:@"banklogo"];
    imgv.contentMode=UIViewContentModeScaleAspectFit;
    self.cardImgV=imgv;
    
    UILabel* titleLb = [UILabel new];
    titleLb.font=[UIFont systemFontOfSize:13];
    [self addSubview:titleLb];
    titleLb.text=@"招商银行";
    self.titleLb=titleLb;
    
    UIImageView* simgV=[UIImageView new];
    simgV.image= [UIImage imageNamed:@"select"];
    simgV.contentMode=UIViewContentModeScaleAspectFit;
    [self addSubview:simgV];
    self.selectImgV=simgV;
    
    [self.cardImgV makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@8);
        make.centerY.equalTo(self);
        make.width.height.equalTo(@25);
    }];
    [self.titleLb makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cardImgV.right).offset(5);
        make.centerY.equalTo(self);
        make.right.equalTo(self.selectImgV.left);
    }];
    
    [self.selectImgV makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.height.equalTo(@30);
        make.right.equalTo(self.right).offset(-10);
    }];
    
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
}

-(void)setSelected:(BOOL)selected{
    if (selected) {
        self.contentView.backgroundColor=[UIColor colorWithHex:@"#E9F7FE"];
        self.selectImgV.hidden=NO;
    }
    else{
        self.contentView.backgroundColor=[UIColor whiteColor];
        self.selectImgV.hidden=YES;
    }
}



@end
@interface TransferPwdView()
@property(nonatomic,strong)UILabel* titleLb;
@property(nonatomic,strong)UILabel* desLb;
@property(nonatomic,strong)UILabel* moneyLb;
@property(nonatomic,strong)UIView* bgV;
//@property(nonatomic,strong)RectPassword* pwd;
@end
@implementation TransferPwdView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    ({
        //mask
        UIView* v= [[UIView alloc]initWithFrame:self.bounds];
        v.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        [self addSubview:v];
        [v makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    });
    
    
    
    UIView* bgV= [[UIView alloc]init];
    bgV.backgroundColor=[UIColor whiteColor];
    [self addSubview:bgV];
    self.bgV=bgV;
    
    
    [bgV makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@150);
        make.left.right.equalTo(self);
        make.bottom.equalTo(self.bottom).offset(150);
    }];
    
    
    //返回
    UIButton* lBtn = [UIButton new];
    [lBtn setImage:[UIImage imageNamed:@"layer-close"] forState:UIControlStateNormal];
    [lBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [bgV addSubview:lBtn];
    
    
    
    NSDictionary* style1 = @{
                             @"orange": [UIColor orangeColor]
                             };
    
    

    UILabel* titleLb = [UILabel new];
    titleLb.textColor=[UIColor blackColor];
    titleLb.font=[UIFont systemFontOfSize:13];
    [bgV addSubview:titleLb];
    titleLb.attributedText=[@"请输入<orange>银行卡（尾号9999）</orange>密码" attributedStringWithStyleBook:style1];
    self.titleLb=titleLb;
    
    
    UILabel* moneyLb = [UILabel new];
    moneyLb.font=[UIFont boldSystemFontOfSize:14];
    moneyLb.textColor=[UIColor blackColor];
    [bgV addSubview:moneyLb];
    moneyLb.text=@"100.00";
    self.moneyLb=moneyLb;
    
    
    UILabel* desLb = [UILabel new];
    desLb.textColor=[UIColor redColor];
    desLb.font=[UIFont systemFontOfSize:13];
    [bgV addSubview:desLb];
    desLb.text=@"密码输入有误";
    self.desLb=desLb;
//    
//    RectPassword  * pwd = [[RectPassword alloc]initWithFrame:CGRectZero];
//    [bgV addSubview:pwd];
//    
//    pwd.inputPwd=^(NSString* pwdstr){
//        if (self.pay) {
//            self.pay(pwdstr,self.moneyLb.text);
//        }
//        //todo:返回密码是否正确
//        
//        return NO;
//    };
//    self.pwd=pwd;
//
    [lBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(bgV).offset(0);
        make.width.height.equalTo(@50);
    }];
    
    
    [self.titleLb makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(lBtn.centerY);
        make.centerX.equalTo(bgV.centerX);
        make.top.equalTo(@0);
        
    }];
    
    
    [moneyLb makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(bgV.centerX);
        make.top.equalTo(self.titleLb.bottom);
    }];
    
    
//    [pwd makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@250);
//        make.height.equalTo(@40);
//        make.centerX.equalTo(bgV.centerX);
//        make.top.equalTo(self.moneyLb.bottom).offset(@10);
//    }];
    [desLb makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(bgV.centerX);
        make.bottom.equalTo(self.bottom);
//        make.top.equalTo(pwd.bottom).offset(10);
    }];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    return self;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


-(void)show{
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.bgV updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.bottom).offset(0);
        }];
        
        
    } completion:^(BOOL finished) {
//        [self.pwd becomeFirstResponder];
    }];
    
}

-(void)hide{
    [UIView animateWithDuration:0.25 animations:^{
        
        [self.bgV updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.bottom).offset(150);
        }];

        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


-(void)keyboardWillShow:(NSNotification*)note{
    
    CGRect endRect =[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    float duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    float h = endRect.size.height;
    
    float marginKeyboard=[self.bgV relativeKeyboard:h];
    
    UIViewAnimationCurve anim=[note.userInfo[UIKeyboardAnimationCurveUserInfoKey] unsignedIntegerValue];
    //    endRect
    
    [UIView animateWithDuration:duration delay:0 options:(UIViewAnimationOptions)anim animations:^{
        //        self.view.t_y-=h;
        [self.bgV updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.bottom).offset(-marginKeyboard);
        }];
        
        [self layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)keyboardWillHide:(NSNotification*)note{
    [self.bgV updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom).offset(0);
    }];
}


@end

