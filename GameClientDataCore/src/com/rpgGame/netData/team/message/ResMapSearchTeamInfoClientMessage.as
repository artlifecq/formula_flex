package com.rpgGame.netData.team.message{
	import com.rpgGame.netData.team.bean.MapTeamInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 本地图队伍信息
	 */
	public class ResMapSearchTeamInfoClientMessage extends Message {
	
		//当前地图队伍列表
		private var _mapteaminfo: Vector.<MapTeamInfo> = new Vector.<MapTeamInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//当前地图队伍列表
			writeShort(_mapteaminfo.length);
			for (i = 0; i < _mapteaminfo.length; i++) {
				writeBean(_mapteaminfo[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//当前地图队伍列表
			var mapteaminfo_length : int = readShort();
			for (i = 0; i < mapteaminfo_length; i++) {
				_mapteaminfo[i] = readBean(MapTeamInfo) as MapTeamInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109111;
		}
		
		/**
		 * get 当前地图队伍列表
		 * @return 
		 */
		public function get mapteaminfo(): Vector.<MapTeamInfo>{
			return _mapteaminfo;
		}
		
		/**
		 * set 当前地图队伍列表
		 */
		public function set mapteaminfo(value: Vector.<MapTeamInfo>): void{
			this._mapteaminfo = value;
		}
		
	}
}