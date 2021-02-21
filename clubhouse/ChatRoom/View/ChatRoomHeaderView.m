//
//  ChatRoomHeaderView.m
//  clubhouse
//
//  Created by Eason on 2021/2/18.
//

#import "ChatRoomHeaderView.h"

@interface ChatRoomHeaderView()
/**圆角初始高度*/
@property(nonatomic, assign) CGFloat cornerHeight;
/**圆角*/
@property(nonatomic, strong) UIView *cornerView;
/**底部*/
@property(nonatomic, strong) UIView *bottomView;
/**标题*/
@property(nonatomic, strong) UILabel *titleLabel;
/**更多*/
@property(nonatomic, strong) UIImageView *moreImageView;
/**更多*/
@property(nonatomic, strong) UIButton *moreButton;
@end

@implementation ChatRoomHeaderView

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
    self.backgroundColor = [UIColor colorWithHexString:@"EDEADC"];
    self.cornerHeight = 50;
    [self addSubview:self.cornerView];
    [self addSubview:self.bottomView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.moreImageView];
    [self addSubview:self.moreButton];
}

- (void) setupConstraints {
    
    [self.cornerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.bottom.trailing.mas_equalTo(0);
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.cornerView.mas_top).with.offset(self.cornerHeight);
        make.leading.bottom.trailing.mas_equalTo(self.cornerView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.cornerView).with.offset(12);
        make.leading.mas_equalTo(self.cornerView).with.offset(15);
        make.trailing.mas_equalTo(self.moreImageView.mas_leading).with.offset(-25);
        make.bottom.mas_equalTo(-15);
    }];
    
    [self.moreImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.cornerView).with.offset(20);
        make.trailing.mas_equalTo(-15);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
    
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.trailing.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    
}

- (void) setupAction {
    
    [self.moreButton addTarget:self action:@selector(tapMore) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) tapMore {
    if (nil != self.moreBlock) {
        self.moreBlock();
    }
}
- (UIView *)cornerView {
    if (nil == _cornerView) {
        _cornerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.cornerHeight)];
        _cornerView.backgroundColor = [UIColor whiteColor];
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_cornerView.frame byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(15, 15)];
        CAShapeLayer *shape = [[CAShapeLayer alloc] init];
        shape.path = [path CGPath];
        shape.frame = _cornerView.frame;
        _cornerView.layer.mask = shape;
    }
    return _cornerView;
}
- (UIView *)bottomView {
    if (nil == _bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}
- (UILabel *)titleLabel {
    if (nil == _titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor colorWithHexString:@"000000"];
        _titleLabel.text = @"#24HoursofLove:the love songs that made us fall in love";
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

-(UIImageView *)moreImageView {
    if (nil == _moreImageView) {
        _moreImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_more"]];
    }
    return _moreImageView;
}

- (UIButton *)moreButton {
    if (nil == _moreButton) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _moreButton;
}

@end
