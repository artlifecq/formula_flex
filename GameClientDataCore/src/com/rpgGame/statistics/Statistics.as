package com.rpgGame.statistics
{
    import com.gameClient.utils.HttpUtil;
    import com.rpgGame.coreData.cfg.ClientConfig;
    
    import flash.system.Capabilities;
    import flash.utils.Dictionary;

    public class Statistics
    {
		//loader加载
		public static const STEP_LOADER:int=1;
		//启动部分
		/**启动添加到舞台**/
		public static const STEP_CLIENT:int=100;
		/**3D环境检测成功**/
		public static const STEP_ENGINE_OK:int=101;
		//===加载部分
		/**开始加载资源**/
		public static const STPE_START_LOAD_RES:int=110;
		/**屏蔽字库加载完成**/
		public static const STEP_LOAD_WORD:int=111;
		/**服务器链接成功**/
		public static const STEP_CONNECT:int=112;
		/**创角成功**/
		public static const STEP_CREATE_CHAR:int=113;
		/**加载创角资源成功**/
		public static const STEP_LOAD_CREAT_RES:int=118;
		/**压测随机名字成功**/
		public static const STEP_RANDOM_NAME:int=114;
		/**DLL加载成功**/
		public static const STEP_LOAD_DLL:int=115;
		/**公共ui加载成功**/
		public static const STEP_PUBLIC_UI:int=116;
		/**字体加载成功**/
		public static const STEP_LOAD_FONT:int=117;
		/**欢迎ui加载成功**/
		public static const STEP_LOAD_WELCOME:int=119;
		//加载完成部分
		/**玩家登陆成功**/
		public static const STEP_LOGIN_SUCCESS:int=130;
		/**获取到主玩家数据**/
		public static const STEP_MAIN_PLAYER_DATA:int=131;
		/**成功进入游戏主入口**/
		public static const STEP_MAIN_ENTRY:int=132;
		//加载配置
		/**加载游戏配置成功**/
		public static const STEP_LOAD_CONFIG:int=133;
		/**首次切换地图**/
		public static const STEP_FISRT_CHANGE_MAP:int=134;
		//首次进地图
		/**首次加载地图cfg配置数据完成**/
		public static const STPE_LOAD_MAP_CFG:int=135;
		/**首次加载场景awd完成**/
		public static const STPE_LOAD_MAP_AWD:int=136;
		/**首次加载地图dat数据完成**/
		public static const STEP_LOAD_MAP_DAT:int=137;
		/**首次发送加载完成消息**/
		public static const STEP_SEND_LOAD_MAP_COMPLETE:int=138;
		/**首次登陆成功进入场景**/
		public static const STEP_ENTER_MAP:int=139;
		/**首次点击开始游戏**/
		public static const STEP_CLICK_START:int=140;
		
		//手动关闭
		/**手动关闭**/
		public static const STEP_MANUAL_CLOSE:int=200;
		/**无法连接服务器**/
		public static const STEP_CANT_CONNECT:int=201;
		/**硬件加速失败**/
		public static const STEP_HARD_DRIVE_ERROR:int=202;
		/**显卡配置太低**/
		public static const STEP_XCARD_ERROR:int=203;
        public static const intance : Statistics = new Statistics();
        
        // nodeId
        
        private var nodeInfoList : Dictionary = new Dictionary();
        
        public function Statistics()
        {
            // init node info nodeInfoList[nodeInfo.id] = nodeInfo
//			nodeInfoList[STEP_CLIENT]="启动添加到舞台";
//			nodeInfoList[STEP_LOAD_WORD]="加载屏蔽字库";
//			nodeInfoList[STEP_CONNECT]="链接服务器";
//			nodeInfoList[STEP_CREATE_CHAR]="创角成功";
//			nodeInfoList[STEP_RANDOM_NAME]="改名成功";
//			nodeInfoList[STEP_LOAD_DLL]="加载dll成功";
//			nodeInfoList[STEP_PUBLIC_UI]="加载公共资源成功";
//			nodeInfoList[STEP_LOAD_FONT]="加载字体";
			
		}	
        public function pushNode(nodeId : int,tip:String="") : void {
  //          if(!ClientConfig.isRelease)return;
//            var nodeInfo : NodeInfo = this.nodeInfoList[nodeId];
//            if (null == nodeInfo) {
//                return;
//            }
            var params : Dictionary = new Dictionary();
            params["game"] = ClientConfig.isRelease?ClientConfig.gameName:"xqj";
            //params["logType"] = nodeInfo.desc;
            params["os"] = Capabilities.os;
            params["nodeId"] = nodeId+ "";
            params["platformName"] = ClientConfig.agent;
            params["browser"] = ClientConfig.browser;
            params["account"] = ClientConfig.loginName;
            params["resolution"] = Capabilities.screenResolutionX + "X" + Capabilities.screenResolutionY;
            params["serverId"] = ClientConfig.isRelease?ClientConfig.loginAreaId:"30001";
            params["ip"] = ClientConfig.clientIp;
            params["time"] = (new Date()).getTime();
			if (ClientConfig.isRelease) 
			{
				HttpUtil.doGet("http://front.moloong.com/front-node/node", params);
			}
			else
			{
				HttpUtil.doGet("http://192.168.5.178:8080/front-node/node", params);
			}
        }
    }
}