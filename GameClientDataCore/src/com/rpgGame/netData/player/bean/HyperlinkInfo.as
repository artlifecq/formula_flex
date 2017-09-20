package com.rpgGame.netData.player.bean{
	import com.rpgGame.netData.player.bean.ParameterInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知子参数
	 */
	public class HyperlinkInfo extends Bean {
	
		//动态参数位置
		private var _i: int; 
		
		//动态参数类型 已前段为准
		private var _t: int;
		
		//动态参数
		private var _parameterInfos: Vector.<ParameterInfo> = new Vector.<ParameterInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//动态参数位置
			writeInt(_i);
			//动态参数类型 已前段为准
			writeInt(_t);
			//动态参数
			writeShort(_parameterInfos.length);
			for (var i: int = 0; i < _parameterInfos.length; i++) {
				writeBean(_parameterInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//动态参数位置
			_i = readInt();
			//动态参数类型 已前段为准
			_t = readInt();
			//动态参数
			var parameterInfos_length : int = readShort();
			for (var i: int = 0; i < parameterInfos_length; i++) {
				_parameterInfos[i] = readBean(ParameterInfo) as ParameterInfo;
			}
			return true;
		}
		
		/**
		 * get 动态参数位置
		 * @return 
		 */
		public function get i(): int{
			return _i;
		}
		
		/**
		 * set 动态参数位置
		 */
		public function set i(value: int): void{
			this._i = value;
		}
		
		/**
		 * get 动态参数类型 已前段为准
		 * @return 
		 */
		public function get t(): int{
			return _t;
		}
		
		/**
		 * set 动态参数类型 已前段为准
		 */
		public function set t(value: int): void{
			this._t = value;
		}
		
		/**
		 * get 动态参数
		 * @return 
		 */
		public function get parameterInfos(): Vector.<ParameterInfo>{
			return _parameterInfos;
		}
		
		/**
		 * set 动态参数
		 */
		public function set parameterInfos(value: Vector.<ParameterInfo>): void{
			this._parameterInfos = value;
		}
		
	}
}