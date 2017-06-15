package com.rpgGame.app.utils
{
	
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	
	import gs.TweenMax;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.display.DisplayObject;
	import starling.filters.BlurFilter;
	import starling.filters.GlowFilter;
	
	/**
	 * 渐变发光效果 工具类
	 * @author lpp
	 * 
	 */	
	public class BreatheTweenUtil
	{
		private static var _tweenList:Vector.<TweenMax> = new Vector.<TweenMax>();
		private static var _nameMap:HashMap = new HashMap();
		
		private static var _threeTimesDic:HashMap = new HashMap();
		private static var _updateTimer:GameTimer;
		/**
		 * 给对象添加渐变发光滤镜效果
		 * @param object     需要添加滤镜的对象
		 * @param _color     颜色值
		 * @param blurValue  模糊值
		 * @param _duration  缓动时间
		 * @param _repeat    重复次数
		 * @param _inner     是否为内侧发光
		 * @return 
		 * 
		 */		
		public static function add(object:DisplayObject, _color:uint=0xffd909, blurValue:int=8, _duration:Number=1, _repeat:int=-1, _inner:Boolean=false):Boolean
		{
			if(_nameMap.containsKey(object))
			{
				return true;
			}
			_nameMap.add(object,true);
			
			if (object == null || TweenMax.getTweensOf(object).length != 0)
			{
				return false;
			};
			var filter:GlowFilter = new GlowFilter();
			filter.color = _color;
			filter.blur = 0;
		
			//filter.alpha = 0.8;
			object.filter = filter;
			var data:Object = {blur:blurValue};
//			data["glowFilter"] = {
//				blur:blurValue
//			};
			data["yoyo"] = true;
			data["repeat"] = _repeat;
			data["onComplete"] = remove;
			data["onCompleteParams"] = [object];
			var tween:TweenMax = TweenMax.to(object.filter, _duration, data);
			_tweenList.push(tween);
			return true;
		}
		
		/**
		 * 从缓动列表中移除掉 不再需要渐变发光滤镜效果的对象
		 * @param object
		 * 
		 */		
		public static function remove(object:DisplayObject):void
		{
			var id:int;
			var data:Array = TweenMax.getTweensOf(object);
			var index:int;
			while (index < data.length)
			{
				id = _tweenList.indexOf(data[index]);
				if (id >= 0)
				{
					_tweenList[id].kill();
					_tweenList.splice(id, 1);
				}
				index++;
			}
			if (object != null)
			{
				object.filter = null;
			}
			_nameMap.remove(object);
		}
		
		public static function get length():uint
		{
			return _nameMap.length;
		}
		
		
		/**
		 * 判断是否包含当前对象
		 * @return 返回判断结果
		 */
		public static function contions(object:DisplayObject):Boolean
		{
			var index:int;
			while (index < _tweenList.length)
			{
				if (_tweenList[index].target == object)
				{
					return true;
				}
				index++;
			}
			return false;
		}
		
		/**
		 * 闪烁一个显示对象
		 * @param $dis     需要添加滤镜的对象
		 * @param $flashTime    闪烁时间
		 * @param $color     颜色值
		 * @param $blurValue  模糊值
		 * @param $duration  缓动时间
		 * @param $repeat    重复次数
		 * @param $inner     是否为内侧发光
		 * 
		 * */
		public static function flashIt($dis:DisplayObject, $flashTime:int = 5000, $color:uint=0xffd909, $blurValue:int= 8, $duration:Number=1, $repeat:int=-1, $inner:Boolean=false):void
		{
			if($dis != null)
			{
				if(!_threeTimesDic.containsKey($dis))
				{
					BreatheTweenUtil.add($dis,$color,$blurValue,$duration,$repeat,$inner);
				}
				_threeTimesDic.add($dis,SystemTimeManager.curtTm + $flashTime);
				startTimer();
				update()
			}
		}
		
		private static function onTimer():void
		{
			var dis:DisplayObject;
			var currentTime:Number = SystemTimeManager.curtTm;
			var arr:Array = _threeTimesDic.keys();
			for each (dis in arr) 
			{
				var endTime:Number = _threeTimesDic.getValue(dis);
				if(endTime < currentTime)
				{
					removeThreeTimsFlash(dis);
				}
			}
		}
		
		private static function update():void
		{
			var conunt:int = _threeTimesDic.length;
			if(conunt > 0)
			{
				startTimer();
			}else
			{
				if(_updateTimer)
				{
					_updateTimer.stop();
				}
			}
		}
		
		private static function startTimer():void
		{
			if(_updateTimer == null)
			{
				_updateTimer = new GameTimer("DisplayObjectFlash",1000,0,onTimer);
			}
			if(!_updateTimer.running)
			{
				_updateTimer.start();
			}
		}
		
		private static function removeThreeTimsFlash(dis:DisplayObject):void
		{
			if(dis != null)
			{
				BreatheTweenUtil.remove(dis);
				_threeTimesDic.remove(dis);
				dis.filter = null;
				update()
			}
		}
	}
}