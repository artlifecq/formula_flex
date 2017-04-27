package com.rpgGame.netData.meridian.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求升级穴位
	 */
	public class CSlevelUpAcuPointsMessage extends Message {
	
		//筋脉Id
		private var _MeridId: int;
		
		//穴位ID
		private var _acuPointId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//筋脉Id
			writeInt(_MeridId);
			//穴位ID
			writeInt(_acuPointId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//筋脉Id
			_MeridId = readInt();
			//穴位ID
			_acuPointId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 225201;
		}
		
		/**
		 * get 筋脉Id
		 * @return 
		 */
		public function get MeridId(): int{
			return _MeridId;
		}
		
		/**
		 * set 筋脉Id
		 */
		public function set MeridId(value: int): void{
			this._MeridId = value;
		}
		
		/**
		 * get 穴位ID
		 * @return 
		 */
		public function get acuPointId(): int{
			return _acuPointId;
		}
		
		/**
		 * set 穴位ID
		 */
		public function set acuPointId(value: int): void{
			this._acuPointId = value;
		}
		
	}
}