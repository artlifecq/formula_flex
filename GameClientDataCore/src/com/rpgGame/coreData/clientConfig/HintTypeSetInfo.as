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
	public class HintTypeSetInfo
	{
		 /**  1:顶部滚动，2：快捷栏上方的提示，4：电视墙,7屏幕中间的；这些是程序提供的能够配置的，之后要加动态配置，请用100+ */
		public var type:int;
		 /**  备注，没啥鸟用，帮你们分辨类型的 */
		public var note:String;
		 /**  层级排序 */
		public var layerOrder:int;
		 /**  顺序插入 */
		public var sequenceInsert:int;
		 /**  宽度 */
		public var width:int;
		 /**  高度 */
		public var height:int;
		 /**  最大宽度 */
		public var maxWidth:int;
		 /**  项目宽度 */
		public var itemWidth:int;
		 /**  位置百分比比如居中就写0.5，如果是像素就写大于等于0的值 */
		public var posX:String;
		 /**  Y百分比，同上 */
		public var posY:String;
		 /**  最大显示数 */
		public var maxShowCount:int;
		 /**  最大保留数 */
		public var maxRetainsCount:int;
		 /**  第一页高度 */
		public var firstPageHeight:int;
		 /**  字体大小 */
		public var textSize:int;
		 /**  center:居中，left：左，right：右 */
		public var textAlign:String;
		 /**  默认颜色 */
		public var defaultColor:String;
		 /**  是否需要等待前面的东西播完，默认是不需要的，需要填1 */
		public var isWaitMsg:int;
		 /**  如果要显示背景，就把背景也放进去，背景会拉伸到前面设置的大小 */
		public var bg:String;
		 /**  项目背景 */
		public var itemBg:String;
		 /**  背景边距，格式：上;下;左;右 */
		public var bgMargin:String;
		 /**  停留时间，所有的时间都是毫秒级别的 */
		public var waitTime:int;
		 /**  显示过程的时间 */
		public var showTime:int;
		 /**  隐藏时间 */
		public var hideTime:int;
		 /**  每一次移动的像素距离 */
		public var textMoveFrameDis:int;
		 /**  文字移动方向，1、向上，2、向下，3、向左，4、向右 */
		public var showMoveDirection:int;
		 /**  文字移动方向，1、上，2、下，3、左，4、右 */
		public var hideMoveDirection:int;
		 /**  是否需要关闭按钮 */
		public var canClose:int;
		 /**  关闭按钮皮肤，可以在UI编辑器里面找到，把flexlite */
		public var closeBtnSkin:String;
		 /**  关闭按钮边距，格式：上;下;左;右 */
		public var closeBtnMargin:String;
		 /**  刷新间隔时间 */
		public var refreshInterval:int;

	}
}
		