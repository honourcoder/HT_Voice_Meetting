//
//  CHClubPlanViewController.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/17.
//

#import "CHClubPlanViewController.h"
#import "CHClubPlanCell.h"
@interface CHClubPlanViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * hallTableView;

@end

@implementation CHClubPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navView.rightDelegate = self;
    [self.navView addLeftAction:@"🔍" isPng:NO];
    [self.navView addrightAction:@[@{@"name":@"🎈",@"isPng":@(NO)},@{@"name":@"💑",@"isPng":@(NO)},@{@"name":@"🏡",@"isPng":@(NO)}] interval:20];
    self.view.backgroundColor = [UIColor colorWithHexString:@"0xf0f0e3"];
    [self.view addSubview:self.hallTableView];
    [self.hallTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(Height_NavBar, 0, 0, 0));
    }];
     
}

- (UITableView *)hallTableView {
    if (_hallTableView == nil) {
        _hallTableView = [[UITableView alloc] init];
        _hallTableView.backgroundColor = UIColor.clearColor;
        _hallTableView.delegate = self;
        _hallTableView.dataSource = self;
        _hallTableView.tableFooterView = [UIView new];
        _hallTableView.tableHeaderView = [UITableView new];
        _hallTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _hallTableView.estimatedRowHeight = 200;
    }
    return _hallTableView;
}
 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CHClubPlanCell * infoCell = [tableView dequeueReusableCellWithIdentifier:@"CHClubPlanCell"];
    if (infoCell == nil) {
        infoCell = [[CHClubPlanCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CHPlanCell"];
        infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return infoCell;
}

 

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * header = [[UIView alloc] init];
    header.backgroundColor = [UIColor colorWithHexString:@"0xdfe1d3"];
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    titleLabel.text = @"TODAY";
    [header addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.left.mas_offset(15);
    }];
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return 12;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark === //

- (void)touchRightAction:(NSInteger)index {
    NSLog(@"%ld",index);
    switch (index) {
        case 1:
        {
            
        }
            break;
            
        default:
            break;
    }
}

 - (void)touchLeftAction {
     [self.navigationController popViewControllerAnimated:YES];
 }

@end
