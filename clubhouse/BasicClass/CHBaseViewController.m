//
//  CHBaseViewController.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/16.
//

#import "CHBaseViewController.h"

@interface CHBaseViewController ()

@end

@implementation CHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.navView];
    [self.navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(statusBarHeight);
        make.height.mas_equalTo(Height_NOStatus);
    }];
}


- (CHBaseNavView *)navView {
    if (_navView == nil) {
        
        _navView = [[CHBaseNavView alloc] init];
    }
    return _navView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
