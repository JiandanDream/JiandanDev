//
//  Created by Jiandan on 2018/4/18.
//  Copyright © 2018年 jdkj. All rights reserved.
//

#import "JDAppTestsViewController.h"
#import "JDAppTestCase.h"
#import "JDTestMethodsViewController.h"

@interface JDAppTestsViewController ()
@property (nonatomic, copy) NSArray *appTestsNames;
@end

@implementation JDAppTestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"appTestsCellID"];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.appTestsNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"appTestsCellID" forIndexPath:indexPath];
    cell.textLabel.text = self.appTestsNames[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *name = self.appTestsNames[indexPath.row];
    JDTestMethodsViewController *vc = [[JDTestMethodsViewController alloc] initWithAppTestsName:name];
    [self showViewController:vc sender:nil];
}

#pragma mark - Getters and setters
- (NSArray *)appTestsNames {
    if (!_appTestsNames) {
        JDAppTestCase *appTests = [JDAppTestCase new];
        _appTestsNames = appTests.subClassNames;
    }
    return _appTestsNames;
}

@end
