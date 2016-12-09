package com.rpgGame.netData.backpack.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 花元宝打开格子申请
	 */
	public class ReqOpenCellMessage extends Message {
	
		//格子编号
		private var _cellId: int;
		
		//1 包裹  2仓库  3寻宝仓库
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//格子编号
			writeInt(_cellId);
			//1 包裹  2仓库  3寻宝仓库
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//格子编号
			_cellId = readInt();
			//1 包裹  2仓库  3寻宝仓库
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 108212;
		}
		
		/**
		 * get 格子编号
		 * @return 
		 */
		public function get cellId(): int{
			return _cellId;
		}
		
		/**
		 * set 格子编号
		 */
		public function set cellId(value: int): void{
			this._cellId = value;
		}
		
		/**
		 * get 1 包裹  2仓库  3寻宝仓库
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 1 包裹  2仓库  3寻宝仓库
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}