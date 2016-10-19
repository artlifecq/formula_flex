package com.rpgGame.coreData.info.buff
{
	import com.rpgGame.coreData.cfg.BuffStateDataManager;
	import com.rpgGame.coreData.cfg.ClientBuffCfgData;
	import com.rpgGame.coreData.clientConfig.ClientBuff;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	
	import app.message.StateProto;

	/**
	 *
	 * Buff数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-06 下午2:53:32
	 *
	 */
	public class BuffInfo extends BaseFaceInfo
	{
		/** buff叠加次数  */
		public var curtStackCount : uint = 0;
		/** buff结束时间 */
		public var disappearTime : Number = 0;
		private var _roleId : Number = 0;
		private var _stateProto : StateProto = null;
		private var _isBuff : Object = null;
		private var _specialData : Object = null;
		private var _description : String = "";

		public function BuffInfo(roleId : Number) : void
		{
			_roleId = roleId;
			super(0, 0, FaceTypeEnum.BUFF + "_" + _roleId);
		}

		public function get stateProto() : StateProto
		{
			if (cfgId > 0 && !_stateProto && !_specialData)
				_stateProto = BuffStateDataManager.getData(cfgId);
			return _stateProto;
		}

		public function get description() : String
		{
			if(_description != "")
				return _description;
			if (stateProto)
				return stateProto.description;
			return "";
		}

		override public function get name() : String
		{
			if (_name)
				return _name;
			if (stateProto)
				return stateProto.name;
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
			if (stateProto)
				return stateProto.isBuff;
			return false;
		}

		public function get totalTime() : Number
		{
			if (stateProto)
				return stateProto.totalTime.toNumber();
			return 0;
		}

		public function get isHidden() : Boolean
		{
			if (stateProto)
				return stateProto.isHidden;
			return false;
		}

		override public function get icoName() : String
		{
			if (_icoName)
				return _icoName;
			if (stateProto)
				return stateProto.icon;
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

	}
}
