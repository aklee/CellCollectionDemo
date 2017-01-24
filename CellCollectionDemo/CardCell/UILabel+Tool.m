//
//  UIView+AK.m
//
//  Created by AK Lee on 14-5-26.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "UILabel+Tool.h"

@implementation UILabel (Tool)

-(void)addFontSize:(float)biggerSize{
    
    UIFont*f=  [UIFont
                fontWithDescriptor:self.font.fontDescriptor
                size:(self.font.pointSize+biggerSize)];
    
    self.font=f;
}

-(void)setFontSize:(float)size{
  
    self.font=[UIFont systemFontOfSize:size];
}


@end
