package com.rpgGame.netData.login.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 创建角色
	 */
	public class ReqCreateCharacterMessage extends Message {
	
		//角色名字
		private var _name: String;
		
		//角色性别,1男,2女(这是不可选的,rolemodelid就决定了性别)
		private var _sex: int;
		
		//是否自动生成
		private var _auto: int;
		
		//角色头像
		private var _icon: String;
		
		//角色职业,模型ID(1-4)
		private var _job: int;
		
		//窗口高像素
		private var _win_high: int;
		
		//窗口宽像素
		private var _win_width: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色名字
			writeString(_name);
			//角色性别,1男,2女(这是不可选的,rolemodelid就决定了性别)
			writeByte(_sex);
			//是否自动生成
			writeByte(_auto);
			//角色头像
			writeString(_icon);
			//角色职业,模型ID(1-4)
			writeByte(_job);
			//窗口高像素
			writeInt(_win_high);
			//窗口宽像素
			writeInt(_win_width);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色名字
			_name = readString();
			//角色性别,1男,2女(这是不可选的,rolemodelid就决定了性别)
			_sex = readByte();
			//是否自动生成
			_auto = readByte();
			//角色头像
			_icon = readString();
			//角色职业,模型ID(1-4)
			_job = readByte();
			//窗口高像素
			_win_high = readInt();
			//窗口宽像素
			_win_width = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 100202;
		}
		
		/**
		 * get 角色名字
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 角色名字
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 角色性别,1男,2女(这是不可选的,rolemodelid就决定了性别)
		 * @return 
		 */
		public function get sex(): int{
			return _sex;
		}
		
		/**
		 * set 角色性别,1男,2女(这是不可选的,rolemodelid就决定了性别)
		 */
		public function set sex(value: int): void{
			this._sex = value;
		}
		
		/**
		 * get 是否自动生成
		 * @return 
		 */
		public function get auto(): int{
			return _auto;
		}
		
		/**
		 * set 是否自动生成
		 */
		public function set auto(value: int): void{
			this._auto = value;
		}
		
		/**
		 * get 角色头像
		 * @return 
		 */
		public function get icon(): String{
			return _icon;
		}
		
		/**
		 * set 角色头像
		 */
		public function set icon(value: String): void{
			this._icon = value;
		}
		
		/**
		 * get 角色职业,模型ID(1-4)
		 * @return 
		 */
		public function get job(): int{
			return _job;
		}
		
		/**
		 * set 角色职业,模型ID(1-4)
		 */
		public function set job(value: int): void{
			this._job = value;
		}
		
		/**
		 * get 窗口高像素
		 * @return 
		 */
		public function get win_high(): int{
			return _win_high;
		}
		
		/**
		 * set 窗口高像素
		 */
		public function set win_high(value: int): void{
			this._win_high = value;
		}
		
		/**
		 * get 窗口宽像素
		 * @return 
		 */
		public function get win_width(): int{
			return _win_width;
		}
		
		/**
		 * set 窗口宽像素
		 */
		public function set win_width(value: int): void{
			this._win_width = value;
		}
		
	}
}