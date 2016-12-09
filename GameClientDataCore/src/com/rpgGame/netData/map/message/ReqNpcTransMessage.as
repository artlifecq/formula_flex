package com.rpgGame.netData.map.message{
	import com.rpgGame.netData.structs.Position;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * NPC传送
	 */
	public class ReqNpcTransMessage extends Message {
	
		//NPC序号
		private var _npcId: int;
		
		//地图序号
		private var _mapId: int;
		
		//坐标
		private var _pos: com.rpgGame.netData.structs.Position;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//NPC序号
			writeInt(_npcId);
			//地图序号
			writeInt(_mapId);
			//坐标
			writeBean(_pos);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//NPC序号
			_npcId = readInt();
			//地图序号
			_mapId = readInt();
			//坐标
			_pos = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101209;
		}
		
		/**
		 * get NPC序号
		 * @return 
		 */
		public function get npcId(): int{
			return _npcId;
		}
		
		/**
		 * set NPC序号
		 */
		public function set npcId(value: int): void{
			this._npcId = value;
		}
		
		/**
		 * get 地图序号
		 * @return 
		 */
		public function get mapId(): int{
			return _mapId;
		}
		
		/**
		 * set 地图序号
		 */
		public function set mapId(value: int): void{
			this._mapId = value;
		}
		
		/**
		 * get 坐标
		 * @return 
		 */
		public function get pos(): com.rpgGame.netData.structs.Position{
			return _pos;
		}
		
		/**
		 * set 坐标
		 */
		public function set pos(value: com.rpgGame.netData.structs.Position): void{
			this._pos = value;
		}
		
	}
}