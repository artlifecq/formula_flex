package com.rpgGame.netData.zhengba.message{
	import com.rpgGame.netData.zhengba.bean.ZhengBaData;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 更新争霸数据
	 */
	public class SCUpdateZhengBaDataMessage extends Message {
	
		//争霸数据
		private var _zhengBaData: ZhengBaData;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//争霸数据
			writeBean(_zhengBaData);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//争霸数据
			_zhengBaData = readBean(ZhengBaData) as ZhengBaData;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 127107;
		}
		
		/**
		 * get 争霸数据
		 * @return 
		 */
		public function get zhengBaData(): ZhengBaData{
			return _zhengBaData;
		}
		
		/**
		 * set 争霸数据
		 */
		public function set zhengBaData(value: ZhengBaData): void{
			this._zhengBaData = value;
		}
		
	}
}