package app.cmd {

    public class AchievementAndNickNameModuleMessages {

        /**
         * 获得新的成就
         * varint32 成就id
         *
         * 客户端根据成就id找到成就，将这个成就以下的所有成就设置为已完成（包括这个成就）
         *
         * 比如这个成就是升到30级，那么客户端自己将升到20级，升到10级，这2个成就设置为已完成
         */
        public static const S2C_NEW_ACHIEVEMENT : String = "45_41";

        /**
         * 更新成就进度
         * varint32 成就类型
         * varint64 进度
         *
         * 根据这个成就类型，更新这个类型的所有成就的进度
         *
         * 比如有升级30级成就，和升到40级成就，更新进度为20，则所有的升级成就都更新进度为20
         */
        public static const S2C_UPDATE_ACHIEVEMENT_PROGRESS : String = "45_42";

        /**
         * 获得新的称号
         * varint32 称号id
         */
        public static const S2C_NEW_NICKNAME : String = "45_43";

        /**
         * 使用称号
         * varint32 称号id，0表示取消称号
         */
        public static const C2S_USE_NICKNAME : String = "45_44";

        /**
         * 使用称号成功
         * varint32 称号id，0表示取消称号
         */
        public static const S2C_USE_NICKNAME : String = "45_45";

        /**
         * 使用称号失败，附带byte错误码
         * 1、称号未激活
         */
        public static const S2C_USE_NICKNAME_FAIL : String = "45_46";

        /**
         * 移除一个称号，这个称号以后都不能再使用，就当英雄没有获得过这个称号
         * varint32 称号id
         *
         * 移除的如果是当前正在使用的称号，客户端不需要处理，服务器会发消息处理
         */
        public static const S2C_REMOVE_NICKNAME : String = "45_47";

        /**
         * 更新成就点数
         * varint32 point成就点数
         */
        public static const S2C_UPDATE_ACHIEVEMENT_POINT : String = "45_48";

    }
}