package com.rpgGame.netData.marriage.message{
	import com.rpgGame.netData.marriage.bean.MarriageLoggerInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 夫妻日志信息
	 */
	public class SCMarriageLogMessage extends Message {
	
		//夫妻互动日志
		private var _marriageLoggerInfo: MarriageLoggerInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//夫妻互动日志
			writeBean(_marriageLoggerInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//夫妻互动日志
			_marriageLoggerInfo = readBean(MarriageLoggerInfo) as MarriageLoggerInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150115;
		}
		
		/**
		 * get 夫妻互动日志
		 * @return 
		 */
		public function get marriageLoggerInfo(): MarriageLoggerInfo{
			return _marriageLoggerInfo;
		}
		
		/**
		 * set 夫妻互动日志
		 */
		public function set marriageLoggerInfo(value: MarriageLoggerInfo): void{
			this._marriageLoggerInfo = value;
		}
		
	}
}