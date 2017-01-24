/******************************************************************
 文件名称: UIColorAdditions.m
 系统名称: 手机银行
 模块名称: 客户端
 类 名 称: UIColorAdditions
 软件版权: 恒生电子股份有限公司
 功能说明: 
 系统版本: 
 开发人员: cyliu
 开发时间: 11-4-19
 审核人员:
 相关文档:
 修改记录: 需求编号 修改日期 修改人员 修改说明
 
 ******************************************************************/


#import "UIColorAdditions.h"

@implementation UIColor(Hex)
+ (UIColor*)colorWithHex:(NSString*)hex{
	return [UIColor colorWithHex:hex andAlpha:1.0f];
}

+ (UIColor*)colorWithHex:(NSString*)hex andAlpha:(float)alpha{
	hex = [hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	if (!hex || [hex length] != 7) {
		return [UIColor clearColor];
	}
	
	unsigned red = 256, green = 256, blue = 256;
	
	NSRange redRange = {1,2};
	NSScanner *scanner = [NSScanner scannerWithString:[hex substringWithRange:redRange]];
	[scanner scanHexInt:&red];

	NSRange greenRange = {3,2};
	scanner = [NSScanner scannerWithString:[hex substringWithRange:greenRange]];
	[scanner scanHexInt:&green];
	
	NSRange blueRange = {5,2};
	scanner = [NSScanner scannerWithString:[hex substringWithRange:blueRange]];
	[scanner scanHexInt:&blue];
	
	if (red == 256 || green == 256 || blue == 256) {
		return nil;
	}
	else {
		return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
	}
}
@end