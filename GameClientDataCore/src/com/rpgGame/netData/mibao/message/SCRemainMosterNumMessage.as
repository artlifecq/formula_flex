package com.rpgGame.netData.mibao.message{
	import com.rpgGame.netData.mibao.bean.RemainMonsterInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 剩下的怪物
	 */
	public class SCRemainMosterNumMessage extends Message {
	
		//剩下怪物列表
		private var _RemainMosterList: Vector.<RemainMonsterInfo> = new Vector.<RemainMonsterInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//剩下怪物列表
			writeShort(_RemainMosterList.length);
			for (i = 0; i < _RemainMosterList.length; i++) {
				writeBean(_RemainMosterList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//剩下怪物列表
			var RemainMosterList_length : int = readShort();
			for (i = 0; i < RemainMosterList_length; i++) {
				_RemainMosterList[i] = readBean(RemainMonsterInfo) as RemainMonsterInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 131102;
		}
		
		/**
		 * get 剩下怪物列表
		 * @return 
		 */
		public function get RemainMosterList(): Vector.<RemainMonsterInfo>{
			return _RemainMosterList;
		}
		
		/**
		 * set 剩下怪物列表
		 */
		public function set RemainMosterList(value: Vector.<RemainMonsterInfo>): void{
			this._RemainMosterList = value;
		}
		
	}
}