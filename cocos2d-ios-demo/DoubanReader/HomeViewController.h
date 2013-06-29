//
//  HomeViewController.h
//  cocos2d-ios-demo
//
//  Created by floyd on 13-6-29.
//
//

#import <UIKit/UIKit.h>
#import "SSPullToRefresh.h"

@interface HomeViewController : UIViewController
@property (nonatomic, strong) SSPullToRefreshView *refreshView;
@property (nonatomic, assign) UITableView *tableview;
@end
