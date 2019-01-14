//
//  CircleProgressView.m
//  MKProgressView
//
//  Created by shuxia on 2019/1/14.
//  Copyright © 2019 shuxia. All rights reserved.
//




#import "CircleProgressView.h"
//宽度
static const CGFloat layerWidth = 10;
@interface CircleProgressView()
{
    /** 原点 */
    CGPoint _origin;
    /** 半径 */
    CGFloat _radius;
    /** 起始 */
    CGFloat _startAngle;
    /** 结束 */
    CGFloat _endAngle;
}
/** 进度显示 */
@property (nonatomic, strong) UILabel *progressLabel;
/** 顶层显示层 */
@property (nonatomic, strong) CAShapeLayer *topLayer;
/** 底层显示层 */
@property (nonatomic, strong) CAShapeLayer *bottomLayer;

@end
@implementation CircleProgressView
- (instancetype)initWithFrame:(CGRect)frame progress:(CGFloat)progress {
    if (self) {
        self = [super initWithFrame:frame];
        self.backgroundColor = [UIColor clearColor];
        self.progress = progress;
        [self CreateSubView];
        
    }
    return self;
}
-(void)CreateSubView{
    
//    [self.layer addSublayer:self.bottomLayer];
    [self.layer addSublayer:self.topLayer];
    [self addSubview:self.progressLabel];
    
    _origin = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    _radius = self.bounds.size.width / 2;
    
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:_origin radius:_radius startAngle:- M_PI_4 * 5 endAngle:M_PI_4 clockwise:YES];
    
    _bottomLayer.path = progressPath.CGPath;
    _topLayer.path = progressPath.CGPath;
    [self gradient];
    
    
}
#pragma mark   --------------------------设置渐变色
- (void)gradient{
    /*声明layer*/
    CALayer *gradientLayer = [CALayer layer];
    
    CAGradientLayer *leftGradient = [CAGradientLayer layer];
    leftGradient.frame = CGRectMake(-layerWidth/2, -layerWidth/2, self.bounds.size.width / 2 + layerWidth/2, self.bounds.size.height + layerWidth);
    leftGradient.colors = @[(id)[UIColor yellowColor].CGColor,
                            (id)[UIColor redColor].CGColor];
    [leftGradient setLocations:@[@0.3, @0.9, @1]];
    
    CAGradientLayer *rightGradient = [CAGradientLayer layer];
    rightGradient.frame = CGRectMake(self.bounds.size.width / 2, -layerWidth/2, self.bounds.size.width / 2 + layerWidth/2, self.bounds.size.height + layerWidth);
    rightGradient.colors = @[(id)[UIColor yellowColor].CGColor,
                             (id)[UIColor greenColor].CGColor];
    [rightGradient setLocations:@[@0.3, @0.9, @1]];

    [gradientLayer addSublayer:leftGradient];
    [gradientLayer addSublayer:rightGradient];
    
    [gradientLayer setMask:_topLayer];
    [self.layer addSublayer:gradientLayer];
    /*
     //颜色差距较小渐变色 起点为左上角 终点为右下角
     
     CALayer *layer = [CALayer layer];
     CAGradientLayer *gradientLayer = [CAGradientLayer layer];
     gradientLayer.frame = CGRectMake(-layerWidth/2, -layerWidth/2, self.bounds.size.width + layerWidth, self.bounds.size.height + layerWidth);
     gradientLayer.colors = @[(id)ColorFromRGB(0xFFD800).CGColor,
     (id)ColorFromRGB(0XFDBC13).CGColor,
     (id)ColorFromRGB(0xFF8100).CGColor];
     gradientLayer.startPoint = CGPointMake(0, 0);
     gradientLayer.endPoint = CGPointMake(1, 1);
     [layer addSublayer:gradientLayer];
     
     [layer setMask:_topLayer];
     [self.layer addSublayer:layer];
*/
}
#pragma mark - 懒加载
- (UILabel *)progressLabel {
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 15)];
        _progressLabel.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.textColor = [UIColor blackColor];
    }
    return _progressLabel;
}
- (CAShapeLayer *)topLayer {
    if (!_topLayer) {
        _topLayer = [CAShapeLayer layer];
        _topLayer.lineWidth = layerWidth;
        _topLayer.lineCap = kCALineCapRound;
        _topLayer.fillColor = [UIColor clearColor].CGColor;
        _topLayer.strokeColor = [UIColor greenColor].CGColor;
    }
    return _topLayer;
}
- (CAShapeLayer *)bottomLayer {
    if (!_bottomLayer) {
        _bottomLayer = [CAShapeLayer layer];
        _bottomLayer.lineCap = kCALineCapRound;
        _bottomLayer.lineWidth = layerWidth;
        _bottomLayer.fillColor = [UIColor clearColor].CGColor;
    }
    return _bottomLayer;
}
#pragma mark - setMethod
- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    _progressLabel.text = [NSString stringWithFormat:@"%.0f%%",progress * 100];
    _topLayer.strokeEnd = _progress;
}


@end
