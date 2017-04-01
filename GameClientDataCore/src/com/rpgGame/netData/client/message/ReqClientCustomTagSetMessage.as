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
	 * 请求设置客户端自定义标记
	 */
	public class ReqClientCustomTagSetMessage extends Message {
	
		//客户端设定内容
		private var _customTaginfo: CustomTaginfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//客户端设定内容
			writeBean(_customTaginfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//客户端设定内容
			_customTaginfo = readBean(CustomTaginfo) as CustomTaginfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 301201;
		}
		
		/**
		 * get 客户端设定内容
		 * @return 
		 */
		public function get customTaginfo(): CustomTaginfo{
			return _customTaginfo;
		}
		
		/**
		 * set 客户端设定内容
		 */
		public function set customTaginfo(value: CustomTaginfo): void{
			this._customTaginfo = value;
		}
		
	}
}