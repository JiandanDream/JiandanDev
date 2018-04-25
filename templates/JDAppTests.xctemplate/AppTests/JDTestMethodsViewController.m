//
//  Created by Jiandan on 2018/4/18.
//  Copyright © 2018年 jdkj. All rights reserved.
//

#import "JDTestMethodsViewController.h"
#import "JDAppTestCase.h"

@interface JDTestMethodsViewController ()
@property (nonatomic, strong) JDAppTestCase *appTests;
@property (nonatomic, copy) NSArray *testsMethodNames;
@end

@implementation JDTestMethodsViewController

- (instancetype)initWithAppTestsName:(NSString *)name {
    self = [super init];
    if (self) {
        Class class = NSClassFromString(name);
        self.appTests = [class new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"testsMethodsCellID"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.testsMethodNames.count;
}

#pragma mark - Table view delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testsMethodsCellID" forIndexPath:indexPath];
    cell.textLabel.text = self.testsMethodNames[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *name = self.testsMethodNames[indexPath.row];
    SEL selector = NSSelectorFromString(name);
    if ([self.appTests respondsToSelector:selector]) {
        [self.appTests performSelector:selector];
    }
}

#pragma mark - Getters and setters
- (NSArray *)testsMethodNames {
    if (!_testsMethodNames) {
        _testsMethodNames = [self.appTests appTestMethods];
    }
    return _testsMethodNames;
}

@end
