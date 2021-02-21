//
//  CHCreateRoomMenu.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/18.
//

#import "CHCreateRoomMenu.h"
#import "CHBaseBotton.h"

@interface CHCreateRoomMenu ()

@property (nonatomic,strong)UIView * contentMenu;

@property (nonatomic,strong)UIView * topTouchButton;
@property (nonatomic,strong)UILabel * addTopicLabel;
@property (nonatomic,strong)CHBaseBotton *openButton;
@property (nonatomic,strong)CHBaseBotton *socialButton;
@property (nonatomic,strong)CHBaseBotton *closedButton;

@property (nonatomic,strong)UIView * lineView;
@property (nonatomic,strong)UILabel * titleLabel;
@property (nonatomic,strong)UILabel * goButton;

@end

@implementation CHCreateRoomMenu


- (void)showMenu {
    [self.contentMenu mas_remakeConstraints:^(MASConstraintMaker *make) {
         make.bottom.left.right.mas_offset(0);
    }];
    
    [UIView animateWithDuration:0.35 animations:^{
         self.backgroundColor = [[UIColor colorWithHexString:@"0xc9c9c9"] colorWithAlphaComponent:0.4];
        [self layoutIfNeeded];
    }];
}

- (void)closeButton {
    [self.contentMenu mas_remakeConstraints:^(MASConstraintMaker *make) {
         make.left.right.mas_offset(0);
         make.top.mas_offset(kScreenHeight);
    }];
    @weakify(self)
    [UIView animateWithDuration:0.35 animations:^{
        weak_self.backgroundColor = [[UIColor colorWithHexString:@"0xc9c9c9"] colorWithAlphaComponent:0];
        [weak_self layoutIfNeeded];
    }completion:^(BOOL finished) {
        weak_self.hidden = YES;
    }];
}

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [[UIColor colorWithHexString:@"0xc9c9c9"] colorWithAlphaComponent:0];
        self.userInteractionEnabled = YES;
        @weakify(self)
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            [weak_self closeButton];
        }]];
        [self addSubview:self.contentMenu];
        [self.contentMenu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_offset(0);
            make.top.mas_offset(kScreenHeight);
        }];
        
        [self.contentMenu addSubview:self.addTopicLabel];
        [self.addTopicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-18);
            make.top.mas_offset(41);
        }];
        [self.contentMenu addSubview:self.topTouchButton];
        [self.topTouchButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_offset(0);
            make.size.mas_equalTo(CGSizeMake(36, 5));
            make.top.mas_equalTo(6);
        }];
        
        [self.contentMenu addSubview:self.socialButton];
        [self.socialButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(124, 106));
            make.centerX.mas_equalTo(0);
            make.top.equalTo(weak_self.topTouchButton.mas_bottom).offset(70);
        }];
        [self.contentMenu addSubview:self.openButton];
        [self.openButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(124, 106));
            make.centerY.equalTo(weak_self.socialButton);
            make.right.equalTo(weak_self.socialButton.mas_left).offset(-10);
        }];
        
        [self.contentMenu addSubview:self.closedButton];
        [self.closedButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(124, 106));
            make.centerY.equalTo(weak_self.socialButton);
            make.left.equalTo(weak_self.socialButton.mas_right).offset(10);
        }];
        [self.contentMenu addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(35);
            make.right.mas_equalTo(-35);
            make.top.equalTo(weak_self.socialButton.mas_bottom).offset(33);
            make.height.mas_equalTo(1);
        }];
        [self.contentMenu addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.equalTo(weak_self.lineView.mas_bottom).offset(19);
        }];
        [self.contentMenu addSubview:self.goButton];
        [self.goButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.equalTo(weak_self.titleLabel.mas_bottom).offset(14);
            make.size.mas_equalTo(CGSizeMake(175, 45));
            make.bottom.mas_equalTo(-(Height_NOTabBar+21.f));
        }];
    }
    return self;
}

- (UIView *)contentMenu {
    if (_contentMenu == nil) {
        _contentMenu = [[UIView alloc] init];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, kScreenWidth, 370) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(25, 0)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = CGRectMake(0, 0, kScreenWidth, 370);
        maskLayer.path = maskPath.CGPath;
        _contentMenu.layer.mask = maskLayer;
        _contentMenu.backgroundColor = UIColor.whiteColor;
        _contentMenu.userInteractionEnabled = NO;
    }
    return _contentMenu;
}

- (UILabel *)addTopicLabel {
    if (_addTopicLabel == nil) {
        _addTopicLabel = [[UILabel alloc] init];
        _addTopicLabel.text = @"+ Add a Topic";
        _addTopicLabel.font = [UIFont boldSystemFontOfSize:12];
        _addTopicLabel.textColor = [UIColor colorWithHexString:@"0x6ba276"];
    }
    return _addTopicLabel;
}

- (UIView *)topTouchButton {
    if (_topTouchButton == nil) {
        _topTouchButton = [[UIView alloc] init];
        _topTouchButton.layer.cornerRadius = 2.5;
        _topTouchButton.layer.masksToBounds = YES;
        _topTouchButton.backgroundColor = [UIColor colorWithHexString:@"0xc9c9c9"];
    }
    return _topTouchButton;
}

- (CHBaseBotton *)openButton {
    if (_openButton == nil) {
        _openButton = [[CHBaseBotton alloc] init];
        _openButton.active = YES;
        _openButton.title = @"Open";
        _openButton.actionBlock = ^(CHBaseBotton * _Nonnull button) {
        
        };
    }
    return _openButton;
}

- (CHBaseBotton *)socialButton {
    if (_socialButton == nil) {
        _socialButton = [[CHBaseBotton alloc] init];
        _socialButton.active = NO;
        _socialButton.title = @"Social";
        _socialButton.actionBlock = ^(CHBaseBotton * _Nonnull button) {
        
        };
    }
    return _socialButton;
}
- (CHBaseBotton *)closedButton {
    if (_closedButton == nil) {
        _closedButton = [[CHBaseBotton alloc] init];
        _closedButton.active = NO;
        _closedButton.title = @"Closed";
        _closedButton.actionBlock = ^(CHBaseBotton * _Nonnull button) {
        
        };
    }
    return _closedButton;
}

- (UIView *)lineView {
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"0xcacaca"];
    }
    return _lineView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = UIColor.blackColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"Start a room  open to everyone";
    }
    return _titleLabel;
}

- (UILabel *)goButton {
    if (_goButton == nil) {
        _goButton = [[UILabel alloc] init];
        _goButton.text = @"🎉 Let‘s go";
        _goButton.textColor = UIColor.blackColor;
        _goButton.font = [UIFont boldSystemFontOfSize:21];
        _goButton.layer.cornerRadius = 22.5;
        _goButton.layer.masksToBounds = YES;
        _goButton.textAlignment = NSTextAlignmentCenter;
        _goButton.backgroundColor = [UIColor colorWithHexString:@"0x4cad5e"];
    }
    return _goButton;
}
@end
