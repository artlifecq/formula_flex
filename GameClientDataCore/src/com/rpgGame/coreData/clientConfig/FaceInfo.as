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
	public class FaceInfo
	{
		 /**  对应mainui/face目录下的表情 */
		public var key:String;
		 /**  表情对应的tips */
		public var value:String;
		 /**  对应的皮肤类(程序生成，不需要填写) */
		public var faceClass:Class;
		 /**  表情类型，单张图片/静态:jpg 动态表情:movieClip */
		public var type:String;
		 /**  用于排序的 */
		public var index:int;
		 /**  表情标识符 */
		public var str:String;

	}
}
		