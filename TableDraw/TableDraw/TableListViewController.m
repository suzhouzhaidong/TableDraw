//
//  TableListViewController.m
//  TableDraw
//
//  Created by Snail Ark on 16/3/22.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "TableListViewController.h"

@interface TableListViewController ()

@end

@implementation TableListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)downloadOneYearData:(id)sender {
    [Util startLoading:self.view];
    NSString *serverip = [Util getServerIp];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 3000;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/plain", @"text/html",nil];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"0",@"pageNum",@"10",@"pageSize", nil];
    
    [manager POST:[NSString stringWithFormat:@"%@:8090/Service.asmx/GetOneYearData",serverip] parameters:dict success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
        [Util stopLoading:self.view];
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [Util stopLoading:self.view];
    }];
}
- (IBAction)startNewTable:(id)sender {
   
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
