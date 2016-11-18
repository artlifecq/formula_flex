package com.game.login.message
{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 登陆成功
	 */
	public class ResLoginSuccessMessage extends Message {
	
		//角色所在地图类型
		private var _mapType: int;
		
		//切换线
		private var _line: int;
		
		//角色所在地图资源Id
		private var _mapModelId: int;
		
		//玩家所在主城
		private var _cityId: int;
		
		//玩家职业
		private var _job: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色所在地图类型
			writeByte(_mapType);
			//切换线
			writeInt(_line);
			//角色所在地图资源Id
			writeInt(_mapModelId);
			//玩家所在主城
			writeInt(_cityId);
			//玩家职业
			writeByte(_job);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色所在地图类型
			_mapType = readByte();
			//切换线
			_line = readInt();
			//角色所在地图资源Id
			_mapModelId = readInt();
			//玩家所在主城
			_cityId = readInt();
			//玩家职业
			_job = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 100102;
		}
		
		/**
		 * get 角色所在地图类型
		 * @return 
		 */
		public function get mapType(): int{
			return _mapType;
		}
		
		/**
		 * set 角色所在地图类型
		 */
		public function set mapType(value: int): void{
			this._mapType = value;
		}
		
		/**
		 * get 切换线
		 * @return 
		 */
		public function get line(): int{
			return _line;
		}
		
		/**
		 * set 切换线
		 */
		public function set line(value: int): void{
			this._line = value;
		}
		
		/**
		 * get 角色所在地图资源Id
		 * @return 
		 */
		public function get mapModelId(): int{
			return _mapModelId;
		}
		
		/**
		 * set 角色所在地图资源Id
		 */
		public function set mapModelId(value: int): void{
			this._mapModelId = value;
		}
		
		/**
		 * get 玩家所在主城
		 * @return 
		 */
		public function get cityId(): int{
			return _cityId;
		}
		
		/**
		 * set 玩家所在主城
		 */
		public function set cityId(value: int): void{
			this._cityId = value;
		}
		
		/**
		 * get 玩家职业
		 * @return 
		 */
		public function get job(): int{
			return _job;
		}
		
		/**
		 * set 玩家职业
		 */
		public function set job(value: int): void{
			this._job = value;
		}
		
	}
}