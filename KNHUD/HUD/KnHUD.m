//
//  KnHUD.m
//  KNHUD
//
//  Created by 刘凡 on 2017/8/24.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import "KnHUD.h"


@interface KnHUDView : UIView

-(void)showTitle:(NSString *)text;

@end

@implementation KnHUDView
{
    //转菊花
    UIActivityIndicatorView * _indicatorView;
    //下面文字
    UILabel * _title;
    //是否清除
    BOOL _dismissed;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
//        如果你定义的view想用autolayout，就设置为NO;  默认为yes
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

-(void)showTitle:(NSString *)text{
    //初始化一个菊花.样式是灰色
    _indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    //设置使用autolayout.
    _indicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_indicatorView];
    
    //设置中心点.
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_indicatorView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_indicatorView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    //假如text 有值,就创建一个title
    if (text) {
        _title = [UILabel new];
        _title.font = [UIFont systemFontOfSize:10];
        _title.text = text;
        _title.textColor = [UIColor grayColor];
        [_title sizeToFit];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_title];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_title attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_title attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_indicatorView attribute:NSLayoutAttributeBottom multiplier:1 constant:5]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_title attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100]];
    }
    
    [_indicatorView startAnimating];
}

@end

@implementation KnHUD
{
    KnHUDView *_contentView;
    __weak UIView *_superView;
}

-(instancetype)initWithView:(UIView *)superView{
    if (self = [super init]) {
        _superView = superView;
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

-(void)shouTitle:(NSString *)text userInteraction:(BOOL)userInteractionEnabled afterDelay:(CGFloat)afterDelay
{
    //创建这个转菊花的时候设置占领主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        [_superView addSubview:self];
        //设置全部顶着边
        [_superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_superView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
        [_superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_superView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
        [_superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_superView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
        [_superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_superView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
        
        //设置用户交互
        self.userInteractionEnabled = userInteractionEnabled;
        
        _contentView = [KnHUDView new];
        [self addSubview:_contentView];
        
        //设置contentView在这个View的中间
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0]];
     
        [_contentView showTitle:text];
        if (afterDelay > 0) {
            [self performSelector:@selector(dismiss) withObject:nil afterDelay:afterDelay];
        }
        
    });
}

-(void)dismiss{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setHidden:YES];
        [self removeFromSuperview];
    });
}

@end
