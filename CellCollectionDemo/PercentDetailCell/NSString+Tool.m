//
//  UIView+AK.m
//
//  Created by AK Lee on 14-5-26.
//  Copyright (c) 2014年 ak. All rights reserved.
//

#import "NSString+Tool.h"
#import "sys/utsname.h"
@implementation NSString (Tool)

+ (NSString*)deviceString
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([deviceString isEqualToString:@"iPhone1,1"]) return @"iPhone 2G (A1203)";
    if ([deviceString isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
    if ([deviceString isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
    if ([deviceString isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
    if ([deviceString isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
    if ([deviceString isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
    if ([deviceString isEqualToString:@"iPhone4,1"]) return @"iPhone 4S (A1387/A1431)";
//    if ([deviceString isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
//    if ([deviceString isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
//    if ([deviceString isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (A1456/A1532)";
//    if ([deviceString isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (A1507/A1516/A1526/A1529)";
    
    
    if ([deviceString isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([deviceString isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    
    
    if ([deviceString isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (A1453/A1533)";
    if ([deviceString isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (A1457/A1518/A1528/A1530)";
    if ([deviceString isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
    if ([deviceString isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
    
    if ([deviceString isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G (A1213)";
    if ([deviceString isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G (A1288)";
    if ([deviceString isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G (A1318)";
    if ([deviceString isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G (A1367)";
    if ([deviceString isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G (A1421/A1509)";
    
    if ([deviceString isEqualToString:@"iPad1,1"])   return @"iPad 1G (A1219/A1337)";
    
    if ([deviceString isEqualToString:@"iPad2,1"])   return @"iPad 2 (A1395)";
    if ([deviceString isEqualToString:@"iPad2,2"])   return @"iPad 2 (A1396)";
    if ([deviceString isEqualToString:@"iPad2,3"])   return @"iPad 2 (A1397)";
    if ([deviceString isEqualToString:@"iPad2,4"])   return @"iPad 2 (A1395+New Chip)";
    if ([deviceString isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G (A1432)";
    if ([deviceString isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G (A1454)";
    if ([deviceString isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G (A1455)";
    
    if ([deviceString isEqualToString:@"iPad3,1"])   return @"iPad 3 (A1416)";
    if ([deviceString isEqualToString:@"iPad3,2"])   return @"iPad 3 (A1403)";
    if ([deviceString isEqualToString:@"iPad3,3"])   return @"iPad 3 (A1430)";
    if ([deviceString isEqualToString:@"iPad3,4"])   return @"iPad 4 (A1458)";
    if ([deviceString isEqualToString:@"iPad3,5"])   return @"iPad 4 (A1459)";
    if ([deviceString isEqualToString:@"iPad3,6"])   return @"iPad 4 (A1460)";
    
    if ([deviceString isEqualToString:@"iPad4,1"])   return @"iPad Air (A1474)";
    if ([deviceString isEqualToString:@"iPad4,2"])   return @"iPad Air (A1475)";
    if ([deviceString isEqualToString:@"iPad4,3"])   return @"iPad Air (A1476)";
    if ([deviceString isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G (A1489)";
    if ([deviceString isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G (A1490)";
    if ([deviceString isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G (A1491)";
    
    if ([deviceString isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([deviceString isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    return deviceString;
}

+ (NSString*)deviceID{
    
    NSString*uuid= [UIDevice currentDevice].identifierForVendor.UUIDString;
    
    //    NSLog(@"uuid:%@",uuid);
    
    return  uuid;
    
}

+ (NSString*)deviceID16{
    
    NSString*uuid= [UIDevice currentDevice].identifierForVendor.UUIDString;
    
    //    NSLog(@"uuid:%@",uuid);
    if (uuid.length>=16) {
      uuid =   [uuid substringToIndex:15];
    }
    return  uuid;
    
}
+ (float)iOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

+(NSAttributedString*)Percent:(NSString*)percentText intFontSize:(float)intFontSize decimalFontSize:(float)decimalFontSize percentFontSize:(float)percentFontSize{
    
    NSDictionary *attr1 = @{NSFontAttributeName: [UIFont systemFontOfSize:intFontSize] };
    
    NSDictionary *attr2 = @{NSFontAttributeName: [UIFont systemFontOfSize:decimalFontSize] };
    
    
    NSDictionary *attr3 = @{NSFontAttributeName: [UIFont systemFontOfSize:percentFontSize],NSForegroundColorAttributeName:[UIColor grayColor] };
    
    NSMutableAttributedString *attributedText=nil;
    
    if ([percentText isEqualToString:@"****"]) {
        NSString *strDisplayText =[NSString stringWithFormat:@"%@%%", percentText];
        
        attributedText = [[NSMutableAttributedString alloc] initWithString:strDisplayText];
        
        [attributedText setAttributes:attr1 range:NSMakeRange(0, strDisplayText.length-1)];
        
        [attributedText setAttributes:attr3 range:NSMakeRange(strDisplayText.length-1, 1)];
    }
    else{
        
    
    //    0.1234
    NSString*expectedAnnual=[NSString stringWithFormat:@"%.4f",[percentText doubleValue]];
    //   34
    NSString* fate_decimal = [NSString stringWithFormat:@".%@",[expectedAnnual substringWithRange:NSMakeRange(4, 2)]];
    
    int fateInt=[[expectedAnnual substringWithRange:NSMakeRange(2, 2)] intValue];
    //    12
    NSString* fate_int = [NSString stringWithFormat:@"%d",fateInt];
    
    
    NSString *strDisplayText =[NSString stringWithFormat:@"%.2f%%",[percentText doubleValue]*100.0f];
    
     attributedText  = [[NSMutableAttributedString alloc] initWithString:strDisplayText];
    
    [attributedText setAttributes:attr1 range:NSMakeRange(0, fate_int.length)];
    
    [attributedText setAttributes:attr2 range:NSMakeRange(fate_int.length, fate_decimal.length)];
    
    [attributedText setAttributes:attr3 range:NSMakeRange(strDisplayText.length-1, 1)];
    
    }
    return attributedText;
}

+(NSAttributedString*)Percent:(NSString*)percentText intFontSize:(float)intFontSize decimalFontSize:(float)decimalFontSize{
    return [NSString Percent:percentText intFontSize:intFontSize decimalFontSize:decimalFontSize percentFontSize:11];
   
}


+(NSString*)moneyInt:(int)m{
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    
    formatter.numberStyle =NSNumberFormatterDecimalStyle;
    
    NSString *newAmount = [formatter stringFromNumber:[NSNumber numberWithInt:m]];
    
    return newAmount;
    
}

//+(NSString*)moneyDouble:(double)m{
//    
//    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
//    
//    formatter.numberStyle =NSNumberFormatterDecimalStyle;
//    
//    NSString *newAmount = [formatter stringFromNumber:[NSNumber numberWithDouble:m]];
//    
//    return newAmount;
//}


+(NSString*)moneyIntString:(NSString*)m{
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    
    formatter.numberStyle =NSNumberFormatterDecimalStyle;
    
    NSString *newAmount = [formatter stringFromNumber:[NSNumber numberWithInt:[m intValue]]];
    
    return newAmount;
    
} 
//精确到小数点后2位小数
+(NSString*)moneyDoubleString:(NSString*)m{
    //精确到2位
    NSString* money= [NSString stringWithFormat:@"%.02lf",[m doubleValue]];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    NSString *newAmount = [formatter stringFromNumber:[NSNumber numberWithDouble:[money doubleValue]]];


    NSRange range=[newAmount rangeOfString:@"."];
    if (range.location==NSNotFound) {
        
        newAmount=[NSString stringWithFormat:@"%@.00",newAmount];

    }

     if (range.location!=NSNotFound&& (newAmount.length-range.location)==2) {
//        1.1 ->1.10
         
         newAmount=[NSString stringWithFormat:@"%@0",newAmount];
    }
    
    return newAmount;
}

+(NSString*)moneyDoubleStringNoDecimal:(NSString*)m{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    NSString *newAmount = [formatter stringFromNumber:[NSNumber numberWithDouble:[m doubleValue]]];
   
    return newAmount;
}


//格式话小数 四舍五入类型
+ (NSString *) decimalwithFormat:(NSString *)format  floatV:(double)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setPositiveFormat:format];
    
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]];
}


//遮盖身份证号码 3303**********0023
+(NSString *)certNoSecure:(NSString *)certNo  {
    //身份证固定18位
    NSString *result=certNo;

    if (certNo.length==18) {

        NSRange  range= (NSRange){4,10};

        result=[certNo stringByReplacingCharactersInRange:range withString:@"**********"];
        
    }
    
    return result;
}

//遮盖手机号码  152****0533
+(NSString *)mobileSecure:(NSString *)mobile{
    //手机号固定11位
    NSString *result=mobile;
   
    if (mobile.length==11) {
    
        NSRange  range= (NSRange){3,4};
        
        result=[mobile stringByReplacingCharactersInRange:range withString:@"****"];
        
        
    }
    return  result;
}


//遮盖银行卡号  6231 **** **** 9876
+(NSString *)bankCardNoSecure:(NSString*)bankCardNo{
    //银行卡号 16 到 19 位
    NSMutableString * mutableBankNo = [NSMutableString stringWithFormat:@"%@",bankCardNo];
    if (mutableBankNo.length >16) {
        [mutableBankNo deleteCharactersInRange:NSMakeRange(0, 3)];
    }
    NSUInteger startLength=( mutableBankNo.length-4);
        
    NSMutableString *star=[[NSMutableString alloc]init];
    for (int i=0; i<startLength; i++) {
            [star appendString:@"*"];
        }
        NSRange  range= (NSRange){0,startLength};
        
        NSString*nos=[ mutableBankNo stringByReplacingCharactersInRange:range withString:star];
        
        //          way2
        //        NSString*nos= self.bankCardNo;
        //
        ////        前后距离四位
        //        int margin=4;
        //
        //        NSRange r=(NSRange){margin,nos.length-margin*2 };
        //
        //        NSMutableString *star=[[NSMutableString alloc]init];
        //
        //        for (int i=0; i<nos.length-margin*2; i++) {
        //
        //            [star appendString:@"*"];
        //
        //        }
        //        nos=[nos stringByReplacingCharactersInRange:r withString:star];
        
        
        
        //            添加空格
        NSMutableString *no=[[NSMutableString alloc]initWithString:nos];
        
        for (int i=0; i<no.length; i++) {
            if (i%5==0) {
                [no insertString:@" " atIndex:i];
            }
        }
        
        mutableBankNo=no;
        
    
    return mutableBankNo;
    
}

//遮盖银行卡号  6231 1231 1232 9876
+(NSString *)bankCardSpace:(NSString*)bankCardNo{
    //银行卡号 16 到 19 位
    NSString *result=bankCardNo;
    
    if ( bankCardNo.length>=16&& bankCardNo.length<=19) {
                 
        //            添加空格
        NSMutableString *no=[[NSMutableString alloc]initWithString:bankCardNo];
        
        for (int i=0; i<no.length; i++) {
            if (i%5==0) {
                [no insertString:@" " atIndex:i];
            }
        }
        
        result=no;
        
    }
    return result;
    
}

 @end
