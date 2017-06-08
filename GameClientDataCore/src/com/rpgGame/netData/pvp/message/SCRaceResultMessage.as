package com.rpgGame.netData.pvp.message{
	import com.rpgGame.netData.zhengba.bean.AwardItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 比赛结果
	 */
	public class SCRaceResultMessage extends Message {
	
		//结果  1 胜利   0 失败
		private var _result: int;
		
		//奖励
		private var _awardItemInfos: Vector.<com.rpgGame.netData.zhengba.bean.AwardItemInfo> = new Vector.<com.rpgGame.netData.zhengba.bean.AwardItemInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//结果  1 胜利   0 失败
			writeInt(_result);
			//奖励
			writeShort(_awardItemInfos.length);
			for (i = 0; i < _awardItemInfos.length; i++) {
				writeBean(_awardItemInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//结果  1 胜利   0 失败
			_result = readInt();
			//奖励
			var awardItemInfos_length : int = readShort();
			for (i = 0; i < awardItemInfos_length; i++) {
				_awardItemInfos[i] = readBean(com.rpgGame.netData.zhengba.bean.AwardItemInfo) as com.rpgGame.netData.zhengba.bean.AwardItemInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 128105;
		}
		
		/**
		 * get 结果  1 胜利   0 失败
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 结果  1 胜利   0 失败
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
		/**
		 * get 奖励
		 * @return 
		 */
		public function get awardItemInfos(): Vector.<com.rpgGame.netData.zhengba.bean.AwardItemInfo>{
			return _awardItemInfos;
		}
		
		/**
		 * set 奖励
		 */
		public function set awardItemInfos(value: Vector.<com.rpgGame.netData.zhengba.bean.AwardItemInfo>): void{
			this._awardItemInfos = value;
		}
		
	}
}