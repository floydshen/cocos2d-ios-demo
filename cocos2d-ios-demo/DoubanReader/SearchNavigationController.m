//
//  SearchNavigationController.m
//  cocos2d-ios-demo
//
//  Created by floyd on 13-6-29.
//
//

#import "SearchNavigationController.h"

@interface SearchNavigationController ()

@end

@implementation SearchNavigationController

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
    CGRect contentFrame = self.view.frame;
    contentFrame.origin.y = contentFrame.origin.y + RTTOPSEARCHHEIGHT * 2;
    contentFrame.size.height = contentFrame.size.height - RTTOPSEARCHHEIGHT;

    self.rtContentView = [[UIView alloc] init];
    self.rtContentView.frame = contentFrame;
    self.rtContentView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.rtContentView];
}

- (void)viewDidAppear:(BOOL)animated {
    CGRect frame = self.view.frame;
    frame.origin.y = frame.origin.y - RTTOPSEARCHHEIGHT;
    self.view.frame = frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)getRtContentView {
    return self.rtContentView;
}

- (void)addSubViewToContent:(UIView *)view {
    [self.rtContentView addSubview:view];
}

- (void)showSearchViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    self.view.frame = frame;
    self.view.backgroundColor = [UIColor blueColor];
    UITextField *textfield = [[UITextField alloc] init];
    textfield.backgroundColor = [UIColor redColor];
    textfield.frame = CGRectMake(50, 5, 200, 40);
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, 300, 50);
    [view setUserInteractionEnabled:YES];
    [view addSubview:textfield];
    [view setBackgroundColor:[UIColor blackColor]];
    [self.navigationBar addSubview:view];
}

@end
