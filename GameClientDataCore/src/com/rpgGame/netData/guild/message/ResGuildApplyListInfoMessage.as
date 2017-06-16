package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.GuildApplyInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 申请列表信息
	 */
	public class ResGuildApplyListInfoMessage extends Message {
	
		//申请列表信息
		private var _applyList: Vector.<GuildApplyInfo> = new Vector.<GuildApplyInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//申请列表信息
			writeShort(_applyList.length);
			for (i = 0; i < _applyList.length; i++) {
				writeBean(_applyList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//申请列表信息
			var applyList_length : int = readShort();
			for (i = 0; i < applyList_length; i++) {
				_applyList[i] = readBean(GuildApplyInfo) as GuildApplyInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111105;
		}
		
		/**
		 * get 申请列表信息
		 * @return 
		 */
		public function get applyList(): Vector.<GuildApplyInfo>{
			return _applyList;
		}
		
		/**
		 * set 申请列表信息
		 */
		public function set applyList(value: Vector.<GuildApplyInfo>): void{
			this._applyList = value;
		}
		
	}
}