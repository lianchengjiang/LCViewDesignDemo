//
//  DataBase.h
//  LCViewDesignDemo
//
//  Created by jiangliancheng on 16/4/25.
//  Copyright © 2016年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News.h"

@interface DataBase : NSObject
+ (instancetype)shareInstance;

- (BOOL)isFavoriteWithId:(NSString *)newsId;
- (BOOL)insertNews:(News *)news;
- (BOOL)deleteNewsWithId:(NSString *)newsId;

@end
