package com.rpgGame.netData.zone.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 武神殿珊栏动画信息
	 */
	public class ResWuShenDianAnimationMessage extends Message {
	
		//特效唯一ID
		private var _effecfId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//特效唯一ID
			writeLong(_effecfId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//特效唯一ID
			_effecfId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155135;
		}
		
		/**
		 * get 特效唯一ID
		 * @return 
		 */
		public function get effecfId(): long{
			return _effecfId;
		}
		
		/**
		 * set 特效唯一ID
		 */
		public function set effecfId(value: long): void{
			this._effecfId = value;
		}
		
	}
}