//
//  CHClubPlanCell.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/17.
//

#import "CHClubPlanCell.h"


@interface CHMembersView : UIView
@property (nonatomic,strong)NSMutableArray * iconArray;
@end

@implementation CHMembersView

- (instancetype)init {
    if (self = [super init]) {
        [self.iconArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:7 leadSpacing:7 tailSpacing:14];
        [self.iconArray mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(41);
            make.centerY.mas_equalTo(0);
        }];
    }
    return self;
}

- (NSMutableArray *)iconArray {
    if (_iconArray == nil) {
        _iconArray = [[NSMutableArray alloc] init];
        for (int i = 0 ; i < 8; i++) {
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.layer.cornerRadius = 14;
            imageView.layer.masksToBounds = YES;
            imageView.backgroundColor = UIColor.redColor;
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            [self addSubview:imageView];
            [_iconArray addObject:imageView];
        }
    }
    return _iconArray;
}

@end

@interface CHClubPlanCell ()
@property (nonatomic,strong) UILabel * timePlanLabel;
@property (nonatomic,strong) UIImageView * planIconView;
@property (nonatomic,strong) UILabel * planTitleLabel;
@property (nonatomic,strong) UILabel * planDetailLabel;
@property (nonatomic,strong) CHMembersView * membersView;
@property (nonatomic,strong) UILabel * memberLabel;
@end

@implementation CHClubPlanCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        [self.contentView addSubview:self.timePlanLabel];
        [self.timePlanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(18);
            make.left.mas_equalTo(14);
        }];
        [self.contentView addSubview:self.planIconView];
        [self.planIconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(24, 24));
            make.right.mas_equalTo(-16);
            make.top.mas_equalTo(16);
        }];
        @weakify(self)
        [self.contentView addSubview:self.planTitleLabel];
        [self.planTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.right.mas_equalTo(-50);
            make.top.equalTo(weak_self.timePlanLabel.mas_bottom).offset(9);
            make.left.mas_equalTo(14);
        }];
        [self.contentView addSubview:self.planDetailLabel];
        [self.planDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-50);
            make.top.equalTo(weak_self.planTitleLabel.mas_bottom).offset(11);
            make.left.mas_equalTo(14);
        }];
        [self.contentView addSubview:self.membersView];
        [self.membersView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-18);
            make.top.equalTo(weak_self.planDetailLabel.mas_bottom).offset(11);
            make.left.mas_equalTo(7);
            make.height.mas_equalTo(43);
        }];
        [self.contentView addSubview:self.memberLabel];
        [self.memberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-18);
            make.top.equalTo(weak_self.membersView.mas_bottom).offset(8);
            make.left.mas_equalTo(14);
            make.bottom.mas_equalTo(-18);
        }];
    }
    return self;
}

- (CHMembersView *)membersView {
    if (_membersView == nil) {
        _membersView = [[CHMembersView alloc] init];
    }
    return _membersView;
}

- (UILabel *)memberLabel {
    if (_memberLabel == nil) {
        _memberLabel = [[UILabel alloc] init];
        _memberLabel.text = @"w/ Delete this help topic if your application support only one document type.Delete this help topic if your application support only one document type.Delete this help topic if your application support only one document type.Delete this help topic if your application support only one document type.Delete this help topic if your application support only one document type.Delete this help topic if your application support only one document type.Delete this help topic if your application support only one document type. this help topic if your application support only one document type.Delete this help topic if your application support only one document type.Delete this help topic if your application support only o this help topic if your application support only one document type.Delete this help topic if your application support only one document type.Delete this help topic if your application support only o this help topic if your application support only one document type.Delete this help topic if your application support only one document type.Delete this help topic if your application support only o";
        _memberLabel.font = [UIFont systemFontOfSize:10];
        _memberLabel.textColor = [UIColor colorWithHexString:@"0x6f6c58"];
        _memberLabel.numberOfLines = 0;
    }
    return _memberLabel;
}

- (UILabel *)timePlanLabel {
    if (_timePlanLabel == nil) {
        _timePlanLabel = [[UILabel alloc] init];
        _timePlanLabel.text = @"5:00 PM";
        _timePlanLabel.font = [UIFont boldSystemFontOfSize:12];
        _timePlanLabel.textColor = [UIColor colorWithHexString:@"0x6f6c58"];
    }
    return _timePlanLabel;
}

- (UIImageView *)planIconView {
    if (_planIconView == nil) {
        _planIconView = [[UIImageView alloc] init];
    }
    return _planIconView;
}

- (UILabel *)planTitleLabel {
    if (_planTitleLabel == nil) {
        _planTitleLabel = [[UILabel alloc] init];
        _planTitleLabel.text = @"9AM IN LOGDON";
        _planTitleLabel.font = [UIFont boldSystemFontOfSize:14];
        _planTitleLabel.numberOfLines = 2;
        _planTitleLabel.textColor = [UIColor colorWithHexString:@"0x342e30"];
    }
    return _planTitleLabel;
}

- (UILabel *)planDetailLabel {
    if (_planDetailLabel == nil) {
        _planDetailLabel = [[UILabel alloc] init];
        _planDetailLabel.text = @"No Agenda, Only Vibes";
        _planDetailLabel.font = [UIFont boldSystemFontOfSize:10];
        _planDetailLabel.textColor = [UIColor colorWithHexString:@"0x342e30"];
    }
    return _planDetailLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
        
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
