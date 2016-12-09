package com.rpgGame.netData.zone.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 校场排行
	 */
	public class JiaoChangRankInfo extends Bean {
	
		//角色名字
		private var _name: String;
		
		//总积分
		private var _totalscore: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色名字
			writeString(_name);
			//总积分
			writeInt(_totalscore);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色名字
			_name = readString();
			//总积分
			_totalscore = readInt();
			return true;
		}
		
		/**
		 * get 角色名字
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 角色名字
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 总积分
		 * @return 
		 */
		public function get totalscore(): int{
			return _totalscore;
		}
		
		/**
		 * set 总积分
		 */
		public function set totalscore(value: int): void{
			this._totalscore = value;
		}
		
	}
}