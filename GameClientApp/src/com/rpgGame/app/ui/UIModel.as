package com.rpgGame.app.ui
{
	import com.game.engine3D.core.StarlingLayer;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	
	import starling.core.Starling;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 * 模态单例
	 * @author Mandragora
	 * 
	 */	
	public class UIModel extends Sprite
	{
		public function UIModel()
		{
			super();
			init();
		}
		
		private function init():void
		{
			showModelArray = new Array();
			Starling.current.nativeStage.addEventListener(Event.RESIZE,onStageResize);
		}
		
		private function onStageResize(e:*):void
		{
			if( Starling.current.nativeStage != null && _blackShape)switchModel(true);
		}
		
		private var showModelArray : Array;
		private static var ins : UIModel;
		/**模态单例**/
		public static function get instence():UIModel
		{
			if(!ins)
			{
				ins = new UIModel();
				StarlingLayerManager.hintUILayer.addChildAt(ins,0);
			}
			return ins;
		}
		
		private var _blackShape:Shape;
		private function drawBlack():void
		{
			_blackShape = new Shape();
			_blackShape.graphics.beginFill( 0x000000, 0.5 );
			_blackShape.graphics.drawRect( 0, 0, 10, 10 );
			_blackShape.graphics.endFill();
			addChildAt( _blackShape , 0 );
		}
		
		public function switchModel(value : Boolean):void
		{
			if(value)
			{
				if(_blackShape == null)
				{
					drawBlack();
				}
				_blackShape.width = Stage3DLayerManager.stage.stageWidth;
				_blackShape.height = Stage3DLayerManager.stage.stageHeight;
				_blackShape.x = -(Stage3DLayerManager.stage.stageWidth - this.width)/2;
				_blackShape.y = -(Stage3DLayerManager.stage.stageHeight - this.height)/2;
				this.addChildAt(_blackShape, 0);
			}else if(_blackShape != null)
			{
				_blackShape.removeFromParent(true);
				_blackShape.graphics.clear();
				_blackShape = null;
			}
		}
		
		public function showModel(target:*,layer:String = StarlingLayerManager.HINT_LAYER):void
		{
			if(showModelArray.indexOf(target)==-1)
			{
				showModelArray.push(target);
				switchModel(true);
			}else
				trace("已经给这个对象添加过一次Model了");
		}
		
		public function hideModel(target:*):void
		{
			if(showModelArray.indexOf(target)!=-1)
			{
				showModelArray.splice(showModelArray.indexOf(target),1);
				if(_blackShape && showModelArray.length == 0)
					switchModel(false);
			}else
				trace("这个对象没有添加过Model，为什么要移除");
		}
	}
}