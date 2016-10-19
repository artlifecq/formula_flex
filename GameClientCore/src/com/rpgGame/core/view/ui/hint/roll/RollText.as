package com.rpgGame.core.view.ui.hint.roll
{
	
	import gs.TweenLite;
	
	import starling.display.Sprite;
	
	/**
	 * 滚动文本
	 * @author luguozheng
	 * 
	 */	
	public class RollText
	{
		/**显示区域宽度*/
		private static var MAX_WIDTH:Number = 403;
		/**信息间距*/
		private static var MARGIN:Number = 50;
		/**滚动速度*/
		private static var SPEED:Number = 0.2;
		/**同时显示最多信息条数*/
		private static var MAX_CHILD:Number = 50;
		
		/**父容器*/
		private static var _parent:Sprite;
		/**子容器*/
		private static var _container:Sprite;
		/**显示对象数组*/
		private static var _noticeArr:Array=[];
		/**回调函数*/
		private static var _callBack:Function;
		
		/**是否已经初始化*/
		private static var _hasInit:Boolean = false;
		/**是否在等待 等待的时候要排队*/
		private static var _needWait:Boolean = false;
		
		public function RollText( single:Single )
		{
		}
		/**
		 * 初始化滚动文本管理器
		 * @param $parent	父容器
		 * @param $max_width 显示区域宽度
		 * @param $margin	信息间距
		 * @param $speed 滚动速度
		 * @param $max_child 同时显示最多信息条数
		 * 
		 */	
		public static function init( $parent:Sprite, $max_width:Number,$noticeY:Number=0, $margin:Number=5, $speed:Number=1, $max_child:Number=50,$callBack:Function=null):void
		{
			//初始数据
			_parent = $parent;
//			MAX_WIDTH = $max_width;
			MARGIN = $margin;
			SPEED = $speed;
			MAX_CHILD = $max_child;
			_callBack = $callBack;
			
			_container = new Sprite();
			_container.touchable = false;
			_container.x = MAX_WIDTH;//给一个初始值
			_container.y = $noticeY
			_parent.addChild(_container);

			//改变标志位
			_hasInit = true;
		}
		/**
		 * 是否已经初始化
		 * 
		 */	
		public static function hasInit():Boolean
		{
			return _hasInit;
		}
		/**
		 * 重新设置宽度
		 * 
		 */	
		public static function resetMaxWidth($maxWidth:Number):void
		{
			MAX_WIDTH = $maxWidth;
			if(_container)
				_container.x = MAX_WIDTH;
		}
		/**
		 * 添加文本
		 * @param $text	文本 支持HTML文本
		 * @param $count 显示次数
		 * 
		 */	
		public static function pushText( $text:String, $count:int = 1 ):void
		{
			if( !_hasInit || _noticeArr.length > 20 )
				return;
			
			_noticeArr[ _noticeArr.length ] = new RollTextFace( $text, $count );
			
			if( !_needWait )
				go();//开始
		}
		
		//开始跑马灯
		private static function go():void
		{
			if(_noticeArr.length == 0)
			{
				_needWait = false;
				return;
			}
			_needWait = true;
			var rt:RollTextFace = _noticeArr.shift();
			rt.showCount--;
			if(rt.showCount > 0)
				_noticeArr[_noticeArr.length] = rt/*.clone()*/;
			else
				rt.release();
			
			_container.addChild(rt);
			
			var toX:int = - MAX_WIDTH - rt.width - 100;//计算到达的位置 由于宽度会变 给了个比较大的值
			var dur:Number;//取一个匀速的时间
			dur = -toX * 0.01 / SPEED;
			TweenLite.to(rt, dur, {x:toX, ease:function(t:Number, b:Number,c:Number, d:Number):Number{return c * t / d + b;}, onComplete:onComplete,onCompleteParams:[rt]});
			//策划要求，
			//前第一条完全消失之后，过1秒后，再开始播第二条，
			//而不是现在这样同一时间，显示2条跑马灯 详细见 bug#1048
//			var waitTime:int = (rt.width + MARGIN)*0.01/SPEED - 0.1;
//			TweenLite.to(_container, waitTime, {onComplete:onCompleteWait});
		}
		
//		private static function onCompleteWait():void
//		{
//			go();
//		}
		
		private static function onComplete(rollTextFace:RollTextFace):void
		{
			if( rollTextFace != null && rollTextFace.parent != null )
			{
				rollTextFace.parent.removeChild( rollTextFace );
			}
			
			go();
			
			if(_container.numChildren == 0 && _noticeArr.length == 0 && _callBack!=null)
			{
				_callBack();
			}
		}
		
	}
}

class Single{}
