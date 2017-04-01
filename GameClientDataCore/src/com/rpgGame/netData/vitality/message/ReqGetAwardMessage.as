package com.rpgGame.netData.vitality.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 领取活跃度奖励
	 */
	public class ReqGetAwardMessage extends Message {
	
		//奖励model
		private var _awardModel: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//奖励model
			writeInt(_awardModel);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//奖励model
			_awardModel = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 205201;
		}
		
		/**
		 * get 奖励model
		 * @return 
		 */
		public function get awardModel(): int{
			return _awardModel;
		}
		
		/**
		 * set 奖励model
		 */
		public function set awardModel(value: int): void{
			this._awardModel = value;
		}
		
	}
}