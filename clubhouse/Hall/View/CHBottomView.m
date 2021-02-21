//
//  CHBottomView.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/17.
//

#import "CHBottomView.h"


@interface CHBottomView ()
@property (nonatomic,strong)UILabel * bottomSender;
@property (nonatomic,strong)UIImageView * menuBtn;
@end

@implementation CHBottomView

- (instancetype)init {
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = UIColor.clearColor;
       CAGradientLayer * layers =  [CHBottomView setGradualChangingColor:self fromColor:@"0xffffff" toColor:@"0xf0f0e3"];
        [self.layer addSublayer:layers];
        [self addSubview:self.bottomSender];
        [self.bottomSender mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(176, 44));
            make.centerX.mas_equalTo(0);
        }];
        @weakify(self);
        [self addSubview:self.menuBtn];
        [self.menuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(weak_self.bottomSender);
            make.right.mas_equalTo(-28);
            make.size.mas_equalTo(CGSizeMake(23, 23));
        }];
    }
    return self;
}

- (void)createChatARoom{
 
//    if (self.actionBlock) {
//        self.actionBlock(NO);
//    }
    if (nil != self.startRoomBlock) {
        self.startRoomBlock();
    }
}

- (void)openNewMenu{
    if (self.actionBlock) {
        self.actionBlock(NO);
    }
}

- (UILabel *)bottomSender {
    if (_bottomSender == nil) {
        _bottomSender = [[UILabel alloc] init];
        _bottomSender.layer.masksToBounds = YES;
        _bottomSender.layer.cornerRadius = 22;
        _bottomSender.text = @"+ Start a room";
        _bottomSender.font = [UIFont boldSystemFontOfSize:18];
        _bottomSender.textAlignment = NSTextAlignmentCenter;
        _bottomSender.textColor = UIColor.whiteColor;
        _bottomSender.backgroundColor = [UIColor colorWithHexString:@"0x4aad63"];
        _bottomSender.userInteractionEnabled = YES;
        [_bottomSender addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(createChatARoom)]];
    }
    return _bottomSender;
}

- (UIImageView *)menuBtn {
    if (_menuBtn == nil) {
        _menuBtn = [[UIImageView alloc] init];
        _menuBtn.backgroundColor = UIColor.redColor;
        [_menuBtn addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openNewMenu)]];
    }
    return _menuBtn;
}
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr{

//    CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, kScreenWidth, Height_TabBar);

    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(__bridge id)[[UIColor colorWithHexString:fromHexColorStr] colorWithAlphaComponent:0].CGColor,(__bridge id)[UIColor colorWithHexString:toHexColorStr].CGColor];

    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);

    //  设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0,@1];

    return gradientLayer;
}
@end
