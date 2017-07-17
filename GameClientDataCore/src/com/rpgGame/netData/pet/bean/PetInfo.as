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
		
		//侍宠阶级
		private var _rank: int;
		
		//进阶经验
		private var _rankExp: int;
		
		//是否已经激活1激活
		private var _actived: int;
		
		//已通的关卡
		private var _passlevel: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//侍宠模板ID
			writeInt(_modelId);
			//侍宠阶级
			writeInt(_rank);
			//进阶经验
			writeInt(_rankExp);
			//是否已经激活1激活
			writeByte(_actived);
			//已通的关卡
			writeByte(_passlevel);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//侍宠模板ID
			_modelId = readInt();
			//侍宠阶级
			_rank = readInt();
			//进阶经验
			_rankExp = readInt();
			//是否已经激活1激活
			_actived = readByte();
			//已通的关卡
			_passlevel = readByte();
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
		
		/**
		 * get 是否已经激活1激活
		 * @return 
		 */
		public function get actived(): int{
			return _actived;
		}
		
		/**
		 * set 是否已经激活1激活
		 */
		public function set actived(value: int): void{
			this._actived = value;
		}
		
		/**
		 * get 已通的关卡
		 * @return 
		 */
		public function get passlevel(): int{
			return _passlevel;
		}
		
		/**
		 * set 已通的关卡
		 */
		public function set passlevel(value: int): void{
			this._passlevel = value;
		}
		
	}
}