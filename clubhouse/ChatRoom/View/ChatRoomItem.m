//
//  ChatRoomItem.m
//  clubhouse
//
//  Created by Eason on 2021/2/17.
//

#import "ChatRoomItem.h"
#import "ChatRoomModel.h"
#import <SDWebImage/SDWebImage.h>

@interface ChatRoomItem()
/**头像*/
@property(nonatomic, strong) UIImageView *avatarImageView;
/**麦克风*/
@property(nonatomic, strong) UIImageView *micphoneImageView;
/**主持人标记*/
@property(nonatomic, strong) UIImageView *compereImageView;
/**昵称*/
@property(nonatomic, strong) UILabel *nickNameLabel;

@end

@implementation ChatRoomItem


- (void) updateDataWith:(ChatRoomModel *) dataModel {

    [self.avatarImageView setImageWithURL:[NSURL URLWithString:dataModel.avatar] placeholder:[UIImage imageNamed:@"img_mrtx"]];
    self.micphoneImageView.highlighted = dataModel.isMicphoneOn;
    self.compereImageView.highlighted = dataModel.isCompere;
    self.nickNameLabel.text = dataModel.nickName;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self setupConstraints];
    }
    return self;
}
- (void) setupUI {
    
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.micphoneImageView];
    [self.contentView addSubview:self.compereImageView];
    [self.contentView addSubview:self.nickNameLabel];
    
}

- (void) setupConstraints {
    
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.leading.trailing.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [self.micphoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.trailing.mas_equalTo(self.avatarImageView);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [self.compereImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.avatarImageView.mas_bottom).offset(10);
        make.trailing.mas_equalTo(self.nickNameLabel.mas_leading).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.compereImageView);
        make.centerX.mas_equalTo(self.avatarImageView);
    }];
    
}


- (UIImageView *)avatarImageView {
    if (nil == _avatarImageView) {
        _avatarImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"img_mrtx"]];
        _avatarImageView.layer.cornerRadius = 20;
        _avatarImageView.layer.masksToBounds = YES;
    }
    return _avatarImageView;
}

- (UIImageView *)micphoneImageView {
    if (nil == _micphoneImageView) {
        _micphoneImageView = [[UIImageView alloc] init];
        _micphoneImageView.image = nil;
        _micphoneImageView.highlightedImage = [UIImage imageNamed:@"icon_edit"];
    }
    return _micphoneImageView;
}
- (UIImageView *)compereImageView {
    if (nil == _compereImageView) {
        _compereImageView = [[UIImageView alloc] init];
        _compereImageView.image = nil;
        _compereImageView.highlightedImage = [UIImage imageNamed:@"icon_edit"];
    }
    return _compereImageView;
}
- (UILabel *)nickNameLabel {
    if (nil == _nickNameLabel) {
        _nickNameLabel = [[UILabel alloc] init];
        _nickNameLabel.font = [UIFont systemFontOfSize:13];
        _nickNameLabel.textColor = [UIColor colorWithHexString:@"000000"];
        _nickNameLabel.text = @"All rooms";
    }
    return _nickNameLabel;;
}


@end
