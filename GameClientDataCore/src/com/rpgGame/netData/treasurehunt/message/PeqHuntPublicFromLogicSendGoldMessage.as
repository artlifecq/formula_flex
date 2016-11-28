package com.rpgGame.netData.treasurehunt.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 公共服同步奖池元宝到All游戏服
	 */
	public class PeqHuntPublicFromLogicSendGoldMessage extends Message {
	
		//奖池元宝数
		private var _allGold: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//奖池元宝数
			writeInt(_allGold);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//奖池元宝数
			_allGold = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 160211;
		}
		
		/**
		 * get 奖池元宝数
		 * @return 
		 */
		public function get allGold(): int{
			return _allGold;
		}
		
		/**
		 * set 奖池元宝数
		 */
		public function set allGold(value: int): void{
			this._allGold = value;
		}
		
	}
}