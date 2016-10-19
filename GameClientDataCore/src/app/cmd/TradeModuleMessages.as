package app.cmd {

    public class TradeModuleMessages {

        /**
         * 发送邀请请求给其他人, 当前不能正在交易, 且不能重复邀请同一个人. 且需等待服务器返回之后才能发邀请给其他人
         *
         * 附带
         *
         * varint64 对方id
         */
        public static const C2S_SEND_TRADE_INVITE : String = "16_1";

        /**
         * 邀请失败, 附带varint32 错误码
         *
         * 1. 对方不在线
         * 2. 你在交易中
         * 3. 对方在交易中
         * 4. 你之前已经邀请过对方了
         * 5. 对方设置拒绝所有交易请求
         * 6. 对方是别的联服的
         * 7. 距离过远
         */
        public static const S2C_SEND_TRADE_INVITE_FAIL : String = "16_1";

        /**
         * 邀请已发出, 等待对方回应. 客户端需要自己计时, 2分钟之内, 如果没有收到对方拒绝/同意的消息, 不能再发送邀请这个人的消息给服务器, 直接提示.
         * 2分钟后, 如果策划需要, 客户端自己弹出提示说对方没有回应邀请, 服务器不会再有消息说邀请过期. 之后可以再发邀请给他
         */
        public static const S2C_SEND_TRADE_INVITE_SUCCESS : String = "16_2";

        /**
         * 收到别人发过来的交易请求, 保留2分钟, 2分钟未响应就直接删掉此请求, 不要自动发送拒绝消息
         *
         * 附带
         *
         * varint64 对方id
         * varint32 对方等级
         * UTFBytes 对方名字
         */
        public static const S2C_RECEIVE_TRADE_INVITE : String = "16_3";

        /**
         * 设置成 自动拒绝所有交易请求. 自己还是可以发送邀请给别人
         *
         * 服务器没有返回, 客户端只需要发消息通知服务器就行
         */
        public static const C2S_SET_AUTO_REJECT_TO_TRUE : String = "16_2";

        /**
         * 不勾 自动拒绝所有交易请求, 别人可以给他发邀请.
         *
         * 服务器没有返回
         */
        public static const C2S_SET_AUTO_REJECT_TO_FALSE : String = "16_3";

        /**
         * 回复收到的交易请求, 客户端发出消息的时候就将请求从请求列表里删除, 不管结果如果, 肯定不能再回复一次了
         *
         * 如果回复是拒绝交易, 则服务器没有返回. 如果是同意交易, 则必须等待服务器返回才能继续操作其他的交易请求
         *
         * 如果是同意, 当自己在交易中时, 玩家点击了之后不要发送消息, 直接提示, 且不需要删除请求, 让玩家可以关掉现有的交易, 重新接受
         *
         * 附带
         *
         * varint64 对方id
         * boolean 是否同意交易
         */
        public static const C2S_REPLY_TRADE_INVITE : String = "16_4";

        /**
         * 接受交易邀请失败, 附带varint32 错误码
         *
         * 1. 你已经在交易中了
         * 2. 对方已经在交易中了
         * 3. 对方下线了
         * 4. 邀请过期了
         * 5. 距离过远
         */
        public static const S2C_ACCEPT_TRADE_FAIL : String = "16_4";

        /**
         * 交易同意成功, 紧接着马上会收到开始交易的消息S2C_START_TRADING
         * 收到后解回复交易的锁, 不需要提示什么
         */
        public static const S2C_ACCEPT_TRADE_SUCCESS : String = "16_5";

        /**
         * 开始交易, 弹出交易面板
         *
         * 附带交易对手的信息
         *
         * varint64 对方id
         * varint32 对方等级
         *
         * 后面方法改成通用方法
         * varint32 后面换装数据的长度
         * while(buffer.readable()){
         *      byte 换装资源
         * }
         *
         * UTFBytes 对方名字
         */
        public static const S2C_START_TRADING : String = "16_6";

        /**
         * 发出的邀请被对方拒绝后, 发邀请者会收到. 这时删掉邀请者的邀请对方的记录, 使邀请者可以再次发出对这人的邀请
         *
         * 附带
         *
         * varint64 对方id
         */
        public static const S2C_OTHER_REJECTED_TRADE : String = "16_7";

        /**
         * 发出的邀请, 对方同意了, 可是你正在交易中. 删掉邀请者邀请对方的记录, 使邀请者可以再邀请
         *
         * 附带
         *
         * varint64 对方id
         */
        public static const S2C_OTHER_ACCEPTED_BUT_YOU_ARE_IN_TRADE : String = "16_8";

        /**
         * 将物品放到交易栏上. 此时状态必须是正常交易状态
         *
         * 如果放到个已经有物品的格子, 则表示将那个物品撤下交易
         *
         * 已经在交易中的物品不要发过来
         *
         * 不能放已经过期的物品, 但可以放有时限但未过期的
         *
         * 附带
         *
         * varint32 要放到哪个交易格子 0-5
         * varint32 要从背包中哪个位置放东西上去
         * varint32 要放的物品的id (以防万一)
         */
        public static const C2S_SET_GOODS : String = "16_7";

        /**
         * 设置物品失败, 附带错误码
         *
         * 1. 交易格子非法, 必须是0-5
         * 2. 背包中那个位置没有物品 (这个不需要提示)
         * 3. 物品id和实际在那个位置的物品不符 (这个也不需要提示)
         * 4. 交易不在正常状态
         * 5. 你当前没有交易
         * 6. 该物品不能被交易 (绑定或已过期)
         * 7. 这个物品已经在交易中
         * 8. 背包中的格子非法, 必须是0-已开格子数
         */
        public static const S2C_SET_GOODS_FAIL : String = "16_15";

        /**
         * 放物品上去成功, 把收到消息的时候, 在之前消息中附带的格子中的物品, 放到消息中附带的交易格子中去. (未必是当时拖的那个物品, 可能这条消息之前客户端又收到了物品移动消息)
         * 必须是收到消息的时候, 那个格子里的物品放上交易
         *
         * 如果之前那个格子里已经有物品, 则将那个物品下交易, 并解除那物品正在交易状态
         */
        public static const S2C_SET_GOODS_SUCCESS : String = "16_16";

        /**
         * 交易对方放上了物品
         *
         * 附带
         *
         * varint32 那个交易格子
         * byteArray.readBytes(byteArray.availableBytes) 物品动态数据
         */
        public static const S2C_OTHER_SET_GOODS : String = "16_17";

        /**
         * 将已放上交易的物品拿下, 必须是在正常交易状态时发送
         *
         * 附带
         *
         * varint32 交易格子 0-5
         */
        public static const C2S_REMOVE_GOODS : String = "16_8";

        /**
         * 拿下物品失败, 附带varint32 错误码
         *
         * 1. 格子非法, 必须是0-5
         * 2. 你当前没有交易
         * 3. 交易不在正常状态
         * 4. 那个位置没有物品 (不需要提示)
         */
        public static const S2C_REMOVE_GOODS_FAIL : String = "16_18";

        /**
         * 拿下物品成功, 没有附带信息, 客户端自己把之前消息里附带的位置的物品拿下交易, 解锁此物品
         */
        public static const S2C_REMOVE_GOODS_SUCCESS : String = "16_19";

        /**
         * 对方拿下了某个交易的物品
         *
         * 附带
         *
         * varint32 交易格子 0-5
         */
        public static const S2C_OTHER_REMOVE_GOODS : String = "16_20";

        /**
         * 锁定. 必须是正常交易状态
         *
         * 没有附带的信息
         */
        public static const C2S_LOCK : String = "16_9";

        /**
         * 锁定失败, 附带varint32 错误码
         *
         * 1. 当前不是正常状态
         * 2. 当前没有交易
         */
        public static const S2C_LOCK_FAIL : String = "16_21";

        /**
         * 锁定成功. 如果对方也是锁定成功状态, 则切为双方都锁定状态, 不然则切为自己已锁定状态
         *
         * 没有附带的信息
         */
        public static const S2C_LOCK_SUCCESS : String = "16_22";

        /**
         * 对方已锁定. 如果自己也是锁定成功状态, 则切为双方都锁定状态, 不然自己还在正常状态, 将对方设为已锁定
         *
         * 没有附带的信息
         */
        public static const S2C_OTHER_LOCKED : String = "16_23";

        /**
         * 确认交易. 在双方都锁定状态下可发, 自己已确认时, 不能再发
         *
         * 这条消息可以不会收到专门的返回, 可能收到取消交易S2C_CANCEL_TRADE的消息
         *
         * 没有附带信息
         */
        public static const C2S_CONFIRM : String = "16_10";

        /**
         * 确认失败
         *
         * 1. 你当前没有交易
         * 2. 交易不在双方都锁定状态 (或者你已经确认)
         */
        public static const S2C_CONFIRM_FAIL : String = "16_24";

        /**
         * 确认成功. 就算双方都已确认, 都不要关闭交易框, 等服务器后续通知
         *
         * 没有附带的信息
         */
        public static const S2C_CONFIRM_SUCCESS : String = "16_25";

        /**
         * 对方已确认. 就算双方都已确认, 都不要关闭交易框, 等服务器后续通知
         *
         * 没有附带的信息
         */
        public static const S2C_OTHER_CONFIRM : String = "16_26";

        /**
         * 取消交易, 在交易的任何阶段都可能会收到, 就算两边都已确认成功. 收到后关闭交易框, 并解锁所有上交易物品
         *
         * 附带varint32 原因
         *
         * 1. 自己银两不足以交易
         * 2. 自己金子不足以交易
         * 3. 自己背包格子不够
         * 4. 对方银两不足以交易
         * 5. 对方金子不足以交易
         * 6. 对方背包格子不够
         * 7. 自己取消了交易
         * 8. 对方取消了交易
         * 9. 对方下线了
         * 10. 自己银两超过负荷
         * 11. 自己金子超过负荷
         * 12. 对方银两超过负荷
         * 13. 对方金子超过负荷
         * 14. 数据错误
         */
        public static const S2C_CANCEL_TRADE : String = "16_27";

        /**
         * 客户端请求取消交易, 任何时间都可以发送
         *
         * 没有附带的信息
         */
        public static const C2S_CANCEL : String = "16_11";

        /**
         * 请求取消交易失败
         * 当前没有交易
         */
        public static const S2C_CANCEL_FAIL : String = "16_28";

        /**
         * 拒绝当前收到的所有交易请求, 没有返回消息
         *
         * 没有附带信息
         */
        public static const C2S_REJECT_ALL_TRADE : String = "16_12";

        /**
         * 交易成功, 关闭交易面板. 交易提示里获得的银两/金子/获得的物品由客户端自己计算, 仅提示玩家, 这条消息不要改变玩家的银两和金子数
         * 服务器会另外发送改变银两和金子的消息
         *
         * 收到后把自己放上交易的格子里的物品删除
         *
         * 附带
         *
         * while(byteArray.available)
         *      varint32 每个交易得到的物品前往的背包格子 (物品的顺序是对方交易过来的物品顺序, 从0-5, 如果是空, 服务器会跳过)
         *
         * 如果收到的格子数少于交易过来的物品数, 则就只从前开始移消息中附带的物品个数到背包中. 对方交易来的后面的那些物品不显示. 服务器会另外用邮件发送
         */
        public static const S2C_TRADE_SUCCESS : String = "16_29";

        /**
         * 和交易银两类似, 和之前设的值有变化才发消息
         *
         * 附带
         *
         * varint32 铜钱数
         */
        public static const C2S_SET_MONEY : String = "16_13";

        /**
         * 设置铜钱失败, 附带varint32错误码
         *
         * 1. 你当前没在交易
         * 2. 你没那么多铜钱
         * 3. 不在正常状态
         //     * 4. 最少要放2铜钱
         */
        public static const S2C_SET_MONEY_FAIL : String = "16_30";

        /**
         * 设置铜钱成功, 将自己的铜钱框设为之前请求里附带的值
         *
         * 没有附带信息
         */
        public static const S2C_SET_MONEY_SUCCESS : String = "16_31";

        /**
         * 交易对手设置了铜钱数, 收到服务器主动推送的提示
         *
         * 附带
         *
         * varint32 铜钱数
         */
        public static const S2C_OTHER_SET_MONEY : String = "16_32";

    }
}