//
//  ServiceTable.m
//  TableDraw
//
//  Created by Snail Ark on 16/3/22.
//  Copyright © 2016年 com.snailgames. All rights reserved.
//

#import "ServiceTable.h"
#import "Util.h"
#import "Base64.h"
#define GetStringValueFromDicWithKey(dic,key) (![dic objectForKey:key])||([[dic objectForKey:key] isKindOfClass:[NSNull class]])?nil:[NSString stringWithFormat:@"%@",[dic objectForKey:key]]
@implementation ServiceTable
- (instancetype)init
{
    if (self == [super init]) {
        _tableName = @"";
        _tableDate = @"";
        _kehumingcheng = @"";
        _fuwudidian = @"";
        _jiqixinghao = @"";
        _jiqixuhao = @"";
        _changneibianhao = @"";
        _jianchariqi =[Util getDateFromDate:[NSDate date] formatter:@"yyyy-MM-dd"];
        _opendocument = [Util getDateFromDate:[NSDate date] formatter:@"yyyy-MM-dd hh:mm:ss"];
        _shiyongshijianzong = @"";
        _shiyongshijianjiazai = @"";
        _yalishedingmin = @"";
        _yalishedingmax = @"";
        _shebeichuchangriqi = [Util getDateFromDate:[NSDate date] formatter:@"yyyy-MM-dd"];
        _dingqibaoyang = @"0";
        _guzhangweixiu = @"0";
        _suopei = @"0";
        _fangong = @"0";
        _lichangxuncha = @"0";
        _huanjingwendu = @"";
        _zhujipaiqiwendu1 = @"";
        _zhujipaiqiwendu2 = @"";
        _kongyajichukouwendu = @"";
        _shebeichukouyali = @"";
        _youqifenliqiyacha = @"";
        _kongqiguolvqijiancha = @"";
        _pinyouyali = @"";
        _liaozhouqijiancha = @"0";
        _dianyav = @"";
        _dianyas = @"";
        _dianyat = @"";
        _dianliuloadr = @"";
        _dianliuloads = @"";
        _dianliuloadt = @"";
        _dianliuunloadr = @"";
        _dianliuunloads = @"";
        _dianliuunloadt = @"";
        _madaqidongcishu = @"";
        _jiaxiezaicishu = @"";
        _diannaobanzongyunxingshijian = @"";
        _lengqueshui_jin = @"";
        _lengqueshui_chu = @"";
        _zhongjianlengqueqijianchab = @"";
        _zhongjianlengqueqijianchac = @"";
        _houbulengqueqijianchab = @"";
        _houbulengqueqijianchac = @"";
        _lengqueyoujianchab = @"";
        _lengqueyoujianchac = @"";
        _youhuxiqijiancha = @"0";
        _xiaoyinqijiancha1 = @"0";
        _paiyufajiancha = @"0";
        _ludianwendu = @"";
        _lpyali = @"";
        _hpyali = @"";
        _xiaoyinqijiancha2 = @"0";
        _shou_zi_paiwuceshi = @"0";
        _linjian1_name = @"";
        _linjian1_no = @"";
        _linjian1_qty = @"";
        _linjian2_name = @"";
        _linjian2_no = @"";
        _linjian2_qty = @"";
        _linjian3_name = @"";
        _linjian3_no = @"";
        _linjian3_qty = @"";
        _linjian4_name = @"";
        _linjian4_no = @"";
        _linjian4_qty = @"";
        _linjian5_name = @"";
        _linjian5_no = @"";
        _linjian5_qty = @"";
        _linjian6_name = @"";
        _linjian6_no = @"";
        _linjian6_qty = @"";
        _linjian7_name = @"";
        _linjian7_no = @"";
        _linjian7_qty = @"";
        _linjian8_name = @"";
        _linjian8_no = @"";
        _linjian8_qty = @"";
        _linjian9_name = @"";
        _linjian9_no = @"";
        _linjian9_qty = @"";
        _linjian10_name = @"";
        _linjian10_no = @"";
        _linjian10_qty = @"";
        _engineer1 = @"";
        _engineer2 = @"";
        _engineer3 = @"";
        _engineer4 = @"";
        _engineer5 = @"";
        _customer1_name = @"";
        _customer1_phone = @"";
        _customer1_email = @"";
        _customer2_name = @"";
        _customer2_phone = @"";
        _customer2_email = @"";
        _customer3_name = @"";
        _customer3_phone = @"";
        _customer3_email = @"";
        _qianming = nil;
        _sign_pic = nil;
        _isSigned = NO;
        _isUpload = NO;
    }
    return self;
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        _kehumingcheng = GetStringValueFromDicWithKey(dict, @"customer");
        _fuwudidian = GetStringValueFromDicWithKey(dict, @"place");
        _jiqixinghao = GetStringValueFromDicWithKey(dict, @"machine_model");
        _jiqixuhao = GetStringValueFromDicWithKey(dict, @"machine_serial");
        _changneibianhao = GetStringValueFromDicWithKey(dict, @"serial_number");
        _jianchariqi = GetStringValueFromDicWithKey(dict, @"date");
        _shiyongshijianzong = GetStringValueFromDicWithKey(dict, @"use_time_total");
        _shiyongshijianjiazai = GetStringValueFromDicWithKey(dict, @"use_time_load");
        _yalishedingmin = GetStringValueFromDicWithKey(dict, @"pressure_min");
        _yalishedingmax = GetStringValueFromDicWithKey(dict, @"pressure_max");
        _shebeichuchangriqi = GetStringValueFromDicWithKey(dict, @"produce_date");
        _dingqibaoyang = GetStringValueFromDicWithKey(dict, @"maintenance");
        _guzhangweixiu = GetStringValueFromDicWithKey(dict, @"repair");
        _suopei = GetStringValueFromDicWithKey(dict, @"claim");
        _fangong = GetStringValueFromDicWithKey(dict, @"rework");
        _lichangxuncha = GetStringValueFromDicWithKey(dict, @"inspection");
        _tableDate = GetStringValueFromDicWithKey(dict, @"tableDate");
        _tableName = GetStringValueFromDicWithKey(dict, @"table_sn");
        _device_sn = GetStringValueFromDicWithKey(dict, @"devcie_sn");
        _huanjingwendu = GetStringValueFromDicWithKey(dict, @"envior_temp");
        _zhujipaiqiwendu1 = GetStringValueFromDicWithKey(dict, @"exhaust_temp1");
        _zhujipaiqiwendu2 = GetStringValueFromDicWithKey(dict, @"exhaust_temp2");
        _kongyajichukouwendu = GetStringValueFromDicWithKey(dict, @"compressor_temp");
        _shebeichukouyali = GetStringValueFromDicWithKey(dict, @"machine_pressure");
        _youqifenliqiyacha = GetStringValueFromDicWithKey(dict, @"separator_pressure");
        _kongqiguolvqijiancha = GetStringValueFromDicWithKey(dict, @"filter_check");
        _pinyouyali = GetStringValueFromDicWithKey(dict, @"oil_pressure");
        _liaozhouqijiancha = GetStringValueFromDicWithKey(dict, @"coupling_check");
        _dianyav = GetStringValueFromDicWithKey(dict, @"voltage_v");
        _dianyas = GetStringValueFromDicWithKey(dict, @"voltage_s");
        _dianyat = GetStringValueFromDicWithKey(dict, @"voltage_t");
        _dianliuloadr = GetStringValueFromDicWithKey(dict, @"current_r_load");
        _dianliuloads = GetStringValueFromDicWithKey(dict, @"current_s_load");
        _dianliuloadt = GetStringValueFromDicWithKey(dict, @"current_t_load");
        _dianliuunloadr = GetStringValueFromDicWithKey(dict, @"current_r_unload");
        _dianliuunloads = GetStringValueFromDicWithKey(dict, @"current_s_unload");
        _dianliuunloadt = GetStringValueFromDicWithKey(dict, @"current_t_unload");
        _madaqidongcishu = GetStringValueFromDicWithKey(dict, @"motor_times");
        _jiaxiezaicishu = GetStringValueFromDicWithKey(dict, @"unload_times");
        _diannaobanzongyunxingshijian = GetStringValueFromDicWithKey(dict, @"pc_runs_times");
        _lengqueshui_jin = GetStringValueFromDicWithKey(dict, @"cool_temp_in");
        _lengqueshui_chu = GetStringValueFromDicWithKey(dict, @"cool_temp_out");
        _zhongjianlengqueqijianchab = GetStringValueFromDicWithKey(dict, @"between_cool_check_bar");
        _zhongjianlengqueqijianchac = GetStringValueFromDicWithKey(dict, @"between_cool_check_temp");
        _houbulengqueqijianchab = GetStringValueFromDicWithKey(dict, @"back_cool_check_bar");
        _houbulengqueqijianchac = GetStringValueFromDicWithKey(dict, @"back_cool_check_temp");
        _lengqueyoujianchab = GetStringValueFromDicWithKey(dict, @"cooloil_check_bar");
        _lengqueyoujianchac = GetStringValueFromDicWithKey(dict, @"cooloil_check_temp");
        _youhuxiqijiancha = GetStringValueFromDicWithKey(dict, @"airbreather_check");
        _xiaoyinqijiancha1 = GetStringValueFromDicWithKey(dict, @"mulffer_check");
        _paiyufajiancha = GetStringValueFromDicWithKey(dict, @"drain_check");
        _ludianwendu = GetStringValueFromDicWithKey(dict, @"dew_temp");
        _lpyali = GetStringValueFromDicWithKey(dict, @"LP_pressure");
        _hpyali = GetStringValueFromDicWithKey(dict, @"HP_pressure");
        _xiaoyinqijiancha2 = GetStringValueFromDicWithKey(dict, @"cool_mulffer_check");
        _shou_zi_paiwuceshi = GetStringValueFromDicWithKey(dict, @"drain_test");
        _linjian1_name = GetStringValueFromDicWithKey(dict, @"part1_name");
        _linjian1_no = GetStringValueFromDicWithKey(dict, @"part1_no");
        _linjian1_qty = GetStringValueFromDicWithKey(dict, @"part1_qty");
        _linjian2_name = GetStringValueFromDicWithKey(dict, @"part2_name");
        _linjian2_no = GetStringValueFromDicWithKey(dict, @"part2_no");
        _linjian2_qty = GetStringValueFromDicWithKey(dict, @"part2_qty");
        _linjian3_name = GetStringValueFromDicWithKey(dict, @"part3_name");
        _linjian3_no = GetStringValueFromDicWithKey(dict, @"part3_no");
        _linjian3_qty = GetStringValueFromDicWithKey(dict, @"part3_qty");
        _linjian4_name = GetStringValueFromDicWithKey(dict, @"part4_name");
        _linjian4_no = GetStringValueFromDicWithKey(dict, @"part4_no");
        _linjian4_qty = GetStringValueFromDicWithKey(dict, @"part4_qty");
        _linjian5_name = GetStringValueFromDicWithKey(dict, @"part5_name");
        _linjian5_no = GetStringValueFromDicWithKey(dict, @"part5_no");
        _linjian5_qty = GetStringValueFromDicWithKey(dict, @"part5_qty");
        _linjian6_name = GetStringValueFromDicWithKey(dict, @"part6_name");
        _linjian6_no = GetStringValueFromDicWithKey(dict, @"part6_no");
        _linjian6_qty = GetStringValueFromDicWithKey(dict, @"part6_qty");
        _linjian7_name = GetStringValueFromDicWithKey(dict, @"part7_name");
        _linjian7_no = GetStringValueFromDicWithKey(dict, @"part7_no");
        _linjian7_qty = GetStringValueFromDicWithKey(dict, @"part7_qty");
        _linjian8_name = GetStringValueFromDicWithKey(dict, @"part8_name");
        _linjian8_no = GetStringValueFromDicWithKey(dict, @"part8_no");
        _linjian8_qty = GetStringValueFromDicWithKey(dict, @"part8_qty");
        _linjian9_name = GetStringValueFromDicWithKey(dict, @"part9_name");
        _linjian9_no = GetStringValueFromDicWithKey(dict, @"part9_no");
        _linjian9_qty = GetStringValueFromDicWithKey(dict, @"part9_qty");
        _linjian10_name = GetStringValueFromDicWithKey(dict, @"part10_name");
        _linjian10_no = GetStringValueFromDicWithKey(dict, @"part10_no");
        _linjian10_qty = GetStringValueFromDicWithKey(dict, @"part10_qty");
        _engineer1 = GetStringValueFromDicWithKey(dict, @"engineer1");
        _engineer2 = GetStringValueFromDicWithKey(dict, @"engineer2");
        _engineer3 = GetStringValueFromDicWithKey(dict, @"engineer3");
        _engineer4 = GetStringValueFromDicWithKey(dict, @"engineer4");
        _engineer5 = GetStringValueFromDicWithKey(dict, @"engineer5");
        _customer1_name = GetStringValueFromDicWithKey(dict, @"customer1_name");
        _customer1_phone = GetStringValueFromDicWithKey(dict, @"customer1_phone");
        _customer1_email = GetStringValueFromDicWithKey(dict, @"customer1_mail");
        _customer2_name = GetStringValueFromDicWithKey(dict, @"customer2_name");
        _customer2_phone = GetStringValueFromDicWithKey(dict, @"customer2_phone");
        _customer2_email = GetStringValueFromDicWithKey(dict, @"customer2_mail");
        _customer3_name = GetStringValueFromDicWithKey(dict, @"icustomer3_named");
        _customer3_phone = GetStringValueFromDicWithKey(dict, @"customer3_phone");
        _customer3_email = GetStringValueFromDicWithKey(dict, @"customer3_mail");
        _guzhangxianxiang = GetStringValueFromDicWithKey(dict, @"NG_status");
        _guzhangchulimiaoshu = GetStringValueFromDicWithKey(dict, @"NG_repair");
        _jianyishixiang = GetStringValueFromDicWithKey(dict, @"propose");
        _opendocument = GetStringValueFromDicWithKey(dict, @"opendocument");
        _signdocument = GetStringValueFromDicWithKey(dict, @"signdocument");
        _closedocument = GetStringValueFromDicWithKey(dict, @"closedocument");
        _barcodeid = GetStringValueFromDicWithKey(dict, @"barcodeid");
        NSArray *array3 = [NSArray arrayWithObjects:_linjian1_name,_linjian1_no,_linjian1_qty,_linjian2_name,_linjian2_no,_linjian2_qty,_linjian3_name,_linjian3_no,_linjian3_qty,_linjian4_name,_linjian4_no,_linjian4_qty,_linjian5_name,_linjian5_no,_linjian5_qty,_linjian6_name,_linjian6_no,_linjian6_qty,_linjian7_name,_linjian7_no,_linjian7_qty,_linjian8_name,_linjian8_no,_linjian8_qty,_linjian9_name,_linjian9_no,_linjian9_qty,_linjian10_name,_linjian10_no,_linjian10_qty ,nil];
        
        _lingjianArray = array3 ;
        NSArray *array4 = [NSArray arrayWithObjects:_engineer1,_engineer2,_engineer3,_engineer4,_engineer5, nil];
        _gongchengshiArray = array4;
        NSString *str = GetStringValueFromDicWithKey(dict, @"sign_pic");
        NSData *data = [NSData dataWithBase64EncodedString:str];
        _qianming = data;
        _sign_pic = data;
        //        _qianming = GetStringValueFromDicWithKey(d, @"sign_pic");
        
        //        _qianming = nil;
        //        _sign_pic = nil;
        _isSigned = YES;
        _isUpload = YES;
    }
    return self;

}
@end
