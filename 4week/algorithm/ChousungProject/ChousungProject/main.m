//
//  main.m
//  ChousungProject
//
//  Created by 배지영 on 2016. 5. 23..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

// ㄱ ㄴ ㄷ (3)
// ㅏ ㅑ (2)
// 없음 ㅇ ㅅ (3)

// 가 강 갓 갸 걍 걋  나 낭 낫 냐 냥 냣 다 당 닷 댜 댱 댯 (18개)
// --------------  ------------- --------------
//       가 (6개)        나 (6개)       다 (6개)
// ------- ------
//    ㅏ      ㅑ
// (2*3)*cho + 3*jung + jong = 번째
// (2, 0, 1) = 2*3*2 + 3*0 + 1 = 13


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
// 초성 ㄱ ㄲ ㄴ ㄷ ㄸ ㄹ ㅁ ㅂ ㅃ ㅅ ㅆ ㅇ ㅈ ㅉ ㅊ ㅋ ㅌ ㅍ ㅎ (19개)
// 중성 21개
// 종성 28개
// 19 * 21 * 28
// 0xAC00 + 21*28*cho + 28*jung + jong = 최
        
        // 초성 배열
        NSArray *chosungs = @[@"ㄱ",@"ㄲ",@"ㄴ",@"ㄷ",@"ㄸ",@"ㄹ",@"ㅁ",@"ㅂ",@"ㅃ",@"ㅅ",@"ㅆ",@"ㅇ",@"ㅈ",@"ㅉ",@"ㅊ",@"ㅋ",@"ㅍ",@"ㅎ"];
        
        // 이름 입력
        NSString *name = @"이름입력";
        NSLog(@"입력 이름: %@", name);
        
        NSMutableString *result = [NSMutableString string];
        
        for (NSUInteger i=0; i<name.length; i++)
        {
            //unichar는 숫자를 글자의 형태로서
            unichar c = [name characterAtIndex:i];
            NSLog(@"입력 이름의 %tu 번째 글자 %C, %zd", i, c, (NSInteger)c);
            
            if (0xAC00 <= c && c <= 0xD7AF)
            {
                NSInteger x = (NSInteger) c - 0xAC00;
                NSLog(@"%zd 번째 ", x);
                
                // -------종성--------//
                // 21*28*cho + 28*jung + jong = x
                // 28*(21*cho + jung) + jong = x
                NSInteger jong = x % 28;
                
                // 28*(21*cho + jung) = x
                x = x - jong;
                
                //--------중성---------//
                // 21*cho + jung = x
                x = x / 28;
                NSInteger jung = x % 21;
                x -= jung;
                
                // ----- 초성 ------//
                // 21*cho = x
                NSInteger cho = x / 21;
                NSString *chosung = chosungs[cho];
                NSLog(@"%C %zd 번째 초성 %@", c, cho, chosung);
                [result appendString:chosung];
            }
            
            else
            {
                //------ 예외 처리 : 한글 외의 문자 (특수문자, 영어, 아랍어 등..)----//
                NSString *letter = [name substringWithRange:NSMakeRange(i,1)];
                NSLog(@"예외: %@", letter);
                
                NSUInteger index = [chosungs indexOfObject:letter];
                NSLog(@"인덱스 %tu",index);
                
                if (index != NSNotFound)
                {
                    [result appendString:letter];
                }
                
            }
            
        }
        
        
    // ---------- 쌍자음 ----------//
        
        NSString *converted = result;
        
        /*
         converted = [converted stringByReplacingOccurrencesOfString:@"ㄱㄱ" withString:@"ㄲ"];
         converted = [converted stringByReplacingOccurrencesOfString:@"ㄷㄷ" withString:@"ㄸ"];
         converted = [converted stringByReplacingOccurrencesOfString:@"ㅂㅂ" withString:@"ㅃ"];
         converted = [converted stringByReplacingOccurrencesOfString:@"ㅅㅅ" withString:@"ㅆ"];
         converted = [converted stringByReplacingOccurrencesOfString:@"ㅈㅈ" withString:@"ㅉ"];*/
        
        for (NSString *chosung in @[@"ㄱ",@"ㄷ",@"ㅂ",@"ㅅ",@"ㅈ"]) {
            NSString *str1 = [NSString stringWithFormat:@"%@%@",chosung,chosung];
            NSUInteger index = [chosungs indexOfObject:chosung];
            NSString *str2 = chosungs[index+1];
            converted = [converted stringByReplacingOccurrencesOfString:str1 withString:str2];
        }
    
    }
    return 0;
}
