package com.rpgGame.netData.horse.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求坐骑信息
	 */
	public class ReqSendHorseInfoToGameMessage extends Message {
	
		//坐骑ID(0表示发送所有坐骑列表)
		private var _horseModelid: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//坐骑ID(0表示发送所有坐骑列表)
			writeByte(_horseModelid);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//坐骑ID(0表示发送所有坐骑列表)
			_horseModelid = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 144201;
		}
		
		/**
		 * get 坐骑ID(0表示发送所有坐骑列表)
		 * @return 
		 */
		public function get horseModelid(): int{
			return _horseModelid;
		}
		
		/**
		 * set 坐骑ID(0表示发送所有坐骑列表)
		 */
		public function set horseModelid(value: int): void{
			this._horseModelid = value;
		}
		
	}
}