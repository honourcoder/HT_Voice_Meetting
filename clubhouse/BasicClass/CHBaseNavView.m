//
//  CHBaseNavView.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/16.
//

#import "CHBaseNavView.h"


@interface CHBaseNavView ()
@property (nonatomic,strong) UIView * leftContentView;
@property (nonatomic,strong) UIView * rightContentView;

@end

@implementation CHBaseNavView


- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.titleContentView];
        [self.titleContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.mas_equalTo(0);
            make.top.bottom.mas_equalTo(0);
        }];
        @weakify(self)
        [self addSubview:self.leftContentView];
        [self.leftContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(24);
            make.height.mas_offset(44);
            make.right.equalTo(weak_self.titleContentView.mas_left).offset(-12);
            make.top.bottom.mas_equalTo(0);
        }];
        
        [self addSubview:self.rightContentView];
        [self.rightContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-24);
            make.height.mas_offset(44);
            make.left.equalTo(weak_self.titleContentView.mas_right).offset(12);
            make.top.bottom.mas_equalTo(0);
        }];
    }
    return self;
}

- (UIView *)addLeftAction:(NSString *)leftName isPng:(BOOL)isPng {
    if (isPng) {
        UIImageView * imageView = [[UIImageView alloc] init];
        if ([leftName containsString:@"http"]) { 
            [imageView setImageWithURL:[NSURL URLWithString:leftName] placeholder:CHUserImagePlaceHolder];
        }else{
            imageView.image = [UIImage imageNamed:leftName];
        }
        [self.leftBtnArray addObject:imageView];
        [self.leftContentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
            make.height.width.mas_equalTo(33);
        }];
        return imageView;
    }else{
        UILabel * titleLabel = [[UILabel alloc] init];
        titleLabel.text = leftName;
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.font = [UIFont boldSystemFontOfSize:24];
        [self.leftContentView addSubview:titleLabel];
        [self.leftBtnArray addObject:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
            make.height.width.mas_equalTo(33);
        }];
        return titleLabel;
    }
}

- (NSMutableArray *)addrightAction:(NSArray <NSDictionary *> *)leftNames interval:(double)interval {
    [self.rightBtnArray removeAllObjects];
    for (NSDictionary  * leftDic in leftNames) {
        NSString * leftName = leftDic[@"name"];
        BOOL isPng = [leftDic[@"isPng"] boolValue];
         if (isPng) {
               UIImageView * imageView = [[UIImageView alloc] init];
               if ([leftName containsString:@"http"]) {
                   [imageView setImageWithURL:[NSURL URLWithString:leftName] placeholder:CHUserImagePlaceHolder];
               }else{
                   imageView.image = [UIImage imageNamed:leftName];
               }
               [self.rightBtnArray addObject:imageView];
               [self.rightContentView addSubview:imageView];
               
           }else{
               UILabel * titleLabel = [[UILabel alloc] init];
               titleLabel.text = leftName;
               titleLabel.textAlignment = NSTextAlignmentCenter;
               titleLabel.font = [UIFont boldSystemFontOfSize:24];
               [self.rightContentView addSubview:titleLabel];
               [self.rightBtnArray addObject:titleLabel];
           }
    }
    UIView * rightView;
    for (int i = 0 ; i < self.rightBtnArray.count; i ++) {
        UIView * subView = self.rightBtnArray[i];
        subView.tag = 100 + i;
        if (i == 0) {
            [subView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_offset(0);
                make.centerY.mas_offset(0);
                make.size.mas_equalTo(CGSizeMake(33, 33));
            }];
        }else if (i < (self.rightBtnArray.count-1)) {
            [subView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(rightView.mas_left).offset(-interval);
                make.centerY.mas_offset(0);
                make.size.mas_equalTo(CGSizeMake(33, 33));
            }];
            
        }else if (i == (self.rightBtnArray.count-1)) {
            [subView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(rightView.mas_left).offset(-interval);
                make.centerY.mas_offset(0);
                make.size.mas_equalTo(CGSizeMake(33, 33));
                make.left.mas_equalTo(0);
            }];
        }
        rightView = subView;
    }
    return self.rightBtnArray;
}

- (void)rightContentAction:(UITapGestureRecognizer *)gesture {
    CGPoint locationPoint = [gesture locationInView:self.rightContentView];
    for (UIView * sender in self.rightBtnArray) {
        if (CGRectContainsPoint(sender.frame, locationPoint)) {
            if (self.rightDelegate &&  [self.rightDelegate respondsToSelector:@selector(touchRightAction:)]) {
                [self.rightDelegate touchRightAction:sender.tag - 100];
            };
        }
    }
}

- (void)leftContentAction:(UITapGestureRecognizer *)gesture {
     if (self.rightDelegate &&  [self.rightDelegate respondsToSelector:@selector(touchRightAction:)]) {
         [self.rightDelegate touchLeftAction];
     };
}

- (UIView *)leftContentView {
    if (_leftContentView == nil) {
        _leftContentView =[[UIView alloc] init];
        [_leftContentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftContentAction:)]];
    }
    return _leftContentView;
}

- (UIView *)rightContentView {
    if (_rightContentView == nil) {
        _rightContentView = [[UIView alloc] init];
        _rightContentView.userInteractionEnabled = YES;
        [_rightContentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightContentAction:)]];
    }
    return _rightContentView;
}

- (UIView *)titleContentView {
    if (_titleContentView == nil) {
        _titleContentView = [[UIView alloc] init];
    }
    return _titleContentView;
}

-(NSMutableArray *)leftBtnArray {
    if (_leftBtnArray == nil) {
        _leftBtnArray = [[NSMutableArray alloc] init];
    }
    return _leftBtnArray;
}

- (NSMutableArray *)rightBtnArray {
    if (_rightBtnArray == nil) {
        _rightBtnArray = [[NSMutableArray alloc] init];
    }
    return _rightBtnArray;
}

@end
