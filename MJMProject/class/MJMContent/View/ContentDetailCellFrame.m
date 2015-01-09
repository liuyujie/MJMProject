//
//  ContentDetailCellFrame.m
//  MJMProject
//
//  Created by bassamyan on 15/1/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentDetailCellFrame.h"
#import "UIImage+MJM.h"

@implementation ContentDetailCellFrame

-(NSInteger)calculateContentcellFrameWithDatadic:(NSMutableDictionary *)dic
{
//    NSMutableDictionary *directors_dic = [dic objectForKey:@"head_directors"];
//    NSMutableDictionary *scriptwriter_dic = [dic objectForKey:@"head_scriptwriter"];
//    NSMutableDictionary *actor_dic = [dic objectForKey:@"head_actor"];
//    NSString *type = [dic objectForKey:@"head_type"];
//    NSString *publish_time = [dic objectForKey:@"head_publishtime"];
//    NSString *now_episode = [dic objectForKey:@"head_nowepisode"];
//    NSString *state = [dic objectForKey:@"head_state"];
//    
//    /***********
//     
//     头部的高度
//     
//     ***********/
//    
    NSInteger cell_head = 200;
//    NSInteger head_title_height = 40;
//    NSInteger head_imageview_height = 150;
//    NSInteger min_height = head_title_height + head_imageview_height + 5;
//    
//    NSInteger real_height = 30;
//    
//    real_height += [self calculateHeightWithdic:directors_dic];
//    real_height += [self calculateHeightWithdic:scriptwriter_dic];
//    real_height += [self calculateHeightWithdic:actor_dic];
    
    
    /***********
     
     内容的高度
     
     ***********/
    
    NSInteger cell_body = 200;
    
    /***********
     
     尾部的高度
     
     ***********/
    
    NSInteger cell_foot = 30;
    
    NSInteger cell_total = cell_head+cell_body+cell_foot;
    return cell_total;
}

/***************************
 
 其他
 
 ***************************/

//-(CGFloat)calculateHeightWithString:(NSString *)string
//{
//    
//}

-(CGFloat)calculateHeightWithdic:(NSMutableDictionary *)dic
{
    NSArray *names_CHN = [dic objectForKey:@"names_CHN"];
    NSString *person = [dic objectForKey:@"person"];
    NSString *name_total = [NSString stringWithFormat:@"%@ : ",person];
    for (int i=0; i<names_CHN.count; i++) {
        if (i>4) {
            break;
        }
        NSString *name = [NSString stringWithFormat:@"%@ / ",names_CHN[i]];
        if (i == names_CHN.count-1) {
            name = [NSString stringWithFormat:@"%@",names_CHN[i]];
        }
        name_total = [name_total stringByAppendingString:name];
    }
    return [self calculateSizeWithFont:font_cellmain Width:MJMWIDTH-130 Height:MAXFLOAT Text:name_total].size.height;
}

-(CGRect)calculateSizeWithFont:(NSInteger)Font Width:(NSInteger)Width Height:(NSInteger)Height Text:(NSString *)Text
{
    NSDictionary *attr = @{NSFontAttributeName : [UIFont systemFontOfSize:Font]};
    CGRect size = [Text boundingRectWithSize:CGSizeMake(Width, Height)
                                     options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attr
                                     context:nil];
    return size;
}

@end
