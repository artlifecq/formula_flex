package com.rpgGame.app.ui.main.head
{
	import com.rpgGame.app.manager.PKMamager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.PKModeUtil;
	import com.rpgGame.coreData.cfg.StaticValue;
	
	import org.mokylin.skin.app.tips.BaseTipsSkin;
	
	import starling.display.Shape;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;

	/**
	 * PK模式切换
	 * @author 卢国征
	 * 
	 */	
	public class PkModeListExt extends SkinUI
	{
		private var skin:BaseTipsSkin;
		
		private var _selected:Boolean;
		private var _pkMode:int = 0;
		private var _closeFun:Function;
		private var labinfo:TextField;
		private var imgeff:Shape;
		
		public function PkModeListExt()
		{
			skin = new BaseTipsSkin();
			super(skin);
			
			initPanel();
		}
		
		private function initPanel():void
		{
			imgeff = new Shape();
			imgeff.graphics.beginFill( 0xfff046, 0.5 );
			imgeff.graphics.drawRect(0,0,50,20);
			imgeff.graphics.endFill();
			addChild(imgeff);
			
			imgeff.touchable = false;
			
			labinfo = new TextField( 50, 20, "" );
			labinfo.color = StaticValue.COLOR_CODE_1;
			labinfo.bold = true;
			addChild( labinfo );
			labinfo.autoSize = TextFieldAutoSize.VERTICAL;
//			labinfo.touchable = false;
			
			imgeff.x = imgeff.y = labinfo.x = labinfo.y = 2;
			
			visible = false;
			imgeff.visible = false;
		
			addEventListener( TouchEvent.TOUCH, onTouch );
			
			setBgSize( 54, 24 );
		}
		
		public function setBgSize( $width:int, $height:int ):void
		{
			skin.imgBG.width = $width;
			skin.imgBG.height = $height;	
		}	
		
		/**
		 * 设置数据 
		 * @param pkmode
		 * 
		 */		
		public function setData( pkmode:int, closeFun:Function ):void{
			_pkMode = pkmode;
			_closeFun = closeFun;
			setInfo();
		}
		/**
		 * 设置文本 
		 * 
		 */		
		private function setInfo():void
		{
			labinfo.text = PKModeUtil.getPKModeInfo(_pkMode);
			labinfo.color = PKModeUtil.getPKModeColor(_pkMode);
		}
		//------------------------------------
		
		public function get pkMode():int
		{
			return _pkMode;
		}
		
		public function set selected(b:Boolean):void
		{
			_selected = b;
			imgeff.visible = b;
		}
		
		private function onTouch( e:TouchEvent ):void
		{
			var touch:Touch;
			touch = e.getTouch( this );
			if( touch == null )
			{
				onMouseOut();
				return;
			}
			
			touch = e.getTouch( this, TouchPhase.HOVER ); 
			if( touch != null )
				onMouseMove();
			
			touch = e.getTouch( this, TouchPhase.BEGAN ); 
			if( touch == null )
				return;
			
			onMouseClick();
		}
		
		private function onMouseClick():void
		{
			PKMamager.HeroSetPKMode(_pkMode);
			if( _closeFun != null )
			{
				onMouseOut();
				_closeFun();
			}
		}
		
		/**
		 * 显示光效
		 * @param e
		 * 
		 */		
		private function onMouseMove():void
		{
			imgeff.visible = true;
		}
		/**
		 * 隐藏光效
		 * @param e
		 * 
		 */		
		private function onMouseOut():void
		{
			if(!_selected)imgeff.visible = false;
		}
		//------------------------------------
	}
}