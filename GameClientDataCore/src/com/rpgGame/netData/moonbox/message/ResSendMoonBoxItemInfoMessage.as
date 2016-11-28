package com.rpgGame.netData.moonbox.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送月光宝盒仓库物品信息
	 */
	public class ResSendMoonBoxItemInfoMessage extends Message {
	
		//月光宝盒等级
		private var _level: int;
		
		//当前经验
		private var _exp: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//月光宝盒等级
			writeInt(_level);
			//当前经验
			writeInt(_exp);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//月光宝盒等级
			_level = readInt();
			//当前经验
			_exp = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 217105;
		}
		
		/**
		 * get 月光宝盒等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 月光宝盒等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 当前经验
		 * @return 
		 */
		public function get exp(): int{
			return _exp;
		}
		
		/**
		 * set 当前经验
		 */
		public function set exp(value: int): void{
			this._exp = value;
		}
		
	}
}