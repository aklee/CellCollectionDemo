//
//  UIView+AK.m
//  BaseDemo
//
//  Created by ak on 2016/6/22.
//  Copyright © 2016年 AK. All rights reserved.
//

#import "UIView+AK.h"
#import <objc/runtime.h>
static char kUIViewRuntimeProperty;
@implementation UIView(AK)
-(void)setT_x:(CGFloat)t_x
{
    CGRect frame = self.frame;
    frame.origin.x = t_x;
    self.frame = frame;
}

- (CGFloat)t_x
{
    return self.frame.origin.x;
}

- (void)setT_y:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)t_y
{
    return self.frame.origin.y;
}

- (void)setT_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)t_width
{
    return self.frame.size.width;
}

- (void)setT_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)t_height
{
    return self.frame.size.height;
}

- (void)setT_size:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)t_size
{
    return self.frame.size;
}

- (void)setT_origin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

-(void)setT_center:(CGPoint)center{
    self.center=center;
}
-(CGPoint)t_center{
    return self.center;
}

-(void)setT_centerX:(CGFloat)t_centerX{
    CGPoint c=self.center;
    c.x = t_centerX;
    self.center=c;
}
-(CGFloat)t_centerX{
    return self.center.x;
}

-(void)setT_centerY:(CGFloat)t_centerY{
    CGPoint c=self.center;
    c.y = t_centerY;
    self.center=c;
}
-(CGFloat)t_centerY{
    return self.center.y;
}


- (CGPoint)t_origin
{
    return self.frame.origin;
}

-(void)setCorner:(float)corner{
    self.layer.cornerRadius=corner;
    self.layer.masksToBounds=YES;
}


-(void)setBorder:(float)length color:(UIColor*)color{
    self.layer.borderWidth=length;
    self.layer.borderColor=color.CGColor;
}
//相对键盘距离
-(float)relativeKeyboard:(float)keyboardH{

    //view当前屏幕的相对位置
    CGPoint pointScreen = [self convertPoint:CGPointMake(0,self.t_height) toView:nil];
    
    //距离屏幕底部距离
    float marginBottom= [UIScreen mainScreen].bounds.size.height-pointScreen.y;
    
    if (marginBottom>=keyboardH) {
        //无遮挡
        return  0;
    }else{
        //被键盘遮挡 需调整y
        return  keyboardH-marginBottom;
    }
    
    
}
-(NSMutableDictionary*)getRuntimeProperty{
    NSMutableDictionary*dic=objc_getAssociatedObject(self, &kUIViewRuntimeProperty);
    if (dic) {
        return dic;
    }
    dic =  @{}.mutableCopy;
    objc_setAssociatedObject(self, &kUIViewRuntimeProperty, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return  dic;
}


-(void)setRuntimePropertyWithValue:(id)value forKey:(NSString *)key{
    NSMutableDictionary* dic = [self getRuntimeProperty];
    [dic setObject:value forKey:key];
}



@end
