package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 扫荡战役副本
	 */
	public class ReqBattleZoneSweepToGameMessage extends Message {
	
		//1是扫荡。2是领取
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1是扫荡。2是领取
			writeInt(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1是扫荡。2是领取
			_type = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155203;
		}
		
		/**
		 * get 1是扫荡。2是领取
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 1是扫荡。2是领取
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}