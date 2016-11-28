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
	 * 通用进入普通地图请求（包含各个功能）
	 */
	public class ReqChangeMapCommonMessage extends Message {
	
		//目的地图模型ID（这个是唯一的，足够用于判断功能）
		private var _mapModel: int;
		
		//参数
		private var _params: int;
		
		//目的坐标坐标
		private var _position: com.rpgGame.netData.structs.Position;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//目的地图模型ID（这个是唯一的，足够用于判断功能）
			writeInt(_mapModel);
			//参数
			writeInt(_params);
			//目的坐标坐标
			writeBean(_position);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//目的地图模型ID（这个是唯一的，足够用于判断功能）
			_mapModel = readInt();
			//参数
			_params = readInt();
			//目的坐标坐标
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101218;
		}
		
		/**
		 * get 目的地图模型ID（这个是唯一的，足够用于判断功能）
		 * @return 
		 */
		public function get mapModel(): int{
			return _mapModel;
		}
		
		/**
		 * set 目的地图模型ID（这个是唯一的，足够用于判断功能）
		 */
		public function set mapModel(value: int): void{
			this._mapModel = value;
		}
		
		/**
		 * get 参数
		 * @return 
		 */
		public function get params(): int{
			return _params;
		}
		
		/**
		 * set 参数
		 */
		public function set params(value: int): void{
			this._params = value;
		}
		
		/**
		 * get 目的坐标坐标
		 * @return 
		 */
		public function get position(): com.rpgGame.netData.structs.Position{
			return _position;
		}
		
		/**
		 * set 目的坐标坐标
		 */
		public function set position(value: com.rpgGame.netData.structs.Position): void{
			this._position = value;
		}
		
	}
}