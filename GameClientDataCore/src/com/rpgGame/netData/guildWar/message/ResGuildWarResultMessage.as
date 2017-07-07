package com.rpgGame.netData.guildWar.message{
	import com.rpgGame.netData.guildWar.bean.GuildWarResultRank;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知战争结束
	 */
	public class ResGuildWarResultMessage extends Message {
	
		//赢方阵营名
		private var _winCampName: String;
		
		//赢方阵营id
		private var _winCampId: int;
		
		//输方阵营名
		private var _lostCampName: String;
		
		//输方阵营id
		private var _lostCampId: int;
		
		//自己阵营总积分
		private var _myCampScore: int;
		
		//自己排名
		private var _myRank: int;
		
		//个人击杀数
		private var _myKillCnt: int;
		
		//个人积分
		private var _mySource: int;
		
		//个人积分排名列表
		private var _rankList: Vector.<GuildWarResultRank> = new Vector.<GuildWarResultRank>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//赢方阵营名
			writeString(_winCampName);
			//赢方阵营id
			writeInt(_winCampId);
			//输方阵营名
			writeString(_lostCampName);
			//输方阵营id
			writeInt(_lostCampId);
			//自己阵营总积分
			writeInt(_myCampScore);
			//自己排名
			writeInt(_myRank);
			//个人击杀数
			writeInt(_myKillCnt);
			//个人积分
			writeInt(_mySource);
			//个人积分排名列表
			writeShort(_rankList.length);
			for (i = 0; i < _rankList.length; i++) {
				writeBean(_rankList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//赢方阵营名
			_winCampName = readString();
			//赢方阵营id
			_winCampId = readInt();
			//输方阵营名
			_lostCampName = readString();
			//输方阵营id
			_lostCampId = readInt();
			//自己阵营总积分
			_myCampScore = readInt();
			//自己排名
			_myRank = readInt();
			//个人击杀数
			_myKillCnt = readInt();
			//个人积分
			_mySource = readInt();
			//个人积分排名列表
			var rankList_length : int = readShort();
			for (i = 0; i < rankList_length; i++) {
				_rankList[i] = readBean(GuildWarResultRank) as GuildWarResultRank;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 253112;
		}
		
		/**
		 * get 赢方阵营名
		 * @return 
		 */
		public function get winCampName(): String{
			return _winCampName;
		}
		
		/**
		 * set 赢方阵营名
		 */
		public function set winCampName(value: String): void{
			this._winCampName = value;
		}
		
		/**
		 * get 赢方阵营id
		 * @return 
		 */
		public function get winCampId(): int{
			return _winCampId;
		}
		
		/**
		 * set 赢方阵营id
		 */
		public function set winCampId(value: int): void{
			this._winCampId = value;
		}
		
		/**
		 * get 输方阵营名
		 * @return 
		 */
		public function get lostCampName(): String{
			return _lostCampName;
		}
		
		/**
		 * set 输方阵营名
		 */
		public function set lostCampName(value: String): void{
			this._lostCampName = value;
		}
		
		/**
		 * get 输方阵营id
		 * @return 
		 */
		public function get lostCampId(): int{
			return _lostCampId;
		}
		
		/**
		 * set 输方阵营id
		 */
		public function set lostCampId(value: int): void{
			this._lostCampId = value;
		}
		
		/**
		 * get 自己阵营总积分
		 * @return 
		 */
		public function get myCampScore(): int{
			return _myCampScore;
		}
		
		/**
		 * set 自己阵营总积分
		 */
		public function set myCampScore(value: int): void{
			this._myCampScore = value;
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
		
		/**
		 * get 个人击杀数
		 * @return 
		 */
		public function get myKillCnt(): int{
			return _myKillCnt;
		}
		
		/**
		 * set 个人击杀数
		 */
		public function set myKillCnt(value: int): void{
			this._myKillCnt = value;
		}
		
		/**
		 * get 个人积分
		 * @return 
		 */
		public function get mySource(): int{
			return _mySource;
		}
		
		/**
		 * set 个人积分
		 */
		public function set mySource(value: int): void{
			this._mySource = value;
		}
		
		/**
		 * get 个人积分排名列表
		 * @return 
		 */
		public function get rankList(): Vector.<GuildWarResultRank>{
			return _rankList;
		}
		
		/**
		 * set 个人积分排名列表
		 */
		public function set rankList(value: Vector.<GuildWarResultRank>): void{
			this._rankList = value;
		}
		
	}
}