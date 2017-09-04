package com.rpgGame.netData.client.message{
	import com.rpgGame.netData.client.bean.CustomTaginfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送客户端自定义标记
	 */
	public class ResClientCustomTagMessage extends Message {
	
		//自定义标记列表
		private var _CustomTaginfos: Vector.<CustomTaginfo> = new Vector.<CustomTaginfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//自定义标记列表
			writeShort(_CustomTaginfos.length);
			for (i = 0; i < _CustomTaginfos.length; i++) {
				writeBean(_CustomTaginfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//自定义标记列表
			var CustomTaginfos_length : int = readShort();
			for (i = 0; i < CustomTaginfos_length; i++) {
				_CustomTaginfos[i] = readBean(CustomTaginfo) as CustomTaginfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 301102;
		}
		
		/**
		 * get 自定义标记列表
		 * @return 
		 */
		public function get CustomTaginfos(): Vector.<CustomTaginfo>{
			return _CustomTaginfos;
		}
		
		/**
		 * set 自定义标记列表
		 */
		public function set CustomTaginfos(value: Vector.<CustomTaginfo>): void{
			this._CustomTaginfos = value;
		}
		
	}
}