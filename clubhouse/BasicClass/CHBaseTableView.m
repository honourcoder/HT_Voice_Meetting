//
//  CHBaseTableView.m
//  clubhouse
//
//  Created by zhang benwei on 2021/2/16.
//

#import "CHBaseTableView.h"


@interface CHBaseTableView ()


@end

@implementation CHBaseTableView


- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"0xe5e2d4"];
        self.backgroundView.backgroundColor = UIColor.clearColor;
        self.layer.cornerRadius = 15;
        self.layer.masksToBounds = YES;
        self.scrollEnabled = NO;
    }
    return self;
}
 

@end
