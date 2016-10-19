package com.rpgGame.coreData.clientConfig
{
	/**
	* 
	*  根据模块config 文件设置自动生成的代码
	*	
	* 【**不可手动修改此类**】，
	*	
	* 【任何修改都将被生成工具覆盖，如需修改请直接修改具体的config文件】
	* @author fly.AutoUICreater
	* @modifier L.L.M.Sunny
	* 修改时间：2015-7-2 上午10:05:12
	* 
	*/
	public class SceneSoundInfo
	{
		 /**  类型(环境音效填0,场景地板音效填1) */
		public var type:uint;
		 /**  名字(可不填) */
		public var name:String;
		 /**  场景坐标点(按,分隔XY) */
		public var pos:String;
		 /**  场景ID */
		public var sceneID:uint;
		 /**  声源范围(即距主角多远,开始听到声音,默认200) */
		public var soundRange:uint;
		 /**  触发格子(格子XY,用,号分隔,;分隔多个格子) */
		public var tiles:String;

	}
}
		