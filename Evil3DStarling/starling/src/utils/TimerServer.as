package utils
{
	import flash.display.Shape;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	/**
	 * 快捷时间工具函数，包含了大部分常用的时间服务需求
	 * 包括帧表，毫秒表，秒表，累计时间, 延时调用等服务
	 * 优点:
	 * 1.便于统一管理,可运行时打印当前项目所有正在工作的定时器,便于排错及优化
	 * 2.使用对象池技术，不会由于频繁调用产生大量对象
	 * 
	 * 以下fun为function的缩写
	 * fun作为key,为弱引用,不会引起回收问题,但不需要时应解除服务
	 * 
	 * 延时表
	 *delayCall(onComplete:Function,delay:Number,params:Array=null)延时调用
	 * 
	 * 毫秒表
	 * add(fun, delay);添加定时服务 ,一次
	 * has(fun);是否存在
	 * stop(fun);暂停
	 * reStart(fun);恢复
	 * edit(fun, delay);修改
	 * remove(fun); 解除定时服务
	 * 
	 * 任意时间间隔循环调用
	 * addLoop(fun, time);每time时间执行一次fun
	 * remove(fun); 解除定时服务
	 * 
	 * 秒表
	 * addSecTick(fun, seconds);每seconds秒执行一次fun
	 * remove(fun); 解除定时服务
	 * 
	 * 帧表,
	 * addTick(fun); 同EnterFrame,每帧执行一次fun
	 * remove(fun);解除定时服务
	 * 
	 * 超时表
	 * hasPassedTime(key, time);距离上次访问此key是否超过了时间time,超过则返回true,否则flase
	 * removePassedTimeServer(key);解除fun超时表服务
	 * 
	 * @auther wewell@163.com
	 * 
	 * 
	 */
	public class TimerServer
	{
		/**每帧用时**/
		private static const TICK:int = int(1000/60);
		
		/**delayCall　延时表key:自增长ID**/
		private static var sn:int;
		
		/** @private Drives all our ENTER_FRAME events.**/
		private static var _shape:Shape;
		
		/** @private Gets updated on every frame.**/
		private static var _rootFrame:int; 
		
		/**flash运行时所经过的毫秒数**/
		private static var _passedTime:int=-1;
		
		/**是否已经初始化**/
		private static var _isInited:Boolean=false;
		
		/**时间驱动 回调支持自定义参数**/
		private static var _entityLib:Dictionary= new Dictionary(false);	
		
		/**超时表 根据一个key(String)返回据上一次访问此key,间隔是否超过指定时间**/
		private static var _durationLib:Dictionary = new Dictionary(false);	
		
		/** @private Gets updated on every second.**/
		private static var _totalFrames:int;
		
		/**
		 * 工具类初始化，外部无需调用，本类会自检测完成初始化
		 * 
		 */		
		public static function init():void
		{
			if(!_isInited)
			{
				_passedTime = getTimer();
				Entity.entities = new Vector.<Entity>();
				_shape = new Shape();
				_shape.addEventListener(Event.ENTER_FRAME, updateAll);
				_isInited = true;
			}
				
				//hack Flash Player 10.1++ SleepModel
/*				var sound:Sound = new Sound(new URLRequest(""));
				sound.play();
				sound.close();*/
		}
		
		/**
		 * 延时函数执行,完成后自动清除
		 * @param fun delay豪秒后fun执行一次，然后自动解除服务
		 * @param delay 毫秒数
		 * @param params fun的回调参数
		 * 
		 */
		public static function delayCall(fun:Function,delay:Number,params:Array=null):void
		{			
/*			var anyKey:String = "UniqueHandle"+ (sn++);
			_entityLib[ anyKey ] = Entity.creat(fun,delay, params, -1);*/
			
			add(fun, delay, params);
		}
		
		/**
		 * 延迟多少帧后调用,调用完成后自动解除服务
		 * @param fun		回调函数
		 * @param frame			需要延迟多少帧
		 * @param params		传递给回调函数的参数
		 *
		 */	
		public static function callAfterFrame(fun:Function, frame:int=1, params:Array=null):void
		{
			var en:Entity = Entity.creat(fun, 0, params, -1);
			en.callAtFrame = _rootFrame + frame + 1;
			_entityLib[ fun ] = en;
		}
		
		/**
		 * 每多少秒执行一次handler
		 * @param fun 回调函数
		 * @param params fun的函数
		 * @param second 秒数, 默认为1秒;支持浮点数表示法，比如1.5
		 * 
		 */		
		public static function addSecTick(fun:Function, params:Array=null, second:Number=1):void
		{
			addLoop(fun, second * 1000, params, 0);
		}
		
		/**
		 * 每帧执行一次fun
		 * @param fun 回调函数
		 * @param params fun的参数
		 * 
		 */		
		public static function addTick(fun:Function, params:Array=null):void
		{
			addLoop(fun, TICK, params, 0);
		}
		
		
		/**
		 *delay毫秒后fun执行一次，然后自动解除服务
		 *@param handle 需要时间服务的响应函数 可修改(edit) /撤销(remove) /暂停(stop) /恢复(reStart)
		 *@param delay毫秒 ,多久后触发handle
		 *重复监听会覆盖，如需避免可使用delayCall
		 * 
		 */		
		public static function add(handle:Function, delay:int, params:Array=null):void
		{
			addLoop(handle, delay, params, -1);
		}
		
		/**
		 * 循环调用
		 * @param handle 被调用函数 如果handle已经存在，则会覆盖,若累积完成循环次数，自动解除服务
		 * @param delay 触发间隔，单位毫秒
		 * @param param handle的参数,请以Array形式传入
		 * @param loop 0表示无限循环,<0表示不循环, >0表示循环次数 	
		 * 
		 */		
		public static function addLoop(handle:Function, delay:int, params:Array=null, loop:int=0):void
		{
			if(edit(handle, delay,params, loop))return;
			_entityLib[ handle ] = Entity.creat(handle, delay,params, loop);
		}
		
		
		///////////////////////////////////////////////////
		//对所有定时服务　handle 通用的方法
		
		/**
		 * 修改某个handle
		 * @param handle 需要被修改的目标函数
		 * @param delay	触发间隔，单位毫秒
		 * @param params	handle的参数,请以Array形式传入
		 * @param loop	0表示无限循环,<0表示不循环, >0表示循环次数 	
		 * @return 
		 * 
		 */		
		public static function edit(handle:Function, delay:int, params:Array=null, loop:int=0):Boolean
		{
			var e:Entity = _entityLib[ handle ];
			if(e != null){
				e.originalDelay = delay;
				e.loop = loop;
				e.param = params;
				return true;
			}
			return false;
		}
		
		/**
		 * 删除某个 handle
		 * 
		 */		
		public static function remove(handle:Function):void
		{
			var e:Entity = _entityLib[ handle ];
			if(e)e.clear();
			delete _entityLib[ handle ];
		}
		
		/**
		 * 判断一个 handle 是否存在
		 * 
		 */		
		public static function has(handle:Function):Boolean
		{
			return _entityLib[ handle ] != null;
		}
		
		/**
		 * 返回到下次触发剩余的时间, 但-1表示handle不存在
		 * 
		 */	
		public static function remain(handle:Function):int
		{
			var e:Entity = _entityLib[ handle ];
			return (e!=null? e.remain: -1);
		}
		
		/**
		 * 暂停某个 handle
		 * 
		 */
		public static function stop(handle:Function):void
		{
			var e:Entity = _entityLib[ handle ];
			if(e != null)e.pause = true; 
		}
		
		/**
		 * 恢复某个 handle
		 * 
		 */		
		public static function reStart(handle:Function):void
		{
			var e:Entity = _entityLib[ handle ];
			if(e != null) e.pause = false;
		}
		
		/**
		 * 返回已经触发的次数，但-1表示handle不存在
		 * 
		 */		
		public static function loopCount(handle:Function):int
		{
			var e:Entity = _entityLib[ handle ];
			return (e != null ? e.count : -1);
		}
		
		/**
		 * 返回剩下需要触发的次数，但-1表示handle不存在
		 * 
		 */		
		public static function leftCount(handle:Function):int
		{
			var e:Entity = _entityLib[ handle ];
			return (e != null ? e.loop-e.count : -1);
		}
		
		
		
		//////////////////////////////////////////////////
		// 频率控制
		
		/**
		 * 判断上次调用该函数时, 与当前时间的间隔, 是否超过了 time 指定的毫秒数.第一次调用返回true
		 * @param key 将被长久保留引用, 因此 key 最好是静态/全局变量,否则不需要时应该调用removePassedTimeServer清除引用;
		 * @param duration 时间间隔 毫秒
		 * @return 是否超时
		 * 
		 */		
		public static function hasPassedTime(key:Object, time:int):Boolean
		{
			var prev_time:int = _durationLib[key];
			var now_time:int = getTimer();
			
			if(prev_time == 0){
				_durationLib[key] = now_time;
				return true;
			}
			if(now_time - prev_time >= time){
				_durationLib[key] = now_time
				return true;
			}
			return false;
		}
		
		/**
		 * 解除两次调用之间经过时间间隔 (毫秒)的服务
		 * @param key 服务唯一标识
		 * 
		 */		
		public static function removePassedTimeServer(key:*):void
		{
			delete _durationLib[key];
		}
		
		
				
		//////////////////////////////////////////////////
		// private
		
		/**
		 * 更新所有服务对象
		 * @param e ENTER_FRAME Event
		 * 
		 */
		private static function updateAll(e:Event = null):void
		{
			_rootFrame++;
			
			// 上一帧到这一帧所耗费的时间(毫秒)
			var pass:int = getTimer() - _passedTime;
			//trace("Passed millisecond: "+pass+" Current Frame: ", _rootFrame);
				
			_passedTime = getTimer();
			
			updateEntityLib(pass);
		}
		
		public static function get rootTime():int
		{
			return _passedTime;
		}
		
		private static function updateEntityLib(pass:int):void
		{
			var d:Dictionary = _entityLib, f:*, e:Entity;
//			var i:int;
			for (f in d)
			{
//				i++;
				e = d[ f ];
				
				if(e.pause)continue;
				
				if(e.callAtFrame > 0)
				{
					if(e.callAtFrame <= _rootFrame)
					{
						e.invoke(pass);
						delete d[f];
						e.clear();
					}
					continue;
				}
				
				e.remain -= pass;	// 倒计时
				if(e.remain <= 0){
					e.invoke(pass);
					if(e.loop < 0 || (e.loop > 0 &&  e.count >= e.loop) ){//不循环或循环次数已到
						delete d[f];
						e.clear();
					}
				}
			}
//			trace("updateEntityLib len ", i);
		}
		
	}
}


