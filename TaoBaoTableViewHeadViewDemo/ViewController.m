//
//  ViewController.m
//  TaoBaoTableViewHeadViewDemo
//
//  Created by jiangdongxu on 2017/2/20.
//  Copyright © 2017年 JiangDongXu. All rights reserved.
//

#import "ViewController.h"
#import "JDTableView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)JDTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.headImage = [UIImage imageNamed:@"head.png"];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - delegate && dataSouce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    
    return cell;
}

#pragma mark - load lazy Area
-(JDTableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[JDTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
