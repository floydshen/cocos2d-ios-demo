//
//  UINavigationBar+CustomHeight.m
//  cocos2d-ios-demo
//
//  Created by floyd on 13-6-30.
//
//

#import "UINavigationBar+CustomHeight.h"

@implementation UINavigationBar (CustomHeight)


- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect barFrame = self.frame;
    barFrame.size.height = 100;
    self.frame = barFrame;
}

@end
