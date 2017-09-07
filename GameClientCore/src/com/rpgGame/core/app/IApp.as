package com.rpgGame.core.app
{
	import com.rpgGame.core.interfaces.IEscExcute;
	
	import flash.geom.Point;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 * 功能模块接口
	 * @author fly
	 */	
	public interface IApp extends IEscExcute
	{
		function set appinfo( value:AppInfo ):void;
		function get appinfo():AppInfo;
		
//		function supperSetup():void;
//		function superAddEvent():void;
//		function superRemoveEvent():void;
		
		
//		function setup():void;
//		function initAttr():void;
//		function initView():void;
		
		function show( data:* = null, openTable:int = 0, parentContiner:DisplayObjectContainer = null ):void;
		function refresh():void;
		function hide():void;
//		function addEvent():void;
//		function removeEvent():void;
		function dispose():void;
		
		function isHideEffecting():Boolean;
		function get parentContainer():DisplayObjectContainer;
		function showCloseGuide( isShowBg:Boolean, bgAlpha:Number ):void;
		
		function get parent():DisplayObjectContainer;
		function addEventListener(name:String, handler:Function):void;
		function get width():Number;
		function get height():Number;
		function set x(value:Number):void;
		function get x():Number;
		function set y(value:Number):void;
		function get y():Number; 
		function hitTest(localPoint:Point):DisplayObject
	}
}