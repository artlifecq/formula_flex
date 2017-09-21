package com.rpgGame.netData.backpack.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 拾取成功
	 */
	public class ResTakeUpSuccessMessage extends Message {
	
		//物品ID
		private var _goodsId: int;
		
		//物品模型ID
		private var _goodModelId: int;
		
		//物品数量
		private var _count: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//物品ID
			writeShort(_goodsId);
			//物品模型ID
			writeInt(_goodModelId);
			//物品数量
			writeInt(_count);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//物品ID
			_goodsId = readShort();
			//物品模型ID
			_goodModelId = readInt();
			//物品数量
			_count = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108107;
		}
		
		/**
		 * get 物品ID
		 * @return 
		 */
		public function get goodsId(): int{
			return _goodsId;
		}
		
		/**
		 * set 物品ID
		 */
		public function set goodsId(value: int): void{
			this._goodsId = value;
		}
		
		/**
		 * get 物品模型ID
		 * @return 
		 */
		public function get goodModelId(): int{
			return _goodModelId;
		}
		
		/**
		 * set 物品模型ID
		 */
		public function set goodModelId(value: int): void{
			this._goodModelId = value;
		}
		
		/**
		 * get 物品数量
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 物品数量
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
	}
}