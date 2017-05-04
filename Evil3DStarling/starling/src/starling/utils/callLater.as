package starling.utils
{
	/**
	 * 延迟函数到屏幕重绘前执行。
	 * @param method 要延迟执行的函数
	 * @param args 函数参数列表
	 * @param delayFrames 延迟的帧数，0表示在当前帧的屏幕重绘前(Render事件)执行；
	 * 1表示下一帧EnterFrame事件时执行,2表示两帧后的EnterFrame事件时执行，以此类推。默认值0。但-1表示取消延时(仅对override为true的调用有效)。
	 * override 表示同一个函数是否取消前一次的调用,默认为true
	 */		
	public function callLater(method:Function,args:Array=null,delayFrames:int=0, override:Boolean=true):void
	{
		DelayCall.getInstance().callLater(method,args,delayFrames, override);
	}
}

import flash.display.Shape;
import flash.events.Event;
import flash.utils.Dictionary;

import starling.core.Starling;

/**
 * 延迟执行函数管理类
 * @author wewell
 */
class DelayCall extends Shape
{
	
	private static var _instance:DelayCall;
	/**
	 * 获取单例
	 */	
	public static function getInstance():DelayCall
	{
		if(!_instance)
			_instance = new DelayCall();
		return _instance;
	}
	/**
	 * 延迟函数队列 
	 */		
	private var methodQueue:Vector.<MethodQueueElement> = new Vector.<MethodQueueElement>();
	/**
	 * 延迟函数表
	 */		
	private var methodMap:Dictionary = new Dictionary(true);
	/**
	 * 是否添加过EnterFrame事件监听标志 
	 */		
	private var listenForEnterFrame:Boolean = false;
	/**
	 * 是否添加过Render事件监听标志 
	 */	
	private var listenForRender:Boolean = false;
	
	/**
	 * 延迟函数到屏幕重绘前执行。
	 * @param method 要延迟执行的函数
	 * @param args 函数参数列表
	 * @param delayFrames 延迟的帧数，0表示在当前帧的屏幕重绘前(Render事件)执行；
	 * 1表示下一帧EnterFrame事件时执行,2表示两帧后的EnterFrame事件时执行，以此类推。默认值0。-1表示取示延时。
	 * @ override 表示同一个函数是否取消前一次的调用,默认为true
	 */		
	public function callLater(method:Function,args:Array=null,delayFrames:int=0, override:Boolean=true):void
	{
		var element:MethodQueueElement = methodMap[method];
		
		/**取消延迟调用，仅对override == true的函数有效 */	
		if(override && delayFrames < 0)
		{
			var i:int = methodQueue.indexOf(element);
			if(i != -1)methodQueue.splice(i,1);
			delete methodMap[method];
			return;
		}
		
		/**覆盖延迟调用，仅对override == true的函数有效 */	
		if(override && element)
		{
			element.args = args;
			element.delayFrames = delayFrames;
		}else{
			element = new MethodQueueElement(method,args,delayFrames,delayFrames==0)
		}
		
		methodQueue.push(element);
		
		if(override)methodMap[method] = element;
		
		if(!listenForEnterFrame)
		{
			addEventListener(Event.ENTER_FRAME,doCallBackFunction);
			listenForEnterFrame = true;
		}
		if(element.onRender)
		{
			if(!listenForRender&&Starling.current.nativeStage)
			{
				Starling.current.nativeStage.addEventListener(Event.RENDER,doCallBackFunction);
				Starling.current.nativeStage.invalidate();
				listenForRender = true;
			}
		}
	}
	
	private function doCallBackFunction(event:Event):void
	{
		var element:MethodQueueElement;
		var onRender:Boolean = Boolean(event.type==Event.RENDER);
		var startIndex:int = methodQueue.length-1;
		while(methodQueue.length)
		{
			element = methodQueue.pop()
			if(onRender&&!element.onRender)
				continue;
			if(!element.onRender)
				element.delayFrames--;
			if(element.delayFrames>0)
				continue;
			methodQueue.splice(i,1);
			delete methodMap[element.method];
			startIndex--;
			if(element.args==null)
			{
				element.method();
			}
			else
			{
				element.method.apply(null,element.args);
			}
		}
		
		var length:int = methodQueue.length;
		var hasOnRender:Boolean = false;
		startIndex = Math.max(0,startIndex);
		for(var i:int=startIndex;i<length;i++)
		{
			if(methodQueue[i].onRender)
			{
				hasOnRender = true;
				break;
			}
		}
		if(!hasOnRender&&listenForRender)
		{
			Starling.current.nativeStage.removeEventListener(Event.RENDER,doCallBackFunction);
			listenForRender = false; 
		}
		if(methodQueue.length==0)
		{
			if(listenForEnterFrame)
			{
				removeEventListener(Event.ENTER_FRAME,doCallBackFunction);
				listenForEnterFrame = false;
			}
			
		}
	}
}

/**
 *  延迟执行函数元素
 */
class MethodQueueElement
{
	
	public function MethodQueueElement(method:Function,args:Array = null,delayFrames:int=0,onRender:Boolean=true)
	{
		this.method = method;
		this.args = args;
		this.delayFrames = delayFrames;
		this.onRender = onRender;
	}
	
	public var method:Function;
	
	public var args:Array;
	
	public var delayFrames:int;
	/**
	 * 在render事件触发
	 */	
	public var onRender:Boolean;
}