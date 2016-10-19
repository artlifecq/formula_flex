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
	public class HintTypeSetInfo
	{
		 /**  1:顶部滚动，2：快捷栏上方的提示，4：电视墙,7屏幕中间的；这些是程序提供的能够配置的，之后要加动态配置，请用100+ */
		public var type:int;
		 /**  备注，没啥鸟用，帮你们分辨类型的 */
		public var note:String;
		 /**  宽度 */
		public var width:int;
		 /**  高度 */
		public var height:int;
		 /**  位置百分比比如居中就写0.5，如果是像素就写大于等于0的值 */
		public var posX:Number;
		 /**  Y百分比，同上 */
		public var posY:Number;
		 /**  最显示数 */
		public var maxShowNumber:int;
		 /**  字体大小 */
		public var textSize:int;
		 /**  center:居中，left：左，right：右 */
		public var textAlign:String;
		 /**  默认颜色 */
		public var defaultColor:String;
		 /**  是否需要等待前面的东西播完，默认是不需要的，需要填1 */
		public var isWaitMsg:Boolean;
		 /**  如果要显示背景，就把背景也放进去，背景会拉伸到前面设置的大小 */
		public var bg:String;
		 /**  停留时间，所有的时间都是毫秒级别的 */
		public var waitTime:int;
		 /**  1:向下2：向上 */
		public var boxMoveType:int;
		 /**  0:没有移动的，1：从左到右，2：从右到左，3：从下到上，4：从上到下(如果配没有移动后面的属性都不会生效) */
		public var showHintType:int;
		 /**  显示过程的时间 */
		public var showTime:int;
		 /**  显示时移动的距离 */
		public var showDis:int;
		 /**  0:没有移动的，1：从左到右，2：从右到左，3：从下到上，4：从上到下(如果配没有移动后面的属性都不会生效) */
		public var hideHintType:int;
		 /**  隐藏时间 */
		public var hideTime:int;
		 /**  移除时移动的距离 */
		public var hideDis:int;
		 /**  字体是否移动(字体移动互斥停留时间，如果是要字体移动，那肯定就不支持停留多久消失了，必须要把文字播放完) */
		public var textIsMove:Boolean;
		 /**  字体每一次移动的距离 */
		public var textMoveFrameDis:int;
		 /**  文字移动方向是不是向左的 */
		public var textMoveDirIsToLeft:Boolean;
		 /**  单条提示显示多少次（只有滚动的才能支持这个属性） */
		public var oneHintShowTimes:int;
		 /**  是否需要关闭按钮 */
		public var canClose:Boolean;
		 /**  关闭按钮宽度 */
		public var closeBtnWidth:int;
		 /**  关闭按钮高度 */
		public var closeBtnHeight:int;
		 /**  关闭按钮皮肤，可以在UI编辑器里面找到，把flexlite */
		public var closeBtnSkin:String;
		 /**  刷新时间 */
		public var updateTime:int;

	}
}
		