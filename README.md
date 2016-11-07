# JLStarGrader
项目中有去多用到评分的地方,虽然github上已有许多类似轮子,还是手痒,参考了别人的代码,自己撸了一个,功能很基础(简陋),给大家共同学习

![示例图片](https://github.com/DjangoGG/JLStarGrader/raw/master/Resource/preview.png)

```Objective-C
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
```
