package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.ApplyPlayerInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 申请加入帮会发给帮会操作人
	 */
	public class ResGuildApplyAddMessage extends Message {
	
		//申请列表
		private var _applyPlayerInfoList: Vector.<ApplyPlayerInfo> = new Vector.<ApplyPlayerInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//申请列表
			writeShort(_applyPlayerInfoList.length);
			for (i = 0; i < _applyPlayerInfoList.length; i++) {
				writeBean(_applyPlayerInfoList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//申请列表
			var applyPlayerInfoList_length : int = readShort();
			for (i = 0; i < applyPlayerInfoList_length; i++) {
				_applyPlayerInfoList[i] = readBean(ApplyPlayerInfo) as ApplyPlayerInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111102;
		}
		
		/**
		 * get 申请列表
		 * @return 
		 */
		public function get applyPlayerInfoList(): Vector.<ApplyPlayerInfo>{
			return _applyPlayerInfoList;
		}
		
		/**
		 * set 申请列表
		 */
		public function set applyPlayerInfoList(value: Vector.<ApplyPlayerInfo>): void{
			this._applyPlayerInfoList = value;
		}
		
	}
}