//
//  ServiceTable.h
//  TableDraw
//
//  Created by Snail Ark on 16/3/22.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceTable : NSObject
@property (nonatomic,strong)NSString *tableName;
@property (nonatomic,strong)NSString *tableDate;
@property (nonatomic,strong)NSString *kehumingcheng;
@property (nonatomic,strong)NSString *fuwudidian;
@property (nonatomic,strong)NSString *jiqixinghao;
@property (nonatomic,strong)NSString *jiqixuhao;
@property (nonatomic,strong)NSString *changneibianhao;
@property (nonatomic,strong)NSString *jianchariqi;
@property (nonatomic,strong)NSString *shiyongshijianzong;
@property (nonatomic,strong)NSString *shiyongshijianjiazai;
@property (nonatomic,strong)NSString *yalishedingmin;
@property (nonatomic,strong)NSString *yalishedingmax;
@property (nonatomic,strong)NSString *shebeichuchangriqi;
@property (nonatomic,strong)NSString *dingqibaoyang;
@property (nonatomic,strong)NSString *guzhangweixiu;
@property (nonatomic,strong)NSString *suopei;
@property (nonatomic,strong)NSString *fangong;
@property (nonatomic,strong)NSString *lichangxuncha;
@property (nonatomic,strong)NSString *huanjingwendu;
@property (nonatomic,strong)NSString *zhujipaiqiwendu1;
@property (nonatomic,strong)NSString *zhujipaiqiwendu2;
@property (nonatomic,strong)NSString *kongyajichukouwendu;
@property (nonatomic,strong)NSString *shebeichukouyali;
@property (nonatomic,strong)NSString *youqifenliqiyacha;
@property (nonatomic,strong)NSString *kongqiguolvqijiancha;
@property (nonatomic,strong)NSString *pinyouyali;
@property (nonatomic,strong)NSString *liaozhouqijiancha;
@property (nonatomic,strong)NSString *dianyav;
@property (nonatomic,strong)NSString *dianyas;
@property (nonatomic,strong)NSString *dianyat;
@property (nonatomic,strong)NSString *dianliuloadr;
@property (nonatomic,strong)NSString *dianliuloads;
@property (nonatomic,strong)NSString *dianliuloadt;
@property (nonatomic,strong)NSString *dianliuunloadr;
@property (nonatomic,strong)NSString *dianliuunloads;
@property (nonatomic,strong)NSString *dianliuunloadt;
@property (nonatomic,strong)NSString *madaqidongcishu;
@property (nonatomic,strong)NSString *jiaxiezaicishu;
@property (nonatomic,strong)NSString *diannaobanzongyunxingshijian;
@property (nonatomic,strong)NSString *lengqueshui_jin;
@property (nonatomic,strong)NSString *lengqueshui_chu;
@property (nonatomic,strong)NSString *zhongjianlengqueqijianchab;
@property (nonatomic,strong)NSString *zhongjianlengqueqijianchac;
@property (nonatomic,strong)NSString *houbulengqueqijianchab;
@property (nonatomic,strong)NSString *houbulengqueqijianchac;
@property (nonatomic,strong)NSString *lengqueyoujianchab;
@property (nonatomic,strong)NSString *lengqueyoujianchac;
@property (nonatomic,strong)NSString *youhuxiqijiancha;
@property (nonatomic,strong)NSString *xiaoyinqijiancha1;
@property (nonatomic,strong)NSString *paiyufajiancha;
@property (nonatomic,strong)NSString *ludianwendu;
@property (nonatomic,strong)NSString *lpyali;
@property (nonatomic,strong)NSString *hpyali;
@property (nonatomic,strong)NSString *xiaoyinqijiancha2;
@property (nonatomic,strong)NSString *shou_zi_paiwuceshi;
@property (nonatomic,strong)NSArray  *lingjianArray;
@property (nonatomic,strong)NSArray  *gongchengshiArray;
@property (nonatomic,strong)NSString *guzhangxianxiang;
@property (nonatomic,strong)NSString *guzhangchulimiaoshu;
@property (nonatomic,strong)NSString *jianyishixiang;
@property (nonatomic,strong) NSString * linjian1_name;
@property (nonatomic,strong) NSString * linjian1_no;
@property (nonatomic,strong) NSString * linjian1_qty;
@property (nonatomic,strong) NSString * linjian2_name;
@property (nonatomic,strong) NSString * linjian2_no;
@property (nonatomic,strong) NSString * linjian2_qty;
@property (nonatomic,strong) NSString * linjian3_name;
@property (nonatomic,strong) NSString * linjian3_no;
@property (nonatomic,strong) NSString * linjian3_qty;
@property (nonatomic,strong) NSString * linjian4_name;
@property (nonatomic,strong) NSString * linjian4_no;
@property (nonatomic,strong) NSString * linjian4_qty;
@property (nonatomic,strong) NSString * linjian5_name;
@property (nonatomic,strong) NSString * linjian5_no;
@property (nonatomic,strong) NSString * linjian5_qty;
@property (nonatomic,strong) NSString * linjian6_name;
@property (nonatomic,strong) NSString * linjian6_no;
@property (nonatomic,strong) NSString * linjian6_qty;
@property (nonatomic,strong) NSString * linjian7_name;
@property (nonatomic,strong) NSString * linjian7_no;
@property (nonatomic,strong) NSString * linjian7_qty;
@property (nonatomic,strong) NSString * linjian8_name;
@property (nonatomic,strong) NSString * linjian8_no;
@property (nonatomic,strong) NSString * linjian8_qty;
@property (nonatomic,strong) NSString * linjian9_name;
@property (nonatomic,strong) NSString * linjian9_no;
@property (nonatomic,strong) NSString * linjian9_qty;
@property (nonatomic,strong) NSString * linjian10_name;
@property (nonatomic,strong) NSString * linjian10_no;
@property (nonatomic,strong) NSString * linjian10_qty;
@property (nonatomic,strong) NSString * engineer1;
@property (nonatomic,strong) NSString * engineer2;
@property (nonatomic,strong) NSString * engineer3;
@property (nonatomic,strong) NSString * engineer4;
@property (nonatomic,strong) NSString * engineer5;
@property (nonatomic,strong) NSString * customer1_name;
@property (nonatomic,strong) NSString * customer1_phone;
@property (nonatomic,strong) NSString * customer1_email;
@property (nonatomic,strong) NSString * customer2_name;
@property (nonatomic,strong) NSString * customer2_phone;
@property (nonatomic,strong) NSString * customer2_email;
@property (nonatomic,strong) NSString * customer3_name;
@property (nonatomic,strong) NSString * customer3_phone;
@property (nonatomic,strong) NSString * customer3_email;
@property (nonatomic,strong) NSString * device_sn;
// 没有签名的保存， 即暂存时间
@property (nonatomic,strong) NSString * closedocument;
// 创建表单的时间
@property (nonatomic ,strong) NSString *opendocument;
// 签名 时间
@property (nonatomic , strong) NSString *signdocument;
// 机器的bar code
@property (nonatomic , strong) NSString *barcodeid;
@property (nonatomic ,assign) BOOL   isSigned;
// 是否已经上传
@property (nonatomic ,assign) BOOL   isUpload;
@property (nonatomic,strong) NSData *NG1_pic;
@property (nonatomic,strong) NSData *NG2_pic;
@property (nonatomic,strong) NSData *NG3_pic;
@property (nonatomic,strong) NSData *NG4_pic;
@property (nonatomic,strong) NSData *NG5_pic;
@property (nonatomic,strong) NSData *Repair1_pic;
@property (nonatomic,strong) NSData *Repair2_pic;
@property (nonatomic,strong) NSData *Repair3_pic;
@property (nonatomic,strong) NSData *Repair4_pic;
@property (nonatomic,strong) NSData *Repair5_pic;
@property (nonatomic,strong) NSData *Parts1_pic;
@property (nonatomic,strong) NSData *Parts2_pic;
@property (nonatomic,strong) NSData *Parts3_pic;
@property (nonatomic,strong) NSData *Parts4_pic;
@property (nonatomic,strong) NSData *Parts5_pic;
@property (nonatomic,strong) NSData *sign_pic;
@property (nonatomic,strong) NSData *xiuqianArray;
@property (nonatomic,strong) NSData *xiuhouArray;
@property (nonatomic,strong) NSData *lingjianImagesArray;
@property (nonatomic,strong) NSData * qianming;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end
