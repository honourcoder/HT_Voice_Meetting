//
//  ChatRoomViewController.m
//  clubhouse
//
//  Created by Eason on 2021/2/17.
//

#import "ChatRoomViewController.h"
#import "ChatRoomTopView.h"
#import "ChatRoomHeaderView.h"
#import "ChatRoomItem.h"
#import "ChatRoomBottomView.h"
#import "ChatRoomTipsView.h"
#import "ChatRoomModel.h"

#import <AgoraRtcKit/AgoraRtcEngineKit.h>

#define AppID @"449f7f4881a246e9a12c1e1797683dd2"
#define token @"006449f7f4881a246e9a12c1e1797683dd2IACvPJYIiu0L33LUFGVXm1C9q9ROKT1RBuU9V0w0bgCzHRGk2igAAAAAEABoKgnHNHwyYAEAAQA0fDJg"

@interface ChatRoomViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,AgoraRtcEngineDelegate>
/**顶部view*/
@property(nonatomic, strong) ChatRoomTopView *topView;

/**中间collectionView*/
@property(nonatomic, strong) UICollectionView *collectionView;
/**提示view*/
@property(nonatomic, strong) ChatRoomTipsView *tipsView;
/**底部view*/
@property(nonatomic, strong) ChatRoomBottomView *bottomView;

/**数据数组*/
@property(nonatomic, strong) NSMutableArray *dataArray;

@property(nonatomic, strong) AgoraRtcEngineKit *agoraKit;

/**麦克风是否打开*/
@property(nonatomic, assign) BOOL microphoneIsClose;
@end

@implementation ChatRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self setupConstraints];
    [self setupAction];
    
    
    [self refreshData];
    
    [self doJoinChannel];
}

- (void) refreshData {
    ChatRoomModel *m1 = [ChatRoomModel new];
    m1.avatar = @"";
    m1.nickName = @"Jaeason";
    m1.isMicphoneOn = NO;
    m1.isCompere = YES;
    ChatRoomModel *m2 = [ChatRoomModel new];
    m2.avatar = @"";
    m2.nickName = @"Barin";
    m2.isMicphoneOn = NO;
    m2.isCompere = YES;
    ChatRoomModel *m3 = [ChatRoomModel new];
    m3.avatar = @"";
    m3.nickName = @"MC";
    m3.isMicphoneOn = YES;
    m3.isCompere = YES;
    ChatRoomModel *m4 = [ChatRoomModel new];
    m4.avatar = @"";
    m4.nickName = @"Sean";
    m4.isMicphoneOn = YES;
    m4.isCompere = NO;
    ChatRoomModel *m5 = [ChatRoomModel new];
    m5.avatar = @"";
    m5.nickName = @"Chris";
    m5.isMicphoneOn = YES;
    m5.isCompere = NO;
    ChatRoomModel *m6 = [ChatRoomModel new];
    m6.avatar = @"";
    m6.nickName = @"Soumeya";
    m6.isMicphoneOn = YES;
    m6.isCompere = NO;
    ChatRoomModel *m7 = [ChatRoomModel new];
    m7.avatar = @"";
    m7.nickName = @"Carini";
    m7.isMicphoneOn = YES;
    m7.isCompere = NO;
    ChatRoomModel *m8 = [ChatRoomModel new];
    m8.avatar = @"";
    m8.nickName = @"Sean";
    m8.isMicphoneOn = YES;
    m8.isCompere = NO;
    ChatRoomModel *m9 = [ChatRoomModel new];
    m9.avatar = @"";
    m9.nickName = @"Sean";
    m9.isMicphoneOn = YES;
    m9.isCompere = NO;
    self.dataArray = @[m1, m2, m3, m4, m5, m6, m7, m8, m9].modelCopy;
    
    self.tipsView.hidden = NO;
    [self.collectionView reloadData];
}

- (void) setupUI {
    [self.navView removeFromSuperview];
    self.view.backgroundColor = [UIColor colorWithHexString:@"EDEADC"];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.tipsView];
    [self.view addSubview:self.bottomView];
    
}

