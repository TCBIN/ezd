//
//  URLMacro.h
//  VictorOC
//
//  Created by WebUser on 17/3/1.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#ifndef URLMacro_h
#define URLMacro_h

#ifdef DEBUG // 调试状态
#define BaseURL          @"http://www.yao7pei.com/AppApi/"
#else // 发布状态
#define BaseURL          @"http://www.yao7pei.com/AppApi/"
#endif

/**加载分页数据条数*/
#define KPageSize10 10
#define KPageSize5  5

//homeURL
#define HomeSpliceUrl    @"ad/getSlide"
#define HomeListUrl      @"ad/getLocalService" //?area_id=441900&limit=5


#endif /* URLMacro_h */
