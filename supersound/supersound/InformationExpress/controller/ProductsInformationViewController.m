//
//  ProductsInformationViewController.m
//  supersound
//
//  Created by Mickey on 2017/8/6.
//  Copyright © 2017年 Mickey. All rights reserved.
//

#import "ProductsInformationViewController.h"
#import "InformationTableViewCell.h"

@interface ProductsInformationViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ProductsInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title=@"产品资讯";
    [self setBarBackBtnWithoutTitle];
    [self addLeftBarButnWithImage:[UIImage imageNamed:@"back"]];
    [self createtableview];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)reactToLeftButtonClickEvent
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createtableview
{
    _tableView = [[UITableView alloc]initWithFrame: CGRectMake(0 , 0, ScreenWidth, ScreenHeight-64)];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] init];   //隐藏tableview多余分割线
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    _tableView.indicatorStyle=UIScrollViewIndicatorStyleWhite;     //设置滚动条为白色
    _tableView.scrollsToTop=YES;
    _tableView.backgroundColor=UIColorFromRGB(BackColorValue);
    
    [self.view addSubview:_tableView];
    
    //下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(loadData) dateKey:@"SailorTable"];
    [self.tableView headerBeginRefreshing];
    self.tableView.headerPullToRefreshText = headerPullToRefreshText;
    self.tableView.headerReleaseToRefreshText = headerReleaseToRefreshText;
    self.tableView.headerRefreshingText = headerRefreshingText;
    
    //上拉加载
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreData)];
    self.tableView.footerPullToRefreshText = footerPullToRefreshText;
    self.tableView.footerReleaseToRefreshText = footerReleaseToRefreshText;
    self.tableView.footerRefreshingText = footerRefreshingText;
}
#pragma mark - 请求数据方法
/**
 *  发送请求并获取数据方法
 */
- (void)loadData{
    //    _page=1;
    //    _start=@"";
    //    [self getNetwork];
    __weak typeof(self) weakSelf = self;
    [weakSelf.tableView headerEndRefreshing];
}
/**
 *  加载更多数据
 */
- (void)loadMoreData{
    //  _page=_page+1;
    //    [self getMoreDate];
    __weak typeof(self) weakSelf = self;
    //
    [weakSelf.tableView footerEndRefreshing];
    //    _page=_page+1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 107;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *InformationTableView = @"InformationTableViewCell";
    
    InformationTableViewCell *rCell = [tableView dequeueReusableCellWithIdentifier:InformationTableView];
    if(rCell == nil)
    {
        rCell= [[[NSBundle mainBundle] loadNibNamed:InformationTableView owner:nil options:nil] lastObject];
    }
    
    
    //    cell.textLabel.text=[NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    return rCell;
}

#pragma mark - cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //消除cell选择痕迹
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
}

@end
