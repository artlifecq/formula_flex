package com.rpgGame.app.ui.main.guide
{
	import com.rpgGame.coreData.clientConfig.Q_player_guide;

	public class GuideQuene
	{
		private var list:Vector.<Q_player_guide>=new Vector.<Q_player_guide>();
		private var _guideType:int;
		private var _startType:int;
	
		public function GuideQuene(s:int,g:int)
		{
			this._guideType=g;
			this._startType=s;
		}

		public function get startType():int
		{
			return _startType;
		}

		public function get guideType():int
		{
			return _guideType;
		}

		public function addNode(config:Q_player_guide):void
		{
			list.push(config);
		}
		public function sort():void
		{
			list.sort(onSort);
		}
		public function onSort(aConfig:Q_player_guide,bConfig:Q_player_guide):int
		{
			var intA:int=aConfig.q_id.split("_")[1];
			var intB:int=bConfig.q_id.split("_")[1];
			if (intA<intB) 
			{
				return -1;
			}
			else if (intA>intB) 
			{
				return 1;
			}
			return 0;
		}
		public function next():Q_player_guide
		{
			return list.shift();
		}
	}
}