package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮贡捐献
	 */
	public class ReqGuildDevoteMessage extends Message {
	
		//类型 0 金币 1青龙令 2白虎令 3朱雀令 4玄武令
		private var _deType: int;
		
		//数量
		private var _num: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//类型 0 金币 1青龙令 2白虎令 3朱雀令 4玄武令
			writeInt(_deType);
			//数量
			writeInt(_num);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//类型 0 金币 1青龙令 2白虎令 3朱雀令 4玄武令
			_deType = readInt();
			//数量
			_num = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111230;
		}
		
		/**
		 * get 类型 0 金币 1青龙令 2白虎令 3朱雀令 4玄武令
		 * @return 
		 */
		public function get deType(): int{
			return _deType;
		}
		
		/**
		 * set 类型 0 金币 1青龙令 2白虎令 3朱雀令 4玄武令
		 */
		public function set deType(value: int): void{
			this._deType = value;
		}
		
		/**
		 * get 数量
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 数量
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
	}
}