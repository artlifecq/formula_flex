package com.rpgGame.core.view.ui
{
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	/**
	 *
	 * 显示ui的基类
	 * @author fly.liuyang
	 * 创建时间：2014-8-8 上午10:55:44
	 * 
	 */
	public class BaseUI extends Sprite
	{
		
		private var _arrEvent:Array = null;
		
		private var _arrCtrlEvent:Array = null;
		
		private var _dicAutoTimer:HashMap = new HashMap();

		public function BaseUI()
		{
			super();
		}

		private function get arrCtrlEvent() : Array
		{
			if (null == _arrCtrlEvent)
			{
				_arrCtrlEvent = [];
			}
			return _arrCtrlEvent;
		}
		
		private function get arrEvent() : Array
		{
			if (null == _arrEvent)
			{
				_arrEvent = [];
			}
			return _arrEvent;
		}
		
		/**
		 * 添加一个会自动释放的事件监听，这个事件会在面板关闭的时候自动释放监听 ，这个函数是对EventManager.addEvent的封装，如果用这个函数添加事件监听，请不要手动删除
		 * @param type 事件类型
		 * @param listener 监听函数
		 * @param arg 监听函数所带参数
		 * @author 康露 2014年8月12日
		 */
		public function autoAddEvent(type:int, listener:Function, ...arg):void
		{
			arrEvent.push([type, listener, arg]);
			if (arg.length == 0)
			{
				EventManager.addEvent(type, listener);
			}
			else
			{
				EventManager.addEvent(type, listener, arg);
			}
		}
		
		/**
		 * 添加显示对象的事件监听，如果用这个函数添加事件监听，请不要手动删除
		 * @param ctrl 显示对象
		 * @param type 事件的类型。
		 * @param listener 处理事件的侦听器函数。此函数必须接受 Event 对象作为其唯一的参数，并且不能返回任何结果，如下面的示例所示： function(evt:Event):void
		 * @author 康露 2014年8月12日
		 */
		public function autoAddCtrlEvent(ctrl:DisplayObject, type:String, listener:Function) : void
		{
			if (null == ctrl)
				return;
			arrCtrlEvent.push([ctrl, type, listener]);
			ctrl.addEventListener(type, listener);
		}
		
	}
}
