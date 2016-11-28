package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.ApplyItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 添加申请道具记录
	 */
	public class ResGuildStoreApplylistMessage extends Message {
	
		//记录信息
		private var _info: Vector.<ApplyItemInfo> = new Vector.<ApplyItemInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//记录信息
			writeShort(_info.length);
			for (i = 0; i < _info.length; i++) {
				writeBean(_info[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//记录信息
			var info_length : int = readShort();
			for (i = 0; i < info_length; i++) {
				_info[i] = readBean(ApplyItemInfo) as ApplyItemInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111406;
		}
		
		/**
		 * get 记录信息
		 * @return 
		 */
		public function get info(): Vector.<ApplyItemInfo>{
			return _info;
		}
		
		/**
		 * set 记录信息
		 */
		public function set info(value: Vector.<ApplyItemInfo>): void{
			this._info = value;
		}
		
	}
}