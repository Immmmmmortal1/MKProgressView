//
//  VoteTableViewCell.m
//  MKProgressView
//
//  Created by shuxia on 2019/1/12.
//  Copyright © 2019 shuxia. All rights reserved.
//

#import "VoteTableViewCell.h"
#import "VotePorgressView.h"
@interface VoteTableViewCell()
@property (nonatomic,strong)VotePorgressView *progressView;

@end
@implementation VoteTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self CreateSubView];
        
    }
    return self;
}

-(void)CreateSubView{
    self.progressView = [VotePorgressView new];
    self.progressView.frame = self.bounds;
    [self.contentView addSubview:self.progressView];
    
    
}
-(void)setVModel:(VoteModel *)vModel{
    _vModel = vModel;
    self.progressView.progressV = vModel.proressM;

    [vModel addObserver:self forKeyPath:@"proressM" options:NSKeyValueObservingOptionNew context:nil];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"proressM"]) {
        if (change[NSKeyValueChangeNewKey]) {

            self.progressView.progressV = _vModel.proressM;
//            if (_model.downLoadP ==1) {
//                [self.downLoadProgress reset];
//            }
        }
    }

}
@end
