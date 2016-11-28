package com.rpgGame.netData.team.message{
	import com.rpgGame.netData.team.bean.MapPlayerInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回搜索玩家
	 */
	public class ResGenericSearchToClientMessage extends Message {
	
		//当前地图玩家列表
		private var _mapplayerinfo: Vector.<MapPlayerInfo> = new Vector.<MapPlayerInfo>();
		//搜索类型 1 好友 2组队
		private var _searType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//当前地图玩家列表
			writeShort(_mapplayerinfo.length);
			for (i = 0; i < _mapplayerinfo.length; i++) {
				writeBean(_mapplayerinfo[i]);
			}
			//搜索类型 1 好友 2组队
			writeByte(_searType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//当前地图玩家列表
			var mapplayerinfo_length : int = readShort();
			for (i = 0; i < mapplayerinfo_length; i++) {
				_mapplayerinfo[i] = readBean(MapPlayerInfo) as MapPlayerInfo;
			}
			//搜索类型 1 好友 2组队
			_searType = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109116;
		}
		
		/**
		 * get 当前地图玩家列表
		 * @return 
		 */
		public function get mapplayerinfo(): Vector.<MapPlayerInfo>{
			return _mapplayerinfo;
		}
		
		/**
		 * set 当前地图玩家列表
		 */
		public function set mapplayerinfo(value: Vector.<MapPlayerInfo>): void{
			this._mapplayerinfo = value;
		}
		
		/**
		 * get 搜索类型 1 好友 2组队
		 * @return 
		 */
		public function get searType(): int{
			return _searType;
		}
		
		/**
		 * set 搜索类型 1 好友 2组队
		 */
		public function set searType(value: int): void{
			this._searType = value;
		}
		
	}
}