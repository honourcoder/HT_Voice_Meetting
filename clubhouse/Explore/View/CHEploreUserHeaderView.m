//
//  CHEploreUserHeaderView.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/19.
//

#import "CHEploreUserHeaderView.h"

@interface CHEploreUserHeaderView ()

@end

@implementation CHEploreUserHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.clearColor;
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(16);
            make.centerY.mas_offset(0);
        }];
    }
    return self;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"PEPOLE TO FOLLOW";
        _titleLabel.font = [UIFont boldSystemFontOfSize:10];
        _titleLabel.textColor = [UIColor colorWithHexString:@"0x686954"];
    }
    return _titleLabel;
}

@end


@interface CHEploreUserFooterView ()

@property (nonatomic,strong) UIView * backView;
@end

@implementation CHEploreUserFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.clearColor;
        [self addSubview:self.backView];
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_offset(0);
            make.top.mas_equalTo(0);
            make.bottom.mas_offset(-21);
        }];
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_offset(-5);
            make.centerX.mas_offset(0);
            make.size.mas_equalTo(CGSizeMake(173, 30));
        }];
    }
    return self;
}

- (UIView *)backView {
    if (_backView == nil) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor colorWithHexString:@"0xf5f5f0"];
        //加阴影--任海丽编辑
           //shadowColor阴影颜色
        _backView.layer.shadowColor = [UIColor blackColor].CGColor;
           //shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
        _backView.layer.shadowOffset = CGSizeMake(0,4);
           //阴影透明度，默认0
        _backView.layer.shadowOpacity = 0.3;
    }
    return _backView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"Show more perple ∨";
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithHexString:@"0x686954"];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor colorWithHexString:@"0xe5e2d4"];
        _titleLabel.layer.cornerRadius = 15.f;
        _titleLabel.layer.masksToBounds = YES;
    }
    return _titleLabel;
}

@end
