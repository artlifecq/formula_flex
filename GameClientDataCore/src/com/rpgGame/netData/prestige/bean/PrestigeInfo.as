package com.rpgGame.netData.prestige.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 声望信息
	 */
	public class PrestigeInfo extends Bean {
	
		//声望阵营 0未选择，1东厂，2西厂
		private var _campType: int;
		
		//东厂声望
		private var _eastPrestige: int;
		
		//西厂声望
		private var _westPrestige: int;
		
		//声望商店不能购买物品是否显示 0显示，1不显示
		private var _notShow: int;
		
		//声望任务材料
		private var _materials: String;
		
		//切换阵营所需元宝
		private var _changeCampNeedGold: int;
		
		//今日已完成声望任务次数
		private var _prestigeTaskTimes: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//声望阵营 0未选择，1东厂，2西厂
			writeByte(_campType);
			//东厂声望
			writeInt(_eastPrestige);
			//西厂声望
			writeInt(_westPrestige);
			//声望商店不能购买物品是否显示 0显示，1不显示
			writeByte(_notShow);
			//声望任务材料
			writeString(_materials);
			//切换阵营所需元宝
			writeInt(_changeCampNeedGold);
			//今日已完成声望任务次数
			writeInt(_prestigeTaskTimes);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//声望阵营 0未选择，1东厂，2西厂
			_campType = readByte();
			//东厂声望
			_eastPrestige = readInt();
			//西厂声望
			_westPrestige = readInt();
			//声望商店不能购买物品是否显示 0显示，1不显示
			_notShow = readByte();
			//声望任务材料
			_materials = readString();
			//切换阵营所需元宝
			_changeCampNeedGold = readInt();
			//今日已完成声望任务次数
			_prestigeTaskTimes = readInt();
			return true;
		}
		
		/**
		 * get 声望阵营 0未选择，1东厂，2西厂
		 * @return 
		 */
		public function get campType(): int{
			return _campType;
		}
		
		/**
		 * set 声望阵营 0未选择，1东厂，2西厂
		 */
		public function set campType(value: int): void{
			this._campType = value;
		}
		
		/**
		 * get 东厂声望
		 * @return 
		 */
		public function get eastPrestige(): int{
			return _eastPrestige;
		}
		
		/**
		 * set 东厂声望
		 */
		public function set eastPrestige(value: int): void{
			this._eastPrestige = value;
		}
		
		/**
		 * get 西厂声望
		 * @return 
		 */
		public function get westPrestige(): int{
			return _westPrestige;
		}
		
		/**
		 * set 西厂声望
		 */
		public function set westPrestige(value: int): void{
			this._westPrestige = value;
		}
		
		/**
		 * get 声望商店不能购买物品是否显示 0显示，1不显示
		 * @return 
		 */
		public function get notShow(): int{
			return _notShow;
		}
		
		/**
		 * set 声望商店不能购买物品是否显示 0显示，1不显示
		 */
		public function set notShow(value: int): void{
			this._notShow = value;
		}
		
		/**
		 * get 声望任务材料
		 * @return 
		 */
		public function get materials(): String{
			return _materials;
		}
		
		/**
		 * set 声望任务材料
		 */
		public function set materials(value: String): void{
			this._materials = value;
		}
		
		/**
		 * get 切换阵营所需元宝
		 * @return 
		 */
		public function get changeCampNeedGold(): int{
			return _changeCampNeedGold;
		}
		
		/**
		 * set 切换阵营所需元宝
		 */
		public function set changeCampNeedGold(value: int): void{
			this._changeCampNeedGold = value;
		}
		
		/**
		 * get 今日已完成声望任务次数
		 * @return 
		 */
		public function get prestigeTaskTimes(): int{
			return _prestigeTaskTimes;
		}
		
		/**
		 * set 今日已完成声望任务次数
		 */
		public function set prestigeTaskTimes(value: int): void{
			this._prestigeTaskTimes = value;
		}
		
	}
}