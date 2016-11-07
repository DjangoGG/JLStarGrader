//
//  JLStarGrader.m
//  JLStarGraderDemo
//
//  Created by 姜伦 on 2016/11/7.
//  Copyright © 2016年 DJangoGG. All rights reserved.
//

#import "JLStarGrader.h"

@implementation JLStarGrader

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self prepare];
    }
    return self;
}

- (void)prepare
{
    self.backgroundColor = [UIColor clearColor];
    self.emptyImage = kStarEmptyImage;
    self.fullImage = kStarFullImage;
    self.starNumber = 5;
    self.starSize = CGSizeMake(20, 20);
    self.starGrade = 1;
    
    [self initSubviews];
}

#pragma mark - UI

- (void)initSubviews
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (int i = 0; i < self.starNumber; i++)
    {
        UIImageView *imgView = [UIImageView new];
        imgView.tag = 1001 + i;
        imgView.image = [UIImage imageNamed:kStarFullImage];
        [self addSubview:imgView];
    }
    
    [self layoutSubviews];
    
    [self configStarImage];
}

- (void)layoutSubviews
{
    CGFloat W = self.bounds.size.width;
    CGFloat H = self.bounds.size.height;
    CGFloat number = self.starNumber;
    
    CGFloat imgW = self.starSize.width;
    CGFloat imgH = self.starSize.height;
    CGFloat margin = (W - imgW * number) / (number + 1);
    CGFloat imgX = margin;
    CGFloat imgY = (H - imgH) / 2;
    
    for (int i = 0; i < number; i++)
    {
        UIImageView *imgView = self.subviews[i];
        imgView.frame = CGRectMake(imgX, imgY, imgW, imgH);
        imgX += (margin + imgW);
    }
}

- (void)configStarImage
{
    for (UIImageView *imgView in self.subviews)
    {
        NSString *imageName = imgView.tag - 1000 > self.starGrade ? self.emptyImage : self.fullImage;
        imgView.image = [UIImage imageNamed:imageName];
    }
}

#pragma mark - Action

- (void)setStarNumber:(int)starNumber
{
    _starNumber = starNumber;
    [self initSubviews];
}

- (void)setStarSize:(CGSize)starSize
{
    _starSize = starSize;
    [self layoutSubviews];
}

- (void)setStarGrade:(int)starGrade
{
    _starGrade = starGrade;
    [self configStarImage];
    [self.delegate starGradeDidChange:self newGrade:starGrade];
}

#pragma mark - Touch

// 滑动开始
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.avoidConflictScrollView.scrollEnabled = NO;
}

// 滑动中
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesRating:touches];
}

// 滑动结束
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.avoidConflictScrollView.scrollEnabled = YES;
    [self touchesRating:touches];
}

/** 根据手指位置计算星数 */
- (void)touchesRating:(NSSet *)touches
{
    
    if (self.noEdit) {
        return;
    }
    
    CGPoint point = [[touches anyObject] locationInView:self];
    
    CGFloat imgW = self.bounds.size.height;
    CGFloat margin = (self.bounds.size.width - imgW * self.starNumber) / (self.starNumber + 1);
    
    int newGrade;
    if (point.x <= margin * 1.5 + imgW)
    {
        newGrade = 1;
    }
    else
    {
        newGrade = (point.x - (margin * 1.5 + imgW)) / (imgW + margin) + 2;
        newGrade = MIN(newGrade, self.starNumber);
    }
    
    if (newGrade != self.starGrade)
    {
        self.starGrade = newGrade;
    }
}


@end
