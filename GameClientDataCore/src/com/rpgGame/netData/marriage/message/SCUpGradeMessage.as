package com.rpgGame.netData.marriage.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 进阶结果
	 */
	public class SCUpGradeMessage extends Message {
	
		//0 失败  1 成功
		private var _result: int;
		
		//当前的亲密值
		private var _intimacyValue: int;
		
		//当前戒指等阶
		private var _levelnum: int;
		
		//战斗力
		private var _fihtPower: int;
		
		//当前激活的buff
		private var _buffs: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//0 失败  1 成功
			writeInt(_result);
			//当前的亲密值
			writeInt(_intimacyValue);
			//当前戒指等阶
			writeInt(_levelnum);
			//战斗力
			writeInt(_fihtPower);
			//当前激活的buff
			writeShort(_buffs.length);
			for (i = 0; i < _buffs.length; i++) {
				writeInt(_buffs[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//0 失败  1 成功
			_result = readInt();
			//当前的亲密值
			_intimacyValue = readInt();
			//当前戒指等阶
			_levelnum = readInt();
			//战斗力
			_fihtPower = readInt();
			//当前激活的buff
			var buffs_length : int = readShort();
			for (i = 0; i < buffs_length; i++) {
				_buffs[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150110;
		}
		
		/**
		 * get 0 失败  1 成功
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 0 失败  1 成功
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
		/**
		 * get 当前的亲密值
		 * @return 
		 */
		public function get intimacyValue(): int{
			return _intimacyValue;
		}
		
		/**
		 * set 当前的亲密值
		 */
		public function set intimacyValue(value: int): void{
			this._intimacyValue = value;
		}
		
		/**
		 * get 当前戒指等阶
		 * @return 
		 */
		public function get levelnum(): int{
			return _levelnum;
		}
		
		/**
		 * set 当前戒指等阶
		 */
		public function set levelnum(value: int): void{
			this._levelnum = value;
		}
		
		/**
		 * get 战斗力
		 * @return 
		 */
		public function get fihtPower(): int{
			return _fihtPower;
		}
		
		/**
		 * set 战斗力
		 */
		public function set fihtPower(value: int): void{
			this._fihtPower = value;
		}
		
		/**
		 * get 当前激活的buff
		 * @return 
		 */
		public function get buffs(): Vector.<int>{
			return _buffs;
		}
		
		/**
		 * set 当前激活的buff
		 */
		public function set buffs(value: Vector.<int>): void{
			this._buffs = value;
		}
		
	}
}