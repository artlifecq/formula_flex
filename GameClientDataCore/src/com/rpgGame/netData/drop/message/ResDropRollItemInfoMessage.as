package com.rpgGame.netData.drop.message{
	import com.rpgGame.netData.drop.bean.RollItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送Roll点物品信息消息
	 */
	public class ResDropRollItemInfoMessage extends Message {
	
		//Roll点物品信息
		private var _rollInfo: RollItemInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//Roll点物品信息
			writeBean(_rollInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//Roll点物品信息
			_rollInfo = readBean(RollItemInfo) as RollItemInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 210101;
		}
		
		/**
		 * get Roll点物品信息
		 * @return 
		 */
		public function get rollInfo(): RollItemInfo{
			return _rollInfo;
		}
		
		/**
		 * set Roll点物品信息
		 */
		public function set rollInfo(value: RollItemInfo): void{
			this._rollInfo = value;
		}
		
	}
}