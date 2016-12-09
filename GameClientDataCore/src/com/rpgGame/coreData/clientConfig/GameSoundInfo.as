package com.rpgGame.coreData.clientConfig
{
	/**
	* 
	*  根据模块config 文件设置自动生成的代码
	*	
	* 【**不可手动修改此类**】，
	*	
	* 【任何修改都将被生成工具覆盖，如需修改请直接修改具体的config文件】
	* @author NEIL
	* 
	*/
	public class GameSoundInfo
	{
		 /**  类型_ID(2＿系统音效,11_国战守方音效,12_国战攻方音效) */
		public var id:String;
		 /**  是否广播(填0和1) */
		public var isBroadcast:int;
		 /**  播放次数 */
		public var repeat:int;
		 /**  播放时长(有播放次数就不要它了) */
		public var playTime:int;
		 /**  (音乐文件名)多个音效用;分格 */
		public var soundNames:String;
		 /**  行为含义 */
		public var des:String;
		 /**  播放几率，100表示必播 */
		public var playChance:int;
		 /**  音量0-100,默认50 */
		public var volume:int;

	}
}
		