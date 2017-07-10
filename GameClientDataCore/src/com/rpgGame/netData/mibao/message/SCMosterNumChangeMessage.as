package com.rpgGame.netData.mibao.message{
	import com.rpgGame.netData.mibao.bean.RemainMonsterInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 怪物数量变化
	 */
	public class SCMosterNumChangeMessage extends Message {
	
		//怪物信息
		private var _MosterNumChange: RemainMonsterInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//怪物信息
			writeBean(_MosterNumChange);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//怪物信息
			_MosterNumChange = readBean(RemainMonsterInfo) as RemainMonsterInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 131103;
		}
		
		/**
		 * get 怪物信息
		 * @return 
		 */
		public function get MosterNumChange(): RemainMonsterInfo{
			return _MosterNumChange;
		}
		
		/**
		 * set 怪物信息
		 */
		public function set MosterNumChange(value: RemainMonsterInfo): void{
			this._MosterNumChange = value;
		}
		
	}
}