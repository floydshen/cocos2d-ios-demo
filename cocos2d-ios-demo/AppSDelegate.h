//
//  AppSDelegate.h
//  cocos2d-ios-demo
//
//  Created by floyd on 13-6-29.
//
//

#import <UIKit/UIKit.h>

@interface AppSDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end
