//
//  AppSDelegate.m
//  cocos2d-ios-demo
//
//  Created by floyd on 13-6-29.
//
//

#import "AppSDelegate.h"
#import "HomeViewController.h"

@implementation AppSDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
//    SYFIndexViewController *ivc = [[[SYFIndexViewController alloc]init] autorelease];
//    UINavigationController *indexNavController = [[[UINavigationController alloc] initWithRootViewController:ivc]autorelease];
//    
//    SYFMapViewController *mvc = [[[SYFMapViewController alloc]init] autorelease];
//    UINavigationController *mapNavController = [[[UINavigationController alloc] initWithRootViewController:mvc] autorelease];
//    
//    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
//    
//    UITabBarItem *indexItem = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:0] autorelease];
//    UITabBarItem *mapItem = [[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:0] autorelease];
//    
//    indexNavController.tabBarItem = indexItem;
//    mapNavController.tabBarItem = mapItem;
//    
//    self.tabBarController.viewControllers = @[indexNavController, mapNavController];
//    self.tabBarController.delegate = self;
    
    
    HomeViewController *homeController = [[HomeViewController alloc] init];
    
    self.window.rootViewController = homeController;
    
    //    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:ivc] autorelease];
    //    self.window.rootViewController = self.navigationController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
