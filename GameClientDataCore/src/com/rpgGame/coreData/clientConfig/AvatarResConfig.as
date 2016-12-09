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
	public class AvatarResConfig
	{
		 /**  资源id */
		public var id:int;
		 /**  资源名称 */
		public var name:String;
		 /**  资源路径 */
		public var res:String;
		 /**  半身像遮罩，格式：x=y=s */
		public var dialogFaceMask:String;
		 /**  头像遮罩，格式：x=y=s */
		public var headFaceMask:String;
		 /**  基础行走动作速度 */
		public var baseWalkActionSpeed:int;
		 /**  混合材质名 */
		public var blendMaterialName:String;
		 /**  混合贴图 */
		public var blendTexture:String;
		 /**  混合遮罩贴图 */
		public var blendMaskTexture:String;
		 /**  混合还原遮罩贴图 */
		public var blendRestoreMaskTexture:String;
		 /**  是否使用体积 */
		public var useVolume:Boolean;
		 /**  待机特效 */
		public var idleEffect:String;

	}
}
		