package com.rpgGame.coreData.info.buff
{
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.coreData.cfg.BuffStateDataManager;
	import com.rpgGame.coreData.cfg.ClientBuffCfgData;
	import com.rpgGame.coreData.clientConfig.ClientBuff;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.netData.buff.bean.BuffInfo;
	
	/**
	 * buff数据--部分数据是客户端从服务器读过来，另外部分数据是读buff表的 
	 * buff相关的都是围绕这个数据来表现的
	 * @author NEIL
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
		
		private var _totalTime:Number = 0;
		private var _disappearTime : Number = 0;
		private var _curtStackCount : uint = 0;
		private var _buffInfo:BuffInfo;
		
		private var _clientData:Object=null;
		
		private var _srcRole:BaseRole;

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
		
		public function get buffStates():String
		{
			if (cfgId > 0 && !_data && !_specialData)
				_data = BuffStateDataManager.getData(cfgId);
			var str:String = _data.q_action_type;
			return str.substring(1,str.length-1);
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
		 * [{"skill":1008,"up":340,"stay":340,"down":340,"h":300}]
                           客户端other（
						   * 受击时间: hit
						   * 上升时间:"up"；
						   * 被同步的技能ID："skill"；
						   * 浮空时间："stay"；
						   * 落地时间："down"；
						   * 离地高度："h"
						   * 变身模型：model
		 * @return 
		 * 
		 */		
		public function get clientData():Object
		{
			try
			{
				_clientData = JSON.parse(_data.q_client_other)[0];
			}
			catch(e:Error)
			{
				trace(e.message + "\t" + _data.q_buff_id);
			}
			return _clientData;
		}

		public function get srcRole():BaseRole
		{
			return _srcRole;
		}

		public function set srcRole(value:BaseRole):void
		{
			_srcRole = value;
		}

	}
}
