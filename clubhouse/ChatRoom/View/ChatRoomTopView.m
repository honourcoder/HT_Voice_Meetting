//
//  ChatRoomTopView.m
//  clubhouse
//
//  Created by Eason on 2021/2/18.
//

#import "ChatRoomTopView.h"
#import "UIView+Gesture.h"

@interface ChatRoomTopView()
/**折叠*/
@property(nonatomic, strong) UIImageView *foldImageView;
/**折叠*/
@property(nonatomic, strong) UIButton *foldButton;
/**标题*/
@property(nonatomic, strong) UILabel *titleLabel;
/**编辑*/
@property(nonatomic, strong) UIImageView *editImageView;
/**头像*/
@property(nonatomic, strong) UIImageView *avatarImageView;
@end

@implementation ChatRoomTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self setupConstraints];
        [self setupAction];
    }
    return self;
}
- (void) setupUI {
    
    [self addSubview:self.foldImageView];
    [self addSubview:self.foldButton];
    [self addSubview:self.titleLabel];
    [self addSubview:self.editImageView];
    [self addSubview:self.avatarImageView];
    
}

- (void) setupConstraints {
    
    [self.foldImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-15);
        make.leading.mas_equalTo(15);
        make.size.mas_equalTo(CGSizeMake(14, 7));
    }];
    [self.foldButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel);
        make.leading.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.foldImageView);
        make.leading.mas_equalTo(self.foldImageView.mas_trailing).with.offset(10);
        make.trailing.mas_equalTo(self.editImageView.mas_leading).with.offset(-10);
    }];
    
    [self.editImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.foldImageView);
        make.trailing.mas_equalTo(self.avatarImageView.mas_leading).with.offset(-25);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.foldImageView);
        make.trailing.mas_equalTo(-15);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
}

- (void) setupAction {
    
    [self.foldButton addTarget:self action:@selector(tapFolder) forControlEvents:UIControlEventTouchUpInside];
    [self.editImageView addTapGestureWith:self action:@selector(tapEdit)];
    [self.avatarImageView addTapGestureWith:self action:@selector(tapAvatar)];
    
}

- (void) tapFolder {
    if (nil != self.foldBlock) {
        self.foldBlock();
    }
}
- (void) tapEdit {
    if (nil != self.editBlock) {
        self.editBlock();
    }
}
- (void) tapAvatar {
    if (nil != self.avatarBlock) {
        self.avatarBlock();
    }
}

- (UIButton *)foldButton {
    if (nil == _foldButton) {
        _foldButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _foldButton;
}
- (UIImageView *)foldImageView {
    if (nil == _foldImageView) {
        _foldImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"icon_arrow_down"]];
    }
    return _foldImageView;
}
- (UILabel *)titleLabel {
    if (nil == _titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor colorWithHexString:@"000000"];
        _titleLabel.text = @"All rooms";
    }
    return _titleLabel;
}
- (UIImageView *)editImageView {
    if (nil == _editImageView) {
        _editImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"icon_edit"]];
    }
    return _editImageView;
}
- (UIImageView *)avatarImageView {
    if (nil == _avatarImageView) {
        _avatarImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"img_mrtx"]];
        _avatarImageView.layer.cornerRadius = 10;
        _avatarImageView.layer.masksToBounds = YES;
    }
    return _avatarImageView;
}

@end
