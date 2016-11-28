package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求更换帮旗
	 */
	public class ReqChangeGuildFlagMessage extends Message {
	
		//帮旗Id
		private var _flagModel: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮旗Id
			writeInt(_flagModel);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮旗Id
			_flagModel = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111219;
		}
		
		/**
		 * get 帮旗Id
		 * @return 
		 */
		public function get flagModel(): int{
			return _flagModel;
		}
		
		/**
		 * set 帮旗Id
		 */
		public function set flagModel(value: int): void{
			this._flagModel = value;
		}
		
	}
}