//
//  YTShopView.m
//  meituan
//
//  Created by 徐友金 on 2017/8/1.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "YTShopView.h"
#import "Additons.h"

#import "YTShopPoi_infoModel.h"
#import "YTInfoLoopView.h"

#import "YTShopDetailController.h"




@interface YTShopView ()

//设置轮播视图属性
@property (nonatomic,weak)YTInfoLoopView *loopView;
//设置背景图片属性
@property (nonatomic,weak)UIImageView *bgImageView;
//设置头像属性
@property (nonatomic,weak)UIImageView *avatarImageView;
//设置店名标签
@property (nonatomic,weak)UILabel *nameLable;
//设置商家公告
@property (nonatomic,weak)UILabel *bulletinLabel;


@end


@implementation YTShopView

//从sb或者xib中进入此方法
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUI];
    
}
//初始化的时候设置9个按钮
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    //设置头部视图,从低往上设置.
    
    ///添加背景图片
    UIImageView *imageView = [[UIImageView alloc] init];
    
    [self addSubview:imageView];
    
    //设置填充模式
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    //设置约束
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
#warning mark - 轮播视图 (注意...)
    ///设置轮播视图
    YTInfoLoopView *loopView = [[YTInfoLoopView alloc] init];
    
    //loopView.backgroundColor = [UIColor lightGrayColor];
    
    //裁剪视图
    loopView.clipsToBounds = YES;
    
    
    [self addSubview:loopView];
    
    //设置约束
    [loopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        
        make.bottom.offset(-8);
        make.height.offset(20);
        
    }];
    
//   loopView.infoModel = _shopPoi_infoModel.discounts[1];
    
    
    
    ///设置虚线
    UIView *dashLineView = [[UIView alloc] init];
    //dashLineView.backgroundColor = [UIColor whiteColor];
    dashLineView.backgroundColor = [UIColor colorWithPatternImage:[UIImage dashLineViewWithColor:[UIColor whiteColor]]];
    
    [self addSubview:dashLineView];
    
    //设置约束
    [dashLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(loopView).offset(0);
        make.right.offset(0);
        make.bottom.equalTo(loopView.mas_top).offset(-8);
        make.height.offset(1);
    }];
    
    
    ///设置头像
    UIImageView *avatarView = [[UIImageView alloc] init];
    
    avatarView.contentMode = UIViewContentModeScaleAspectFill;
    
    avatarView.layer.cornerRadius = 32;
    
    avatarView.clipsToBounds = YES;
    
    //设置边框颜色和宽度
    avatarView.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.7].CGColor;
    
    avatarView.layer.borderWidth = 2;
    
    avatarView.backgroundColor = [UIColor blueColor];
    
    [self addSubview:avatarView];
    
    //设置约束
    [avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(dashLineView).offset(0);
        make.bottom.equalTo(dashLineView.mas_top).offset(-8);
        make.width.height.offset(64);
    }];
    
    
    ///设置店名
    UILabel *nameLable = [UILabel makeLabelWithText:@"粮新发现(修正大厦店)" andTextFont:16 andTextColor:[UIColor whiteColor]];
    
    [self addSubview:nameLable];
    
    //设置约束
    [nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(avatarView.mas_right).offset(16);
        make.centerY.equalTo(avatarView).offset(-16);
    }];
    
    ///设置商家公告
    UILabel *bulletinLabel = [UILabel makeLabelWithText:@"来就送,来就送来就送,来就送来就送,来就送来就送,来就送来就送,来就送来就送,来就送" andTextFont:14 andTextColor:[UIColor colorWithWhite:1 alpha:0.9]];
    
    [self addSubview:bulletinLabel];
    
    //设置约束
    [bulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLable).offset(0);
        make.centerY.equalTo(avatarView).offset(16);
        
        make.right.offset(-16);
        
    }];
    
    
    
    
    //属性赋值
    _bgImageView = imageView;
    _avatarImageView = avatarView;
    _nameLable = nameLable;
    _bulletinLabel = bulletinLabel;
    
    //一句话没有赋值,整了很久,多注意思路哦.
    _loopView = loopView;
    
    
    
    //给loopView添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loopViewClick)];
    
    
    [loopView addGestureRecognizer:tap];
    
    
    
    //测试使用,直接跳转商家详情
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        [self loopViewClick];
//    });
    
    
    
}

///点击loopView 显示商家详情界面
- (void)loopViewClick
{
    //创建商家详情 并进行modal
    YTShopDetailController *shopDetailController = [[YTShopDetailController alloc] init];
    
    
    //传值给商家详情
    shopDetailController.shopPoi_infoModel = _shopPoi_infoModel;
    
    [self.viewController presentViewController:shopDetailController animated:YES completion:nil];
    
    
    
}


//调用set模型方法,给背景图片赋值  ----- 赋值给对应控制 传递数据
- (void)setShopPoi_infoModel:(YTShopPoi_infoModel *)shopPoi_infoModel
{
    _shopPoi_infoModel = shopPoi_infoModel;
    
    //测试数据
    //"http://p0.meituan.net/xianfu/75706b131fec44e8c2a8390f43e5a51c83968.jpg.webp(错误的)
    //http://p1.meituan.net/aichequan/e597d736e85846ee41d55440a5a86ad9193992.png.webp
    //_bgImageView = shopPoi_infoModel.pic_url;
    
    
    ///设置背景图片
    NSString *bgImageURLStr = [shopPoi_infoModel.poi_back_pic_url stringByDeletingPathExtension];
    //加载网络图片
    [_bgImageView sd_setImageWithURL:[NSURL URLWithString:bgImageURLStr]];
    
    ///设置商家图片
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:[shopPoi_infoModel.pic_url stringByDeletingPathExtension]]];
    
    //设置店名
    _nameLable.text = shopPoi_infoModel.name;
    
    //设置商家公告
    _bulletinLabel.text = shopPoi_infoModel.bulletin;
    
    
////    //商家轮播的信息
  _loopView.discounts = shopPoi_infoModel.discounts;

    
    
}
@end
