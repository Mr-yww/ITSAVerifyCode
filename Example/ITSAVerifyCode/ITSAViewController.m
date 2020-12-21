//
//  ITSAViewController.m
//  ITSAVerifyCode
//
//  Created by Mr-yww on 12/21/2020.
//  Copyright (c) 2020 Mr-yww. All rights reserved.
//

#import "ITSAViewController.h"
#import <ITSAVerifyCode/ITSAVerifyCodeView.h>

@interface ITSAViewController ()
@property (nonatomic, strong) ITSAVerifyCodeView *verifyCodeView;
@property (nonatomic ,strong) UILabel *lb_code;
@end

@implementation ITSAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _verifyCodeView = [[ITSAVerifyCodeView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    _verifyCodeView.center = self.view.center;
    [self.view addSubview:_verifyCodeView];
    __weak typeof(self)weakSelf = self;
    _verifyCodeView.codeType = ITSAVerifyCodeNumber|ITSAVerifyCodeUppercase|ITSAVerifyCodeLowercase;
    _verifyCodeView.codeChangeHandler = ^(NSString * _Nonnull code) {
        NSLog(@"verifyCode: %@, currentCode:%@", code, weakSelf.verifyCodeView.currentCode);
        weakSelf.lb_code.text = [NSString stringWithFormat:@" 码：%@", code];
    };
    
    _lb_code = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    _lb_code.center = CGPointMake(_verifyCodeView.center.x, _verifyCodeView.center.y + 50);
    _lb_code.backgroundColor = [UIColor grayColor];
    _lb_code.textColor = [UIColor whiteColor];
    _lb_code.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:_lb_code];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
