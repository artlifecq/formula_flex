package com.rpgGame.netData.guildWar.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知个人信息
	 */
	public class ResGuildWarPersionInfoMessage extends Message {
	
		//个人积分
		private var _score: int;
		
		//排名
		private var _rank: int;
		
		//累计击杀数
		private var _allKillCnt: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//个人积分
			writeInt(_score);
			//排名
			writeInt(_rank);
			//累计击杀数
			writeInt(_allKillCnt);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//个人积分
			_score = readInt();
			//排名
			_rank = readInt();
			//累计击杀数
			_allKillCnt = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253109;
		}
		
		/**
		 * get 个人积分
		 * @return 
		 */
		public function get score(): int{
			return _score;
		}
		
		/**
		 * set 个人积分
		 */
		public function set score(value: int): void{
			this._score = value;
		}
		
		/**
		 * get 排名
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 排名
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
		/**
		 * get 累计击杀数
		 * @return 
		 */
		public function get allKillCnt(): int{
			return _allKillCnt;
		}
		
		/**
		 * set 累计击杀数
		 */
		public function set allKillCnt(value: int): void{
			this._allKillCnt = value;
		}
		
	}
}