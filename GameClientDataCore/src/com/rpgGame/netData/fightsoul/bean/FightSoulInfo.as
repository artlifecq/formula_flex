package com.rpgGame.netData.fightsoul.bean{
	import com.rpgGame.netData.fightsoul.bean.TypeValue;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战魂数据
	 */
	public class FightSoulInfo extends Bean {
	
		//战魂等级
		private var _level: int;
		
		//经验
		private var _exp: int;
		
		//活跃度
		private var _vitality: int;
		
		//当前模型等级
		private var _curModelLv: int;
		
		//当日途径获取次数
		private var _values: Vector.<TypeValue> = new Vector.<TypeValue>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//战魂等级
			writeShort(_level);
			//经验
			writeInt(_exp);
			//活跃度
			writeInt(_vitality);
			//当前模型等级
			writeShort(_curModelLv);
			//当日途径获取次数
			writeShort(_values.length);
			for (var i: int = 0; i < _values.length; i++) {
				writeBean(_values[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//战魂等级
			_level = readShort();
			//经验
			_exp = readInt();
			//活跃度
			_vitality = readInt();
			//当前模型等级
			_curModelLv = readShort();
			//当日途径获取次数
			var values_length : int = readShort();
			for (var i: int = 0; i < values_length; i++) {
				_values[i] = readBean(TypeValue) as TypeValue;
			}
			return true;
		}
		
		/**
		 * get 战魂等级
		 * @return 
		 */
		public function get level(): int{
			return _level;
		}
		
		/**
		 * set 战魂等级
		 */
		public function set level(value: int): void{
			this._level = value;
		}
		
		/**
		 * get 经验
		 * @return 
		 */
		public function get exp(): int{
			return _exp;
		}
		
		/**
		 * set 经验
		 */
		public function set exp(value: int): void{
			this._exp = value;
		}
		
		/**
		 * get 活跃度
		 * @return 
		 */
		public function get vitality(): int{
			return _vitality;
		}
		
		/**
		 * set 活跃度
		 */
		public function set vitality(value: int): void{
			this._vitality = value;
		}
		
		/**
		 * get 当前模型等级
		 * @return 
		 */
		public function get curModelLv(): int{
			return _curModelLv;
		}
		
		/**
		 * set 当前模型等级
		 */
		public function set curModelLv(value: int): void{
			this._curModelLv = value;
		}
		
		/**
		 * get 当日途径获取次数
		 * @return 
		 */
		public function get values(): Vector.<TypeValue>{
			return _values;
		}
		
		/**
		 * set 当日途径获取次数
		 */
		public function set values(value: Vector.<TypeValue>): void{
			this._values = value;
		}
		
	}
}