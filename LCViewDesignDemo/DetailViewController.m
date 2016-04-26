//
//  DetailViewController.m
//  LCViewDesignDemo
//
//  Created by jiangliancheng on 16/4/25.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "DetailViewController.h"
#import "DataBase.h"
#import "SMFavoriteButton.h"


@interface DetailViewController ()
@property (nonatomic, strong) UIButton *favoriteButton;

@end


@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#ifndef SelfManager
    self.favoriteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.favoriteButton];
    [self.favoriteButton addTarget:self action:@selector(favoriteButtonAction) forControlEvents:UIControlEventTouchUpInside];

    if ([[DataBase shareInstance] isFavoriteWithId:self.news.newsId]) {
        [self.favoriteButton setImage:[UIImage imageNamed:@"favorite"] forState:UIControlStateNormal];
    } else {
        [self.favoriteButton setImage:[UIImage imageNamed:@"unfavorite"] forState:UIControlStateNormal];
    }
    
#else 
    SMFavoriteButton *button = [SMFavoriteButton new];
    button.news = self.news;
    [self.view addSubview:button];
    
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)favoriteButtonAction
{
    if (([[DataBase shareInstance] isFavoriteWithId:self.news.newsId])) {
        [[DataBase shareInstance] deleteNewsWithId:self.news.newsId];
        [self.favoriteButton setImage:[UIImage imageNamed:@"unfavorite"] forState:UIControlStateNormal];
    } else {
        [[DataBase shareInstance] insertNews:self.news];
        [self.favoriteButton setImage:[UIImage imageNamed:@"favorite"] forState:UIControlStateNormal];
    }
}

@end
