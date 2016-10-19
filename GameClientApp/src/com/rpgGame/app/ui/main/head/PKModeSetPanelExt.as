package com.rpgGame.app.ui.main.head
{
	import com.rpgGame.coreData.type.PKModeType;
	
	import gs.TweenLite;
	import gs.easing.Expo;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	
	/**
	 * 设置PK模式面板
	 * @author 卢国征
	 * 
	 */	
	public class PKModeSetPanelExt extends Sprite
	{
		
		private var SHOW_TIMER:Number = 100;
		private var SHOW_TIMER2:Number = 0.1;
		
		
		private var _isShowPanel:Boolean = false;
		private var pkModeListVect:Vector.<PkModeListExt>;
		
		private var isShowing:Boolean = false;
		
		public function PKModeSetPanelExt()
		{
			initPanel();
		}
		
		private function initPanel():void{
			pkModeListVect = new Vector.<PkModeListExt>;
			
			var modeArr:Array = [PKModeType.PEACE,
				PKModeType.COUNTRY,
				PKModeType.ALLIANCE,
				PKModeType.ALL,
				PKModeType.TEAM,
				PKModeType.GUILD,
				PKModeType.FAMILY,
				PKModeType.KIND_OR_EVIL,
				PKModeType.DIFFERENT_SEVER];
			
			var len:int = modeArr.length;
			var pkmodelist:PkModeListExt;
			for(var i:int = 0 ;i <len; i++ )
			{
				pkmodelist = new PkModeListExt();
				pkmodelist.setData( modeArr[i], showAndHidePanel );
				pkmodelist.y = 6 + i * 24;
				pkmodelist.x = 6 + 0;
				addChildAt(pkmodelist,0);
				pkModeListVect.push(pkmodelist);
			}
			
			Starling.current.stage.addEventListener( TouchEvent.TOUCH, onClose );
		}
	
		/**
		 * 判断显示与隐藏 
		 * 
		 */		
		public function showAndHidePanel():void{
			// 正在动画中就管了
			if(isShowing)
				return;
			
			if(isShowPanel)
			{
				listIndex = this.pkModeListVect.length - 1
				hidePanel(false);
			}
			else
			{
				listIndex = 0;
				showPanel(true);
			}
		}
		
		private var listIndex:int=0;
		/**
		 *显示列表 
		 * 
		 */		
		public function showPanel(isShow:Boolean):void
		{
			isShowPanel = isShow;
			isShowing = true;
			var len:int = this.pkModeListVect.length;
			var pkmodelist:PkModeListExt;
			if( listIndex < len )
			{
				pkmodelist = pkModeListVect[listIndex];
				TweenLite.to(pkmodelist, 0.03, { autoAlpha:1, ease:Expo.easeOut,onComplete:effShow } );
				listIndex++;
			}
			else
			{
				isShowing = false;
			}
		}
		private function effShow():void
		{
			showPanel(true);
		}
		/**
		 *隐藏列表 
		 * 
		 */		
		public function hidePanel(isShow:Boolean):void
		{
			isShowPanel = isShow;
			isShowing = true;
			
			var pkmodelist:PkModeListExt;
			var len:int = this.pkModeListVect.length 
				
			if( listIndex >= 0 )
			{
				pkmodelist = pkModeListVect[listIndex];
				TweenLite.to(pkmodelist, 0.03, { autoAlpha:0, ease:Expo.easeOut,onComplete:hideShow } );
				listIndex--;
			}
			else
			{
				isShowing = false;
			}
		}
		private function hideShow():void
		{
			hidePanel(false);
		}
		//---------------------------------
		public function onClose( e:TouchEvent ):void
		{
			var touch:Touch = e.getTouch( Starling.current.stage, TouchPhase.BEGAN ); 
			if( touch == null )
				return;
			
			touch = e.getTouch( this, TouchPhase.BEGAN ); 
			if( touch != null )
				return;//说明点击自己，不隐藏
			
			if( isShowPanel == false ) 
				return;
			
			if( isShowing )
				return;
			
			listIndex = this.pkModeListVect.length - 1
			hidePanel(false)
		}
		//////////////
		public function get isShowPanel():Boolean
		{
			return _isShowPanel;
		}

		public function set isShowPanel(value:Boolean):void
		{
			_isShowPanel = value;
		}
		
		
	}
}