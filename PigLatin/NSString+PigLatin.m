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
    
    NSArray *stringArray = [self componentsSeparatedByString:@" "];
    
    NSMutableArray *modifiedStringArray = [NSMutableArray array];
    
    NSString *modifyString;
    
//    NSLog(@"%lu", stringArray.count);
    
    for (int i = 0; i < stringArray.count; i++) {
        
        //for each word
        modifyString = stringArray[i];
        
        [modifiedStringArray insertObject:[modifyString modifyWord] atIndex:i];
        
    }
    
    NSString *pigLatin = [modifiedStringArray componentsJoinedByString:@" "];
//    NSLog(@"%@", pigLatin);

    return pigLatin;

}

-(NSString *)modifyWord {
    
    NSString *addAy = @"ay";
    
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"];
    
    //find first consonant
    NSRange firstRange = [self rangeOfCharacterFromSet:vowelSet];
    
    NSString *firstHalfString = [self substringWithRange:NSMakeRange(0, firstRange.location)];
    
    NSString *secondHalfString = [self substringWithRange:NSMakeRange(firstRange.location, self.length - firstRange.location)];
    
    //move to the end and add ay
    NSString *modifiedWord = [[secondHalfString stringByAppendingString:firstHalfString] stringByAppendingString:addAy];
    
    return modifiedWord;
    
}





















@end
