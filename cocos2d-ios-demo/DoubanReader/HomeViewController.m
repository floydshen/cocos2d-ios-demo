//
//  HomeViewController.m
//  cocos2d-ios-demo
//
//  Created by floyd on 13-6-29.
//
//

#import "HomeViewController.h"
#import "SearchNavigationController.h"
#import "ListViewController.h"
#import "UserCell.h"

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate, SSPullToRefreshViewDelegate>


@property(nonatomic, assign) UIView *rtContentView;

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    DLog(@"homeview didload");
    SearchNavigationController *snc = (SearchNavigationController *)self.navigationController;
    self.rtContentView = snc.rtContentView;
	// Do any additional setup after loading the view.
    
    self.tableview = [[UITableView alloc] init];
    CGRect frame = self.rtContentView.frame;
    frame.origin.y = 0;
    frame.size.height = frame.size.height - 100;
    self.tableview.frame = frame;
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    self.refreshView = [[SSPullToRefreshView alloc] initWithScrollView:self.tableview delegate:self];
    self.refreshView.contentView = [[SSPullToRefreshSimpleContentView alloc] initWithFrame:CGRectMake(0, 0, 320, 40) refreshFlg:YES];
    self.refreshView.expandedHeight = 40;
    [self.tableview addSubview:self.refreshView];
    [self.rtContentView addSubview:self.tableview];
    
    UIView *toolsView = [[UIView alloc] init];
    toolsView.frame = CGRectMake(0, frame.origin.y + frame.size.height, frame.size.width, 100);
    [toolsView setBackgroundColor:[UIColor grayColor]];
    [self.rtContentView addSubview:toolsView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *loadIdentifier = @"LoadCell1";
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:loadIdentifier];
    
    if (cell == nil) {
        cell = [[UserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.frame = CGRectMake(0, 0, 320, 40);
    }
    
    NSInteger row = [indexPath row];
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"==========%d", row] ;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ListViewController *view = [[ListViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}

#pragma mark - SSPullToRefreshViewDelegate
- (void)pullToRefreshViewDidStartLoading:(SSPullToRefreshView *)view {
    NSLog(@"-pullToRefreshViewDidStartLoading-");
    
//    [self.navigationController showSearchViewController:self.view animated:YES];
    
}


@end
