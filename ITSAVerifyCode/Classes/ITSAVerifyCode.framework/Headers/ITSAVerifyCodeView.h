//
//  ITSAVerifyCodeView.h
//  ITSA
//
//  Created by yww on 2020/11/20.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, ITSAVerifyCodeType) {
    ITSAVerifyCodeNumber        = 1 << 0,       //数字
    ITSAVerifyCodeUppercase     = 1 << 1,       //大写字母
    ITSAVerifyCodeLowercase     = 1 << 2        //小写字母
};

NS_ASSUME_NONNULL_BEGIN

@interface ITSAVerifyCodeView : UIView

// 当前验证码的值
@property (nonatomic, copy, readonly) NSString *currentCode;

// 验证码的类型，可选择由数字、大写字母、小写字母任意组合, 默认为纯数字
@property (nonatomic, assign) ITSAVerifyCodeType codeType;

// 验证码的长度, 建议不超过6位
@property (nonatomic, assign) NSInteger codeLength;

// 验证码是否随机倾斜。默认为YES，随机倾斜
@property (nonatomic, assign) BOOL enableObliqueness;

// 是否在校验时忽略大小写, 默认NO
@property (nonatomic, assign) BOOL ignoreCase;

// 干扰线的数量，默认15
@property (nonatomic, assign) NSInteger lineCount;

// 线条的透明度 0~1；1：不透明，默认为0.5
@property (nonatomic, assign) CGFloat lineAlpha;

// 噪点数量，默认100
@property (nonatomic, assign) NSInteger noisyPointCount;

// 验证码改变的回调
@property (nonatomic, copy) void(^codeChangeHandler)(NSString *code);

// 刷新验证码
- (void)refreshCode;

// 传入字符串和当前图片验证码进行比较
- (BOOL)VerifyCode:(NSString *)code;

@end

NS_ASSUME_NONNULL_END
