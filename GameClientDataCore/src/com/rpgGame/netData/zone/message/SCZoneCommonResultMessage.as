package com.rpgGame.netData.zone.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回副本结束通用消息
	 */
	public class SCZoneCommonResultMessage extends Message {
	
		//副本类型
		private var _type: int;
		
		//结果（1成功，0失败）
		private var _result: int;
		
		//倒计时   秒
		private var _subTime: int;
		
		//奖励物品列表
		private var _itemInfoList: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//副本类型
			writeByte(_type);
			//结果（1成功，0失败）
			writeByte(_result);
			//倒计时   秒
			writeInt(_subTime);
			//奖励物品列表
			writeShort(_itemInfoList.length);
			for (i = 0; i < _itemInfoList.length; i++) {
				writeBean(_itemInfoList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//副本类型
			_type = readByte();
			//结果（1成功，0失败）
			_result = readByte();
			//倒计时   秒
			_subTime = readInt();
			//奖励物品列表
			var itemInfoList_length : int = readShort();
			for (i = 0; i < itemInfoList_length; i++) {
				_itemInfoList[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155149;
		}
		
		/**
		 * get 副本类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 副本类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 结果（1成功，0失败）
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 结果（1成功，0失败）
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
		/**
		 * get 倒计时   秒
		 * @return 
		 */
		public function get subTime(): int{
			return _subTime;
		}
		
		/**
		 * set 倒计时   秒
		 */
		public function set subTime(value: int): void{
			this._subTime = value;
		}
		
		/**
		 * get 奖励物品列表
		 * @return 
		 */
		public function get itemInfoList(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _itemInfoList;
		}
		
		/**
		 * set 奖励物品列表
		 */
		public function set itemInfoList(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._itemInfoList = value;
		}
		
	}
}