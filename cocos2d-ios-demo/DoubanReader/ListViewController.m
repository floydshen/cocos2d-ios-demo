//
//  ListViewController.m
//  cocos2d-ios-demo
//
//  Created by floyd on 13-7-1.
//
//

#import "ListViewController.h"
#import "SearchNavigationController.h"

@interface ListViewController ()<UITableViewDataSource, UITableViewDelegate, SSPullToRefreshViewDelegate>
@property(nonatomic, assign) UIView *rtContentView;
@end

@implementation ListViewController

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
    DLog(@"list didload");
    SearchNavigationController *snc = (SearchNavigationController *)self.navigationController;
    self.rtContentView = snc.rtContentView;
	// Do any additional setup after loading the view.
    
    self.tableview = [[UITableView alloc] init];
    
    CGRect frame = self.rtContentView.frame;
    frame.origin.y = 0;
    frame.size.height = frame.size.height;
    
    self.tableview.frame = frame;
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    
    self.refreshView = [[SSPullToRefreshView alloc] initWithScrollView:self.tableview delegate:self];
    self.refreshView.contentView = [[SSPullToRefreshSimpleContentView alloc] initWithFrame:CGRectMake(0, 0, 320, 40) refreshFlg:YES];
    self.refreshView.expandedHeight = 40;
    [self.tableview addSubview:self.refreshView];
    
    [self.rtContentView addSubview:self.tableview];
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
    NSString *loadIdentifier = @"LoadCell";
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:loadIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.frame = CGRectMake(0, 0, 320, 40);
    }
    
    NSInteger row = [indexPath row];
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"!!!======%d", row] ;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    ListViewController *view = [[ListViewController alloc] init];
//    [self.navigationController pushViewController:view animated:YES];
}

#pragma mark - SSPullToRefreshViewDelegate
- (void)pullToRefreshViewDidStartLoading:(SSPullToRefreshView *)view {
    NSLog(@"-pullToRefreshViewDidStartLoading-");
    
    [self.navigationController showSearchViewController:self.view animated:YES];
    
}

@end
