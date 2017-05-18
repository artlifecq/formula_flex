package com.game.engine2D.scene.render.vo
{
	import com.game.engine2D.config.GlobalConfig2D;
	
	import flash.display.BlendMode;
	
	import away3d.enum.LoadPriorityType;
	
	/**
	 * 某个换装部件 的 基本参数数据
	 * @author Carver
	 */
	public class RenderParamData implements IRenderUnitData
	{
		//参数***********************************************
		private var _id:int = -1;
		private var _type:String;
		/**部件加载列表里的优先级*/
		public var priority:int = LoadPriorityType.LEVEL_CUSTOM_3;
		/**部件资源释放延长时间，想加快释放设置为负值，要减慢释放设置为正值*/
		public var destoryTm:int = 0;
		/** 是否自动回收显存 */
		public var autoRecycleEnable:Boolean = true;
		
		private var _fullPathDic:Object = {};
		
		/**
		 * 换装资源绝对地址(此参数只做对比用， 取地址时一般用getFullSourcePath， getFullSourcePath内封装了版本控制)
		 * 注意：如果此值为null，则换装为空，但依然可执行vars中的回调
		 * 使用"#"号作为状态占位符（代表：stand,walk等）
		 * 例如：http://..../mid135/#.tsa 站立最终会被替换为 http://..../mid135/stand.tsa
		 */
		public function get sourcePath():String
		{
			return _sourcePath;
		}
		
		/**
		 * @private
		 */
		public function set sourcePath(value:String):void
		{
			_sourcePath = value;
			_fullPathDic = {};
		}
		
		/**
		 * ID 某角色换装的唯一标识,注意该ID必须唯一
		 */
		public function get id():int
		{
			return _id;
		}
		public function set id(value:int):void
		{
			_id = value;
		}
		
		/**部件类型*/
		public function get type():String
		{
			return _type;
		}
		public function set type(value:String):void
		{
			_type = value;
		}
		
		private var _mouseEnabled:Boolean = false;
		/**
		 * 是否禁用鼠标
		 */
		public function get mouseEnabled():Boolean
		{
			return _mouseEnabled;
		}
		public function set mouseEnabled(value:Boolean):void
		{
			_mouseEnabled = value;
		}
		
		private var _enableScaleTexture:Boolean = true;
		/** 是否允许动态缩放显存  */
		public function get enableScaleTexture():Boolean
		{
			return _enableScaleTexture;
		}
		
		public function set enableScaleTexture(value:Boolean):void
		{
			_enableScaleTexture = value;
		}
		
		private var _sleepTime:int = 0;
		/**睡眠时间（睡眠，即：在一遍播放完毕之后的休息）*/
		public function get sleepTime():int
		{
			return _sleepTime;
		}
		
		public function set sleepTime(value:int):void
		{
			_sleepTime = value;
		}
		
		/** 旋转角度, 必须设置hasRotation 为true*/
		private var _rotation:int;
		public function get rotation():int
		{
			return _rotation;
		}
		
		public function set rotation(value:int):void
		{
			_rotation = value;
		}
		
		
		/** 播放速度*/
		private var _speed:int;
		public function get speed():int
		{
			return _speed;
		}
		
		public function set speed(value:int):void
		{
			_speed = value;
		}
		
		
		/**
		 * 换装资源绝对地址(此参数只做对比用， 取地址时一般用getFullSourcePath， getFullSourcePath内封装了版本控制)
		 * 注意：如果此值为null，则换装为空，但依然可执行vars中的回调
		 * 使用"#"号作为状态占位符（代表：stand,walk等）
		 * 例如：http://..../mid135/#.tsa 站立最终会被替换为 http://..../mid135/stand.tsa
		 */
		private var _sourcePath:String;
		
		/**
		 * 换装资源绝对地址
		 */
		public function getFullSourcePath($status:uint):String
		{
			if(sourcePath==null || sourcePath=="")return null;
			
			var fullPath:String = _fullPathDic[$status];
			if(fullPath == null || fullPath == "")
			{
				//把int型的动作id ， 转换成字母的动作资源名称， 比如，站立动作1 --> a
				var resName:String = GlobalConfig2D.resUrlFunc($status);
				//替换占位符
				fullPath = isBitmap?sourcePath:sourcePath.replace("#",resName);
				//获取版本地址
				if(GlobalConfig2D.avatarFileVersion!=null)
				{
					fullPath = GlobalConfig2D.avatarFileVersion(fullPath);
				}
				_fullPathDic[$status] = fullPath;
			}
			return fullPath;
		}
		
		
		private var _clearSameType:Boolean = true;
		/**
		 * 是否清空同种类型的换装 
		 */
		public function get clearSameType():Boolean
		{
			return _clearSameType;
		}
		public function set clearSameType(value:Boolean):void
		{
			_clearSameType = value;
		}
		
		private var _playCompleteAutoRecycle:Boolean = false;
		/**
		 * 是否播放完毕后自动回收(注意只有当播放到最后一次的最后才会触发播放完毕事件)
		 */
		public function get playCompleteAutoRecycle():Boolean
		{
			return _playCompleteAutoRecycle;
		}
		public function set playCompleteAutoRecycle(value:Boolean):void
		{
			_playCompleteAutoRecycle = value;
		}
		
		protected var _curtStatus:uint;//当前播放的状态
		public function set curtStatus(value:uint):void
		{
			_curtStatus = value;
		}
		
		public function get curtStatus():uint
		{
			return _curtStatus;
		}
		
		protected var _curtLogic:int;//当前播放的角度
		public function set curtLogic(value:int):void
		{
			_curtLogic = value;
		}
		
		public function get curtLogic():int
		{
			return _curtLogic;
		}
		
		protected var _repeat:uint;
		public function set repeat(value:uint):void
		{
			_repeat = value;
		}
		
		public function get repeat():uint
		{
			return _repeat;
		}
		
		protected var _depth:int;
		public function set depth(value:int):void
		{
			_depth = value;
		}
		
		public function get depth():int
		{
			return _depth;
		}
		
		protected var _hasRotation:Boolean;//当前播放的角度
		public function set hasRotation($hasRotation:Boolean):void
		{
			_hasRotation = $hasRotation;
		}
		
		public function get hasRotation():Boolean
		{
			return _hasRotation;
		}
		
		protected var _blendMode:String = BlendMode.NORMAL;//当前播放的角度
		public function set blendMode($blendMode:String):void
		{
			_blendMode = $blendMode;
		}
		
		public function get blendMode():String
		{
			return _blendMode;
		}
		
		//**********************************其他参数************************************************
		/**
		 * 是Bitmap资源还是MC资源(当传入位图资源时，需要显示改变此值为true)
		 */	
		public var isBitmap:Boolean = false;
		
		//携带数据（弹道拖尾专用）***********************************************
		/**弹道拖尾APD*/		
		public var tailApd:RenderParamData;
		/**弹道拖尾与弹头之间的距离间隔(像素)*/	
		public var tailHeadDis:int = 150;
		/**弹道拖尾APD距离间隔(像素)*/	
		public var tailDis:int = 100;
		
		/**
		 * @parm $id 
		 * @parm $type 换装类型
		 * @parm $sourcePath 换装资源绝对地址  支持MC压缩资源或直接的位图格式
		 * 注意：如果此值为null，则换装为空，但依然可执行vars中的回调
		 * 使用"#"号作为状态占位符（代表：stand,walk等）
		 * 例如：http://..../mid135/#.tsa 站立最终会被替换为 http://..../mid135/stand.tsa
		 * */
		public function RenderParamData($id:int=-1,$type:String=null, $sourcePath:String="",$status:uint=1/*CharStatusType.STAND*/)
		{
			id = $id;
			type = $type;
			sourcePath = $sourcePath;
			_curtStatus = $status;
			if($sourcePath && $sourcePath.indexOf("_add")!=-1)
			{
				_blendMode = BlendMode.ADD;
			}
		}
		
		/**
		 * 创建一个副本
		 * 注意：ID也将被复制
		 */
		public function clone():RenderParamData
		{
			var apd:RenderParamData = new RenderParamData(id,type,sourcePath);
			apd.priority = priority;
			apd.mouseEnabled = mouseEnabled;
			
			apd.clearSameType = clearSameType;
			apd.sleepTime = sleepTime;
			apd.playCompleteAutoRecycle = playCompleteAutoRecycle;
			apd.isBitmap = isBitmap;
			
			if(tailApd!=null)
			{
				apd.tailApd = tailApd.clone();
			}
			apd.tailDis = tailDis;
			apd.tailHeadDis = tailHeadDis;
			return apd;
		}
		
		/**
		 * 检测是否相等
		 * 注意：不检测回调
		 */
		public function equals($toCompare:RenderParamData):Boolean
		{
			return id == $toCompare.id
				&&type == $toCompare.type
				&&sourcePath==$toCompare.sourcePath
				&&priority == $toCompare.priority
				&&clearSameType == $toCompare.clearSameType
				
				&&mouseEnabled == $toCompare.mouseEnabled
				&&sleepTime == $toCompare.sleepTime
				&&playCompleteAutoRecycle == $toCompare.playCompleteAutoRecycle
				&&isBitmap == $toCompare.isBitmap
				//&&statusList == $toCompare.statusList
				//&&logicAngleList == $toCompare.logicAngleList
				&&(
					tailApd == $toCompare.tailApd
					||
					(
						tailApd && $toCompare.tailApd
						&&
						tailApd.equals($toCompare.tailApd)
					)
				)
				&&
				tailDis == $toCompare.tailDis
				&&
				tailHeadDis == $toCompare.tailHeadDis
		}
	}
}