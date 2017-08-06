//
//  SearchViewController.m
//  supersound
//
//  Created by Mickey on 2017/8/6.
//  Copyright © 2017年 Mickey. All rights reserved.
//

#import "SearchViewController.h"
#import "MickeyUITextView.h"

@interface SearchViewController ()<UISearchBarDelegate,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
{
    UIView * searchView;
    UISearchBar * searchBare;
    NSString * keyword;
    NSMutableArray *dataArr;
    NSMutableArray *themedataArr;
    NSMutableArray *livedataArr;
    MickeyUITextView *searchlab;
}
@end

@implementation SearchViewController
//Cell的Identifier
static NSString *SearchHistoryCellName = @"SearchHistoryTableCell";

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden=YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //初始化界面
    [self initView];
    [self getDate];
    self.navigationController.navigationBarHidden=YES ;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    self.navigationController.navigationBar.hidden=YES;
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidAppear:YES];
    self.navigationController.navigationBar.hidden=NO;
}
-(void)getDate
{
//    [[RootHttpHelper httpHelper] basicGetURL:@"article/attr" andParams:nil andSuccess:^(NSDictionary *successData) {
//        if ([[successData objectForKey:@"code"] integerValue]==200) {
//            
//            NSMutableDictionary *dic=[successData objectForKey:@"items"];
//            themedataArr=[[NSMutableArray alloc]initWithArray:[dic objectForKey:@"attrs"]];
//            livedataArr=[[NSMutableArray alloc]initWithArray:[dic objectForKey:@"video_attrs"]];
            [self creatHeadView];
//            [self.table reloadData];
//        }else{
//            
//        }
//    } andError:^(NSError *error) {
//        NSLog(@"%@",error);
//        if ([[MickeyTools getErrorStringWithError:error] isEqualToString:@"登陆信息过期,需要重新登陆"]) {
//            
//        }else{
//            [self.view makeToast:[MickeyTools getErrorStringWithError:error] duration:1.5 position:ToastDefaultPositionTop];
//        }
//    }];
    
}
#pragma mark - 初始化界面
- (void)initView
{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 22)];
    statusBarView.backgroundColor=UIColorFromRGB(SubjectColorValue);
    [self.view addSubview:statusBarView];
    
    
    if(dataArr == nil)
    {
        dataArr = [NSMutableArray array];
    }
    if(themedataArr == nil)
    {
        themedataArr = [NSMutableArray array];
    }
    if(livedataArr == nil)
    {
        livedataArr = [NSMutableArray array];
    }
    
    [self searchViewBar];
    
    //设置TableView
    self.table=[[UITableView alloc]initWithFrame:CGRectMake(0, 71, SCREEN_WIDTH, SCREEN_HEIGHT-71)];
    
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.backgroundColor = [UIColor whiteColor];
    self.table.separatorStyle = UITableViewScrollPositionNone;
    self.table.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.table];
    
}

