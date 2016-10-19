package app.cmd {

    public class AnnoucementMessages {

        /**
         * 公告
         *
         * varint32 解析出来为id
         * String[] 所有的参数，按顺序排列，客户端如果检测到content中存在同一个名字的需要传入的参数使用同一个
         *
         * 读取方式:
         *      readVarint32(); // 解析成id
         *      while(isReadable()) {
         *          String param = readUTF();
         *      }
         */
        public static const S2C_WORLD_ANNOUCEMENT : String = "101_0";

    }
}