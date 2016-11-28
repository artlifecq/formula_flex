package com.rpgGame.netData.horse.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求乘骑或者休息
	 */
	public class ReqHorseIllusionToGameMessage extends Message {
	
		//坐骑ID(0表示休息)
		private var _horseModelid: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//坐骑ID(0表示休息)
			writeShort(_horseModelid);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//坐骑ID(0表示休息)
			_horseModelid = readShort();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 144203;
		}
		
		/**
		 * get 坐骑ID(0表示休息)
		 * @return 
		 */
		public function get horseModelid(): int{
			return _horseModelid;
		}
		
		/**
		 * set 坐骑ID(0表示休息)
		 */
		public function set horseModelid(value: int): void{
			this._horseModelid = value;
		}
		
	}
}