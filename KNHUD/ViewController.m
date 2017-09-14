//
//  ViewController.m
//  KNHUD
//
//  Created by 刘凡 on 2017/8/24.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import "ViewController.h"
#import "UIView+KnHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view KNHUDShow:@"正在加载" userInteraction:YES afterDelay:15];
   
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view KNHUDDismiss];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