- (void) setupConstraints {

    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topView.mas_bottom);
        make.leading.trailing.mas_equalTo(0);
        make.bottom.mas_equalTo(self.bottomView.mas_top);
    }];
    
    [self.tipsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.bottomView.mas_top);
        make.leading.trailing.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
}

- (void) setupAction {
    __weak typeof(self) weakSelf = self;
    [self.topView setFoldBlock:^{
        [weakSelf foldAction];
    }];
    [self.topView setEditBlock:^{
        [weakSelf editAction];
    }];
    [self.topView setAvatarBlock:^{
        [weakSelf avatarAction];
    }];
    
    [self.bottomView setLeaveBlock:^{
        [weakSelf leaveAction];
    }];
    [self.bottomView setInviteBlock:^{
        [weakSelf inviteAction];
    }];
    [self.bottomView setMicphoneBlock:^{
        [weakSelf micphoneAction];
    }];
}
- (void) foldAction {
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:true];
    }
}

- (void)doJoinChannel {
    self.microphoneIsClose = NO;
    self.agoraKit = [AgoraRtcEngineKit sharedEngineWithAppId:AppID delegate:self];
    NSUInteger userId = 0;
//    [self.agoraKit joinChannelByToken:token channelId:@"meetting" info:nil uid:userId options:(AgoraRtcChannelMediaOptions * _Nonnull){
//
//    }];
    
    [self.agoraKit joinChannelByToken:token channelId:@"meetting" info:nil uid:userId joinSuccess:^(NSString * _Nonnull channel, NSUInteger uid, NSInteger elapsed) {
        [self.agoraKit setEnableSpeakerphone:YES];
//        [UIApplication sharedApplication].isIdleTimerDisabled = YES;
        
        NSLog(@"进入房间成功");
    }];
}
- (void) editAction {
    NSLog(@"点击编辑");
}
- (void) avatarAction {
    NSLog(@"点击头像");
}
- (void) moreAction {
    NSLog(@"点击表头更多");
}
- (void) leaveAction {
    NSLog(@"点击离开");
}
- (void) inviteAction {
    NSLog(@"点击邀请");
}
- (void) micphoneAction {
    NSLog(@"点击麦克风");
    self.microphoneIsClose = !self.microphoneIsClose;
    [self.agoraKit muteLocalAudioStream:self.microphoneIsClose];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击用户");
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ChatRoomItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ChatRoomItem class]) forIndexPath:indexPath];
    
    [item updateDataWith:self.dataArray[indexPath.item]];
    
    return item;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        ChatRoomHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([ChatRoomHeaderView class]) forIndexPath:indexPath];
        __weak typeof(self) weakSelf = self;
        [headerView setMoreBlock:^{
            [weakSelf moreAction];
        }];
        return headerView;
    }
    return reusableview;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(kScreenWidth, 100);
}

- (ChatRoomTopView *)topView {
    if (nil == _topView) {
        _topView = [[ChatRoomTopView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, Height_NavBar)];
    }
    return _topView;
}

-(UICollectionView *)collectionView {
    if (nil == _collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(100, 150);
        layout.sectionInset = UIEdgeInsetsZero;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ChatRoomItem class] forCellWithReuseIdentifier:NSStringFromClass([ChatRoomItem class])];
        [_collectionView registerClass:[ChatRoomHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([ChatRoomHeaderView class])];

    }
    return _collectionView;
}

-(ChatRoomTipsView *)tipsView {
    if (nil == _tipsView) {
        _tipsView = [[ChatRoomTipsView alloc] init];
        _tipsView.hidden = YES;
    }
    return _tipsView;
}

- (ChatRoomBottomView *)bottomView {
    if (nil == _bottomView) {
        _bottomView = [[ChatRoomBottomView alloc] initWithFrame:CGRectMake(0, kScreenHeight - Height_TabBar, kScreenWidth, Height_TabBar)];
    }
    
    return _bottomView;
}

- (NSMutableArray *)dataArray {
    if (nil == _dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.agoraKit leaveChannel:^(AgoraChannelStats * _Nonnull stat) {
            
    }];
}

@end
