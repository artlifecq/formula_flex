package com.rpgGame.app.ui
{
	import com.rpgGame.core.manager.StarlingLayerManager;
	
	import flash.display.Stage;
	
	import away3d.events.Event;
	
	import feathers.controls.UIAsset;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
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
			showModelArray = new Vector.<SkinUIPanel>();
			_stage = Starling.current.nativeStage;
			drawBlack();
			
		}
		
		private function onStageResize(e:*):void
		{
			_blackShape.width = _stage.stageWidth;
			_blackShape.height = _stage.stageHeight;
			_bottonPng.y = _stage.stageHeight-_bottonPng.height;
			_bottonPng.x = _topPng.x = (_stage.stageWidth - _topPng.width)/2;
		}
		
		private var showModelArray :Vector.<SkinUIPanel>;
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
		private var _topPng:UIAsset;
		private var _bottonPng:UIAsset;
		private function drawBlack():void
		{
			_blackShape = new Shape();
			_blackShape.graphics.beginFill( 0x000000, 0.5 );
			_blackShape.graphics.drawRect( 0, 0, 10, 10 );
			_blackShape.graphics.endFill();
			addChildAt( _blackShape , 0 );
			
			_topPng = new feathers.controls.UIAsset();
			_topPng.height = 187;
			_topPng.width = 1920;
			_topPng.y = _topPng.height;
			_topPng.styleName = "ui/big_bg/bg_2.png";
			_topPng.scaleY = -1;
			this.addChild(_topPng);
			
			_bottonPng = new feathers.controls.UIAsset();
			_bottonPng.height = 187;
			_bottonPng.width = 1920;
			_bottonPng.styleName = "ui/big_bg/bg_2.png";
			this.addChild(_bottonPng);
		}
		
		public function switchModel(panel:SkinUIPanel,isadd:Boolean):void
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
		}
		
		private function changeHandler():void
		{
			var length:int = showModelArray.length;
			var havePartnerCount:int = 0;
			for(var i:int = 0;i<length;i++)
			{
				if(showModelArray[i].isSHowing)
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
		
	}
}