//
//  YTFoodDetailFlowLayout.m
//  meituan
//
//  Created by 徐友金 on 2017/8/4.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTFoodDetailFlowLayout.h"

@implementation YTFoodDetailFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    //水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //设置cell和collectionView一样大
    self.itemSize = self.collectionView.bounds.size;
    
    //行列间距都为0
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    
}
@end
