//
//  ViewController.m
//  KVO
//
//  Created by 上海烨历网络科技有限公司 on 2017/6/19.
//  Copyright © 2017年 上海烨历网络科技有限公司. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property(nonatomic,strong)NSString *price;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.price = @"10";
    //添加监听对象
    [self addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    NSLog(@"---------%@",_price);
    
    
    [self performSelector:@selector(changeGrade) withObject:nil afterDelay:5.0];
    
}
- (void)changeGrade {
    self.price = @"10000";
}
//执行监听代理
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    if (object == self && [keyPath isEqualToString:@"price"]) {
        NSLog(@"---------%@",_price);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
//移除监听
- (void)dealloc {
    [self removeObserver:self forKeyPath:@"price" context:nil];
}



@end
