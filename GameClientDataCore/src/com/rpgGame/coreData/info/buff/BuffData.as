package com.rpgGame.coreData.info.buff
{
	import com.rpgGame.coreData.cfg.BuffStateDataManager;
	import com.rpgGame.coreData.cfg.ClientBuffCfgData;
	import com.rpgGame.coreData.clientConfig.ClientBuff;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.netData.buff.bean.BuffInfo;
	
	/**
	 *
	 * Buff数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-06 下午2:53:32
	 *
	 */
	public class BuffData extends BaseFaceInfo
	{
		private var _buffId:Number = 0;//服务器生成id
		private var _roleId : Number = 0;
		private var _data : Q_buff = null;
		private var _isBuff : Object = null;
		private var _specialData : Object = null;
		private var _description : String = "";
		
		private var _dizziness:Boolean;
		private var _freeze:Boolean;
		private var _silence:Boolean;
		private var _chaos:Boolean;
		private var _hiding:Boolean;
		private var _totalTime:Number = 0;
		private var _disappearTime : Number = 0;
		private var _curtStackCount : uint = 0;
		private var _buffInfo:BuffInfo;

		public function BuffData(roleId : Number) : void
		{
			_roleId = roleId;
			super(0, 0, FaceTypeEnum.BUFF + "_" + _roleId);
		}

		public function get buffData() : Q_buff
		{
			if (cfgId > 0 && !_data && !_specialData)
				_data = BuffStateDataManager.getData(cfgId);
			return _data;
		}

		public function get description() : String
		{
			if(_description != "")
				return _description;
			if (_data)
				return _data.q_description;
			return "";
		}

		override public function get name() : String
		{
			if (_name)
				return _name;
			if (_data)
				return _data.q_buff_name;
			return "";
		}

		public function set isBuff(value : Boolean) : void
		{
			_isBuff = value;
		}

		public function get isBuff() : Boolean
		{
			if (_isBuff != null)
				return _isBuff;
			if (_data)
				return _data.q_effect_type == 1;
			return false;
		}

		public function get isHidden() : Boolean
		{
			if (_data)
				return _data.q_cast_type == 0;
			return false;
		}
		
		override public function get icoName() : String
		{
			if (_icoName)
				return _icoName;
			if (_data)
				return _data.q_icon;
			return "";
		}

		public function get roleId() : Number
		{
			return _roleId;
		}

		public function get specialData() : Object
		{
			return _specialData;
		}

		public function set specialData(value : Object) : void
		{
			_specialData = value;
		}

		public function set description(value:String):void
		{
			_description = value;
		}
		
		public function setClientBuffInfo(key:String):void
		{
			var buff : ClientBuff = ClientBuffCfgData.getBuffByKey(key);
			if(!buff)
				return;
			_name = buff.name;
			_cfgId = buff.value;
			_icoName = buff.icon;
			_description = buff.description;
		}

		public function get buffInfo():BuffInfo
		{
			return _buffInfo;
		}

		public function set buffInfo(value:BuffInfo):void
		{
			_buffInfo = value;
			
			_buffId = _buffInfo.buffId.ToGID();
			cfgId = _buffInfo.buffModelId;
			_disappearTime = _buffInfo.remainTime.fValue;
			_totalTime = _buffInfo.totalTime.fValue;
			_curtStackCount = _buffInfo.overlay;
		}

		/** buff叠加次数  */
		public function get curtStackCount():uint
		{
			return _curtStackCount;
		}

		/**
		 * @private
		 */
		public function set curtStackCount(value:uint):void
		{
			_curtStackCount = value;
		}

		/** buff结束时间 */
		public function get disappearTime():Number
		{
			return _disappearTime;
		}

		/**
		 * @private
		 */
		public function set disappearTime(value:Number):void
		{
			_disappearTime = value;
		}

		public function set totalTime(value:Number):void
		{
			_totalTime = value;
		}

		public function get totalTime() : Number
		{
			return _totalTime;
		}

		/**
		 * 服务器生成的唯一id，不是配置表的id哦 
		 * @return 
		 * 
		 */		
		public function get buffId():Number
		{
			return _buffId;
		}

		public function set buffId(value:Number):void
		{
			_buffId = value;
		}

		/**
		 * EBUFFTYPE_DIZZINESS("眩晕", 1),                   // 不能攻击,不能移动
		EBUFFTYPE_FREEZE("定身", 2),                      // 不能移动跳跃
		EBUFFTYPE_SILENCE("沉默", 3),                     // 不能攻击
		EBUFFTYPE_CHAOS("混乱", 4),                       //
		EBUFFTYPE_HIDING("隐身", 5),                      // 
		 */
		public function get dizziness():Boolean
		{
			return _dizziness;
		}

		/**
		 * @private
		 */
		public function set dizziness(value:Boolean):void
		{
			_dizziness = value;
		}

		public function get freeze():Boolean
		{
			return _freeze;
		}

		public function set freeze(value:Boolean):void
		{
			_freeze = value;
		}

		public function get silence():Boolean
		{
			return _silence;
		}

		public function set silence(value:Boolean):void
		{
			_silence = value;
		}

		public function get chaos():Boolean
		{
			return _chaos;
		}

		public function set chaos(value:Boolean):void
		{
			_chaos = value;
		}

		public function get hiding():Boolean
		{
			return _hiding;
		}

		public function set hiding(value:Boolean):void
		{
			_hiding = value;
		}


	}
}
