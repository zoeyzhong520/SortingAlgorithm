//
//  ViewController.m
//  排序算法
//
//  Created by zhifu360 on 2019/9/24.
//  Copyright © 2019 ZZJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@(-1),@(5),@(0),@(99),@(777),@(84)]];
    
    [self bubbleSortWithArray:array];
    
    [self selectionSortWithArray:array];
    
    [self quickSortWithArray:array left:0 right:5];
    
    [self insertionSortWithArray:array];
}

#pragma mark - 冒泡
- (void)bubbleSortWithArray:(NSMutableArray *)array
{
    for (int i = 0; i < array.count; i ++) {
        for (int j = 0; j < array.count - 1 - i; j ++) {
            if ([array[j] intValue] < [array[j+1] intValue]) {
                int tmp = [array[j] intValue];
                array[j] = array[j+1];
                array[j+1] = @(tmp);
            }
        }
    }
    NSLog(@"冒泡array: %@",array);
}

#pragma mark - 选择
- (void)selectionSortWithArray:(NSMutableArray *)array
{
    for (int i = 0; i < array.count; i ++) {
        for (int j = i+1; j < array.count; j ++) {
            if ([array[i] intValue] < [array[j] intValue]) {
                int tmp = [array[i] intValue];
                array[i] = array[j];
                array[j] = @(tmp);
            }
        }
    }
    NSLog(@"选择array:%@",array);
}

#pragma mark - 快速
- (void)quickSortWithArray:(NSMutableArray *)array left:(NSInteger)left right:(NSInteger)right
{
    if (left < right) {
        NSInteger tmp = [self getMiddleIndexWithArray:array left:left right:right];
        //对基准左右两侧进行排序
        [self quickSortWithArray:array left:left right:tmp-1];
        [self quickSortWithArray:array left:tmp+1 right:right];
    }
    NSLog(@"快速Array:%@",array);
}

- (NSInteger)getMiddleIndexWithArray:(NSMutableArray *)array left:(NSInteger)left right:(NSInteger)right
{
    int tmp = [array[left] intValue];
    while (left < right) {
        while (left < right && tmp <= [array[right] intValue]) {
            right --;
        }
        if (left < right) {
            array[left] = array[right];
        }
        while (left < right && [array[left] intValue] <= tmp) {
            left ++;
        }
        if (left < right) {
            array[right] = array[left];
        }
    }
    array[left] = @(tmp);
    return left;
}

#pragma mark - 插入
- (void)insertionSortWithArray:(NSMutableArray *)array
{
    for (int i = 0; i < array.count; i ++) {
        int tmp = [array[i] intValue];
        for (int j = i-1; j >= 0 && tmp < [array[j] intValue]; j--) {
            array[j+1] = array[j];
            array[j] = @(tmp);
        }
    }
    NSLog(@"插入Array:%@",array);
}

@end
