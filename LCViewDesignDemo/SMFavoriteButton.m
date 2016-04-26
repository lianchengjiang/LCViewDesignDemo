//
//  SMFavoriteButton.m
//  LCViewDesignDemo
//
//  Created by jiangliancheng on 16/4/26.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import "SMFavoriteButton.h"
#import "DataBase.h"

@interface SMFavoriteButton ()
@property (nonatomic, strong) UIImage *favoriteImage;
@property (nonatomic, strong) UIImage *unfavoriteImage;
@property (nonatomic, strong) DataBase *dataBase;
@end

@implementation SMFavoriteButton

// 初始化SMFavoriteButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    _favoriteImage = [UIImage imageNamed:@"favorite"];
    _unfavoriteImage = [UIImage imageNamed:@"unfavorite"];
    _dataBase = [DataBase shareInstance];
    [self addTarget:self action:@selector(favoriteAction) forControlEvents:UIControlEventTouchUpInside];
    [self updateFavoriteStatus];
    return self;
}

// 按钮点击操作
- (void)favoriteAction
{
    if (([self.dataBase isFavoriteWithId:self.news.newsId])) {
        [self.dataBase deleteNewsWithId:self.news.newsId];
    } else {
        [self.dataBase insertNews:self.news];
    }
    [self updateFavoriteStatus];
}

// 更新收藏按钮状态
- (void)updateFavoriteStatus
{
    if ([self.dataBase isFavoriteWithId:self.news.newsId]) {
        [self setImage:self.favoriteImage forState:UIControlStateNormal];
    } else {
        [self setImage:self.unfavoriteImage forState:UIControlStateNormal];
    }
}

@end
