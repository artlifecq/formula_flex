package com.rpgGame.netData.map.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * bossAI信息
	 */
	public class BossAIInfo extends Bean {
	
		//阶段（0表示没有开始 1,2,3...和后端约定）
		private var _step: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//阶段（0表示没有开始 1,2,3...和后端约定）
			writeByte(_step);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//阶段（0表示没有开始 1,2,3...和后端约定）
			_step = readByte();
			return true;
		}
		
		/**
		 * get 阶段（0表示没有开始 1,2,3...和后端约定）
		 * @return 
		 */
		public function get step(): int{
			return _step;
		}
		
		/**
		 * set 阶段（0表示没有开始 1,2,3...和后端约定）
		 */
		public function set step(value: int): void{
			this._step = value;
		}
		
	}
}