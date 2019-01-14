//
//  CircleProgressVC.m
//  MKProgressView
//
//  Created by shuxia on 2019/1/14.
//  Copyright © 2019 shuxia. All rights reserved.
//

#import "CircleProgressVC.h"
#import "CircleProgressView.h"

@interface CircleProgressVC (){
    CircleProgressView *_circleProgress;
}

@end

@implementation CircleProgressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _circleProgress = [[CircleProgressView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width/2, self.view.bounds.size.height/2) progress:0];
    
    _circleProgress.center = self.view.center;
    [self.view addSubview:_circleProgress];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _circleProgress.progress += 0.1;
    if (_circleProgress.progress > 1.0) {
        _circleProgress.progress = 0;
    }
}



@end
