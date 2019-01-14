//
//  SectorProgressView.h
//  MKProgressView
//
//  Created by shuxia on 2019/1/14.
//  Copyright © 2019 shuxia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SectorProgressView : UIView
@property (nonatomic,assign)  CGFloat   progress;
@property (nonatomic,strong)  UIColor   *fillColor;

/*初始化*/
- (instancetype)initWithFrame:(CGRect)frame progress:(CGFloat)progress;

@end

NS_ASSUME_NONNULL_END
