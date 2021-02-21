//
//  CHEploreTopicCell.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/18.
//

#import "CHEploreTopicCell.h"

@interface CHEploreTopicCell ()
@property (nonatomic,strong) UIView * eploreContentView;
@property (nonatomic,strong) UILabel * titleLabel;
@property (nonatomic,strong) UILabel * addressLabel;
@end

@implementation CHEploreTopicCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentView.layer.cornerRadius = 15;
        self.contentView.layer.masksToBounds = YES;
        self.contentView.backgroundColor = UIColor.whiteColor;
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(10);
            make.top.mas_offset(8);
            make.right.mas_offset(-10);
        }];
        @weakify(self)
        [self.contentView addSubview:self.addressLabel];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(10);
            make.top.equalTo(weak_self.titleLabel.mas_bottom).offset(8);
            make.right.mas_offset(-10);
        }];
    }
    return self;
}



- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.text = @"🥳 Hanging Out";
        _titleLabel.textColor = [UIColor colorWithHexString:@"0x343936"];
    }
    return _titleLabel;
}

- (UILabel *)addressLabel {
    if (_addressLabel == nil) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.font = [UIFont systemFontOfSize:12];
        _addressLabel.text = @"TikTok, Small Business,Instagram, Networking";
        _addressLabel.textColor = [UIColor colorWithHexString:@"0x343936"];
        _addressLabel.numberOfLines = 2;
    }
    return _addressLabel;
}

@end
