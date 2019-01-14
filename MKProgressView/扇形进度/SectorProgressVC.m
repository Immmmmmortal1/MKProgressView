//
//  SectorProgressVC.m
//  MKProgressView
//
//  Created by shuxia on 2019/1/14.
//  Copyright © 2019 shuxia. All rights reserved.
//

#import "SectorProgressVC.h"
#import "SectorProgressView.h"

@interface SectorProgressVC (){
    SectorProgressView *_sectorView;
    
}

@end

@implementation SectorProgressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    _sectorView = [[SectorProgressView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width/2, self.view.bounds.size.height/2) progress:0.1];
//    _sectorView.progress = 0.0;

    _sectorView.center = self.view.center;
    [self.view addSubview:_sectorView];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _sectorView.progress += 0.1;
    if (_sectorView.progress > 1.0) {
        _sectorView.progress = 0;
    }
}


@end
