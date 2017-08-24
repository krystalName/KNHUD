//
//  KnHUD.h
//  KNHUD
//
//  Created by 刘凡 on 2017/8/24.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KnHUD : UIView




/**
 初始化

 @param superView superView
 @return 自己
 */
-(instancetype)initWithView:(UIView *)superView;


/**
 显示转圈

 @param text 显示内容
 @param userInteractionEnabled 是否开启用户交互
 @param afterDelay 延迟时间
 */
-(void)shouTitle:(NSString *)text userInteraction:(BOOL)userInteractionEnabled afterDelay:(CGFloat)afterDelay;

/**
 隐藏HUD
 */
-(void)dismiss;

@end
