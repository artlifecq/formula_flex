package com.rpgGame.statistics
{
    import com.gameClient.utils.HttpUtil;
    import com.rpgGame.coreData.cfg.ClientConfig;
    
    import flash.system.Capabilities;
    import flash.utils.Dictionary;

    public class Statistics
    {
        public static const intance : Statistics = new Statistics();
        
        // nodeId
        
        private var nodeInfoList : Dictionary = new Dictionary();
        
        public function Statistics()
        {
            // init node info nodeInfoList[nodeInfo.id] = nodeInfo
        }
        
        public function pushNode(nodeId : int) : void {
            if(ClientConfig.isDebug)return;
            var nodeInfo : NodeInfo = this.nodeInfoList[nodeId];
            if (null == nodeInfo) {
                return;
            }
            var params : Dictionary = new Dictionary();
            params["game"] = ClientConfig.gameName;
            params["logType"] = nodeInfo.desc;
            params["os"] = Capabilities.os;
            params["nodeId"] = nodeInfo.id + "";
            params["platformName"] = ClientConfig.agent;
            params["browser"] = ClientConfig.browser;
            params["account"] = ClientConfig.loginName;
            params["resolution"] = Capabilities.screenResolutionX + "X" + Capabilities.screenResolutionY;
            params["serverId"] = ClientConfig.loginAreaId;
            params["ip"] = ClientConfig.clientIp;
            params["time"] = (new Date()).getTime();
            HttpUtil.doGet("http://front.moloong.com/front-node/node", params);
        }
    }
}