package app.cmd {

    public class EquipmentModuleMessages {

        /**
         * 请求打造装备
         * 发送该消息加锁，在未收到S2C_BUILD_EQUIPMENT或S2C_BUILD_EQUIPMENT_FAIL的一定时间内一直保持该锁
         *
         * varint32 装备id
         * varint32 材料等级数量
         * for(i->材料等级数量){
         *      varint32 材料i等级
         * }
         *
         * bool 是否使用银两代替绑银, true 使用银两代替，false 不使用银两代替
         *
         * for(buffer.readable()){
         *      varint32 背包中的位置
         *      varint32 物品的数量
         * }
         */
        public static const C2S_BUILD_EQUIPMENT : String = "6_1";

        /**
         * 装备打造成功，客户端将物品放到背包格子上
         * 解锁
         *
         * varint32 背包位置
         * bytes GoodsProto
         */
        public static const S2C_BUILD_EQUIPMENT : String = "6_2";

        /**
         * 装备打造失败，返回varint32错误码
         * 解锁
         *
         * 1. 背包空位不足
         * 2. 装备不存在，无法打造
         * 3. 服务器bug
         * 4. 物品不够
         * 5. 物品位置非法
         * 6. 银两不够
         * 7. 装备无法打造
         */
        public static const S2C_BUILD_EQUIPMENT_FAIL : String = "6_3";

        /**
         * 装备打造成功广播
         *
         * varint32 装备id
         * varint32 装备品质(Quality)
         * varint32 装备评价(Evaluate)
         * varint64 打造者的id
         * bytes 打造者的名字
         */
        public static const S2C_BUILD_EQUIPMENT_BROADCAST : String = "6_4";

        /**
         * 装备合成
         *
         * 锁定，在此期间不要发送合成消息了
         *
         * bool 是否使用银两代替绑银, true 使用银两代替，false 不使用银两代替
         *
         * varint32 中间装备在背包中的位置
         *
         * for(buffer.readable()){
         *      varint32 四周的装备在背包中的位置
         * }
         */
        public static const C2S_COMBINE_EQUIPMENT : String = "6_5";

        /**
         * 装备合成完成，可能没有合成出物品
         *
         * 解锁
         *
         * varint32 装备在背包中的位置
         *
         * boolean 合成成功
         *
         * if(合成成功){
         *      合成成功，客户端将新的装备覆盖旧的装备，并且根据需要进行提示
         *      bytes GoodsProto
         * } else {
         *      合成失败
         *      boolean 装备是否绑定
         * }
         */
        public static const S2C_COMBINE_EQUIPMENT : String = "6_6";

        /**
         * 装备合成失败，返回varint32错误码
         *
         * 解锁
         *
         * 1. 物品位置非法
         * 2. 物品不是装备
         * 3. 装备无法合成
         * 4. 银两不足
         * 5. 物品不足
         * 6. 不在一个有效等级段内
         * 7. 服务器bug
         */
        public static const S2C_COMBINE_EQUIPMENT_FAIL : String = "6_7";

        /**
         * 材料合成
         *
         * varint32 材料合成id[CombineDataProto.id]
         *
         * varint32 合成材料数量
         *
         * UpgradeProto 材料合成需要的消耗[CombineDataProto.upgrade_data]
         */
        public static const C2S_COMBINE_MATERIAL : String = "6_10";

        /**
         * 合成完成
         *
         * boolean true[合成成功] / false[合成失败]
         *
         * if(合成成功){
         *      varint32 合成后的id
         *      varint32 数量
         * }
         */
        public static const S2C_COMBINE_MATERIAL : String = "6_11";

        /**
         * 合成失败，返回varint32错误码
         *
         * 1. 无法合成
         * 2. 合成数量非法
         * 3. 背包格子不够
         * 4. 物品不够
         * 5. 物品位置非法
         * 6. 银两不足
         */
        public static const S2C_COMBINE_MATERIAL_FAIL : String = "6_12";

        /**
         * 请求升星
         *
         * varint32 升星id
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         * varint32 容器位置
         * varint32 升星的装备[防止在此期间变动]
         *
         * UpgradeProto 升星所需要的消耗
         */
        public static const C2S_REFINE_EQUIPMENT : String = "6_15";

        /**
         * 升星完成，将该物品覆盖上去
         *
         * if(!buffer.readable()){
         *      什么都没变
         *      return;
         * }
         *
         * varint32 value
         *     容器类型：
         *     if(容器类型=MOUNT_EQUIPMENT){
         *         (坐骑第几个槽位 << 8) | ContainerType
         *     } else if(容器类型=STORAGE){
         *         如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *         (npcId << 8) | ContainerType
         *     } else {
         *         ContainerType
         *     }
         * varint32 容器位置
         * bytes 降星后的装备，解析成GoodsProto，客户端自己去判断是升星还是降星
         */
        public static const S2C_REFINE_EQUIPMENT : String = "6_16";

        /**
         * 升星失败，返回varint32错误码
         *
         * 1. 该升星未找到
         * 2. 容器类型非法
         * 3. 装备位置非法
         * 4. 要升星的装备没有找到
         * 5. 装备没找到
         * 6. 升星跟装备的星级不匹配
         * 7. 物品不够
         * 8. 物品位置非法
         * 9. 银两不足
         */
        public static const S2C_REFINE_EQUIPMENT_FAIL : String = "6_17";

        /**
         * 装备拆解
         *
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         * varint32 装备位置
         * varint32 装备id，防止拆解错误
         * bool 使用银两替代绑银
         */
        public static const C2S_DESTROY_EQUIPMENT : String = "6_20";

        /**
         * 拆解成功
         *
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         * varint32 装备位置
         * varint32 装备id
         *
         * while(readable()){
         *      varint32 拆解后的材料的id
         *      varint32 拆解后的材料的数量
         * }
         */
        public static const S2C_DESTROY_EQUIPMENT : String = "6_21";

        /**
         * 拆解失败，返回varint32错误码
         *
         * 1. 容器类型非法
         * 2. 装备位置非法
         * 3. 要拆解的物品不是装备
         * 4. 要拆解的装备没有找到
         * 5. 该装备无法拆解
         * 6. 该星级的装备无法拆解
         * 7. 银两不足
         * 8. 背包空间不足
         * 9. 服务器bug
         */
        public static const S2C_DESTROY_EQUIPMENT_FAIL : String = "6_22";

        /**
         * 名将改造
         *
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         * varint32 装备所在位置
         * varint32 装备id[防止发错]
         *
         * varint32 改造id
         * UpgradeProto 改造的消耗需要的数据
         */
        public static const C2S_CHANGE_EQUIPMENT_GENERAL : String = "6_25";

        /**
         * 改造成功
         *
         * if(!buffer.readable()){
         *      改造没有任何变化，客户端提示，套装属性什么的都不会变化
         *      return;
         * }
         *
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         * varint32 装备所在位置
         * bytes GoodsProto 改造后的装备
         *
         */
        public static const S2C_CHANGE_EQUIPMENT_GENERAL : String = "6_26";

        /**
         * 改造失败，返回varint32错误码
         *
         * 1. 改造没找到
         * 2. 该装备无法改造
         * 3. 容器类型非法
         * 4. 装备位置非法
         * 5. 不是装备
         * 6. 物品不够
         * 7. 钱不够
         * 8. 装备未找到
         */
        public static const S2C_CHANGE_EQUIPMENT_GENERAL_FAIl : String = "6_27";

        /**
         * 升星套变化了
         *
         * varint32 升星套id[0表示没有套装了]
         */
        public static const S2C_REFINE_TAOZ_CHANGED : String = "6_40";

        /**
         * 品质套变化了
         *
         * varint32 品质套id[0表示没有套装了]
         */
        public static const S2C_QUALITY_TAOZ_CHANGED : String = "6_41";

    }
}