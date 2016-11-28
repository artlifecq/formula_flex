package com.rpgGame.netData.warmark.message{
	import com.rpgGame.netData.warmark.bean.WarMarkInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 更新战印列表
	 */
	public class ResUpdateWarmarkMessage extends Message {
	
		//战印
		private var _info: WarMarkInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//战印
			writeBean(_info);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//战印
			_info = readBean(WarMarkInfo) as WarMarkInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 193102;
		}
		
		/**
		 * get 战印
		 * @return 
		 */
		public function get info(): WarMarkInfo{
			return _info;
		}
		
		/**
		 * set 战印
		 */
		public function set info(value: WarMarkInfo): void{
			this._info = value;
		}
		
	}
}