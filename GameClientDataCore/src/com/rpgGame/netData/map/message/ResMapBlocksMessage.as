package com.rpgGame.netData.map.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 阻挡点信息
	 */
	public class ResMapBlocksMessage extends Message {
	
		//阻挡点集合
		private var _blocks: Vector.<int> = new Vector.<int>();
		//阻挡点集合1
		private var _blocks1: Vector.<int> = new Vector.<int>();
		//阻挡点集合2
		private var _blocks2: Vector.<int> = new Vector.<int>();
		//阻挡点集合3
		private var _blocks3: Vector.<int> = new Vector.<int>();
		//阻挡点集合4
		private var _blocks4: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//阻挡点集合
			writeShort(_blocks.length);
			for (i = 0; i < _blocks.length; i++) {
				writeInt(_blocks[i]);
			}
			//阻挡点集合1
			writeShort(_blocks1.length);
			for (i = 0; i < _blocks1.length; i++) {
				writeInt(_blocks1[i]);
			}
			//阻挡点集合2
			writeShort(_blocks2.length);
			for (i = 0; i < _blocks2.length; i++) {
				writeInt(_blocks2[i]);
			}
			//阻挡点集合3
			writeShort(_blocks3.length);
			for (i = 0; i < _blocks3.length; i++) {
				writeInt(_blocks3[i]);
			}
			//阻挡点集合4
			writeShort(_blocks4.length);
			for (i = 0; i < _blocks4.length; i++) {
				writeInt(_blocks4[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//阻挡点集合
			var blocks_length : int = readShort();
			for (i = 0; i < blocks_length; i++) {
				_blocks[i] = readInt();
			}
			//阻挡点集合1
			var blocks1_length : int = readShort();
			for (i = 0; i < blocks1_length; i++) {
				_blocks1[i] = readInt();
			}
			//阻挡点集合2
			var blocks2_length : int = readShort();
			for (i = 0; i < blocks2_length; i++) {
				_blocks2[i] = readInt();
			}
			//阻挡点集合3
			var blocks3_length : int = readShort();
			for (i = 0; i < blocks3_length; i++) {
				_blocks3[i] = readInt();
			}
			//阻挡点集合4
			var blocks4_length : int = readShort();
			for (i = 0; i < blocks4_length; i++) {
				_blocks4[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 101703;
		}
		
		/**
		 * get 阻挡点集合
		 * @return 
		 */
		public function get blocks(): Vector.<int>{
			return _blocks;
		}
		
		/**
		 * set 阻挡点集合
		 */
		public function set blocks(value: Vector.<int>): void{
			this._blocks = value;
		}
		
		/**
		 * get 阻挡点集合1
		 * @return 
		 */
		public function get blocks1(): Vector.<int>{
			return _blocks1;
		}
		
		/**
		 * set 阻挡点集合1
		 */
		public function set blocks1(value: Vector.<int>): void{
			this._blocks1 = value;
		}
		
		/**
		 * get 阻挡点集合2
		 * @return 
		 */
		public function get blocks2(): Vector.<int>{
			return _blocks2;
		}
		
		/**
		 * set 阻挡点集合2
		 */
		public function set blocks2(value: Vector.<int>): void{
			this._blocks2 = value;
		}
		
		/**
		 * get 阻挡点集合3
		 * @return 
		 */
		public function get blocks3(): Vector.<int>{
			return _blocks3;
		}
		
		/**
		 * set 阻挡点集合3
		 */
		public function set blocks3(value: Vector.<int>): void{
			this._blocks3 = value;
		}
		
		/**
		 * get 阻挡点集合4
		 * @return 
		 */
		public function get blocks4(): Vector.<int>{
			return _blocks4;
		}
		
		/**
		 * set 阻挡点集合4
		 */
		public function set blocks4(value: Vector.<int>): void{
			this._blocks4 = value;
		}
		
	}
}