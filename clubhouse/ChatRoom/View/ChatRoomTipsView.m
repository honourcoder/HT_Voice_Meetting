//
//  ChatRoomTipsView.m
//  clubhouse
//
//  Created by Eason on 2021/2/18.
//

#import "ChatRoomTipsView.h"

@interface ChatRoomTipsView()
/**标题*/
@property(nonatomic, strong) UILabel *titleLabel;

@end

@implementation ChatRoomTipsView

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
    self.backgroundColor = [UIColor colorWithHexString:@"E24448"];
    [self addSubview:self.titleLabel];
}

- (void) setupConstraints {
     
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.leading.mas_equalTo(15);
        make.trailing.mas_equalTo(-15);
    }];
     
    
}

- (UILabel *)titleLabel {
    if (nil == _titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor colorWithHexString:@"000000"];
        _titleLabel.text = @"Poor connection. Try to find a stronger signal.";
        _titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _titleLabel;
}

@end
