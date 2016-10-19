package com.rpgGame.coreData.cfg.country
{
	import flash.utils.Dictionary;

	import app.message.Int32PairProto;
	import app.message.TaoNiConfig;
	import app.message.TaoNiDungeonProto;
	import app.message.TaoNiDungeonProto.TaoNiStageProto;

	/**
	 *
	 * 国家讨逆静态数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-5-3 上午11:32:15
	 *
	 */
	public class CountryTaoNiCfgData
	{
		private static var _taoNiDungeonProto : TaoNiDungeonProto;
		private static var _stageMonsterCountById : Array;
		private static var _scenes : Array;
		private static var _timeData : String;
		private static var _duration : Number;
		private static var _maxStage : int;

		public function CountryTaoNiCfgData()
		{
		}

		public static function get maxStage() : int
		{
			return _maxStage;
		}

		public static function get duration() : Number
		{
			return _duration;
		}

		public static function get timeData() : String
		{
			return _timeData;
		}

		public static function get scenes() : Array
		{
			return _scenes;
		}

		public static function setConfig(config : TaoNiConfig) : void
		{
			if (!config)
				return;
			if (config.miscData)
			{
				_scenes = config.miscData.scene;
				_timeData = config.miscData.timeData;
				_duration = config.miscData.duration.toNumber();
			}
		}

		public static function setSceneConfig(config : TaoNiDungeonProto) : void
		{
			if (!config)
				return;
			_taoNiDungeonProto = config;
			_stageMonsterCountById = [];
			_maxStage = _taoNiDungeonProto.stages.length;
			for (var i : int = 0; i < _maxStage; i++)
			{
				var stageProto : TaoNiStageProto = _taoNiDungeonProto.stages[i];
				var countById : Dictionary = _stageMonsterCountById[i];
				if (!countById)
				{
					countById = new Dictionary();
					_stageMonsterCountById[i] = countById;
				}
				for each (var pairProto : Int32PairProto in stageProto.monsterIdCount)
				{
					var monsterId : int = pairProto.key;
					countById[monsterId] = pairProto.value;
				}
			}
		}

		public static function getTaoNiStageProto(stage : int) : TaoNiStageProto
		{
			var stageIndex : int = stage - 1;
			if (_taoNiDungeonProto && _taoNiDungeonProto.stages && stageIndex > -1 && stageIndex < _taoNiDungeonProto.stages.length)
			{
				return _taoNiDungeonProto.stages[stageIndex];
			}
			return null;
		}

		public static function getMonsterCountById(stage : int) : Dictionary
		{
			var stageIndex : int = stage - 1;
			var countById : Dictionary = _stageMonsterCountById[stageIndex];
			return countById;
		}
	}
}
