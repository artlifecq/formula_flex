package com.rpgGame.app.ui
{
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.SkinUI;
	
	import flash.display.Stage;
	
	import away3d.events.Event;
	
	import feathers.themes.GuiTheme;
	
	import org.mokylin.skin.loading.Bg_Foot;
	import org.mokylin.skin.loading.Bg_head;
	
	import starling.core.Starling;
	import starling.display.Shape;
	import starling.display.Sprite;

	/**
	 * 模态单例
	 * @author Mandragora
	 * 
	 */	
	public class UIModel extends Sprite
	{
		protected var _stage : Stage;
		public static const PARTNER:Sprite = StarlingLayerManager.hintUILayer
		public function UIModel()
		{
			super();
			init();
		}
		
		private function init():void
		{
			showModelArray = new Vector.<SkinUI>();
			_stage = Starling.current.nativeStage;
			GuiTheme.ins.customScale9GridRect("ui/big_bg/bg_1.png","1,0,1,147");
			GuiTheme.ins.customScale9GridRect("ui/big_bg/bg_2.png","1,0,1,185");
			drawBlack();
			
		}
		
		private function onStageResize(e:*):void
		{
			_blackShape.width = _stage.stageWidth;
			_blackShape.height = _stage.stageHeight;
			_bgFoot.y = _stage.stageHeight-_bgFoot.height;
//			_bgFoot.x = _bgHead.x = (_stage.stageWidth - _bgHead.width)/2;
			var halfW:int=Math.ceil(_stage.stageWidth/2);
			(_bgHead.stateSkin as Bg_head).left.x=0;
			(_bgHead.stateSkin as Bg_head).left.width=halfW;
			(_bgHead.stateSkin as Bg_head).right.x=_stage.stageWidth;
			(_bgHead.stateSkin as Bg_head).right.width=halfW;
			(_bgFoot.stateSkin as Bg_Foot).left.x=0;
			(_bgFoot.stateSkin as Bg_Foot).left.width=halfW;
			(_bgFoot.stateSkin as Bg_Foot).right.x=_stage.stageWidth;
			(_bgFoot.stateSkin as Bg_Foot).right.width=halfW;
		}
		
		private var showModelArray :Vector.<SkinUI>;
		private static var ins : UIModel;
		/**模态单例**/
		public static function get instence():UIModel
		{
			if(!ins)
			{
				ins = new UIModel();
			}
			return ins;
		}
		
		private var _blackShape:Shape;
		private var _bgHead:SkinUI;
		private var _bgFoot:SkinUI;
		private function drawBlack():void
		{
			_blackShape = new Shape();
			_blackShape.graphics.beginFill( 0x000000, 1 );
			_blackShape.graphics.drawRect( 0, 0, 10, 10 );
			_blackShape.graphics.endFill();
			addChildAt( _blackShape , 0 );
			
			_bgHead = new SkinUI(new Bg_head());
			_bgFoot=new SkinUI(new Bg_Foot());
			addChild(_bgHead);
			addChild(_bgFoot);
			onStageResize(null);
		}
		
		public function switchModel(panel:SkinUI,isadd:Boolean,type:int):void
		{
			var index:int = showModelArray.indexOf(panel);
			if(!isadd)
			{
				if(index>=0)
				{
					panel.removeEventListener(Event.ADDED_TO_STAGE,changeHandler);
					panel.removeEventListener(Event.REMOVED_FROM_STAGE,changeHandler);
					showModelArray.splice(index,1);
					changeHandler();
				}
			}else{
				if(index<0)
				{
					panel.addEventListener(Event.ADDED_TO_STAGE,changeHandler);
					panel.addEventListener(Event.REMOVED_FROM_STAGE,changeHandler);
					showModelArray.push(panel);
					changeHandler();
				}
			}
			
			if(type==1)
			{
				_blackShape.alpha = 0.8;
				_bgHead.visible = false;
				_bgFoot.visible = false;
			}else{
				_blackShape.alpha = 0.5;
				_bgHead.visible = true;
				_bgFoot.visible = true;
			}
		}
		
		private function changeHandler():void
		{
			var length:int = showModelArray.length;
			var havePartnerCount:int = 0;
			for(var i:int = 0;i<length;i++)
			{
				if(showModelArray[i].parent)
				{
					havePartnerCount++;
					break;
				}
			}
			
			if(havePartnerCount>0&& this.parent==null)
			{
				PARTNER.addChildAt(this,0);
				_stage.addEventListener(Event.RESIZE,onStageResize);
				onStageResize(null);
			}
			
			if(havePartnerCount<=0&& this.parent!=null)
			{
				PARTNER.removeChild(this);
				_stage.removeEventListener(Event.RESIZE,onStageResize);
			}
		}
		public function clear():void
		{
			showModelArray.length = 0;
			if(this.parent!=null){
				PARTNER.removeChild(this);
				_stage.removeEventListener(Event.RESIZE,onStageResize);
			}
		}
	}
}