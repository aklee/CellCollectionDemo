//
//  ViewController.m
//  CellCollectionDemo
//
//  Created by ak on 2017/1/23.
//  Copyright © 2017年 ak. All rights reserved.
//

#import "ViewController.h"
#import "CTMediator+CellManager.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray* data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Collection";
    self.data=@[].mutableCopy;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.data addObject:@"TransferCardCell"];
    [self.data addObject:@"TransferCardCell"];
    [self.data addObject:@"BankCardTableViewCell"];
    [self.data addObject:@"BankCardTableViewCell"];
    [self.data addObject:@"CardCell"];
    [self.data addObject:@"CardCell"];
    [self.data addObject:@"FinancialNewsTableViewCell"];
    [self.data addObject:@"FinancialNewsTableViewCell"];
    [self.data addObject:@"PercentDetailCell"];
    [self.data addObject:@"PercentDetailCell"];
    [self.data addObject:@"AnnounceTableViewCell"];
    [self.data addObject:@"AnnounceTableViewCell"];
    [self.data addObject:@"NewsDetailTableViewCell"];
    [self.data addObject:@"NewsDetailTableViewCell"];
    
    
    
    
    for (NSString *m in self.data) {
        
        [[CTMediator sharedInstance] CTM_tableView:self.tableView registerClsName:m];
    }
    
    
    
}
//MARK:
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *m = self.data[indexPath.row];
    
    UITableViewCell* cell = [[CTMediator sharedInstance] CTM_tableView:tableView cellforRowAtIndexPath:indexPath clsName:m];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *m = self.data[indexPath.row];
   
    float row =  [[CTMediator sharedInstance] CTM_tableView:tableView heightForRowAtIndexPath:indexPath clsName:m];

    return  row;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //refresh unselected rows
    NSString *m = self.data[indexPath.row];
    
     [[CTMediator sharedInstance] CTM_tableView:tableView didSelectRowAtIndexPath:indexPath clsName:m];
    
}
@end
