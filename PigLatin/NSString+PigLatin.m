//
//  NSString+PigLatin.m
//  PigLatin
//
//  Created by Ian Tsai on 2015-05-08.
//  Copyright (c) 2015 Ian Tsai. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

-(NSString *)stringByPigLatinization{
    
    NSMutableArray *stringArray = [[self componentsSeparatedByString:@" "] mutableCopy];
    
    NSString *addAy = @"ay";
    
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"];
    
    NSString *modifyString;
    
//    NSLog(@"%lu", stringArray.count);
    
    for (int i = 0; i < stringArray.count; i++) {
        
        //for each word
        modifyString = stringArray[i];
        
        //find first consonant
        NSRange firstRange = [modifyString rangeOfCharacterFromSet:vowelSet];
        
        NSString *firstHalfString = [modifyString substringWithRange:NSMakeRange(0, firstRange.location)];
        
        NSString *secondHalfString = [modifyString substringWithRange:NSMakeRange(firstRange.location, modifyString.length - firstRange.location)];

        //move to the end and add ay
        modifyString = [[secondHalfString stringByAppendingString:firstHalfString] stringByAppendingString:addAy];
    
//        NSLog(@"%@", modifyString);
        stringArray[i] = modifyString;
        
    }
    
    NSString *pigLatin = [stringArray componentsJoinedByString:@" "];
//    NSLog(@"%@", pigLatin);

    return pigLatin;

}





















@end
