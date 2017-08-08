//
//  TrainingMeetingViewController.m
//  supersound
//
//  Created by Mickey on 2017/8/3.
//  Copyright © 2017年 Mickey. All rights reserved.
//

#import "TrainingMeetingViewController.h"
#import "TrainingMeetingTableViewCell.h"
#import "WorkShopViewController.h"
#import "SDCycleScrollView.h"

@interface TrainingMeetingViewController ()<SDCycleScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    SDCycleScrollView *cycleScrollView;
    UIView *tableheadView;
}
@property(nonatomic,strong)NSMutableArray *ModelimgArr;
@end

@implementation TrainingMeetingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addLeftBarButnWithImage:[UIImage imageNamed:@"sys.png"]];
    [self addRightBarButnWithImage:[UIImage imageNamed:@"search"]];
    [self createtableview];
    [self addheightview];
    // Do any additional setup after loading the view from its nib.
}
- (void)createtableview
{
    _tableView = [[UITableView alloc]initWithFrame: CGRectMake(0 , 0, ScreenWidth, ScreenHeight - 44-64)];
    
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

- (void)addheightview
{
    tableheadView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 125+40+85+5)];
    tableheadView.backgroundColor=[UIColor whiteColor];
    self.tableView.tableHeaderView=tableheadView;
    UIView *searchview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    searchview.backgroundColor=[UIColor whiteColor];
    [tableheadView addSubview:searchview];
    
    if (cycleScrollView) {
        [cycleScrollView removeFromSuperview];
    }
    
    _ModelimgArr=[[NSMutableArray alloc]init];
    [_ModelimgArr addObject:@"http://bpic.588ku.com/back_pic/00/08/53/17562a43dac4e41.jpg"];
    [_ModelimgArr addObject:@"http://bpic.588ku.com/back_pic/00/05/05/995625dd8ca6ffd.jpg"];
    
    cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 40, ScreenWidth, 125) shouldInfiniteLoop:YES imageNamesGroup:_ModelimgArr];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [tableheadView addSubview:cycleScrollView];
    
    UIView *leftview=[[UIView alloc]initWithFrame:CGRectMake(0, 40+125, ScreenWidth/2, 89)];
    [tableheadView addSubview:leftview];
    
    UIImageView *leftimg=[[UIImageView alloc]initWithFrame:CGRectMake(16, 21, 46, 46)];
    leftimg.image=[UIImage imageNamed:@"meeting"];
    [leftview addSubview:leftimg];
    
    UILabel *titlelab=[[UILabel alloc]initWithFrame:CGRectMake(66, 26, 80, 18)];
    titlelab.text=@"学术会议";
    titlelab.font=[UIFont systemFontOfSize:15.f];
    titlelab.textColor=UIColorFromRGB(0x333333);
    [leftview addSubview:titlelab];
    
    UILabel *detaillab=[[UILabel alloc]initWithFrame:CGRectMake(64, 48, 120, 14)];
    detaillab.text=@"参会学习，提升实力";
    detaillab.font=[UIFont systemFontOfSize:12.f];
    detaillab.textColor=UIColorFromRGB(0x666666);
    [leftview addSubview:detaillab];
    
    UIButton *leftbtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 40+125, ScreenWidth/2, 89)];
    [leftbtn addTarget:self action:@selector(tomeeting) forControlEvents:UIControlEventTouchUpInside];
    [tableheadView addSubview:leftbtn];
    
    
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(ScreenWidth/2, 40+125+25, 1, 39)];
    line.backgroundColor=UIColorFromRGB(0xcccccc);
    [tableheadView addSubview:line];
    
    UIView *rightview=[[UIView alloc]initWithFrame:CGRectMake(ScreenWidth/2, 40+125, ScreenWidth/2, 89)];
    [tableheadView addSubview:rightview];
    
    UIImageView *rightimg=[[UIImageView alloc]initWithFrame:CGRectMake(12, 21, 46, 46)];
    rightimg.image=[UIImage imageNamed:@"ask"];
    [rightview addSubview:rightimg];
    
    UILabel *titlelab1=[[UILabel alloc]initWithFrame:CGRectMake(56, 26, 80, 18)];
    titlelab1.text=@"调查问卷";
    titlelab1.font=[UIFont systemFontOfSize:15.f];
    titlelab1.textColor=UIColorFromRGB(0x333333);
    [rightview addSubview:titlelab1];
    
    UILabel *detaillab1=[[UILabel alloc]initWithFrame:CGRectMake(54, 48, 130, 14)];
    detaillab1.text=@"学术调查，为科研献力";
    detaillab1.font=[UIFont systemFontOfSize:12.f];
    detaillab1.textColor=UIColorFromRGB(0x666666);
    [rightview addSubview:detaillab1];
    
    UIView *line1=[[UIView alloc]initWithFrame:CGRectMake(0, 125+40+85, ScreenWidth, 5)];
    line1.backgroundColor=UIColorFromRGB(BackColorValue);
    [tableheadView addSubview:line1];
    
    UIButton *rightbtn=[[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/2, 40+125, ScreenWidth/2, 89)];
    [rightbtn addTarget:self action:@selector(toask) forControlEvents:UIControlEventTouchUpInside];
    [tableheadView addSubview:rightbtn];
    
}
- (void)toask
{
//    WorkShopViewController *ask=[[WorkShopViewController alloc]init];
//    [self.navigationController pushViewController:ask animated:YES];
}
- (void)tomeeting
{
    WorkShopViewController *ask=[[WorkShopViewController alloc]init];
    [self.navigationController pushViewController:ask animated:YES];
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

// Responds to click event of right button.
- (void)reactToRightButtonClickEvent
{
    
}
- (void)reactToLeftButtonClickEvent
{
    
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
    return 5;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 106;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *InformationTableView = @"TrainingMeetingTableViewCell";
    
    TrainingMeetingTableViewCell *rCell = [tableView dequeueReusableCellWithIdentifier:InformationTableView];
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

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    
}
@end
