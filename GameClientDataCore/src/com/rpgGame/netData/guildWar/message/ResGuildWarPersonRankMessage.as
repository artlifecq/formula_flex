package com.rpgGame.netData.guildWar.message{
	import com.rpgGame.netData.guildWar.bean.CampPersonRankInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知帮会战玩家排名
	 */
	public class ResGuildWarPersonRankMessage extends Message {
	
		//列表
		private var _infos: Vector.<CampPersonRankInfo> = new Vector.<CampPersonRankInfo>();
		//自己排名
		private var _myRank: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//列表
			writeShort(_infos.length);
			for (i = 0; i < _infos.length; i++) {
				writeBean(_infos[i]);
			}
			//自己排名
			writeInt(_myRank);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//列表
			var infos_length : int = readShort();
			for (i = 0; i < infos_length; i++) {
				_infos[i] = readBean(CampPersonRankInfo) as CampPersonRankInfo;
			}
			//自己排名
			_myRank = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253108;
		}
		
		/**
		 * get 列表
		 * @return 
		 */
		public function get infos(): Vector.<CampPersonRankInfo>{
			return _infos;
		}
		
		/**
		 * set 列表
		 */
		public function set infos(value: Vector.<CampPersonRankInfo>): void{
			this._infos = value;
		}
		
		/**
		 * get 自己排名
		 * @return 
		 */
		public function get myRank(): int{
			return _myRank;
		}
		
		/**
		 * set 自己排名
		 */
		public function set myRank(value: int): void{
			this._myRank = value;
		}
		
	}
}