//
//  UIView+KnHUD.h
//  KNHUD
//
//  Created by 刘凡 on 2017/8/24.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KnHUD)


/**
 显示菊花

 @param text title内容
 @param userInteraction 是否允许交互
 @param afterDelay 延迟时间
 */
-(void)KNHUDShow:(NSString *)text userInteraction:(BOOL)userInteraction afterDelay:(CGFloat)afterDelay;


/**
 显示菊花

 @param text 标签内容
 @param userInteraction 是否允许交互
 */
-(void)KNHUDShow:(NSString *)text userInteraction:(BOOL)userInteraction;


/**
 显示菊花

 @param text 标签内容
 @param afterDelay 延迟时间
 */
-(void)KNHUDShow:(NSString *)text afterDelay:(CGFloat)afterDelay;


/**
显示菊花

 @param text 标签内容
 */
-(void)KNHUDShow:(NSString *)text;


/**
 默认只显示菊花
 */
-(void)KNHUDShow;


/**
 隐藏菊花
 */
-(void)KNHUDDismiss;


@end
