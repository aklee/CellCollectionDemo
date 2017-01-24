//
//  UIView+AK.h
//  Created by AK Lee on 14-5-26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Tool)

+ (NSString*)deviceString;

+ (NSString*)deviceID;

//deviceID取前16位
+ (NSString*)deviceID16;

+ (float)iOSVersion;


//0.13  -> 13%
+(NSAttributedString*)Percent:(NSString*)percentText intFontSize:(float)intFontSize decimalFontSize:(float)decimalFontSize percentFontSize:(float)percentFontSize;

//0.13  -> 13%
+(NSAttributedString*)Percent:(NSString*)percentText intFontSize:(float)intFontSize decimalFontSize:(float)decimalFontSize;


//千分位转换 int string -> money 精确0位小数
+(NSString*)moneyIntString:(NSString*)m;

//千分位转换 double string -> money 精确2位小数
+(NSString*)moneyDoubleString:(NSString*)m;

//千分位转换 double string -> money
+(NSString*)moneyDoubleStringNoDecimal:(NSString*)m;




//千分位转换 int   -> money
//+(NSString*)moneyInt:(int)m;
//千分位转换 double   -> money
//+(NSString*)moneyDouble:(double)m;




//格式话小数 四舍五入类型
+ (NSString *)decimalwithFormat:(NSString *)format  floatV:(double)floatV;


//遮盖身份证号码
+(NSString *)certNoSecure:(NSString *)certNo;

//遮盖手机号码  152****0533
+(NSString *)mobileSecure:(NSString *)mobile;

//遮盖银行卡号  6231 **** **** 9876
+(NSString *)bankCardNoSecure:(NSString*)bankCardNo;

//遮盖银行卡号  6231 1231 1231 9876
+(NSString *)bankCardSpace:(NSString*)bankCardNo;
 
@end
