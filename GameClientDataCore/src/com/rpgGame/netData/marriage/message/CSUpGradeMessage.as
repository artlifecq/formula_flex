package com.rpgGame.netData.marriage.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 进阶
	 */
	public class CSUpGradeMessage extends Message {
	
		//1 进阶   2 突破      3 自动突破
		private var _type: int;
		
		//0 不自动购买材料    1 自动购买材料
		private var _autoBuy: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1 进阶   2 突破      3 自动突破
			writeInt(_type);
			//0 不自动购买材料    1 自动购买材料
			writeInt(_autoBuy);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1 进阶   2 突破      3 自动突破
			_type = readInt();
			//0 不自动购买材料    1 自动购买材料
			_autoBuy = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150109;
		}
		
		/**
		 * get 1 进阶   2 突破      3 自动突破
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 1 进阶   2 突破      3 自动突破
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 0 不自动购买材料    1 自动购买材料
		 * @return 
		 */
		public function get autoBuy(): int{
			return _autoBuy;
		}
		
		/**
		 * set 0 不自动购买材料    1 自动购买材料
		 */
		public function set autoBuy(value: int): void{
			this._autoBuy = value;
		}
		
	}
}