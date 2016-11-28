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
	public class ClientSceneNPC
	{
		 /**  怪物ID */
		public var id:uint;
		 /**  名字 */
		public var name:String;
		 /**  换装资源(穿的衣服资源名) */
		public var avatarRes:String;
		 /**  场景ID */
		public var sceneID:uint;
		 /**  出生坐标点(按=分隔XY按;分割点) */
		public var bornPos:String;
		 /**  生成数量 */
		public var bornCount:uint;
		 /**  尺寸倍率 */
		public var sizeScale:uint;
		 /**  是否动态创建 */
		public var isDynamicCreate:Boolean;
		 /**  绑定NPC模板ID */
		public var bindNpcModelId:int;
		 /**  远离视野是否显示 */
		public var needInViewDist:Boolean;

	}
}
		