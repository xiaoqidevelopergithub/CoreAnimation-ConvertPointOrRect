//
//  ViewController.m
//  CoreAnimation-ConvertPointAndRect
//
//  Created by 张晓琪 on 2018/9/11.
//  Copyright © 2018年 张晓琪. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView1;
@property (weak, nonatomic) IBOutlet UIView *layerView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"vc";
    
    CGPoint point = CGPointMake(0, 0);
    CGRect rect = CGRectMake(0, 0, 50, 50);
    CGPoint convertPoint;
    CGRect convertRect;
    
    // layerView1 的 point 在 layerView2 的内部坐标系统内的位置。若 toLayer 为 nil，则使用window.layer。
    convertPoint = [self.layerView1.layer convertPoint:point toLayer:self.layerView2.layer];
    
    // layerView2 的 point 在 layerView1 的内部坐标系统内的位置。
//    convertPoint = [self.layerView1.layer convertPoint:point fromLayer:self.layerView2.layer];
    
    convertRect = [self.layerView1.layer convertRect:rect toLayer:self.layerView2.layer];
    
    NSLog(@">>>%@", NSStringFromCGPoint(convertPoint));
    
    NSLog(@">>>%@", NSStringFromCGRect(convertRect));
}

- (IBAction)presentModal:(id)sender {
    CGRect originRect;
    
    originRect = [self.layerView1.layer convertRect:self.layerView1.layer.frame toLayer:nil];
    
    ModalViewController *modalVC = [[ModalViewController alloc] init];
    modalVC.originRect = originRect;
    [self presentViewController:modalVC animated:NO completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
