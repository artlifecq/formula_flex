package com.rpgGame.netData.pet.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 玩家外观展示信息
	 */
	public class PetInfo extends Bean {
	
		//侍宠模板ID
		private var _modelId: int;
		
		//侍宠等级
		private var _level: int;
		
		//侍宠阶级
		private var _rank: int;
		
		//进阶经验
		private var _rankExp: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//侍宠模板ID
			writeInt(_modelId);
			//侍宠等级
			writeInt(_level);
			//侍宠阶级
			writeInt(_rank);
			//进阶经验
			writeInt(_rankExp);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//侍宠模板ID
			_modelId = readInt();
			//侍宠等级
			_level = readInt();
			//侍宠阶级
			_rank = readInt();
			//进阶经验
			_rankExp = readInt();
			return true;
		}
		
		/**
		 * get 侍宠模板ID
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set 侍宠模板ID
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
		}
		
		/**
		 * get 侍宠等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 侍宠等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 侍宠阶级
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 侍宠阶级
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
		/**
		 * get 进阶经验
		 * @return 
		 */
		public function get rankExp(): int{
			return _rankExp;
		}
		
		/**
		 * set 进阶经验
		 */
		public function set rankExp(value: int): void{
			this._rankExp = value;
		}
		
	}
}