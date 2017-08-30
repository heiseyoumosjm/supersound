//
//  StudyGardenViewController.m
//  supersound
//
//  Created by Mickey on 2017/8/3.
//  Copyright © 2017年 Mickey. All rights reserved.
//

#import "StudyGardenViewController.h"
#import "SDCycleScrollView.h"
#import "InformationTableViewCell.h"
#import "NetworkCloudViewController.h"

@interface StudyGardenViewController ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>
{
    SDCycleScrollView *cycleScrollView;
    UIView *tableheadView;
}
@property(nonatomic,strong)NSMutableArray *ModelimgArr;
@property(nonatomic,strong)NSMutableArray *imgArr;
@property(nonatomic,strong)NSMutableArray *imgnameArr;

@end

@implementation StudyGardenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRightBarButnWithImage:[UIImage imageNamed:@"search"]];
    [self setBarBackBtnWithoutTitle];
//    [self initNavView];
    [self createtableview];
    [self createscrollview];

    // Do any additional setup after loading the view from its nib.
}
- (void)reactToRightButtonClickEvent
{
    
}
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden=NO;
}
- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden=NO;
}
- (void)createtableview
{
    _tableView = [[UITableView alloc]initWithFrame: CGRectMake(0 , 0, ScreenWidth, ScreenHeight - 48-64)];
    
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

- (void)createscrollview
{
    tableheadView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 125+89+5)];
    tableheadView.backgroundColor=[UIColor whiteColor];
    
    if (cycleScrollView) {
        [cycleScrollView removeFromSuperview];
    }
    
    _ModelimgArr=[[NSMutableArray alloc]init];
    [_ModelimgArr addObject:@"http://bpic.588ku.com/back_pic/00/08/53/17562a43dac4e41.jpg"];
    [_ModelimgArr addObject:@"http://bpic.588ku.com/back_pic/00/05/05/995625dd8ca6ffd.jpg"];
    
    cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 125) shouldInfiniteLoop:YES imageNamesGroup:_ModelimgArr];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [tableheadView addSubview:cycleScrollView];
    
    _imgArr=[[NSMutableArray alloc]init];
    [_imgArr addObject:@"class1"];
    [_imgArr addObject:@"share"];
    [_imgArr addObject:@"病例库.png"];
    [_imgArr addObject:@"doctor"];
    _imgnameArr=[[NSMutableArray alloc]init];
    [_imgnameArr addObject:@"网络云课堂"];
    [_imgnameArr addObject:@"经典案例"];
    [_imgnameArr addObject:@"病例库"];
    [_imgnameArr addObject:@"医用工具"];
    
    CGFloat btnWidth = 40;
    CGFloat width = ScreenWidth/4;
    CGFloat spaceWidth = (width - btnWidth)/2;
    NSInteger row;
    NSInteger cow;
    if (_imgArr.count<=4) {
        cow=_imgArr.count;
        row=1;
    }
    for (int i = 0;i < 4;i++) {
        NSInteger index = i;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(spaceWidth+i*width, 0*(btnWidth+28)+8+130, btnWidth, btnWidth)];
        if (index< 4&&index<_imgArr.count) {
            //            [btn sd_setImageWithURL:[NSURL URLWithString:_imgArr[index]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"1.png"]];
            [btn setBackgroundImage:[UIImage imageNamed:_imgArr[i]] forState:UIControlStateNormal];
        }else{
            [btn setImage:[UIImage imageNamed:@"全部.png"] forState:UIControlStateNormal];
        }
        btn.tag = index;
        
        [btn addTarget:self action:@selector(chooseServers:) forControlEvents:UIControlEventTouchUpInside];
        [tableheadView addSubview:btn];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*width ,
                                                                   btn.frame.origin.y + btn.frame.size.height,
                                                                   width, 18)];
        if (index< 4&&index<_imgnameArr.count) {
            label.text = _imgnameArr[index];
        }else{
            label.text = @"全部分类";
        }
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:12];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        [tableheadView addSubview:label];
        
        //            }
        //        }
    }
    
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0, 125+89, ScreenWidth, 5)];
    line.backgroundColor=UIColorFromRGB(BackColorValue);
    [tableheadView addSubview:line];
    
    _tableView.tableHeaderView=tableheadView;
    
}
- (void)chooseServers:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
        {
            NetworkCloudViewController *class=[[NetworkCloudViewController alloc]init];
            [self.navigationController pushViewController:class animated:YES];
//            ProductsInformationViewController *next=[[ProductsInformationViewController alloc]init];
//            [self.navigationController pushViewController:next animated:YES];
        }
            
            break;
        case 1:
        {
//            LatestPostsViewController *next=[[LatestPostsViewController alloc]init];
//            [self.navigationController pushViewController:next animated:YES];
        }
            
            break;
        case 2:
            
            break;
            
        default:
            break;
    }
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


- (void)search
{
//    SearchViewController *search=[[SearchViewController alloc]init];
//    [self.navigationController pushViewController:search animated:YES];
}
- (void)scanCamera
{
    
}
- (void)initNavView
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, ScreenWidth, 64.f)];
    headerView.backgroundColor = UIColorFromRGB(SubjectColorValue);
    [self.view addSubview:headerView];
    
    
    UIView *searchView=[[UIView alloc]initWithFrame:CGRectMake(14, 25, ScreenWidth-75, 30)];
    searchView.backgroundColor=[UIColor whiteColor];
    searchView.layer.cornerRadius = 15;
    searchView.layer.masksToBounds = YES;
    [headerView addSubview:searchView];
    
    
    
    UIImageView *searvhimg=[[UIImageView alloc]initWithFrame:CGRectMake(10, 7, 16, 16)];
    searvhimg.image=[UIImage imageNamed:@"fangda"];
    [searchView addSubview:searvhimg];
    
    UILabel *searchlab=[[UILabel alloc]initWithFrame:CGRectMake(36, 0, ScreenWidth-75, 30)];
    searchlab.text=@"搜索资讯、指南";
    searchlab.textColor=[UIColor grayColor];
    searchlab.textAlignment=NSTextAlignmentLeft;
    searchlab.font=[UIFont systemFontOfSize:12];
    [searchView addSubview:searchlab];
    
    UIButton *searvhimgbtn=[[UIButton alloc]initWithFrame:CGRectMake(8, 0, ScreenWidth-150, 40)];
    [searvhimgbtn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [searchView addSubview:searvhimgbtn];
    
    
    UIButton *scan = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-75+19+14, 26, 26, 26)];
    [scan setImage:[UIImage imageNamed:@"sys.png"] forState:UIControlStateNormal];
    [scan addTarget:self action:@selector(scanCamera) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:scan];
    
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

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    
}
@end
