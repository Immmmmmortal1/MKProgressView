//
//  SectorProgressView.m
//  MKProgressView
//
//  Created by shuxia on 2019/1/14.
//  Copyright © 2019 shuxia. All rights reserved.
//

#import "SectorProgressView.h"
@interface SectorProgressView()
{
    /*圆点*/
    CGPoint _origin;
    /*半径*/
    CGFloat _radius;
    /*起始*/
    CGFloat _starAngle;
    /*结束*/
    CGFloat _endAngle;
    
}

/*进度显示*/
@property (nonatomic,strong)UILabel *progressLabel;
/*填充layer*/
@property (nonatomic,strong)CAShapeLayer *fillLayer;



@end

@implementation SectorProgressView
@synthesize progress = _progress;
- (instancetype)initWithFrame:(CGRect)frame progress:(CGFloat)progress{
    if (self) {
        self = [super initWithFrame:frame];
        self.backgroundColor = [UIColor clearColor];
        self.progress = progress;
        [self CreateSubView];
    }
    return self;
}
#pragma mark   --------------------------初始化页面
-(void)CreateSubView{
    /*这个 是占位*/
    [self.layer addSublayer:self.fillLayer];
    [self addSubview:self.progressLabel];
    _origin = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    _radius = self.bounds.size.width/2;
//    /*使用贝塞尔曲线 画圆 */
//    UIBezierPath *borderPath = [UIBezierPath bezierPathWithArcCenter:_origin radius:_radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
//    /*创建layer*/
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    maskLayer.path = borderPath.CGPath;
//    self.layer.mask = maskLayer;
    
    
    
}
#pragma mark   --------------------------懒加载
-(UILabel *)progressLabel{
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 15)];
        _progressLabel.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.textColor = [UIColor blackColor];
    }
    return _progressLabel;
}
#pragma mark - 懒加载
- (CAShapeLayer *)fillLayer {
    if (!_fillLayer) {
        _fillLayer = [CAShapeLayer layer];
        _fillLayer.fillColor = [UIColor redColor].CGColor;
    }
    return _fillLayer;
}
#pragma mark   --------------------------getter方法
//-(CGFloat)progress{
//    return _progress;
//}
#pragma mark   --------------------------setter方法
-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    _progressLabel.text = [NSString stringWithFormat:@"%.0f%%",progress * 100];
    _starAngle = - M_PI_2;
    _endAngle = _starAngle + _progress * M_PI * 2;
    
    UIBezierPath *fillPath = [UIBezierPath bezierPathWithArcCenter:_origin radius:_radius startAngle:_starAngle endAngle:_endAngle clockwise:YES];
    [fillPath addLineToPoint:_origin];
    _fillLayer.path = fillPath.CGPath;
    _fillLayer.fillColor = [UIColor redColor].CGColor;

}

@end
