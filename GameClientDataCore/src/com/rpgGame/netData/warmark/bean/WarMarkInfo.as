package com.rpgGame.netData.warmark.bean{
	import com.rpgGame.netData.warmark.bean.CondInfo;
	import com.rpgGame.netData.warmark.bean.WMSkillInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战印信息类
	 */
	public class WarMarkInfo extends Bean {
	
		//模版Id
		private var _modelId: int;
		
		//是否已经激活
		private var _isActive: int;
		
		//条件列表
		private var _condlist: Vector.<CondInfo> = new Vector.<CondInfo>();
		//技能列表
		private var _skilllist: Vector.<WMSkillInfo> = new Vector.<WMSkillInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//模版Id
			writeInt(_modelId);
			//是否已经激活
			writeByte(_isActive);
			//条件列表
			writeShort(_condlist.length);
			for (var i: int = 0; i < _condlist.length; i++) {
				writeBean(_condlist[i]);
			}
			//技能列表
			writeShort(_skilllist.length);
			for (var i: int = 0; i < _skilllist.length; i++) {
				writeBean(_skilllist[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//模版Id
			_modelId = readInt();
			//是否已经激活
			_isActive = readByte();
			//条件列表
			var condlist_length : int = readShort();
			for (var i: int = 0; i < condlist_length; i++) {
				_condlist[i] = readBean(CondInfo) as CondInfo;
			}
			//技能列表
			var skilllist_length : int = readShort();
			for (var i: int = 0; i < skilllist_length; i++) {
				_skilllist[i] = readBean(WMSkillInfo) as WMSkillInfo;
			}
			return true;
		}
		
		/**
		 * get 模版Id
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set 模版Id
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
		}
		
		/**
		 * get 是否已经激活
		 * @return 
		 */
		public function get isActive(): int{
			return _isActive;
		}
		
		/**
		 * set 是否已经激活
		 */
		public function set isActive(value: int): void{
			this._isActive = value;
		}
		
		/**
		 * get 条件列表
		 * @return 
		 */
		public function get condlist(): Vector.<CondInfo>{
			return _condlist;
		}
		
		/**
		 * set 条件列表
		 */
		public function set condlist(value: Vector.<CondInfo>): void{
			this._condlist = value;
		}
		
		/**
		 * get 技能列表
		 * @return 
		 */
		public function get skilllist(): Vector.<WMSkillInfo>{
			return _skilllist;
		}
		
		/**
		 * set 技能列表
		 */
		public function set skilllist(value: Vector.<WMSkillInfo>): void{
			this._skilllist = value;
		}
		
	}
}