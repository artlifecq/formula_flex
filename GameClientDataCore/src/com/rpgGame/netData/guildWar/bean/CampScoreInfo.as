package com.rpgGame.netData.guildWar.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 阵营积分信息
	 */
	public class CampScoreInfo extends Bean {
	
		//阵营名
		private var _name: String;
		
		//阵营名Id
		private var _campId: int;
		
		//积分
		private var _score: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//阵营名
			writeString(_name);
			//阵营名Id
			writeInt(_campId);
			//积分
			writeInt(_score);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//阵营名
			_name = readString();
			//阵营名Id
			_campId = readInt();
			//积分
			_score = readInt();
			return true;
		}
		
		/**
		 * get 阵营名
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 阵营名
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 阵营名Id
		 * @return 
		 */
		public function get campId(): int{
			return _campId;
		}
		
		/**
		 * set 阵营名Id
		 */
		public function set campId(value: int): void{
			this._campId = value;
		}
		
		/**
		 * get 积分
		 * @return 
		 */
		public function get score(): int{
			return _score;
		}
		
		/**
		 * set 积分
		 */
		public function set score(value: int): void{
			this._score = value;
		}
		
	}
}