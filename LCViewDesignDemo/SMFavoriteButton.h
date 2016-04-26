//
//  SMFavoriteButton.h
//  LCViewDesignDemo
//
//  Created by jiangliancheng on 16/4/26.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

#define SelfManager

@interface SMFavoriteButton : UIButton
@property (nonatomic, strong) NewsModel *news;
@end
