package com.rpgGame.netData.map.bean{
	import com.rpgGame.netData.structs.Position;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 地面特效
	 */
	public class AttachInfo extends Bean {
	
		//唯一ID
		private var _id: int;
		
		//释放者ID
		private var _ownerId: int;
		
		//坐标
		private var _position: com.rpgGame.netData.structs.Position;
		
		//模型ID
		private var _modelId: int;
		
		//状态
		private var _state: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//唯一ID
			writeShort(_id);
			//释放者ID
			writeShort(_ownerId);
			//坐标
			writeBean(_position);
			//模型ID
			writeInt(_modelId);
			//状态
			writeByte(_state);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//唯一ID
			_id = readShort();
			//释放者ID
			_ownerId = readShort();
			//坐标
			_position = readBean(com.rpgGame.netData.structs.Position) as com.rpgGame.netData.structs.Position;
			//模型ID
			_modelId = readInt();
			//状态
			_state = readByte();
			return true;
		}
		
		/**
		 * get 唯一ID
		 * @return 
		 */
		public function get id(): int{
			return _id;
		}
		
		/**
		 * set 唯一ID
		 */
		public function set id(value: int): void{
			this._id = value;
		}
		
		/**
		 * get 释放者ID
		 * @return 
		 */
		public function get ownerId(): int{
			return _ownerId;
		}
		
		/**
		 * set 释放者ID
		 */
		public function set ownerId(value: int): void{
			this._ownerId = value;
		}
		
		/**
		 * get 坐标
		 * @return 
		 */
		public function get position(): com.rpgGame.netData.structs.Position{
			return _position;
		}
		
		/**
		 * set 坐标
		 */
		public function set position(value: com.rpgGame.netData.structs.Position): void{
			this._position = value;
		}
		
		/**
		 * get 模型ID
		 * @return 
		 */
		public function get modelId(): int{
			return _modelId;
		}
		
		/**
		 * set 模型ID
		 */
		public function set modelId(value: int): void{
			this._modelId = value;
		}
		
		/**
		 * get 状态
		 * @return 
		 */
		public function get state(): int{
			return _state;
		}
		
		/**
		 * set 状态
		 */
		public function set state(value: int): void{
			this._state = value;
		}
		
	}
}