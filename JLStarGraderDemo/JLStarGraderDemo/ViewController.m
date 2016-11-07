//
//  ViewController.m
//  JLStarGraderDemo
//
//  Created by 姜伦 on 2016/11/7.
//  Copyright © 2016年 DjangoGG. All rights reserved.
//

#import "ViewController.h"
#import "JLStarGrader.h"

@interface ViewController () <JLStarGraderDelegate>

@property (weak, nonatomic) IBOutlet JLStarGrader *starGrader;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.starGrader.delegate = self;
    
    self.starGrader.starGrade = 2;
    self.starGrader.starNumber = 5;
    self.starGrader.starSize = CGSizeMake(25, 25);
    self.starGrader.avoidConflictScrollView = self.scrollView;
}


- (void)starGradeDidChange:(JLStarGrader *)starGrader newGrade:(int)newGrade {
    switch (newGrade) {
        case 1:
            self.tipLabel.text = @"非常不好";
            break;
        case 2:
            self.tipLabel.text = @"不咋地";
            break;
        case 3:
            self.tipLabel.text = @"还行";
            break;
        case 4:
            self.tipLabel.text = @"还不错";
            break;
        case 5:
            self.tipLabel.text = @"非常好";
            break;
        default:
            break;
    }
}


@end
