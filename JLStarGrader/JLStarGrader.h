//
//  JLStarGrader.h
//  JLStarGraderDemo
//
//  Created by 姜伦 on 2016/11/7.
//  Copyright © 2016年 DJangoGG. All rights reserved.
//

#import <UIKit/UIKit.h>

// 默认星星图片
static NSString *kStarFullImage = @"star";
static NSString *kStarEmptyImage = @"nil_star";


@class JLStarGrader;

@protocol JLStarGraderDelegate <NSObject>

/** 代理方法, 评分改变 */
- (void)starGradeDidChange:(JLStarGrader *)starGrader newGrade:(int)newGrade;

@end


@interface JLStarGrader : UIView

/// 星星数量, 默认5
@property (nonatomic, assign) int starNumber;
/// 星星大小, 默认20*20
@property (nonatomic, assign) CGSize starSize;
/// 分数, 默认1
@property (nonatomic, assign) int starGrade;
/// 滑动评分时, 禁止该 scrollview 的滑动
@property (nonatomic, weak) UIScrollView *avoidConflictScrollView;
/// 是否可以编辑, 默认可以
@property (nonatomic, assign) BOOL noEdit;
/// 有星图片名
@property (nonatomic, copy) NSString *fullImage;
/// 无星图片名
@property (nonatomic, copy) NSString *emptyImage;
/// 代理
@property (nonatomic, weak) id <JLStarGraderDelegate> delegate;

@end
