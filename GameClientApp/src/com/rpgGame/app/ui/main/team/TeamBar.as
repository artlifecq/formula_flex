package com.rpgGame.app.ui.main.team
{
	import com.rpgGame.core.ui.SkinUI;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.mainui.teamlist.TeamBarSkin;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	/**
	 * 左侧队伍缩进窗口 
	 * @author 陈鹉光
	 * 
	 */	
	public class TeamBar extends SkinUI
	{
		private  var _skin:TeamBarSkin;
		/** 缓动时间 **/
		private static const FOLD_TIME:Number = 1;
		/** 是否显示窗口 **/
		private var _isShowSkin:Boolean;
		/** 容器 **/
		private var teamSprite:Sprite;
		/** 子面板 **/
		private var mainList:TeamList;
		/** 缓动 **/
		private var _tweenLiteToFold:TweenLite;
		
		public function TeamBar()
		{
			_skin = new TeamBarSkin();
			super(_skin);
			init();
		}
		
		/**
		 * 初始化 
		 * 
		 */		
		private function init():void
		{
			teamSprite = new Sprite();
			addChild(teamSprite);
			addChild( _skin.btnBig );
			addChild( _skin.btnSmall );
			
			mainList = new TeamList();
			teamSprite.addChild( mainList ); 
		}
		
		/**
		 * 位置布局 
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
			x = 0;
			y = int( ( sHeight - _skin.height ) * 0.25 );
		}
		
		/**
		 * 关闭界面 
		 * 
		 */		
		private function tweenToClose():void
		{
			if( _tweenLiteToFold )
				_tweenLiteToFold.kill();
			
			_tweenLiteToFold = TweenLite.to( teamSprite, FOLD_TIME,{ x:-mainList.width, alpha:0 } );
		}
		
		/**
		 * 打开界面 
		 * 
		 */		
		private function tweenToOpen():void
		{
			if( _tweenLiteToFold )
				_tweenLiteToFold.kill();
			_tweenLiteToFold = TweenLite.to( teamSprite, FOLD_TIME,{ x:mainList.x, alpha:1 } );
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch( target )
			{
				case _skin.btnBig:
					tweenToOpen();
					_skin.btnBig.visible = false;
					_skin.btnSmall.visible = true;
					break;
				
				case _skin.btnSmall:
					tweenToClose();
					_skin.btnBig.visible = true;
					_skin.btnSmall.visible = false;
					break;
			}
		}

	}
}