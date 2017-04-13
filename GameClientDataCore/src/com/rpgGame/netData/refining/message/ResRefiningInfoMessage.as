package com.rpgGame.netData.refining.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送炼化相关信息
	 */
	public class ResRefiningInfoMessage extends Message {
	
		//炼化经验
		private var _refiningExp: int;
		
		//炼化等级
		private var _refiningRank: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//炼化经验
			writeInt(_refiningExp);
			//炼化等级
			writeInt(_refiningRank);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//炼化经验
			_refiningExp = readInt();
			//炼化等级
			_refiningRank = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 204101;
		}
		
		/**
		 * get 炼化经验
		 * @return 
		 */
		public function get refiningExp(): int{
			return _refiningExp;
		}
		
		/**
		 * set 炼化经验
		 */
		public function set refiningExp(value: int): void{
			this._refiningExp = value;
		}
		
		/**
		 * get 炼化等级
		 * @return 
		 */
		public function get refiningRank(): int{
			return _refiningRank;
		}
		
		/**
		 * set 炼化等级
		 */
		public function set refiningRank(value: int): void{
			this._refiningRank = value;
		}
		
	}
}