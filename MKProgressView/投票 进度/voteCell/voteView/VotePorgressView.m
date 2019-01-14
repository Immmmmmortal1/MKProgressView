//
//  VotePorgressView.m
//  MKProgressView
//
//  Created by shuxia on 2019/1/12.
//  Copyright © 2019 shuxia. All rights reserved.
//

#import "VotePorgressView.h"
#import <QuartzCore/QuartzCore.h>

@interface VotePorgressView()
@property (nonatomic, assign) CFTimeInterval animationDuration;
@property (nonatomic, assign) BOOL animated;
@property (nonatomic,strong)UIBezierPath *path;
@property (nonatomic,assign) CGFloat  startY;

@end
@implementation VotePorgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.animated = YES;
        self.animationDuration = 0.5;
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        [self CreateSubView];
    }
    return self;
}

-(void)CreateSubView{
    
    
}
-(void)setProgressV:(CGFloat )progressV{
    _progressV = progressV;
    self.path = [UIBezierPath bezierPath];
    
    self.startY = self.frame.size.height/2;
    [self.path moveToPoint:CGPointMake(0, self.startY)];
    

    CGFloat endX = self.frame.size.width*_progressV;
    [self.path addLineToPoint:CGPointMake(endX, self.startY)];

    CAShapeLayer *layer = [CAShapeLayer layer];
    /*设置进度条的高度*/
    layer.lineWidth = self.frame.size.height;
    layer.path = self.path.CGPath;
    layer.strokeColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:layer];


}
@end
