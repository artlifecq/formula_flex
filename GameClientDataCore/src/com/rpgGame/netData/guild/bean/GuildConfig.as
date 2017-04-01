package com.rpgGame.netData.guild.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮会配置
	 */
	public class GuildConfig extends Bean {
	
		//帮会自动加入
		private var _autoJoin: int;
		
		//加入等级限制
		private var _levelLimit: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮会自动加入
			writeByte(_autoJoin);
			//加入等级限制
			writeInt(_levelLimit);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮会自动加入
			_autoJoin = readByte();
			//加入等级限制
			_levelLimit = readInt();
			return true;
		}
		
		/**
		 * get 帮会自动加入
		 * @return 
		 */
		public function get autoJoin(): int{
			return _autoJoin;
		}
		
		/**
		 * set 帮会自动加入
		 */
		public function set autoJoin(value: int): void{
			this._autoJoin = value;
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