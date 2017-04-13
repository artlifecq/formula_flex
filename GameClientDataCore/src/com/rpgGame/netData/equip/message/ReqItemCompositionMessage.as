package com.rpgGame.netData.equip.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 道具合成
	 */
	public class ReqItemCompositionMessage extends Message {
	
		//操作Id
		private var _opaque: int;
		
		//配方Id
		private var _recipeId: int;
		
		//合成数量,-1:全部合成
		private var _num: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//操作Id
			writeInt(_opaque);
			//配方Id
			writeInt(_recipeId);
			//合成数量,-1:全部合成
			writeByte(_num);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//操作Id
			_opaque = readInt();
			//配方Id
			_recipeId = readInt();
			//合成数量,-1:全部合成
			_num = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 107207;
		}
		
		/**
		 * get 操作Id
		 * @return 
		 */
		public function get opaque(): int{
			return _opaque;
		}
		
		/**
		 * set 操作Id
		 */
		public function set opaque(value: int): void{
			this._opaque = value;
		}
		
		/**
		 * get 配方Id
		 * @return 
		 */
		public function get recipeId(): int{
			return _recipeId;
		}
		
		/**
		 * set 配方Id
		 */
		public function set recipeId(value: int): void{
			this._recipeId = value;
		}
		
		/**
		 * get 合成数量,-1:全部合成
		 * @return 
		 */
		public function get num(): int{
			return _num;
		}
		
		/**
		 * set 合成数量,-1:全部合成
		 */
		public function set num(value: int): void{
			this._num = value;
		}
		
	}
}