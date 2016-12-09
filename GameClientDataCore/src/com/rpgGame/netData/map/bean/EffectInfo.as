package com.rpgGame.netData.map.bean{
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 场景效果信息
	 */
	public class EffectInfo extends Bean {
	
		//EffectID
		private var _effectId: long;
		
		//Effect模型ID
		private var _effectModelId: int;
		
		//播放类型(0-1次 1-不停)
		private var _type: int;
		
		//坐标X
		private var _x: int;
		
		//坐标Y
		private var _y: int;
		
		//播放时间(秒)
		private var _play: int;
		
		//施法者攻击模式
		private var _pkstate: int;
		
		//对象id
		private var _targetId: long;
		
		//施放者id
		private var _sourceId: long;
		
		//模拟飞行参数（0速度值，1角度值[10000倍], 2经过时间）
		private var _simulateParams: Vector.<int> = new Vector.<int>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//EffectID
			writeLong(_effectId);
			//Effect模型ID
			writeInt(_effectModelId);
			//播放类型(0-1次 1-不停)
			writeByte(_type);
			//坐标X
			writeShort(_x);
			//坐标Y
			writeShort(_y);
			//播放时间(秒)
			writeInt(_play);
			//施法者攻击模式
			writeInt(_pkstate);
			//对象id
			writeLong(_targetId);
			//施放者id
			writeLong(_sourceId);
			//模拟飞行参数（0速度值，1角度值[10000倍], 2经过时间）
			writeShort(_simulateParams.length);
			for (var i: int = 0; i < _simulateParams.length; i++) {
				writeInt(_simulateParams[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//EffectID
			_effectId = readLong();
			//Effect模型ID
			_effectModelId = readInt();
			//播放类型(0-1次 1-不停)
			_type = readByte();
			//坐标X
			_x = readShort();
			//坐标Y
			_y = readShort();
			//播放时间(秒)
			_play = readInt();
			//施法者攻击模式
			_pkstate = readInt();
			//对象id
			_targetId = readLong();
			//施放者id
			_sourceId = readLong();
			//模拟飞行参数（0速度值，1角度值[10000倍], 2经过时间）
			var simulateParams_length : int = readShort();
			for (var i: int = 0; i < simulateParams_length; i++) {
				_simulateParams[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get EffectID
		 * @return 
		 */
		public function get effectId(): long{
			return _effectId;
		}
		
		/**
		 * set EffectID
		 */
		public function set effectId(value: long): void{
			this._effectId = value;
		}
		
		/**
		 * get Effect模型ID
		 * @return 
		 */
		public function get effectModelId(): int{
			return _effectModelId;
		}
		
		/**
		 * set Effect模型ID
		 */
		public function set effectModelId(value: int): void{
			this._effectModelId = value;
		}
		
		/**
		 * get 播放类型(0-1次 1-不停)
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 播放类型(0-1次 1-不停)
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 坐标X
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set 坐标X
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get 坐标Y
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set 坐标Y
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
		/**
		 * get 播放时间(秒)
		 * @return 
		 */
		public function get play(): int{
			return _play;
		}
		
		/**
		 * set 播放时间(秒)
		 */
		public function set play(value: int): void{
			this._play = value;
		}
		
		/**
		 * get 施法者攻击模式
		 * @return 
		 */
		public function get pkstate(): int{
			return _pkstate;
		}
		
		/**
		 * set 施法者攻击模式
		 */
		public function set pkstate(value: int): void{
			this._pkstate = value;
		}
		
		/**
		 * get 对象id
		 * @return 
		 */
		public function get targetId(): long{
			return _targetId;
		}
		
		/**
		 * set 对象id
		 */
		public function set targetId(value: long): void{
			this._targetId = value;
		}
		
		/**
		 * get 施放者id
		 * @return 
		 */
		public function get sourceId(): long{
			return _sourceId;
		}
		
		/**
		 * set 施放者id
		 */
		public function set sourceId(value: long): void{
			this._sourceId = value;
		}
		
		/**
		 * get 模拟飞行参数（0速度值，1角度值[10000倍], 2经过时间）
		 * @return 
		 */
		public function get simulateParams(): Vector.<int>{
			return _simulateParams;
		}
		
		/**
		 * set 模拟飞行参数（0速度值，1角度值[10000倍], 2经过时间）
		 */
		public function set simulateParams(value: Vector.<int>): void{
			this._simulateParams = value;
		}
		
	}
}