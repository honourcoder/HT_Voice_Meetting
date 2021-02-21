//
//  CHHallViewController.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/16.
//

#import "CHHallViewController.h"

#import "CHClubPlanViewController.h"

#import "CHPlanCell.h"
#import "CHChatRoomInfoCell.h"
#import "CHBottomView.h"
 
#import "CHCreateRoomMenu.h"
 
#import "ChatRoomViewController.h"
#import "CHExploreViewController.h"

@interface CHHallViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * hallTableView;
@property (nonatomic,strong)CHBottomView * bottomView;
@property (nonatomic,strong)CHCreateRoomMenu * roomMenu;
@end

@implementation CHHallViewController

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
    
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(Height_TabBar);
    }];
    [self.view addSubview:self.roomMenu];
    [self.roomMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(0);
    }];
}

- (CHCreateRoomMenu *)roomMenu {
    if (_roomMenu == nil) {
        _roomMenu = [[CHCreateRoomMenu alloc] init];
        _roomMenu.hidden = YES;
    }
    return _roomMenu;
}

- (void) startRoom {
    
    
}

- (CHBottomView *)bottomView {
    if (_bottomView == nil) {
        _bottomView = [[CHBottomView alloc] init];
 
        @weakify(self)
        _bottomView.actionBlock = ^(BOOL isOpenNewMenu) {
            if (isOpenNewMenu) {
                [weak_self createChatARoom];
            }else{
                [weak_self openNewMenu];
            }
        };
        _bottomView.startRoomBlock = ^{
            [weak_self startRoom];
        }; 
    }
    return _bottomView;
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
    }
    return _hallTableView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatRoomViewController *chatRoomVC = [ChatRoomViewController new];
    chatRoomVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:chatRoomVC animated:YES completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        CHChatRoomInfoCell* infoCell = [tableView dequeueReusableCellWithIdentifier:@"CHChatRoomInfoCell"];
        if (infoCell == nil) {
            infoCell = [[CHChatRoomInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CHChatRoomInfoCell"];
            infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return infoCell;
    }else{
        CHPlanCell * infoCell = [tableView dequeueReusableCellWithIdentifier:@"CHPlanCell"];
        if (infoCell == nil) {
            infoCell = [[CHPlanCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CHPlanCell"];
            infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return infoCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return 350.f;
    }
    return 150.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 8;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return 3;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

#pragma mark === //

- (void)touchRightAction:(NSInteger)index {
    NSLog(@"%ld",index);
    switch (index) {
        case 1:
        {
            CHClubPlanViewController * clubPlanVC = [[CHClubPlanViewController alloc] init];
            [self.navigationController pushViewController:clubPlanVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)touchLeftAction {
    CHExploreViewController * exploreVC = [[CHExploreViewController alloc] init];
    [self.navigationController pushViewController:exploreVC animated:YES];
}

- (void)createChatARoom{
     
}

- (void)openNewMenu{
    self.roomMenu.hidden = NO;
    [self.roomMenu showMenu];
}
@end
