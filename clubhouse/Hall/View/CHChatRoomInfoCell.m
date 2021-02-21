//
//  CHChatRoomInfoCell.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/17.
//

#import "CHChatRoomInfoCell.h"

@interface CHRoomPersonInfoCell : UITableViewCell
@property (nonatomic,strong) UILabel * timePlanLabel;
@property (nonatomic,strong) UIImageView * planIconView;
//@property (nonatomic,strong) UILabel * planTitleLabel;
//@property (nonatomic,strong) UILabel * planDetailLabel;
@end

@implementation CHRoomPersonInfoCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = UIColor.clearColor;
        [self.contentView addSubview:self.timePlanLabel];
        [self.timePlanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.centerY.mas_offset(0);
            make.right.mas_equalTo(0);
        }];
//        @weakify(self)
//        [self.contentView addSubview:self.planTitleLabel];
//        [self.planTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(weak_self.timePlanLabel.mas_right).offset(15);
//            make.top.mas_offset(8);
//            make.height.mas_equalTo(12);
//        }];
//        [self.contentView addSubview:self.planIconView];
//        [self.planIconView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(weak_self.planTitleLabel.mas_right).offset(8);
//            make.centerY.equalTo(weak_self.planTitleLabel);
//        }];
//        [self.contentView addSubview:self.planDetailLabel];
//        [self.planDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(weak_self.planTitleLabel);
//            make.top.equalTo(weak_self.planTitleLabel.mas_bottom).offset(7);
//        }];
    }
    return self;
}

- (UILabel *)timePlanLabel {
    if (_timePlanLabel == nil) {
        _timePlanLabel = [[UILabel alloc] init];
        _timePlanLabel.text = @"Jeason Ma ✉️";
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

//- (UILabel *)planTitleLabel {
//    if (_planTitleLabel == nil) {
//        _planTitleLabel = [[UILabel alloc] init];
//        _planTitleLabel.text = @"9AM IN LOGDON";
//        _planTitleLabel.font = [UIFont boldSystemFontOfSize:10];
//        _planTitleLabel.textColor = [UIColor colorWithHexString:@"0x342e30"];
//    }
//    return _planTitleLabel;
//}
//
//- (UILabel *)planDetailLabel {
//    if (_planDetailLabel == nil) {
//        _planDetailLabel = [[UILabel alloc] init];
//        _planDetailLabel.text = @"No Agenda, Only Vibes";
//        _planDetailLabel.font = [UIFont boldSystemFontOfSize:14];
//        _planDetailLabel.textColor = [UIColor colorWithHexString:@"0x342e30"];
//    }
//    return _planDetailLabel;
//}

@end

@interface CHRoomOwnerIconView : UIView
@property (nonatomic,strong) UIImageView * ownerOneView;
@property (nonatomic,strong) UIImageView * ownerTwoView;

@end

@implementation CHRoomOwnerIconView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.ownerTwoView];
        [self.ownerTwoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        [self addSubview:self.ownerOneView];
        [self.ownerOneView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
    }
    return self;
}

- (UIImageView *)ownerOneView {
    if (_ownerOneView == nil) {
        _ownerOneView = [[UIImageView alloc] init];
        _ownerOneView.layer.cornerRadius = 18;
        _ownerOneView.layer.masksToBounds = YES;
        _ownerOneView.contentMode = UIViewContentModeScaleAspectFill;
        _ownerOneView.clipsToBounds = YES;
        _ownerOneView.backgroundColor = UIColor.redColor;
    }
    return _ownerOneView;
}

- (UIImageView *)ownerTwoView {
    if (_ownerTwoView == nil) {
        _ownerTwoView = [[UIImageView alloc] init];
        _ownerTwoView.layer.cornerRadius = 18;
        _ownerTwoView.layer.masksToBounds = YES;
        _ownerTwoView.contentMode = UIViewContentModeScaleAspectFill;
        _ownerTwoView.clipsToBounds = YES;
        _ownerTwoView.backgroundColor = UIColor.blueColor;
    }
    return _ownerTwoView;
}

@end


@interface CHChatRoomTotalInfoView : UIView
@property (nonatomic,strong) UILabel * personNoLabel;
@property (nonatomic,strong) UILabel * talksNoLabel;
@property (nonatomic,strong) UILabel * centerLabel;
@property (nonatomic,strong) UIImageView * personNoIcon;
@property (nonatomic,strong) UIImageView * talksNoIcon;
@end

@implementation CHChatRoomTotalInfoView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.personNoLabel];
        @weakify(self)
        [self.personNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
        }];
        [self addSubview:self.personNoIcon];
        [self.personNoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weak_self.personNoLabel.mas_right).offset(5);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(10);
        }];
        [self addSubview:self.centerLabel];
        [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weak_self.personNoIcon.mas_right).offset(5);
            make.top.bottom.mas_equalTo(0);
        }];
        [self addSubview:self.talksNoLabel];
        [self.talksNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weak_self.centerLabel.mas_right).offset(5);
            make.top.bottom.mas_equalTo(0);
        }];
        [self addSubview:self.talksNoIcon];
        [self.talksNoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weak_self.talksNoLabel.mas_right).offset(5);
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-5);
            make.width.mas_equalTo(10);
        }];
    }
    return self;
}

- (UIImageView *)personNoIcon {
    if (_personNoIcon == nil) {
        _personNoIcon = [[UIImageView alloc] init];
        _personNoIcon.backgroundColor = UIColor.redColor;
    }
    return _personNoIcon;
}

