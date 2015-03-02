//
//  UUMessageContentButton.m
//  BloodSugarForDoc
//
//  Created by shake on 14-8-27.
//  Copyright (c) 2014年 shake. All rights reserved.
//

#import "UUMessageContentButton.h"
@implementation UUMessageContentButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //图片
        self.backImageView = [[UIImageView alloc]init];
        self.backImageView.userInteractionEnabled = YES;
        self.backImageView.layer.cornerRadius = 5;
        self.backImageView.layer.masksToBounds  = YES;
        self.backImageView.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.backImageView];
        
        //语音
        self.voiceBackView = [[UIView alloc]init];
        [self addSubview:self.voiceBackView];
        self.second = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, 30)];
        self.second.textAlignment = NSTextAlignmentCenter;
        self.second.font = [UIFont systemFontOfSize:14];
        self.voice = [[UIImageView alloc]initWithFrame:CGRectMake(80, 5, 20, 20)];
        self.voice.image = [UIImage imageNamed:@"chat_animation_white3"];
        self.voice.animationImages = [NSArray arrayWithObjects:
                                      [UIImage imageNamed:@"chat_animation_white1"],
                                      [UIImage imageNamed:@"chat_animation_white2"],
                                      [UIImage imageNamed:@"chat_animation_white3"],nil];
        self.voice.animationDuration = 1;
        self.voice.animationRepeatCount = 0;
        self.indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        self.indicator.center=CGPointMake(80, 15);
        [self.voiceBackView addSubview:self.indicator];
        [self.voiceBackView addSubview:self.voice];
        [self.voiceBackView addSubview:self.second];
        
        self.backImageView.userInteractionEnabled = NO;
        self.voiceBackView.userInteractionEnabled = NO;
        self.second.userInteractionEnabled = NO;
        self.voice.userInteractionEnabled = NO;
        
        self.second.backgroundColor = [UIColor clearColor];
        self.voice.backgroundColor = [UIColor clearColor];
        self.voiceBackView.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}
- (void)benginLoadVoice
{
    self.voice.hidden = YES;
    [self.indicator startAnimating];
}
- (void)didLoadVoice
{
    self.voice.hidden = NO;
    [self.indicator stopAnimating];
    [self.voice startAnimating];
}
-(void)stopPlay
{
//    if(self.voice.isAnimating){
        [self.voice stopAnimating];
//    }
}


/*
 
 软件环境：Mac OS X 10.9.4
 硬件环境：MacBook Pro
 开发工具：Xcode5.0
 责任描述：该项目为本人独立开发项目
 1.团队开会讨论项目各项需求
 2.实现项目UI界面
 3.规范应用的API接口文档
 4.与服务端实现接口的对接测试
 项目描述：本项目与“我行招车”项目是一个系列的项目，这个项目主要是为广大司机朋友提供一个更好的接单服务平台，并且该软件为司机朋友提供了营运的数据，以及相关的分析，能够使司机朋友很直观的看到自己的营运情况。
 
 */

- (void)setIsMyMessage:(BOOL)isMyMessage
{
    _isMyMessage = isMyMessage;
    if (isMyMessage) {
        self.backImageView.frame = CGRectMake(5, 5, 220, 220);
        self.voiceBackView.frame = CGRectMake(15, 10, 130, 35);
        self.second.textColor = [UIColor whiteColor];
    }else{
        self.backImageView.frame = CGRectMake(15, 5, 220, 220);
        self.voiceBackView.frame = CGRectMake(25, 10, 130, 35);
        self.second.textColor = [UIColor grayColor];
    }
}
//添加
- (BOOL)canBecomeFirstResponder
{
    return YES;
}
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    return (action == @selector(copy:));
}

-(void)copy:(id)sender{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.titleLabel.text;
}


@end
