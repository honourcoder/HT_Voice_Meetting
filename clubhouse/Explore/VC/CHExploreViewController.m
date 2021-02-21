//
//  CHExploreViewController.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/18.
//

#import "CHExploreViewController.h"
#import "CHEploreTopicCell.h"
#import "CHEploreUserInfoCell.h"
#import "CHEploreUserHeaderView.h"
@interface CHExploreViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView * exploreCollectionView;
@property (nonatomic,assign) BOOL showMoreFollow;
@end

@implementation CHExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navView.rightDelegate = self;
    [self.navView addLeftAction:@"🔍" isPng:NO];
    self.view.backgroundColor = [UIColor colorWithHexString:@"0xf0f0e3"];
    [self.view addSubview:self.exploreCollectionView];
    @weakify(self)
    [self.exploreCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.navView.mas_bottom);
        make.left.right.bottom.mas_offset(0);
    }];
    self.showMoreFollow = NO;
}


- (UICollectionView *)exploreCollectionView {
    if (_exploreCollectionView == nil) {
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//        flowLayout.
        _exploreCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _exploreCollectionView.delegate = self;
        _exploreCollectionView.dataSource = self;
        [_exploreCollectionView registerClass:[CHEploreTopicCell class] forCellWithReuseIdentifier:@"CHEploreTopicCell"];
        [_exploreCollectionView registerClass:[CHEploreUserInfoCell class] forCellWithReuseIdentifier:@"CHEploreUserInfoCell"];
        [_exploreCollectionView registerClass:[CHEploreUserHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CHEploreUserHeaderView"];
        [_exploreCollectionView registerClass:[CHEploreUserFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CHEploreUserFooterView"];
        _exploreCollectionView.alwaysBounceVertical = YES;
        _exploreCollectionView.backgroundColor = UIColor.clearColor;
    
    }
    return _exploreCollectionView;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CHEploreUserInfoCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CHEploreUserInfoCell" forIndexPath:indexPath];
        return cell;
    }
    CHEploreTopicCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CHEploreTopicCell" forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CHEploreUserHeaderView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CHEploreUserHeaderView" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            header.titleLabel.text = @"PEPOLE TO FOLLOW";
        }else{
            header.titleLabel.text = @"FIND CONVERSTIONS ABOUTS...";
        }
        return header;
    }else{
      
        if (indexPath.section == 0) {
            CHEploreUserFooterView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CHEploreUserFooterView" forIndexPath:indexPath];
            return header;
        }else{
            return [UICollectionReusableView new];
        }
        
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return 4;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return  UIEdgeInsetsMake(0, 15, 0, 15);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(kScreenWidth, 44);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 0) {
     return CGSizeMake(kScreenWidth, 51);
    }else{
        return CGSizeMake(0, 0);
    }
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
    return CGSizeMake(kScreenWidth, 74);
    }
    return CGSizeMake(((kScreenWidth - 45)/2.f -0.5f), 72);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)touchLeftAction {
    [self.navigationController popViewControllerAnimated:YES];
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
