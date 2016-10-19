package com.rpgGame.coreData.info.task.target
{
	/**
	 *
	 * 分层剧情任务
	 * @author zgd
	 * 创建时间：2014-9-12 下午4:56:47
	 * 
	 */
	public class TaskTargetLayerStory extends BaseTaskTargetInfo
	{
		/**
		 *  触发进入的场景的id
		 */
		public var sceneId:int;
		/**
		 * 触发进入的场景的X坐标
		 */
		public var startX:int;
		/**
		 * 触发进入的场景的Y坐标
		 */
		public var startY:int;
		/**
		 * 触发进入的场景中心点的左右宽度
		 */
		public var endX:int;
		/**
		 * 触发进入的场景中心店的上下高度
		 */
		public var endY:int;
		/**
		 * 追踪面板显示的内容
		 */
		public var content:String;
		
		public function get centerX():int
		{
			return (endX - startX)/2 + startX;
		}
		
		public function get centerY():int
		{
			return (endY - startY)/2 + startY;
		}
		
		public function TaskTargetLayerStory()
		{
			super();
		}
	}
}
