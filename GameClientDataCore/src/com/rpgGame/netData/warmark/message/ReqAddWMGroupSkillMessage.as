package com.rpgGame.netData.warmark.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求添加战印组合技能
	 */
	public class ReqAddWMGroupSkillMessage extends Message {
	
		//模版Id
		private var _srcModelId: int;
		
		//模版Id
		private var _toModelId: int;
		
		//格子Id
		private var _gridId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//模版Id
			writeInt(_srcModelId);
			//模版Id
			writeInt(_toModelId);
			//格子Id
			writeInt(_gridId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//模版Id
			_srcModelId = readInt();
			//模版Id
			_toModelId = readInt();
			//格子Id
			_gridId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 193204;
		}
		
		/**
		 * get 模版Id
		 * @return 
		 */
		public function get srcModelId(): int{
			return _srcModelId;
		}
		
		/**
		 * set 模版Id
		 */
		public function set srcModelId(value: int): void{
			this._srcModelId = value;
		}
		
		/**
		 * get 模版Id
		 * @return 
		 */
		public function get toModelId(): int{
			return _toModelId;
		}
		
		/**
		 * set 模版Id
		 */
		public function set toModelId(value: int): void{
			this._toModelId = value;
		}
		
		/**
		 * get 格子Id
		 * @return 
		 */
		public function get gridId(): int{
			return _gridId;
		}
		
		/**
		 * set 格子Id
		 */
		public function set gridId(value: int): void{
			this._gridId = value;
		}
		
	}
}