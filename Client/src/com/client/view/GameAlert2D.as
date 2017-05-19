package com.client.view
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class GameAlert2D 
	{
		
		private static var _info:String;
		private static var _okFunc:Function;
		private static var _gameAlert2D:MovieClip;
		
		
		public static function show(info:String, okFunc:Function):void
		{
			var skinCls:Class = null;
			_info = info;
			_okFunc = okFunc;
			if (!_gameAlert2D)
			{
				skinCls = (TipsInfoView2D.getDefinitionByName("GameAlert2DSkin") as Class);
				_gameAlert2D = new skinCls();
			}
			TextField(_gameAlert2D.labInfo).text = _info;
			SimpleButton(_gameAlert2D.btnOk).addEventListener("click", onOkClick);
			Stage3DLayerManager.stage.addChild(_gameAlert2D);
			Stage3DLayerManager.stage.addEventListener("resize", onResize);
			onResize();
		}
		
		private static function onResize(e:Event=null):void
		{
			if (_gameAlert2D && _gameAlert2D.stage)
			{
				_gameAlert2D.x = (_gameAlert2D.stage.stageWidth - _gameAlert2D.width) * 0.5;
				_gameAlert2D.y = (_gameAlert2D.stage.stageHeight - _gameAlert2D.height) * 0.5;
			}
		}
		
		private static function onOkClick(e:MouseEvent):void
		{
			hide();
			if (_okFunc != null)
			{
				_okFunc();
			}
		}
		
		private static function hide():void
		{
			Stage3DLayerManager.stage.removeEventListener("resize", onResize);
			if (_gameAlert2D)
			{
				SimpleButton(_gameAlert2D.btnOk).removeEventListener("click", onOkClick);
				if (_gameAlert2D.parent)
				{
					_gameAlert2D.parent.removeChild(_gameAlert2D);
				}
			}
		}	
	}
}