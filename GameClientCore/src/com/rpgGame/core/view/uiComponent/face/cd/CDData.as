package com.rpgGame.core.view.uiComponent.face.cd
{
	import gs.TweenLite;
	import gs.easing.Linear;

	public class CDData
	{
		public var id:*;//标识...
		public var now:Number = 0;//目前时间
		public var cd:Number = 0; //总CD时间
		//缓动用
		private var _obj:Object = {angle:0};
		
		//开始回调
		private var _onStartFun:Function;
		//更新回调
		private var _onUpdateFun:Function;
		//完成回调
		private var _onCompleteFun:Function;
		
		public function CDData( $id:* = null, $onStart:Function = null, $onUpdate:Function = null, $onComplete:Function = null )
		{
			id = $id;
			_onStartFun = $onStart;
			_onUpdateFun = $onUpdate;
			_onCompleteFun = $onComplete;
		}
		
		public function dispose():void
		{
			now = 0;
			cd = 0;
			_obj = {angle:0};
			_onUpdateFun = null;
			_onCompleteFun = null;
		}
		
		public function set startCallBack(value:Function):void
		{
			_onStartFun = value;
		}
		
		public function set updateCallBack(value:Function):void
		{
			_onUpdateFun = value;
		}
		
		public function set completeCallBack(value:Function):void
		{
			_onCompleteFun = value;
		}
		
		/**
		 * 开始
		 * @param $cd CD时长（毫秒）
		 * @param $start 开始时间（毫秒）
		 * */
		public function play( $cd:int, $start:int = 0 ):void
		{
			if($cd <0 || $start < 0)
			{
				return;
			}
			
			stop(false);
			
			now = $start;
			cd = $cd;
			
			_obj.angle = cd!=0 ? now/cd*360 : 360;
			if( lostTm > 0 )
			{
				if(_onStartFun != null)
					_onStartFun( this );
				
				onUpdate();
				TweenLite.to(_obj, lostTm * 0.001, {angle:360, onUpdate:onUpdate, onComplete:onComplete,ease:Linear.easeNone});
			}
			else
			{
				onComplete();
			}
		}
		
		private function onUpdate():void
		{
			update( _obj.angle );
			if(_onUpdateFun != null)
			{
				_onUpdateFun( this );
			}
		}
		
		private function onComplete():void
		{
			update(360);
			if( _onCompleteFun != null )
				_onCompleteFun( this );
			
			dispose();
		}
		
		/**
		 * 停止
		 * @param $complete 是否执行完成动作
		 * */
		public function stop($complete:Boolean=true):void
		{
			TweenLite.killTweensOf( _obj, $complete );
		}
		
		/**
		 * 取得剩余时间（秒）
		 * */
		public function get lostTm():Number	
		{
			return cd - now;
		}
		
		/**
		 * 更新
		 * @param $angle 角度
		 */
		private function update( $angle:Number = 0 ):void
		{
			now = $angle / 360 * cd;
		}
		
	}
}