#pragma mark - 设置头部
- (void)creatHeadView
{
    _backView=[[UIView alloc]init];
    _backView.backgroundColor=[UIColor whiteColor];
    
//    UILabel *hotView=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
//    hotView.text=@"   资讯热门";
//    hotView.textColor=UIColorFromRGB(0xc90920);
//    hotView.font=[UIFont systemFontOfSize:16.f];
//    hotView.textAlignment=NSTextAlignmentLeft;
//    hotView.backgroundColor=[UIColor clearColor];
//    [_backView addSubview:hotView];
    
    UIImageView *hot=[[UIImageView alloc]initWithFrame:CGRectMake(16, 20, 71, 18)];
    hot.image=[UIImage imageNamed:@"热门"];
    [_backView addSubview:hot];
    
    
    CGFloat w = 8;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
    CGFloat h = 50;//用来控制button距离父视图的高  _searchPageArr
    dataArr = @[@"黑色幽默",@"黑色幽默",@"黑色幽默",@"黑色幽默",@"黑色幽默",@"黑色幽默",@"黑色幽默",@"黑色幽默",@"黑色幽默",@"黑色幽默",@"黑色幽默",@"黑色幽默",@"黑色幽默",@"黑色幽默",@"黑色幽默",@"黑色幽默",@"黑色幽默"];
    for (int i = 0; i < dataArr.count; i++)
    {
        NSDictionary *dict=dataArr[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = i;
        button.backgroundColor = [UIColor whiteColor];
        [button addTarget:self action:@selector(handleClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:UIColorFromRGB(0xcccccc) forState:UIControlStateNormal];
        
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
        //为button赋值
        //根据计算文字的大小
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:12]; //设置矩形四个圆角半径
        
        [button setTitle:dataArr[i] forState:UIControlStateNormal];
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
        CGFloat length = [dataArr[i] boundingRectWithSize:CGSizeMake(320, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        //设置button的frame
        button.frame = CGRectMake( 8+w, h,  length + 25 , 24);
        //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
        if( 8+w + length + 25 > SCREEN_WIDTH-16){
            w = 10; //换行时将w置为0
            h = h + button.frame.size.height + 10;//距离父视图也变化
            button.frame = CGRectMake(8+w, h,length + 25, 24);//重设button的frame
        }
        w = button.frame.size.width + button.frame.origin.x;
         _backView.frame=CGRectMake(0, 8, length + 25, h+40);
        [_backView addSubview:button];
    }
    _table.tableHeaderView=_backView;
    
    
}

#pragma mark - SearchBar(顶部导航的搜索栏)
- (void)searchViewBar
{
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 22, SCREEN_WIDTH, 48)];
    headView.backgroundColor=UIColorFromRGB(SubjectColorValue);
    [self.view addSubview:headView];
//    headView.backgroundColor=[UIColor whiteColor];
    
    searchView=[[UIView alloc]initWithFrame:CGRectMake(16, 9, SCREEN_WIDTH-70, 30)];
    searchView.backgroundColor=[UIColor whiteColor];
    searchView.layer.cornerRadius = 15;
    searchView.layer.masksToBounds = YES;
    [headView addSubview:searchView];
    
    UIImageView *searvhimg=[[UIImageView alloc]initWithFrame:CGRectMake(10, 7, 16, 16)];
    searvhimg.image=[UIImage imageNamed:@"fangda"];
    [searchView addSubview:searvhimg];
    
    searchlab=[[MickeyUITextView alloc]initWithFrame:CGRectMake(31, 0, SCREEN_WIDTH-70-36, 30)];
    searchlab.backgroundColor=[UIColor whiteColor];
    searchlab.placeholder=@"输入你想搜索的标题的关键词";
    searchlab.textColor=[UIColor grayColor];
    searchlab.delegate=self;
    searchlab.tintColor = UIColorFromRGB(SubjectColorValue);
    searchlab.placeholderColor = [UIColor grayColor];
    searchlab.textAlignment=NSTextAlignmentLeft;
    searchlab.font=[UIFont systemFontOfSize:12];
    searchlab.showsVerticalScrollIndicator = YES;
    [searchView addSubview:searchlab];
    
    UIButton *cancal=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60, 4 ,60, 40)];
    [cancal addTarget:self action:@selector(cancal) forControlEvents:UIControlEventTouchUpInside];
    [cancal setTitle:@"  取消" forState:UIControlStateNormal];
    cancal.titleLabel.font=[UIFont systemFontOfSize:14.f];
    [cancal setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [headView addSubview:cancal];
    
    [headView addSubview:searchView];
    //    [searchBare becomeFirstResponder];
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textField
{
    textField.returnKeyType = UIReturnKeySearch;
    
    return YES;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        //        //模糊关键字
        keyword = searchlab.text;
        
//        SearchThemeResultViewController *result=[[SearchThemeResultViewController alloc]init];
//        result.titleName=keyword;
//        result.keyword=keyword;
//        [self.navigationController pushViewController:result animated:YES];
        searchlab.text=@"";
        return NO;
    }
    return YES;
}

-(void)cancal
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 点击搜索框时调用
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.placeholder = @"";
}

#pragma mark - TableView的代理方法
#pragma mark - 分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark - 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

#pragma mark - 每个Cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

#pragma mark - 初始化Cell
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id rCell = [tableView dequeueReusableCellWithIdentifier:SearchHistoryCellName];
    if(rCell == nil)
    {
        rCell= [[[NSBundle mainBundle] loadNibNamed:SearchHistoryCellName owner:nil options:nil] lastObject];
    }
    
    [self configHistoryCell:rCell atIndexPath:indexPath];
    
    return rCell;
}

#pragma mark - 设置历史Cell内容
-(void)configHistoryCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath*)indexPath
{
    cell.backgroundColor=[UIColor greenColor];
    
}
-(void)delete:(UIButton *)btn
{
 
}
#pragma mark - Cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"点击的是第：%ld",(long)indexPath.row);
    if(indexPath.section == 0)
    {
        //模糊关键字
        //        keyword = [self.searchArr objectAtIndex:self.searchArr.count-1-indexPath.row];
        
        [self searchData];
    }
}

#pragma mark - 键盘中，搜索按钮被按下，执行的方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)search
{
    NSLog(@"++++++++搜索按钮点击事件");
    //模糊关键字
    keyword = search.text;
    //    [self.searchArr addObject:keyword];
    [self.table reloadData];
    [self searchData];
}

#pragma mark - 热门按钮点击事件
- (void)handleClick:(UIButton *)sender
{
    NSLog(@"++++++++热门按钮点击事件");
//    NSDictionary *dic=[[NSDictionary alloc]init];
//    dic=themedataArr[sender.tag];
//    SearchThemeResultViewController *result=[[SearchThemeResultViewController alloc]init];
//    //    if (![self isBlankString:keyword]) {
//    //    result.titleName=keyword;
//    //    }else{
//    //    result.titleName=[dic objectForKey:@"name"];
//    //    }
//    result.titleName=[dic objectForKey:@"name"];
//    //    result.keyword=[dic objectForKey:@"name"];
//    result.titleNameId=[dic objectForKey:@"id"];
//    //    result.titleName=keyword;
//    [self.navigationController pushViewController:result animated:YES];
}

#pragma mark - 请求搜索数据
- (void)searchData
{
 
}



#pragma mark - View从superView中移除时
- (void)viewWillDisappear:(BOOL)animated
{
    [searchBare resignFirstResponder];
     searchBare.placeholder = @"输入你想搜索的关键词";
     self.navigationController.navigationBar.hidden=NO;
}

#pragma mark - ScrollView 开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [searchBare resignFirstResponder];
     searchBare.placeholder = @"输入你想搜索的关键词";
}

#pragma mark - 收起键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [searchBare resignFirstResponder];
     searchBare.placeholder = @"输入你想搜索的关键词";
}

- (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}


@end
