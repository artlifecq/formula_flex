package com.rpgGame.netData.monster.message{
	import com.rpgGame.netData.monster.bean.WGBossInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送boss概要信息列表
	 */
	public class ResWGBossListToClientMessage extends Message {
	
		//请求的信息类型，0全部（慎用），1世界，2统领
		private var _bosstype: int;
		
		//boss列表
		private var _worldbossList: Vector.<WGBossInfo> = new Vector.<WGBossInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//请求的信息类型，0全部（慎用），1世界，2统领
			writeByte(_bosstype);
			//boss列表
			writeShort(_worldbossList.length);
			for (i = 0; i < _worldbossList.length; i++) {
				writeBean(_worldbossList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//请求的信息类型，0全部（慎用），1世界，2统领
			_bosstype = readByte();
			//boss列表
			var worldbossList_length : int = readShort();
			for (i = 0; i < worldbossList_length; i++) {
				_worldbossList[i] = readBean(WGBossInfo) as WGBossInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114113;
		}
		
		/**
		 * get 请求的信息类型，0全部（慎用），1世界，2统领
		 * @return 
		 */
		public function get bosstype(): int{
			return _bosstype;
		}
		
		/**
		 * set 请求的信息类型，0全部（慎用），1世界，2统领
		 */
		public function set bosstype(value: int): void{
			this._bosstype = value;
		}
		
		/**
		 * get boss列表
		 * @return 
		 */
		public function get worldbossList(): Vector.<WGBossInfo>{
			return _worldbossList;
		}
		
		/**
		 * set boss列表
		 */
		public function set worldbossList(value: Vector.<WGBossInfo>): void{
			this._worldbossList = value;
		}
		
	}
}