//
//  CHBaseBotton.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/18.
//

#import "CHBaseBotton.h"

@interface CHBaseBotton ()

@property (nonatomic,strong) UIImageView * imageView;

@property (nonatomic,strong) UILabel * titleLabel;

@end

@implementation CHBaseBotton

- (instancetype)init {
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        @weakify(self)
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            if (weak_self.actionBlock) {
                weak_self.actionBlock(weak_self);
            }
        }]];
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(75, 75));
            make.top.mas_equalTo(8);
            make.centerX.mas_equalTo(0);
        }];
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weak_self.imageView.mas_bottom).offset(4);
            make.centerX.mas_equalTo(0);
        }];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _titleLabel.text =_title;
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    _imageView.image = [UIImage imageNamed:_imageName];
}

- (void)setActive:(BOOL)active {
    _active = active;
    if (_active) {
        self.backgroundColor = [UIColor colorWithHexString:@"0xe0e6ef"];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
    }else{
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius =  0;
        self.layer.masksToBounds = NO;
    }
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.layer.cornerRadius = 32;
        _imageView.layer.masksToBounds = YES;
        _imageView.backgroundColor = UIColor.redColor;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.textColor = UIColor.blackColor;
    }
    return _titleLabel;
}




@end
