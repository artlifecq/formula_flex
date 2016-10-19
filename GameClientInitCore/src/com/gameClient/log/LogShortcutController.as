package com.gameClient.log
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;

	public class LogShortcutController
	{
		private static var _replyKeyList:Array;
		private static var _replyKeyFun:Function;
		private static var _replyKeyFunArgs:Array;
		private static var _keyDownList:Array = [];
//		private static var _keyCodeFunListMap:Object = {};
		
		public function LogShortcutController()
		{
		}
		
		public static function init(stage:Stage):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
		}
		
//		public function setKeyListFun(keyCodeList:Array,fun:Function,funArgs:Array=null):void
//		{
//			_keyCodeFunListMap[fun] = [keyCodeList,funArgs];
//		}
		
		public static function setKeyListFun(keyCodeList:Array,fun:Function,funArgs:Array=null):void
		{
			_replyKeyList = keyCodeList;
			_replyKeyFun = fun;
			_replyKeyFunArgs = funArgs;
		}
		
		private static function onKeyDown(e:KeyboardEvent):void
		{
			var index:int = _keyDownList.indexOf(e.keyCode);
			if(index != -1)
			{
				return;
			}
			var cnt:uint = 0;
			_keyDownList.push(e.keyCode);
			for each(var keyCode:uint in _keyDownList)
			{
				index = _replyKeyList.indexOf(keyCode);
				if(index != -1)
				{
					cnt++;
				}
			}
//			GameLog.add(cnt,_keyDownList.length);
			if(cnt == _replyKeyList.length)
			{
				if(_replyKeyFun != null)
				{
					_replyKeyFun.apply(null,_replyKeyFunArgs);
				}
			}
		}
		
		private static function onKeyUp(e:KeyboardEvent):void
		{
			var index:int = _keyDownList.indexOf(e.keyCode);
			if(index != -1)
			{
				_keyDownList.splice(index,1);
			}
		}
	}
}