//
//  ViewController.m
//  TransitionDemo
//
//  Created by mac on 16/5/30.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *titleArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    titleArr = @[@"flipNavigationPush",@"waiting",@"waiting"];
    
    self.navigationController.navigationBar.translucent = NO;

    [self createUI];
}

- (void)createUI{
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame),CGRectGetHeight(self.view.frame))];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    table.tableFooterView = [[UIView alloc]init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = titleArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[[FirstViewController alloc]init] animated:YES];
            break;
            
        default:
            break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
