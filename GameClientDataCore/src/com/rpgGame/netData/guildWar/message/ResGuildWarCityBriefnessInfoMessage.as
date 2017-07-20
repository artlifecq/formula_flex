package com.rpgGame.netData.guildWar.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知城市信息
	 */
	public class ResGuildWarCityBriefnessInfoMessage extends Message {
	
		//城市id
		private var _cityId: int;
		
		//结束时间点(s)
		private var _endTime: int;
		
		//防守阵营id
		private var _defendCmapId: int;
		
		//统帅技能冷却时间(s)
		private var _leaderSkillCooling: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//城市id
			writeInt(_cityId);
			//结束时间点(s)
			writeInt(_endTime);
			//防守阵营id
			writeInt(_defendCmapId);
			//统帅技能冷却时间(s)
			writeInt(_leaderSkillCooling);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//城市id
			_cityId = readInt();
			//结束时间点(s)
			_endTime = readInt();
			//防守阵营id
			_defendCmapId = readInt();
			//统帅技能冷却时间(s)
			_leaderSkillCooling = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253110;
		}
		
		/**
		 * get 城市id
		 * @return 
		 */
		public function get cityId(): int{
			return _cityId;
		}
		
		/**
		 * set 城市id
		 */
		public function set cityId(value: int): void{
			this._cityId = value;
		}
		
		/**
		 * get 结束时间点(s)
		 * @return 
		 */
		public function get endTime(): int{
			return _endTime;
		}
		
		/**
		 * set 结束时间点(s)
		 */
		public function set endTime(value: int): void{
			this._endTime = value;
		}
		
		/**
		 * get 防守阵营id
		 * @return 
		 */
		public function get defendCmapId(): int{
			return _defendCmapId;
		}
		
		/**
		 * set 防守阵营id
		 */
		public function set defendCmapId(value: int): void{
			this._defendCmapId = value;
		}
		
		/**
		 * get 统帅技能冷却时间(s)
		 * @return 
		 */
		public function get leaderSkillCooling(): int{
			return _leaderSkillCooling;
		}
		
		/**
		 * set 统帅技能冷却时间(s)
		 */
		public function set leaderSkillCooling(value: int): void{
			this._leaderSkillCooling = value;
		}
		
	}
}