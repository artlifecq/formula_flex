package com.rpgGame.app.ui.main.task
{
	import com.rpgGame.core.ui.SkinUI;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.dailyTaskEventTrack.trackItem.TaskBarSkin;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	/**
	 * 夺经、刺探、运镖任务追踪栏 
	 * 控制面板显示隐藏用
	 * @author 陈鹉光
	 */	
	public class TaskEventTrackPanel extends SkinUI
	{
		/** 缓动时间 **/
		private static const FOLD_TIME:Number = 1;
		/** 当前skin **/
		private var taskSkin:TaskBarSkin;
		/** 任务子面板容器 **/
		private var taskSprite:Sprite;
		/** 子面板 **/
		private var trackTaskPanel:TaskTrackPanel;
		/** 缓动 **/
		private var _tweenLiteToFold:TweenLite;
		
		public function TaskEventTrackPanel()
		{
			taskSkin = new TaskBarSkin();
			super( taskSkin );
			init();
		}
		
		private function init():void
		{
			taskSprite = new Sprite();
			addChild(taskSprite);
			addChild( taskSkin.btnBig );
			addChild( taskSkin.btnSmall );
			
			trackTaskPanel = new TaskTrackPanel();
			trackTaskPanel.x = 7;
			trackTaskPanel.y = -7;
			taskSprite.addChild( trackTaskPanel ); 
		}
		
		/**
		 * 布局 
		 * @param sWidth
		 * @param sHeight
		 * 
		 */		
		public function resize(sWidth:int, sHeight:int):void
		{
			if( _tweenLiteToFold )
			{
				_tweenLiteToFold.kill();
				_tweenLiteToFold = null;
			}
			
			x = sWidth - taskSkin.width;
			y = sHeight;
		}
		
		/**
		 * 关闭界面 
		 * 
		 */		
		private function tweenToClose():void
		{
			if( _tweenLiteToFold )
				_tweenLiteToFold.kill();
			
			_tweenLiteToFold = TweenLite.to( taskSprite, FOLD_TIME,{ x:trackTaskPanel.width, alpha:0 } );
		}
		
		/**
		 * 打开界面 
		 * 
		 */		
		private function tweenToOpen():void
		{
			if( _tweenLiteToFold )
				_tweenLiteToFold.kill();
			_tweenLiteToFold = TweenLite.to( taskSprite, FOLD_TIME,{ x:trackTaskPanel.x - 7, alpha:1 } );
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch( target )
			{
				case taskSkin.btnBig:
					tweenToOpen();
					taskSkin.btnBig.visible = false;
					taskSkin.btnSmall.visible = true;
					break;
				
				case taskSkin.btnSmall:
					tweenToClose();
					taskSkin.btnBig.visible = true;
					taskSkin.btnSmall.visible = false;
					break;
			}
		}
		
		/**
		 * 显示面板
		 * 
		 */		
		public function onShow():void
		{
			this.visible = true;
		}
		
		/**
		 * 隐藏面板
		 * 
		 */		
		public function onHide():void
		{
			this.visible = false;
		}
		
	}
}