class Entity{
	
	/**
	 *Entity对象池 
	 */	
	internal static var entities:Vector.<Entity>;
	internal static var entyLen:int;
	
	public var remain:int; //到下一次触发剩余的时间,毫秒
	public var handle:Function;
	public var param:Array;
	public var count:int;	//已循环次数
	public var loop:int;		//loop 0表示无限循环,<0表示不循环, >0表示循环次数 	
	public var originalDelay:int; //触发间隔,毫秒
	public var pause:Boolean;//暂停
	public var callAtFrame:int;
	
	public function Entity():void{
		
	}
	
	internal function initSet(handle:Function, delay:int, params:Array=null, loop:int=0):void
	{
		this.originalDelay = delay;
		this.remain = delay;
		this.handle = handle;
		this.loop = loop;
		this.param = params;
		this.count = 0;
	}
	
	internal function invoke(pass:int):void{
		count++;
		if(handle != null)handle.apply(null, param);
		if(loop >= 0){
			remain = originalDelay + remain;
			
			//最小化时单次pass可能会很大，上述表达式累加后remain<0,而导到后面会加速补帧
			//这里作跳过处理,即最小化时的丢失掉的帧将被忽略
			if(remain < 0)
			{
				remain = originalDelay;
			}
		}
	}
	
	internal function clear():void{
		handle = null;
		param = null;
		remain = count = loop = originalDelay = callAtFrame = 0;
		pause = false;
		
		//回收
		entities[entyLen++] = this;
	}
	
	/**
	 * 使用对象池管理创建对象
	 * @param handle 被调用函数 如果handle已经存在，则会覆盖,若累积完成循环次数，自动解除服务
	 * @param delay 触发间隔，单位毫秒
	 * @param param handle的参数,请以Array形式传入
	 * @param loop 0表示无限循环,<0表示不循环, >0表示循环次数 	
	 */	
	internal static function creat(handle:Function, delay:int, params:Array=null, loop:int=0):Entity
	{
		if(!_isInited)
		{
			utils.TimerServer.init();
			_isInited = true;
		}
		
		var entity:Entity;
		if(entyLen > 0)
		{
			entity = entities.pop();
			entyLen--;
		}else{
			entity = new Entity();
		}
		entity.initSet(handle, delay, params, loop);
		return entity;
	}
	internal static var _isInited:Boolean;
}