- (UILabel *)talksNoLabel {
    if (_talksNoLabel == nil) {
        _talksNoLabel = [[UILabel alloc] init];
        _talksNoLabel.text= @"10";
        _talksNoLabel.textColor = [UIColor colorWithHexString:@"0x989898"];
        _talksNoLabel.font = [UIFont systemFontOfSize:12];
    }
    return _talksNoLabel;
}

- (UIImageView *)talksNoIcon {
    if (_talksNoIcon == nil) {
        _talksNoIcon = [[UIImageView alloc] init];
        _talksNoIcon.backgroundColor = UIColor.redColor;
    }
    return _talksNoIcon;
}

- (UILabel *)personNoLabel {
    if (_personNoLabel == nil) {
        _personNoLabel = [[UILabel alloc] init];
        _personNoLabel.text= @"10.2k";
        _personNoLabel.textColor = [UIColor colorWithHexString:@"0x989898"];
        _personNoLabel.font = [UIFont systemFontOfSize:12];
    }
    return _personNoLabel;
}

- (UILabel *)centerLabel {
    if (_centerLabel == nil) {
        _centerLabel = [[UILabel alloc] init];
        _centerLabel.text = @"/";
        _centerLabel.font = [UIFont boldSystemFontOfSize:12];
        _centerLabel.textColor = [UIColor colorWithHexString:@"0x989898"];
    }
    return _centerLabel;
}

@end

@interface CHChatRoomInfoCell () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UILabel * titlesLabel;
@property (nonatomic,strong) UILabel * detailsLabel;
@property (nonatomic,strong) CHRoomOwnerIconView * roomOwnerIconView;
@property (nonatomic,strong) UITableView * tableViewCell;
@property (nonatomic,strong) CHChatRoomTotalInfoView * roomTotalView;

@end

@implementation CHChatRoomInfoCell

- (UITableView *)tableViewCell {
    if (_tableViewCell == nil) {
        _tableViewCell = [[UITableView alloc] init];
        _tableViewCell.delegate = self;
        _tableViewCell.dataSource = self;
        _tableViewCell.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableViewCell.backgroundColor = UIColor.clearColor;
        _tableViewCell.backgroundView.backgroundColor = UIColor.clearColor;
        
        _tableViewCell.layer.masksToBounds = YES;
        _tableViewCell.scrollEnabled = NO;
    }
    return _tableViewCell;
}
- (CHRoomOwnerIconView *)roomOwnerIconView {
    if (_roomOwnerIconView == nil) {
        _roomOwnerIconView = [[CHRoomOwnerIconView alloc] init];
    }
    return _roomOwnerIconView;
}

- (UILabel *)titlesLabel {
    if (_titlesLabel == nil) {
        _titlesLabel = [[UILabel alloc] init];
        _titlesLabel.font = [UIFont boldSystemFontOfSize:10];
        _titlesLabel.text = @"THE ARE CLUB 🏠";
    }
    return _titlesLabel;
}

- (UILabel *)detailsLabel {
    if (_detailsLabel == nil) {
        _detailsLabel = [[UILabel alloc] init];
        _detailsLabel.font = [UIFont boldSystemFontOfSize:16];
        _detailsLabel.text = @"#24HoursofLove: the love song that made us fall in love";
        _detailsLabel.numberOfLines = 2;
    }
    return _detailsLabel;
}

- (CHChatRoomTotalInfoView *)roomTotalView {
    if (_roomTotalView == nil) {
        _roomTotalView = [[CHChatRoomTotalInfoView alloc] init];
    }
    return _roomTotalView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = UIColor.clearColor;
        UIView * infoContentView = [[UIView alloc] init];
        infoContentView.backgroundColor = UIColor.whiteColor;
        infoContentView.layer.cornerRadius = 15;
        
         @weakify(self)
        [self.contentView addSubview:infoContentView];
        [infoContentView addSubview:self.titlesLabel];
        [self.titlesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(22);
            make.left.mas_equalTo(20);
        }];
        [infoContentView addSubview:self.detailsLabel];
        [self.detailsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weak_self.titlesLabel.mas_bottom).offset(10);
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-28);
        }];
        [infoContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(8, 16, 8, 16));
        }];
        [infoContentView addSubview:self.roomOwnerIconView];
        [self.roomOwnerIconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(68, 56));
            make.left.mas_equalTo(20);
            make.top.equalTo(weak_self.detailsLabel.mas_bottom).offset(18);
        }];
        [infoContentView addSubview:self.tableViewCell];
        
       
        [self.tableViewCell mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weak_self.roomOwnerIconView.mas_right).offset(15);
            make.top.equalTo(weak_self.detailsLabel.mas_bottom).offset(18);
            make.right.mas_equalTo(28);
            make.bottom.mas_equalTo(-23);
        }];
        [infoContentView addSubview:self.roomTotalView];
        [self.roomTotalView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weak_self.tableViewCell.mas_bottom).offset(-2);
            make.left.mas_equalTo(weak_self.tableViewCell);
        }];
    }
    return self;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CHRoomPersonInfoCell * infoCell = [tableView dequeueReusableCellWithIdentifier:@"CHRoomPersonInfoCell"];
    if (infoCell == nil) {
        infoCell = [[CHRoomPersonInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CHRoomPersonInfoCell"];
        infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return infoCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 25.f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
