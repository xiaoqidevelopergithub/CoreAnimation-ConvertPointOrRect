//
//  ModalViewController.m
//  CoreAnimation-ConvertPointAndRect
//
//  Created by 张晓琪 on 2018/9/11.
//  Copyright © 2018年 张晓琪. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@property (nonatomic, strong) UIView *animateLayerView;
@property (nonatomic, strong) UIButton *backButton;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"modalVC";
    self.view.backgroundColor = [UIColor grayColor];
    
    self.backButton = [UIButton new];
    [self.view addSubview:_backButton];
    _backButton.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 50, 50, 50);
    _backButton.backgroundColor = [UIColor redColor];
    [_backButton addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    
    self.animateLayerView = [UIView new];
    [self.view addSubview:_animateLayerView];
    self.animateLayerView.frame = self.originRect;
    self.animateLayerView.backgroundColor = [UIColor redColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView animateWithDuration:.5 animations:^{
        self.animateLayerView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 2.0 - 100, [UIScreen mainScreen].bounds.size.width, 200);
    }];
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
