package com.rpgGame.netData.offlineres.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 领奖成功消息
	 */
	public class ResGetOfflineSucMessage extends Message {
	
		//成功类型
		private var _type: int;
		
		//参数
		private var _pvalue: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//成功类型
			writeByte(_type);
			//参数
			writeInt(_pvalue);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//成功类型
			_type = readByte();
			//参数
			_pvalue = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 209103;
		}
		
		/**
		 * get 成功类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 成功类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 参数
		 * @return 
		 */
		public function get pvalue(): int{
			return _pvalue;
		}
		
		/**
		 * set 参数
		 */
		public function set pvalue(value: int): void{
			this._pvalue = value;
		}
		
	}
}