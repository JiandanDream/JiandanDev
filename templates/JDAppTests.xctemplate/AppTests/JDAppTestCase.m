//
//  Created by Jiandan on 2018/4/18.
//  Copyright © 2018年 jdkj. All rights reserved.
//

#import "JDAppTestCase.h"
#import <objc/runtime.h>

@implementation JDAppTestCase
- (NSArray<NSString *> *)appTestMethods {
    NSString *str = [self performSelector:@selector(_shortMethodDescription)];
    NSArray *components = [str componentsSeparatedByString:@"\n\t\t"];
    NSMutableArray *testMethods = [NSMutableArray new];
    for (NSString *component in components) {
        if ([component containsString:@"test"] && ![component containsString:@"appTestMethods"]) {
            NSRange bRange = [component rangeOfString:@"test"];
            NSRange eRange = [component rangeOfString:@";"];
            NSString *method = [component substringWithRange:NSMakeRange(bRange.location, eRange.location - bRange.location)];
            [testMethods addObject:method];
        }
    }
    return testMethods;
}

- (NSArray<NSString *> *)subClassNames {
    int numClasses;
    Class *classes = NULL;
    numClasses = objc_getClassList(NULL,0);
    
    NSMutableArray *subClassNames = [NSMutableArray new];
    if (numClasses >0 ) {
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        for (int i = 0; i < numClasses; i++) {
            if (class_getSuperclass(classes[i]) == [self class]){
                [subClassNames addObject:NSStringFromClass(classes[i])];
            }
        }
        free(classes);
    }
    return subClassNames;
}
@end
