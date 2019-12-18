//
#import <XCTest/XCTest.h>
#import "iosTestRunner.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
   [super tearDown];
}

- (void)testExample {
     IosTestRunner* runner = [[IosTestRunner alloc] init];
     XCTAssert(runner);
}
@end
