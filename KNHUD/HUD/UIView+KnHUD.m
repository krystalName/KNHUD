//
//  UIView+KnHUD.m
//  KNHUD
//
//  Created by 刘凡 on 2017/8/24.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import "UIView+KnHUD.h"
#import "KnHUD.h"


@implementation UIView (KnHUD)

-(void)KNHUDShow:(NSString *)text userInteraction:(BOOL)userInteraction afterDelay:(CGFloat)afterDelay
{
    [[self KnHUDView] shouTitle:text userInteraction:userInteraction afterDelay:afterDelay];
}


-(void)KNHUDShow:(NSString *)text userInteraction:(BOOL)userInteraction{
    [[self KnHUDView] shouTitle:text userInteraction:userInteraction afterDelay:0];
}

-(void)KNHUDShow:(NSString *)text afterDelay:(CGFloat)afterDelay{
    [[self KnHUDView] shouTitle:text userInteraction:NO afterDelay:afterDelay];
}

-(void)KNHUDShow:(NSString *)text{
    [[self KnHUDView] shouTitle:text userInteraction:NO afterDelay:0];
}

-(void)KNHUDShow{
    [[self KnHUDView] shouTitle:nil userInteraction:NO afterDelay:0];
}

-(void)KNHUDDismiss{
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[KnHUD class]]) {
            [(KnHUD *)subView dismiss];
        }
    }
}


/**
 创建HUD

 @return 返回HUD
 */
-(KnHUD *)KnHUDView{
    KnHUD *hud = nil;
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[KnHUD class]]) {
            hud = (KnHUD *)subView;
            break;
        }
    }
    
    if (!hud) {
        hud = [[KnHUD alloc]initWithView:self];
    }
    
    return hud;
}

@end
