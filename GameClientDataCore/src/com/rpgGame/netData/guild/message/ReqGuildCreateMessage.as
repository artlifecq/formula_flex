package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 创建帮派
	 */
	public class ReqGuildCreateMessage extends Message {
	
		//帮派名字
		private var _name: String;
		
		//帮派宣言
		private var _note: String;
		
		//消耗类型1:元宝,2:绑定元宝
		private var _costType: int;
		
		//本次操作标识
		private var _opaque: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//帮派名字
			writeString(_name);
			//帮派宣言
			writeString(_note);
			//消耗类型1:元宝,2:绑定元宝
			writeByte(_costType);
			//本次操作标识
			writeInt(_opaque);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//帮派名字
			_name = readString();
			//帮派宣言
			_note = readString();
			//消耗类型1:元宝,2:绑定元宝
			_costType = readByte();
			//本次操作标识
			_opaque = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111201;
		}
		
		/**
		 * get 帮派名字
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 帮派名字
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 帮派宣言
		 * @return 
		 */
		public function get note(): String{
			return _note;
		}
		
		/**
		 * set 帮派宣言
		 */
		public function set note(value: String): void{
			this._note = value;
		}
		
		/**
		 * get 消耗类型1:元宝,2:绑定元宝
		 * @return 
		 */
		public function get costType(): int{
			return _costType;
		}
		
		/**
		 * set 消耗类型1:元宝,2:绑定元宝
		 */
		public function set costType(value: int): void{
			this._costType = value;
		}
		
		/**
		 * get 本次操作标识
		 * @return 
		 */
		public function get opaque(): int{
			return _opaque;
		}
		
		/**
		 * set 本次操作标识
		 */
		public function set opaque(value: int): void{
			this._opaque = value;
		}
		
	}
}