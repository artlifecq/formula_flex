package com.rpgGame.netData.zone.message{
	import com.rpgGame.netData.zone.bean.JiaoChangRankInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回绝校场信息
	 */
	public class ResJiaoChangInfoMessage extends Message {
	
		//校场排名
		private var _jiaochangRankList: Vector.<JiaoChangRankInfo> = new Vector.<JiaoChangRankInfo>();
		//玩家当前积分
		private var _score: int;
		
		//玩家最大连击数
		private var _mosthit: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//校场排名
			writeShort(_jiaochangRankList.length);
			for (i = 0; i < _jiaochangRankList.length; i++) {
				writeBean(_jiaochangRankList[i]);
			}
			//玩家当前积分
			writeInt(_score);
			//玩家最大连击数
			writeShort(_mosthit);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//校场排名
			var jiaochangRankList_length : int = readShort();
			for (i = 0; i < jiaochangRankList_length; i++) {
				_jiaochangRankList[i] = readBean(JiaoChangRankInfo) as JiaoChangRankInfo;
			}
			//玩家当前积分
			_score = readInt();
			//玩家最大连击数
			_mosthit = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155111;
		}
		
		/**
		 * get 校场排名
		 * @return 
		 */
		public function get jiaochangRankList(): Vector.<JiaoChangRankInfo>{
			return _jiaochangRankList;
		}
		
		/**
		 * set 校场排名
		 */
		public function set jiaochangRankList(value: Vector.<JiaoChangRankInfo>): void{
			this._jiaochangRankList = value;
		}
		
		/**
		 * get 玩家当前积分
		 * @return 
		 */
		public function get score(): int{
			return _score;
		}
		
		/**
		 * set 玩家当前积分
		 */
		public function set score(value: int): void{
			this._score = value;
		}
		
		/**
		 * get 玩家最大连击数
		 * @return 
		 */
		public function get mosthit(): int{
			return _mosthit;
		}
		
		/**
		 * set 玩家最大连击数
		 */
		public function set mosthit(value: int): void{
			this._mosthit = value;
		}
		
	}
}