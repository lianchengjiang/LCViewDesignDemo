//
//  DetailViewController.m
//  LCViewDesignDemo
//
//  Created by jiangliancheng on 16/4/25.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "DetailViewController.h"
#import "DataBase.h"

@interface DetailViewController ()
@property (nonatomic, strong) UIButton *favoriteButton;

@end


@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([[DataBase shareInstance] isFavoriteWithId:self.news.newsId]) {
        [self.favoriteButton setImage:[UIImage imageNamed:@"favorite"] forState:UIControlStateNormal];
    } else {
        [self.favoriteButton setImage:[UIImage imageNamed:@"unfavorite"] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter
- (UIButton *)favoriteButton
{
    if (!_favoriteButton) {
        _favoriteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _favoriteButton;
}

@end
