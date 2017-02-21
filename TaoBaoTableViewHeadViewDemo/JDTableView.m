//
//  JDTableView.m
//  TaoBaoTableViewHeadViewDemo
//
//  Created by jiangdongxu on 2017/2/20.
//  Copyright © 2017年 JiangDongXu. All rights reserved.
//

#import "JDTableView.h"

@interface JDTableView ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIImageView *imageView;
@end
@implementation JDTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.contentInset = UIEdgeInsetsMake(_height, 0, 0, 0);
        
        self.imageView = [UIImageView new];
        
        self.imageView.frame = CGRectMake(0, - _height, self.frame.size.width, _height);
        
        [self addSubview:self.imageView];
        //将 image 放在 tableview 的最后面
        [self sendSubviewToBack:self.imageView];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect targetFrame = self.imageView.frame;
    
    CGFloat y = self.contentOffset.y;
    
    CGFloat offset =  - self.contentOffset.y - self.contentInset.top;
    
    if (offset < 0) {  // 说明image正在被遮盖
        offset = (-3.0f * offset) / 4;
        
        targetFrame.origin.y = - self.contentInset.top + offset;
        
        self.imageView.frame = targetFrame;
        
    }else{
        if (y + self.contentInset.top <= 0) { // 说明image完全显示
            
            self.imageView.frame = CGRectMake(y + _height, y , self.frame.size.width - (y + _height) * 2, -y);
        }
    }
}
-(void)setHeadImage:(UIImage *)headImage{
    if (_headImage != headImage) {
        _headImage = headImage;
    }
    _imageView.image = _headImage;
}

-(void)setHeight:(CGFloat)height{
    if (_height != height) {
        _height = height;
    }
    self.contentInset = UIEdgeInsetsMake(_height, 0, 0, 0);
    
    self.imageView.frame = CGRectMake(0, - _height, self.frame.size.width, _height);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
