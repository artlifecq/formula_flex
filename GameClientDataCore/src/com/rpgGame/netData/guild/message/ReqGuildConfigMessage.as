package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 修改帮会设置
	 */
	public class ReqGuildConfigMessage extends Message {
	
		//自动同意加入帮会的申请(0 否 1是)
		private var _autoGuildAgreeAdd: int;
		
		//加入等级限制
		private var _levelLimit: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//自动同意加入帮会的申请(0 否 1是)
			writeByte(_autoGuildAgreeAdd);
			//加入等级限制
			writeInt(_levelLimit);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//自动同意加入帮会的申请(0 否 1是)
			_autoGuildAgreeAdd = readByte();
			//加入等级限制
			_levelLimit = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111212;
		}
		
		/**
		 * get 自动同意加入帮会的申请(0 否 1是)
		 * @return 
		 */
		public function get autoGuildAgreeAdd(): int{
			return _autoGuildAgreeAdd;
		}
		
		/**
		 * set 自动同意加入帮会的申请(0 否 1是)
		 */
		public function set autoGuildAgreeAdd(value: int): void{
			this._autoGuildAgreeAdd = value;
		}
		
		/**
		 * get 加入等级限制
		 * @return 
		 */
		public function get levelLimit(): int{
			return _levelLimit;
		}
		
		/**
		 * set 加入等级限制
		 */
		public function set levelLimit(value: int): void{
			this._levelLimit = value;
		}
		
	}
}