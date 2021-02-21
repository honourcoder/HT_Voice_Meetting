//
//  CHPlanCell.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/16.
//

#import "CHPlanCell.h"


@interface CHPlanInfoCell : UITableViewCell
@property (nonatomic,strong) UILabel * timePlanLabel;
@property (nonatomic,strong) UIImageView * planIconView;
@property (nonatomic,strong) UILabel * planTitleLabel;
@property (nonatomic,strong) UILabel * planDetailLabel;
@end

@implementation CHPlanInfoCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = UIColor.clearColor;
        [self.contentView addSubview:self.timePlanLabel];
        [self.timePlanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(34);
            make.top.mas_offset(8);
        }];
        @weakify(self)
        [self.contentView addSubview:self.planTitleLabel];
        [self.planTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weak_self.timePlanLabel.mas_right).offset(15);
            make.top.mas_offset(8);
            make.height.mas_equalTo(12);
        }];
        [self.contentView addSubview:self.planIconView];
        [self.planIconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weak_self.planTitleLabel.mas_right).offset(8);
            make.centerY.equalTo(weak_self.planTitleLabel);
        }];
        [self.contentView addSubview:self.planDetailLabel];
        [self.planDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weak_self.planTitleLabel);
            make.top.equalTo(weak_self.planTitleLabel.mas_bottom).offset(7);
        }];
    }
    return self;
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
        _planTitleLabel.font = [UIFont boldSystemFontOfSize:10];
        _planTitleLabel.textColor = [UIColor colorWithHexString:@"0x342e30"];
    }
    return _planTitleLabel;
}

- (UILabel *)planDetailLabel {
    if (_planDetailLabel == nil) {
        _planDetailLabel = [[UILabel alloc] init];
        _planDetailLabel.text = @"No Agenda, Only Vibes";
        _planDetailLabel.font = [UIFont boldSystemFontOfSize:14];
        _planDetailLabel.textColor = [UIColor colorWithHexString:@"0x342e30"];
    }
    return _planDetailLabel;
}

@end

@interface CHPlanCell () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) CHBaseTableView * tableViewCell;

@end

@implementation CHPlanCell

- (CHBaseTableView *)tableViewCell {
    if (_tableViewCell == nil) {
        _tableViewCell = [[CHBaseTableView alloc] init];
        _tableViewCell.delegate = self;
        _tableViewCell.dataSource = self;
        _tableViewCell.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableViewCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.tableViewCell];
        self.backgroundColor = UIColor.clearColor;
        [self.tableViewCell mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 16, 0, 16));
        }];
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CHPlanInfoCell * infoCell = [tableView dequeueReusableCellWithIdentifier:@"CHPlanInfoCell"];
    if (infoCell == nil) {
        infoCell = [[CHPlanInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CHPlanInfoCell"];
        infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return infoCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 46.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 8;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
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
