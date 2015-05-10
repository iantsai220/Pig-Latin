//
//  main.m
//  PigLatin
//
//  Created by Ian Tsai on 2015-05-08.
//  Copyright (c) 2015 Ian Tsai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"Enter sentence");
        
        char str[1025];
        
        fgets(str, 1025, stdin);
        
        NSString *string = [[NSString alloc] initWithUTF8String:str];
        
        NSString *modified = [string stringByPigLatinization];
        
        NSLog(@"%@", modified);
  
    }
    return 0;
}
