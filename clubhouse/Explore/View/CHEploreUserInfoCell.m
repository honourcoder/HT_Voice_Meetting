//
//  CHEploreUserInfoCell.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/19.
//

#import "CHEploreUserInfoCell.h"

typedef enum : NSUInteger {
    CHEploreStyleUser,
    CHEploreStyleUserAndHttp,
} CHEploreStyle;

@interface CHEploreUserInfoCell ()

@property (nonatomic,strong) UIImageView * iconImageView;

@property (nonatomic,strong) UILabel * nickNameLabel;
@property (nonatomic,strong) UILabel * userNameLabel;
@property (nonatomic,strong) UILabel * httpLabel;
@property (nonatomic,strong) UILabel * followLabel;
@property (nonatomic,assign) CHEploreStyle style;
@end

@implementation CHEploreUserInfoCell


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"0xf5f5f0"];
        [self.contentView addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_offset(10);
            make.width.height.mas_offset(51);
//            make.bottom.mas_offset(-3);
            make.centerY.mas_equalTo(0);
            make.left.mas_offset(15);
        }];
        [self.contentView addSubview:self.followLabel];
        [self.followLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(86, 40));
            make.right.mas_equalTo(-15);
            make.centerY.mas_equalTo(0);
        }];
       
        [self.contentView addSubview:self.userNameLabel];
        
        [self.contentView addSubview:self.nickNameLabel];
         
        [self.contentView addSubview:self.httpLabel];
        
        self.style = 0;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setStyle:(CHEploreStyle)style {
    _style = style;
    @weakify(self);
    if (style == CHEploreStyleUser) {
        [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weak_self.iconImageView.mas_right).offset(10);
            make.right.equalTo(weak_self.followLabel.mas_left).offset(-15);
            make.bottom.equalTo(weak_self.iconImageView.mas_centerY).offset(-4);
        }];
        [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weak_self.iconImageView.mas_right).offset(10);
            make.right.equalTo(weak_self.followLabel.mas_left).offset(-15);
            make.top.equalTo(weak_self.iconImageView.mas_centerY).offset(4);
        }];
        self.httpLabel.hidden = YES;
    }else if (style == CHEploreStyleUserAndHttp) {
        [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weak_self.iconImageView.mas_right).offset(10);
            make.right.equalTo(weak_self.followLabel.mas_left).offset(-15);
            make.centerY.equalTo(weak_self.iconImageView.mas_centerY);
        }];
        [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weak_self.iconImageView.mas_right).offset(10);
            make.right.equalTo(weak_self.followLabel.mas_left).offset(-15);
            make.bottom.equalTo(weak_self.userNameLabel.mas_top).offset(-8);
        }];
        self.httpLabel.hidden = NO;
        [self.httpLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weak_self.iconImageView.mas_right).offset(10);
            make.right.equalTo(weak_self.followLabel.mas_left).offset(-15);
            make.top.equalTo(weak_self.userNameLabel.mas_bottom).offset(8);
        }];
    }
}

- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.cornerRadius = 22;
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.backgroundColor = UIColor.redColor;
    }
    return _iconImageView;
}

- (UILabel *)nickNameLabel {
    if (_nickNameLabel == nil) {
        _nickNameLabel = [[UILabel alloc] init];
        _nickNameLabel.text = @"Yuan Zhao";
        _nickNameLabel.font = [UIFont boldSystemFontOfSize:13];
        _nickNameLabel.textColor = UIColor.blackColor;
    }
    return _nickNameLabel;
}

- (UILabel *)userNameLabel {
    if (_userNameLabel == nil) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.text = @"@zhaoyuan";
        _userNameLabel.font = [UIFont systemFontOfSize:13];
        _userNameLabel.textColor = UIColor.blackColor;
    }
    return _userNameLabel;
}

- (UILabel *)httpLabel {
    if (_httpLabel == nil) {
        _httpLabel = [[UILabel alloc] init];
        _httpLabel.text = @"https://www.gofundme.com/f/mamseaada/zhaoyuan";
        _httpLabel.font = [UIFont systemFontOfSize:13];
        _httpLabel.textColor = UIColor.blackColor;
    }
    return _httpLabel;
}

- (UILabel *)followLabel {
    if (_followLabel == nil) {
        _followLabel = [[UILabel alloc] init];
        _followLabel.text = @"Follow";
        _followLabel.font = [UIFont systemFontOfSize:16];
        _followLabel.textColor = [UIColor colorWithHexString:@"0x7281ab"];
        _followLabel.layer.cornerRadius = 15.f;
        _followLabel.layer.masksToBounds = YES;
        _followLabel.layer.borderColor = [UIColor colorWithHexString:@"0x6574a4"].CGColor;
        _followLabel.layer.borderWidth = 2;
        _followLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _followLabel;
}

@end
