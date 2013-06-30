//
//  ListViewController.h
//  cocos2d-ios-demo
//
//  Created by floyd on 13-7-1.
//
//

#import <UIKit/UIKit.h>
#import "SSPullToRefresh.h"

@interface ListViewController : UIViewController
@property (nonatomic, strong) SSPullToRefreshView *refreshView;
@property (nonatomic, assign) UITableView *tableview;
@end
