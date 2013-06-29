//
//  main.m
//  cocos2d-ios-demo
//
//  Created by floyd on 13-6-23.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//

//#import <UIKit/UIKit.h>
//
//int main(int argc, char *argv[]) {
//    
//    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
//    int retVal = UIApplicationMain(argc, argv, nil, @"AppController");
//    [pool release];
//    return retVal;
//}


#import <UIKit/UIKit.h>
#import "AppSDelegate.h"

int main(int argc, char *argv[])
{
    @try {
        @autoreleasepool {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppSDelegate class]));
        }
    }
    @catch (NSException *exception) {
        
        
        @throw exception;
    }
    
}
