//
//  CHBaseNavView.h
//  clubhouse
//
//  Created by zhang benwei on 2021/2/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CHBaseRightNavDelegate <NSObject>

- (void)touchRightAction:(NSInteger)index;
- (void)touchLeftAction;

@end

@interface CHBaseNavView : UIView
@property (nonatomic,strong) NSMutableArray *leftBtnArray;
@property (nonatomic,strong) NSMutableArray *rightBtnArray;
@property (nonatomic,strong) UIView * titleContentView;
@property (nonatomic,assign) id <CHBaseRightNavDelegate> rightDelegate;

- (UIView *)addLeftAction:(NSString *)leftName isPng:(BOOL)isPng;

- (NSMutableArray *)addrightAction:(NSArray <NSDictionary *> *)leftNames interval:(double)interval;

@end

NS_ASSUME_NONNULL_END
