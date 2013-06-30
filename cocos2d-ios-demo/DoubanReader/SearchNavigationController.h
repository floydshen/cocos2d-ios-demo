//
//  SearchNavigationController.h
//  cocos2d-ios-demo
//
//  Created by floyd on 13-6-29.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "UINavigationBar+CustomHeight.h"

@interface SearchNavigationController : UINavigationController<UINavigationControllerDelegate, UITextFieldDelegate>

@property(nonatomic, assign) UIView *rtContentView;

- (UIView *)getRtContentView;
- (void)showSearchViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)addSubViewToContent:(UIView *)view;

@end
