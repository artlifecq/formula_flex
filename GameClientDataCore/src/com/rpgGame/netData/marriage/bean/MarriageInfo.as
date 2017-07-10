package com.rpgGame.netData.marriage.bean{
	import com.rpgGame.netData.marriage.bean.InteractionInfo;
	import com.rpgGame.netData.marriage.bean.MarriageLoggerInfo;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 婚姻数据
	 */
	public class MarriageInfo extends Bean {
	
		//结婚对象Id
		private var _marriagePlayerId: long;
		
		//结婚对象的名字
		private var _marriagePlayerName: String;
		
		//当前亲密度
		private var _intimacyValue: int;
		
		//婚戒物品id
		private var _weddingRingItemId: int;
		
		//当前戒指等阶
		private var _levelnum: int;
		
		//结婚状态  5 未婚  6 已婚
		private var _state: int;
		
		//战斗力
		private var _fihtPower: int;
		
		//突破值
		private var _wishValue: int;
		
		//副本挑战剩余次数
		private var _zoneSubNum: int;
		
		//当前激活的buff
		private var _buffs: Vector.<int> = new Vector.<int>();
		//互动数据
		private var _interactionInfos: Vector.<InteractionInfo> = new Vector.<InteractionInfo>();
		//互动日志
		private var _marriageLoggerInfos: Vector.<MarriageLoggerInfo> = new Vector.<MarriageLoggerInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//结婚对象Id
			writeLong(_marriagePlayerId);
			//结婚对象的名字
			writeString(_marriagePlayerName);
			//当前亲密度
			writeInt(_intimacyValue);
			//婚戒物品id
			writeInt(_weddingRingItemId);
			//当前戒指等阶
			writeInt(_levelnum);
			//结婚状态  5 未婚  6 已婚
			writeInt(_state);
			//战斗力
			writeInt(_fihtPower);
			//突破值
			writeInt(_wishValue);
			//副本挑战剩余次数
			writeInt(_zoneSubNum);
			//当前激活的buff
			writeShort(_buffs.length);
			for (var i: int = 0; i < _buffs.length; i++) {
				writeInt(_buffs[i]);
			}
			//互动数据
			writeShort(_interactionInfos.length);
			for (var i: int = 0; i < _interactionInfos.length; i++) {
				writeBean(_interactionInfos[i]);
			}
			//互动日志
			writeShort(_marriageLoggerInfos.length);
			for (var i: int = 0; i < _marriageLoggerInfos.length; i++) {
				writeBean(_marriageLoggerInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//结婚对象Id
			_marriagePlayerId = readLong();
			//结婚对象的名字
			_marriagePlayerName = readString();
			//当前亲密度
			_intimacyValue = readInt();
			//婚戒物品id
			_weddingRingItemId = readInt();
			//当前戒指等阶
			_levelnum = readInt();
			//结婚状态  5 未婚  6 已婚
			_state = readInt();
			//战斗力
			_fihtPower = readInt();
			//突破值
			_wishValue = readInt();
			//副本挑战剩余次数
			_zoneSubNum = readInt();
			//当前激活的buff
			var buffs_length : int = readShort();
			for (var i: int = 0; i < buffs_length; i++) {
				_buffs[i] = readInt();
			}
			//互动数据
			var interactionInfos_length : int = readShort();
			for (var i: int = 0; i < interactionInfos_length; i++) {
				_interactionInfos[i] = readBean(InteractionInfo) as InteractionInfo;
			}
			//互动日志
			var marriageLoggerInfos_length : int = readShort();
			for (var i: int = 0; i < marriageLoggerInfos_length; i++) {
				_marriageLoggerInfos[i] = readBean(MarriageLoggerInfo) as MarriageLoggerInfo;
			}
			return true;
		}
		
		/**
		 * get 结婚对象Id
		 * @return 
		 */
		public function get marriagePlayerId(): long{
			return _marriagePlayerId;
		}
		
		/**
		 * set 结婚对象Id
		 */
		public function set marriagePlayerId(value: long): void{
			this._marriagePlayerId = value;
		}
		
		/**
		 * get 结婚对象的名字
		 * @return 
		 */
		public function get marriagePlayerName(): String{
			return _marriagePlayerName;
		}
		
		/**
		 * set 结婚对象的名字
		 */
		public function set marriagePlayerName(value: String): void{
			this._marriagePlayerName = value;
		}
		
		/**
		 * get 当前亲密度
		 * @return 
		 */
		public function get intimacyValue(): int{
			return _intimacyValue;
		}
		
		/**
		 * set 当前亲密度
		 */
		public function set intimacyValue(value: int): void{
			this._intimacyValue = value;
		}
		
		/**
		 * get 婚戒物品id
		 * @return 
		 */
		public function get weddingRingItemId(): int{
			return _weddingRingItemId;
		}
		
		/**
		 * set 婚戒物品id
		 */
		public function set weddingRingItemId(value: int): void{
			this._weddingRingItemId = value;
		}
		
		/**
		 * get 当前戒指等阶
		 * @return 
		 */
		public function get levelnum(): int{
			return _levelnum;
		}
		
		/**
		 * set 当前戒指等阶
		 */
		public function set levelnum(value: int): void{
			this._levelnum = value;
		}
		
		/**
		 * get 结婚状态  5 未婚  6 已婚
		 * @return 
		 */
		public function get state(): int{
			return _state;
		}
		
		/**
		 * set 结婚状态  5 未婚  6 已婚
		 */
		public function set state(value: int): void{
			this._state = value;
		}
		
		/**
		 * get 战斗力
		 * @return 
		 */
		public function get fihtPower(): int{
			return _fihtPower;
		}
		
		/**
		 * set 战斗力
		 */
		public function set fihtPower(value: int): void{
			this._fihtPower = value;
		}
		
		/**
		 * get 突破值
		 * @return 
		 */
		public function get wishValue(): int{
			return _wishValue;
		}
		
		/**
		 * set 突破值
		 */
		public function set wishValue(value: int): void{
			this._wishValue = value;
		}
		
		/**
		 * get 副本挑战剩余次数
		 * @return 
		 */
		public function get zoneSubNum(): int{
			return _zoneSubNum;
		}
		
		/**
		 * set 副本挑战剩余次数
		 */
		public function set zoneSubNum(value: int): void{
			this._zoneSubNum = value;
		}
		
		/**
		 * get 当前激活的buff
		 * @return 
		 */
		public function get buffs(): Vector.<int>{
			return _buffs;
		}
		
		/**
		 * set 当前激活的buff
		 */
		public function set buffs(value: Vector.<int>): void{
			this._buffs = value;
		}
		
		/**
		 * get 互动数据
		 * @return 
		 */
		public function get interactionInfos(): Vector.<InteractionInfo>{
			return _interactionInfos;
		}
		
		/**
		 * set 互动数据
		 */
		public function set interactionInfos(value: Vector.<InteractionInfo>): void{
			this._interactionInfos = value;
		}
		
		/**
		 * get 互动日志
		 * @return 
		 */
		public function get marriageLoggerInfos(): Vector.<MarriageLoggerInfo>{
			return _marriageLoggerInfos;
		}
		
		/**
		 * set 互动日志
		 */
		public function set marriageLoggerInfos(value: Vector.<MarriageLoggerInfo>): void{
			this._marriageLoggerInfos = value;
		}
		
	}
}