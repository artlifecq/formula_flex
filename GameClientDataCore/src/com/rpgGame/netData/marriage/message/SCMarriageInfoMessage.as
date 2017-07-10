package com.rpgGame.netData.marriage.message{
	import com.rpgGame.netData.marriage.bean.MarriageInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 婚姻数据
	 */
	public class SCMarriageInfoMessage extends Message {
	
		//婚姻数据
		private var _marriageInfo: MarriageInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//婚姻数据
			writeBean(_marriageInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//婚姻数据
			_marriageInfo = readBean(MarriageInfo) as MarriageInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150106;
		}
		
		/**
		 * get 婚姻数据
		 * @return 
		 */
		public function get marriageInfo(): MarriageInfo{
			return _marriageInfo;
		}
		
		/**
		 * set 婚姻数据
		 */
		public function set marriageInfo(value: MarriageInfo): void{
			this._marriageInfo = value;
		}
		
	}
}