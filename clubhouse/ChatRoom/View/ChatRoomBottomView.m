//
//  ChatRoomBottomView.m
//  clubhouse
//
//  Created by Eason on 2021/2/18.
//

#import "ChatRoomBottomView.h"
#import "UIView+Gesture.h"

@interface ChatRoomBottomView()
/**离开view*/
@property(nonatomic, strong) UIView *leaveView;
/**离开icon*/
@property(nonatomic, strong) UIImageView *leaveIconImageView;
/**离开label*/
@property(nonatomic, strong) UILabel *leaveLabel;
/**邀请*/
@property(nonatomic, strong) UIImageView *inviteImageView;
/**麦克风*/
@property(nonatomic, strong) UIImageView *micphoneImageView;

@end

@implementation ChatRoomBottomView

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
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.leaveView];
    [self.leaveView addSubview:self.leaveIconImageView];
    [self.leaveView addSubview:self.leaveLabel];
    [self addSubview:self.inviteImageView];
    [self addSubview:self.micphoneImageView];
    
}

- (void) setupConstraints {
    
    [self.leaveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.leading.mas_equalTo(15);
        make.height.mas_equalTo(30);
    }];
    [self.leaveIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.leading.mas_equalTo(15);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.leaveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.leaveIconImageView.mas_trailing).with.offset(5);
        make.centerY.mas_equalTo(0);
        make.trailing.mas_equalTo(-15);
    }];
    
    [self.inviteImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.leaveView);
        make.trailing.mas_equalTo(self.micphoneImageView.mas_leading).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.micphoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.leaveView);
        make.trailing.mas_equalTo(-15);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
}

- (void) setupAction {
    
    [self.leaveView addTapGestureWith:self action:@selector(tapLeave)];
    [self.inviteImageView addTapGestureWith:self action:@selector(tapInvite)];
    [self.micphoneImageView addTapGestureWith:self action:@selector(tapMicphone)];
    
}

- (void) tapLeave {
    if (nil != self.leaveBlock) {
        self.leaveBlock();
    }
}
- (void) tapInvite {
    if (nil != self.inviteBlock) {
        self.inviteBlock();
    }
}
- (void) tapMicphone {
    self.micphoneImageView.highlighted = !self.micphoneImageView.highlighted;
    if (nil != self.micphoneBlock) {
        self.micphoneBlock();
    }
}


- (UIView *)leaveView {
    if (nil == _leaveView) {
        _leaveView = [[UIView alloc] init];
        _leaveView.backgroundColor = [UIColor colorWithHexString:@"EDEDED"];
        _leaveView.layer.cornerRadius = 15;
        _leaveView.layer.masksToBounds = YES;
    }
    return _leaveView;
}
- (UIImageView *)leaveIconImageView {
    if (nil == _leaveIconImageView) {
        _leaveIconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_edit"]];
    }
    return _leaveIconImageView;
}
- (UILabel *)leaveLabel {
    if (nil == _leaveLabel) {
        _leaveLabel = [[UILabel alloc] init];
        _leaveLabel.font = [UIFont systemFontOfSize:12];
        _leaveLabel.textColor = [UIColor colorWithHexString:@"333333"];
        _leaveLabel.text = @"Leave quietly";
    }
    return _leaveLabel;
}
- (UIImageView *)inviteImageView {
    if (nil == _inviteImageView) {
        _inviteImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"icon_edit"]];
        _inviteImageView.backgroundColor = [UIColor colorWithHexString:@"EDEDED"];
        _inviteImageView.layer.cornerRadius = 15;
        _inviteImageView.layer.masksToBounds = YES;
    }
    return _inviteImageView;
}
- (UIImageView *)micphoneImageView {
    if (nil == _micphoneImageView) {
        _micphoneImageView = [[UIImageView alloc] init];
        _micphoneImageView.highlighted = YES;
        _micphoneImageView.image = [UIImage imageNamed:@"icon_edit"];
        _micphoneImageView.highlightedImage = [UIImage imageNamed:@"img_mrtx"];
        _micphoneImageView.backgroundColor = [UIColor colorWithHexString:@"EDEDED"];
        _micphoneImageView.layer.cornerRadius = 15;
        _micphoneImageView.layer.masksToBounds = YES;
    }
    return _micphoneImageView;
}


@end
